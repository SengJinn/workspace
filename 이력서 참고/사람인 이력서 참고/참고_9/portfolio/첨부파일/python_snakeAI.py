# Wormy (a Nibbles clone)
# By Al Sweigart al@inventwithpython.com
# http://inventwithpython.com/pygame
# Released under a "Simplified BSD" license

import random, pygame, sys
import tensorflow as tf
import numpy as np
from pygame.locals import *
from collections import deque

FPS = 1000
WINDOWWIDTH = 100   #640
WINDOWHEIGHT = 100  #480
CELLSIZE = 20

assert WINDOWWIDTH % CELLSIZE == 0, "Window width must be a multiple of cell size."
assert WINDOWHEIGHT % CELLSIZE == 0, "Window height must be a multiple of cell size."
CELLWIDTH = int(WINDOWWIDTH / CELLSIZE)
CELLHEIGHT = int(WINDOWHEIGHT / CELLSIZE)
PIXEL = (CELLWIDTH+2) * (CELLHEIGHT+2)
LIMIT = CELLWIDTH * CELLHEIGHT * 0.7             # max length
HEAD = 0

#             R    G    B
WHITE     = (255, 255, 255)
BLACK     = (  0,   0,   0)
RED       = (255,   0,   0)
GREEN     = (  0, 255,   0)
DARKGREEN = (  0, 155,   0)
DARKGRAY  = ( 40,  40,  40)
BGCOLOR = BLACK

UP = 'up'
DOWN = 'down'
LEFT = 'left'
RIGHT = 'right'

learning_rate           = 0.01
DISCOUNT_RATE           = 0.99
BUFFER_SIZE             = 10000
BATCH_SIZE              = 64
TARGET_UPDATE_FREQUENCY = 10
MAX_EPISODES            = 30000 + 1

O1 = PIXEL
O2 = O1/2
O3 = O2/2
O4 = O3/2
out = 4

# Y = up, down, lef, right
###############################################################################
X = tf.compat.v1.placeholder(tf.float32, [None, PIXEL])
Y = tf.compat.v1.placeholder(tf.float32, [None, out])

#keep_prob = tf.compat.v1.placeholder(tf.float32)
#rate = 1 - keep_prob                    # where should i use this? and is this correct?

# main network ################################################################
W1 = tf.compat.v1.get_variable("W1", shape=[PIXEL, O1], initializer=tf.glorot_uniform_initializer())
b1 = tf.Variable(tf.random.normal([O1]))
L1 = tf.nn.relu(tf.matmul(X, W1) + b1)
#L1 = tf.nn.dropout(L1, rate=rate)

W2 = tf.compat.v1.get_variable("W2", shape=[O1, out], initializer=tf.glorot_uniform_initializer())
b2 = tf.Variable(tf.random.normal([out]))
# L2 = tf.nn.dropout(L2, rate=rate)
hypothesis = tf.matmul(L1, W2) + b2

cost = tf.compat.v1.losses.mean_squared_error(Y, hypothesis)
optimizer = tf.compat.v1.train.AdamOptimizer(learning_rate=learning_rate).minimize(cost)

###############################################################################

"""
    mainDQN     : Q, change, theta
    targetDQN   : Q^, fixed, theta_
        
    Q_pred      : network prediction
    Q_target    : r + Q`
    
    1. using epsilon, a = argmax Q || random a 
        keep save the state
    2. after [frequency], update (main)network 
        using (Q_target - Q_pred) with minibatch unit
    3. independently after every C steps, copy [targetDQN <- mainDQN]
"""

def main():
    global FPSCLOCK, DISPLAYSURF, BASICFONT

    pygame.init()
    FPSCLOCK = pygame.time.Clock()
    DISPLAYSURF = pygame.display.set_mode((WINDOWWIDTH, WINDOWHEIGHT))
    BASICFONT = pygame.font.Font('freesansbold.ttf', 18)
    pygame.display.set_caption('AI snake')

    showStartScreen()
    
    with tf.compat.v1.Session() as sess:
        buffer = deque(maxlen=BUFFER_SIZE)
        e = 1
        tf.compat.v1.global_variables_initializer().run()
        
###############################################################################
        score_list = []
        for episode in range(MAX_EPISODES):
            e = 1. / ((episode/100)+1)
            record = runGame(e, buffer, sess)
            score_list.append(record)
            if episode % 10 == 0:
                print("%04d :  %d" % (episode, sum(score_list) / len(score_list)))
                score_list.clear()
        print("final : %d" % runGame(0, buffer, sess))

