-- [스키마(=데이터베이스)를 만들겠다]
-- CREATE SCHEMA IF NOT EXISTS 스키마명; 

-- [스키마를 사용하겠다]
-- USE 스키마명;

-- [테이블 정보 확인]
-- SELECT * FROM 테이블명;

-- [테이블 구조 확인] 
-- DESC 테이블명;   
-- DESCRIBE 테이블명;

-- [테이블이 존재하면 삭제]
-- DROP TABLE IF EXISTS 테이블명;

-- [테이블이 존재하지 않으면 생성]
-- CREATE TABLE IF NOT EXISTS 테이블명;

-- [ALTER 문을 사용하여 테이블 구조 변경]
-- ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새컬럼명 데이터타입;

/*
	TINYBLOB  	2^8 - 1 [256bytes]
	BLOB	  	2^16-1  [64KB]
	MEDIUMBLOB 	2^24 -1 [8MB]
	LONGBLOB	2^32 -1 [4GB]
*/

USE vvv;
-- ===================================================== 
-- [회원 정보 테이블]
CREATE TABLE IF NOT EXISTS `member` (
    `num` INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
    pass VARCHAR(30) NOT NULL,
    age INT(3),
    `point` INT,
    phone VARCHAR(100) NOT NULL UNIQUE,
    join_date TIMESTAMP DEFAULT NOW()
);

SELECT * FROM `member`;

-- DROP TABLE IF EXISTS ;

-- [프로필 공유 계정]
CREATE TABLE IF NOT EXISTS `profile`(
	`num` INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(100),
	`name` VARCHAR(20) NOT NULL,
	image_name VARCHAR(50) NOT NULL,
    image_type VARCHAR(50) NOT NULL,
	image LONGBLOB NOT NULL,
    bookmark INT,
	FOREIGN KEY (email) REFERENCES `member`(email)
);


-- [회원 탈퇴 시 회원 정보 저장 테이블]
CREATE TABLE IF NOT EXISTS member_backup LIKE `member`;
-- member_backup 테이블을 member 구조 처럼 만든다.
-- LIKE 절을 이용하면 **데이터와 키를 다 복사**해서 가지고 온다.

desc member_backup;
SELECT * FROM member_backup;

TRUNCATE TABLE member_backup;

-- [게시판 정보 테이블]
CREATE TABLE IF NOT EXISTS board(
	b_num int PRIMARY KEY AUTO_INCREMENT ,
    b_title VARCHAR(20),
    b_content VARCHAR(255),
    email VARCHAR(100), 
    b_regdate TIMESTAMP DEFAULT NOW(),
    b_viewcnt int,
    FOREIGN KEY (email) REFERENCES `member`(email)
);

ALTER TABLE board ADD COLUMN `name` VARCHAR(20) NOT NULL after email;

-- [컨텐츠 정보 테이블]
CREATE TABLE IF NOT EXISTS movie(
	mv_num int PRIMARY KEY AUTO_INCREMENT ,
	image_name VARCHAR(50), -- NOT NULL,
    image_type VARCHAR(50), -- NOT NULL,
	image LONGBLOB, -- NOT NULL,
    video_name VARCHAR(50), -- NOT NULL,
	video_type VARCHAR(50), -- NOT NULL,
    video LONGBLOB, -- NOT NULL,
	title VARCHAR(20),
    genre VARCHAR(20),
    actor VARCHAR(255),
    director VARCHAR(255),
    summary VARCHAR(255),
    `comment` VARCHAR(255),
    star int(5.0)
);
SELECT * FROM movie;

DROP TABLE movie;
DROP TABLE movie_rating;

INSERT INTO movie (mv_num, title, genre, actor, director, summary) 
VALUES (null, '라라랜드', '뮤지컬', '라이언 고슬링, 엠마 왓슨', '데미언 셔젤', '꿈을 꾸는 사람들을 위한 별들의 도시 라라랜드. 재즈 피아니스트 세바스찬과 배우 지망생 미아, 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.');

INSERT INTO movie (mv_num, image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/fubao.jpg', '/FP/resources/images/banners/fubao_poster.jpg', '안녕, 할부지', '다큐멘터리, 애니메이션', '푸바오, 아이바오, 송영관', '심형준, 토마스 고',
'헤어질 때를 알기에 매 순간 진심이고 애틋했던 그들 1354일, 그동안의 못다 한 이야기', '5', '15');

INSERT INTO movie (mv_num, image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/warnangsori.jpg', '/FP/resources/images/banners/warnangsori_poster.jpg', '워낭소리', '다큐멘터리', '최원균, 이삼순, 누렁이', '이충렬',
'평생 땅을 지키며 살아온 농부 최노인에겐 30년을 부려온 소 한 마리가 있다. 소의 수명은 보통 15년, 그런데 이 소의 나이는 무려 마흔 살. 살아 있다는 게 믿기지 않는 이 소는 최노인의 베스트 프렌드이며, 최고의 농기구이고, 유일한 자가용이다. 귀가 잘 안 들리는 최노인이지만 희미한 소의 워낭 소리도 귀신같이 듣고 한 쪽 다리가 불편하지만 소 먹일 풀을 베기 위해 매일 산을 오른다. 심지어 소에게 해가 갈까 논에 농약을 치지 않는 고집쟁이다. 소 역시 제대로 서지도 못 하면서 최노인이 고삐를 잡으면 산 같은 나뭇짐도 마다 않고 나른다. 무뚝뚝한 노인과 무덤덤한 소. 둘은 모두가 인정하는 환상의 친구다. 그러던 어느 봄, 최노인은 수의사에게 소가 올 해를 넘길 수 없을 거라는 선고를 듣는다.', '5', '15');