def runGame(e, buffer, sess):
    # Set a random start point.
    startx = int(CELLWIDTH/2)
    starty = int(CELLHEIGHT/2)
    wormCoords = [{'x': startx,     'y': starty},
                  {'x': startx - 1, 'y': starty},
                  {'x': startx - 2, 'y': starty}]
    direction = RIGHT
    apple = getRandomLocation()
    
    score = 0
    step_count = 0
    done = 0
    
    while True: # main game loop
        reward = 0
# state #######################################################################
        state = currentMatrix(wormCoords, apple)
        
# direction ###################################################################        
        if e > np.random.rand(1): # E-greedy (O), random-noise (X)
            action = random.randint(0, 3)
        else:
            hypo = sess.run(hypothesis, feed_dict={X: state})
            action = np.argmax(hypo)
        
        direction_list = {0:UP, 1:DOWN, 2:LEFT, 3:RIGHT}
        direction_past = direction
        direction = direction_list.get(action)
        
        if direction_past == UP and direction == DOWN:
            direction = UP
        elif direction_past == DOWN and direction == UP:
            direction = DOWN
        elif direction_past == LEFT and direction == RIGHT:
            direction = LEFT
        elif direction_past == RIGHT and direction == LEFT:
            direction = RIGHT
        
# move ########################################################################
        # if snake go opposite direction?
        if direction == UP:
            newHead = {'x': wormCoords[HEAD]['x'], 'y': wormCoords[HEAD]['y'] - 1}
        elif direction == DOWN:
            newHead = {'x': wormCoords[HEAD]['x'], 'y': wormCoords[HEAD]['y'] + 1}
        elif direction == LEFT:
            newHead = {'x': wormCoords[HEAD]['x'] - 1, 'y': wormCoords[HEAD]['y']}
        elif direction == RIGHT:
            newHead = {'x': wormCoords[HEAD]['x'] + 1, 'y': wormCoords[HEAD]['y']}
        wormCoords.insert(0, newHead)
        
# reward ######################################################################
        # check distance with apple
        if distance(apple, wormCoords[HEAD]) < distance(apple, wormCoords[1]):
            reward += 1
        else :
            reward -= 2
            
        # check if worm has eaten apple
        if wormCoords[HEAD]['x'] == apple['x'] and wormCoords[HEAD]['y'] == apple['y']:
            apple = getRandomLocation()
            reward += 99
            if(len(wormCoords) >= LIMIT):
                done = 1
        else:
            del wormCoords[-1]
        
        # Die condition
        if wormCoords[HEAD]['x'] == -1 or wormCoords[HEAD]['x'] == CELLWIDTH or wormCoords[HEAD]['y'] == -1 or wormCoords[HEAD]['y'] == CELLHEIGHT:
            done = 1
            reward -= 10
        for wormBody in wormCoords[1:]:
            if wormBody['x'] == wormCoords[HEAD]['x'] and wormBody['y'] == wormCoords[HEAD]['y']:
                done = 1
                reward -= 10
                
# next_state ##################################################################
        next_state = currentMatrix(wormCoords, apple)
        
# record ######################################################################
        """ record every single step in buffer (state, action, reward, next state, done)
        """
        step_count += 1
        score += reward
        buffer.append((state, action, reward, next_state, done))
        
# network update ##############################################################
        if len(buffer) > BATCH_SIZE:
            minibatch = random.sample(buffer, BATCH_SIZE)
            
            states      = np.vstack ([i[0] for i in minibatch])
            actions     = np.array  ([i[1] for i in minibatch])
            rewards     = np.array  ([i[2] for i in minibatch])
            next_states = np.vstack ([i[3] for i in minibatch])
            finish      = np.array  ([i[4] for i in minibatch])
        
            x = states
            Q_target = rewards + DISCOUNT_RATE * np.max(sess.run(hypothesis, feed_dict={X: next_states})) * ~finish
        
            y = sess.run(hypothesis, feed_dict={X: states})
            y[np.arange(len(x)), actions] = Q_target
        
            cost_val, optimizer_val = sess.run([cost, optimizer], feed_dict={X: x, Y: y})
            
            # buffer.clear()
            
# finish ######################################################################
        if done == 1:
            return score
        
# Graphic and System ##########################################################
        DISPLAYSURF.fill(BGCOLOR)
        drawWorm(wormCoords)
        drawApple(apple)
        pygame.display.update()
        FPSCLOCK.tick(FPS)

# util ########################################################################
def currentMatrix(wormCoords, apple):
    mat = np.zeros((CELLWIDTH+2, CELLHEIGHT+2))
    for i in range(CELLWIDTH+2):
        mat[0][i] = 1
        mat[CELLWIDTH+1][i] = 1
    for i in range(CELLHEIGHT+2):
        mat[i][0] = 1
        mat[i][CELLHEIGHT+1] = 1
    mat = mat.reshape((1, (CELLWIDTH+2) * (CELLHEIGHT+2)))
    
    mat[0][apple['x']+1 + (apple['y']+1)*(CELLWIDTH+2)] = 100
    for body in wormCoords:
        mat[0][body['x']+1 + (body['y']+1)*(CELLWIDTH+2)] = 1
    mat[0][wormCoords[HEAD]['x']+1 + (wormCoords[HEAD]['y']+1)*(CELLHEIGHT+2)] = 10
    
    return mat
    
def distance(apple, head):
    return pow(apple['x'] - head['x'], 2) + pow(apple['y'] - head['y'], 2)

###############################################################################
# not mine ####################################################################
###############################################################################

def drawPressKeyMsg():
    pressKeySurf = BASICFONT.render('Press a key to play.', True, DARKGRAY)
    pressKeyRect = pressKeySurf.get_rect()
    pressKeyRect.topleft = (WINDOWWIDTH - 200, WINDOWHEIGHT - 30)
    DISPLAYSURF.blit(pressKeySurf, pressKeyRect)


def checkForKeyPress():
    if len(pygame.event.get(QUIT)) > 0:
        terminate()

    keyUpEvents = pygame.event.get(KEYUP)
    if len(keyUpEvents) == 0:
        return None
    if keyUpEvents[0].key == K_ESCAPE:
        terminate()
    return keyUpEvents[0].key


def showStartScreen():
    titleFont = pygame.font.Font('freesansbold.ttf', 100)
    titleSurf1 = titleFont.render('Wormy!', True, WHITE, DARKGREEN)
    titleSurf2 = titleFont.render('Wormy!', True, GREEN)

    degrees1 = 0
    degrees2 = 0
    while True:
        DISPLAYSURF.fill(BGCOLOR)
        rotatedSurf1 = pygame.transform.rotate(titleSurf1, degrees1)
        rotatedRect1 = rotatedSurf1.get_rect()
        rotatedRect1.center = (WINDOWWIDTH / 2, WINDOWHEIGHT / 2)
        DISPLAYSURF.blit(rotatedSurf1, rotatedRect1)

        rotatedSurf2 = pygame.transform.rotate(titleSurf2, degrees2)
        rotatedRect2 = rotatedSurf2.get_rect()
        rotatedRect2.center = (WINDOWWIDTH / 2, WINDOWHEIGHT / 2)
        DISPLAYSURF.blit(rotatedSurf2, rotatedRect2)

        drawPressKeyMsg()

        if checkForKeyPress():
            pygame.event.get() # clear event queue
            return
        pygame.display.update()
        FPSCLOCK.tick(FPS)
        degrees1 += 3 # rotate by 3 degrees each frame
        degrees2 += 7 # rotate by 7 degrees each frame


def terminate():
    pygame.quit()
    sys.exit()


def getRandomLocation():
    return {'x': random.randint(0, CELLWIDTH - 1), 'y': random.randint(0, CELLHEIGHT - 1)}


def drawWorm(wormCoords):
    for coord in wormCoords:
        x = coord['x'] * CELLSIZE
        y = coord['y'] * CELLSIZE
        wormSegmentRect = pygame.Rect(x, y, CELLSIZE, CELLSIZE)
        pygame.draw.rect(DISPLAYSURF, DARKGREEN, wormSegmentRect)


def drawApple(coord):
    x = coord['x'] * CELLSIZE
    y = coord['y'] * CELLSIZE
    appleRect = pygame.Rect(x, y, CELLSIZE, CELLSIZE)
    pygame.draw.rect(DISPLAYSURF, RED, appleRect)


if __name__ == '__main__':
    main()