CREATE TABLE IF NOT EXISTS movie_rating(
	mr_num int PRIMARY KEY AUTO_INCREMENT ,
    email VARCHAR(100),
    mv_num int,
    mr_comment VARCHAR(100) NOT NULL,
    mr_stars int,
    FOREIGN KEY (email) REFERENCES `member`(email),
    FOREIGN KEY (mv_num) REFERENCES `movie`(mv_num)
);

ALTER TABLE movie_rating ADD COLUMN `name` VARCHAR(20) NOT NULL;

SELECT * FROM movie_rating;
DESC movie_rating;

CREATE TABLE IF NOT EXISTS drama LIKE `movie`;

CREATE TABLE IF NOT EXISTS docu LIKE `movie`;

CREATE TABLE IF NOT EXISTS ent LIKE `movie`;


-- [만료일이 되면 자동으로 갱신]
DELIMITER //
CREATE TRIGGER update_membership_status
BEFORE UPDATE ON member		-- UPDATE 쿼리가 실행되어야 트리거 실행
FOR EACH ROW
BEGIN
	IF NEW.expiryDate < NOW() - INTERVAL 1 SECOND THEN
		SET NEW.membershipStatus = '만료';
        SET NEW.membershipType = '';
        SET NEW.paymentDate = NULL;
        SET NEW.expiryDate = NULL;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_delete_member
AFTER DELETE ON member		-- member 테이블에서 행이 삭제된 후에 이 트리거 실행됨
FOR EACH ROW				-- 각 행이 삭제될 때마다 트리거가 실행됨
BEGIN
    INSERT INTO member_backup VALUES(OLD.num, OLD.email, OLD.pass, OLD.age, OLD.point, OLD.phone, OLD.join_date, OLD.membershipType, OLD.membershipStatus, OLD.paymentDate, OLD.expiryDate);
END //
DELIMITER ;

show create table b_comment;
show create table movie_rating;
-- CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`mv_num`) REFERENCES `movie` (`mv_num`)
-- CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
 show create table movie_likes;
-- CONSTRAINT `movie_likes_ibfk_1` FOREIGN KEY (`num`) REFERENCES `profile` (`num`)
-- CONSTRAINT `movie_likes_ibfk_2` FOREIGN KEY (`mv_num`) REFERENCES `movie` (`mv_num`)
show create table board;
-- CONSTRAINT `board_ibfk_1` FOREIGN KEY (`email`) REFERENCES `member` (`email`) ON DELETE CASCADE
-- CONSTRAINT `fk_p_num` FOREIGN KEY (`p_num`) REFERENCES `profile` (`num`)  ON DELETE CASCADE

DELIMITER //
CREATE TRIGGER after_delete_member
AFTER DELETE ON member			-- member 테이블에서 행이 삭제된 후에 이 트리거 실행됨
FOR EACH ROW					-- 각 행이 삭제될 때마다 트리거가 실행됨
BEGIN
    -- 삭제된 데이터를 member_backup 테이블에 백업
    INSERT INTO member_backup VALUES (OLD.num, OLD.email, OLD.pass, OLD.age, OLD.point, OLD.phone, OLD.join_date, OLD.membershipType, OLD.membershipStatus, OLD.paymentDate, OLD.expiryDate);

    -- movie_rating에서 해당 회원의 평점 삭제
    DELETE FROM movie_rating WHERE email = OLD.email;
    
    -- movie_likes에서 해당 회원의 좋아요 기록 삭제
    DELETE FROM movie_likes WHERE num = OLD.num;
    
    -- board에서 해당 회원의 게시물 삭제
    DELETE FROM board WHERE email = OLD.email;
    
    -- b_comment에서 해당 회원의 댓글 삭제
    DELETE FROM b_comment WHERE email = OLD.email;
END //
DELIMITER ;

drop TRIGGER after_delete_member;

ALTER TABLE movie_rating
DROP FOREIGN KEY movie_rating_ibfk_1;

ALTER TABLE movie_rating
ADD CONSTRAINT movie_rating_ibfk_1
FOREIGN KEY (email) REFERENCES member(email)
ON DELETE CASCADE;

ALTER TABLE movie_likes
DROP FOREIGN KEY movie_likes_ibfk_1;

ALTER TABLE movie_likes
ADD CONSTRAINT movie_likes_ibfk_1
FOREIGN KEY (num) REFERENCES profile(num)
ON DELETE CASCADE;

ALTER TABLE b_comment
DROP FOREIGN KEY b_comment_ibfk_1;

ALTER TABLE b_comment
ADD CONSTRAINT b_comment_ibfk_1
FOREIGN KEY (email) REFERENCES member(email)
ON DELETE CASCADE;

-- CONSTRAINT `b_comment_ibfk_1` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
-- CONSTRAINT `fk_board_b_num` FOREIGN KEY (`b_num`) REFERENCES `board` (`b_num`) ON DELETE CASCADE
