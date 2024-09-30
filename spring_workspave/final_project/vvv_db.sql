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
DESC profile;

-- [회원 탈퇴 시 회원 정보 저장 테이블]
CREATE TABLE IF NOT EXISTS member_backup LIKE `member`;
-- member_backup 테이블을 member 구조 처럼 만든다.
-- LIKE 절을 이용하면 **데이터와 키를 다 복사**해서 가지고 온다.


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
DESC board;

-- [컨텐츠 정보 테이블]
CREATE TABLE IF NOT EXISTS movie(
	mv_num int PRIMARY KEY AUTO_INCREMENT ,
    image_url VARCHAR(255),
    poster_url VARCHAR(255),
	title VARCHAR(20),
    genre VARCHAR(20),
    actor VARCHAR(255),
    director VARCHAR(255),
    summary TEXT,
    `comment` VARCHAR(255),
    star INT,
    age_limit int
);
SELECT * FROM movie;

DROP TABLE movie;
ALTER TABLE movie ADD COLUMN age_limit int after star;
ALTER TABLE movie ADD COLUMN poster_url VARCHAR(255) after image_url;

DROP TABLE movie_rating;

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/lalaland.jpg', '/FP/resources/images/banners/lalaland_poster.jpg', '라라랜드', '뮤지컬, 드라마, 로맨스', '라이언 고슬링, 엠마 왓슨', '데미언 셔젤',
'꿈을 꾸는 사람들을 위한 별들의 도시 라라랜드. 재즈 피아니스트 세바스찬과 배우 지망생 미아, 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.', '5', '15');

SELECT * from movie;

SHOW CREATE TABLE movie;

alter table movie drop column  where mv_num = 1;

DELETE FROM movie WHERE mv_num = 1;

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
DROP TABLE movie_rating;
DESC movie_rating;

CREATE TABLE IF NOT EXISTS drama LIKE `movie`;

CREATE TABLE IF NOT EXISTS docu LIKE `movie`;

CREATE TABLE IF NOT EXISTS ent LIKE `movie`;

CREATE TABLE movie_likes (
    likes_id INT AUTO_INCREMENT PRIMARY KEY,
    mv_num INT NOT NULL,
    `num` INT NOT NULL,
    FOREIGN KEY (`num`) REFERENCES `profile`(`num`),
	FOREIGN KEY (mv_num) REFERENCES movie(mv_num)
);
DROP TABLE movie_likes;
SELECT * FROM movie_likes;

 
 INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/beginagain.jpg', '/FP/resources/images/banners/beginagain_poster.jpg', '비긴 어게인', '드라마, 로맨스, 코미디', '마크 러팔로, 키이라 나이틀리, 애덤 리바인', '존 카니',
'싱어송라이터인 그레타는 남자친구 데이브가 메이저 음반회사와 계약을 하게 되면서 뉴욕으로 오게 된다. 그러나 행복도 잠시, 오랜 연인이자 음악적 파트너로서 함께 노래를 만들고 부르는 것이 좋았던 그레타와 달리 스타가 된 데이브의 마음은 어느새 변해버린다. 스타 음반 프로듀서였지만 이제는 해고된 댄은 미치기 일보 직전 들른 뮤직바에서 그레타의 자작곡을 듣게 되고 아직 녹슬지 않은 촉을 살려 음반 제작을 제안한다. 거리 밴드를 결성한 그들은 뉴욕의 거리를 스튜디오 삼아 진짜로 부르고 싶었던 노래를 만들어가는데…', '5', '15');
 
 INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/abouttime.jpg', '/FP/resources/images/banners/abouttime_poster.jpg', '어바웃 타임', '로맨스,  코미디', '도널 글리슨, 레이첼 맥아담스', '리처드 커티스',
'모태솔로 팀은 성인이 된 날, 아버지로부터 놀랄만한 가문의 비밀을 듣게 된다. 바로 시간을 되돌릴 수 있는 능력이 있다는 것! 그것이 비록 히틀러를 죽이거나 여신과 뜨거운 사랑을 할 수는 없지만, 여자친구는 만들어 줄 순 있으리.. 꿈을 위해 런던으로 간 팀은 우연히 만난 사랑스러운 여인 메리에게 첫눈에 반하게 된다. 그녀의 사랑을 얻기 위해 자신의 특별한 능력을 마음껏 발휘하는 팀. 어설픈 대시, 어색한 웃음은 리와인드! 뜨거웠던 밤은 더욱 뜨겁게 리플레이! 꿈에 그리던 그녀와 매일매일 최고의 순간을 보낸다. 하지만 그와 그녀의 사랑이 완벽해질수록 팀을 둘러싼 주변 상황들은 미묘하게 엇갈리고, 예상치 못한 사건들이 여기저기 나타나기 시작하는데… 어떠한 순간을 다시 살게 된다면, 과연 완벽한 사랑을 이룰 수 있을까?', '5', '15');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/3idiots.png', '/FP/resources/images/banners/3idiots_poster.jpg', '세 얼간이', '뮤지컬, 드라마, 블랙 코미디', '아미르 칸, 카리나 카푸르', '라지쿠마르 히라니',
'천재들만 간다는 일류 명문대 ICE, 성적과 취업만을 강요하는 학교를 발칵 뒤집어 놓은 대단한 녀석 란초! 아버지가 정해준 꿈, 공학자가 되기 위해 정작 본인이 좋아하는 일은 포기하고 공부만하는 파파보이 파르한! 찢어지게 가난한 집, 병든 아버지와 식구들을 책임지기 위해 무조건 대기업에 취직해야만 하는 라주! 친구의 이름으로 뭉친 세 얼간이! 삐딱한 천재들의 진정한 꿈을 찾기 위한 세상 뒤집기 한판이 시작된다!', '5', '12');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/baywatch.png', '/FP/resources/images/banners/baywatch_poster.jpg', '베이워치:SOS 해상 구조대', '액션, 코미디', '드웨인 존슨, 잭 에프론', '세스 고든',
'미치 뷰캐넌이 대장으로 있는 해양구조대에 올림픽 수영 메달리스트 맷 브로디가 합류한다. 이기적인 성격의 맷은 미치와 항상 티격태격하게 된다. 한편 해변에서는 플라카라고 불리는 마약이 자꾸만 발견되고 시의원이 죽는 사고도 벌어진다. 이것은 해변의 땅값을 떨어뜨린 뒤 몽땅 사들여 사유지화 하려는 거대 클럽의 사장 리즈 빅토리아의 음모였으며 이미 공무원들까지 매수된 상태였다. 눈치빠른 미치는 맷을 비롯하여 섬머, C.J, 로니 등 대원들과 함께 리즈의 음모를 파헤치며 해변을 지켜내기 위한 작전을 개시한다.', '5', '19');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/whiplash.jpg', '/FP/resources/images/banners/whiplash_poster.jpg', '위플래쉬', '드라마, 음악, 스릴러, 성장', '마일스 텔러, J.K. 시몬스', '데이미언 셔젤',
'뉴욕의 명문 셰이퍼 음악학교에서 최고의 스튜디오 밴드에 들어가게 된 신입생 앤드류 최고의 지휘자이지만 동시에 최악의 폭군인 플레쳐 교수는 폭언과 학대로 앤드류를 한계까지 몰아붙이고 또 몰아붙인다. 드럼 주위로 뚝뚝 떨어지는 피, 빠르게 달리는 선율 뒤로 아득해지는 의식, 그 순간, 드럼에 대한 앤드류의 집착과 광기가 폭발한다. 최고의 연주를 위한 완벽한 스윙이 시작된다!', '5', '15');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/Alien.jpg', '/FP/resources/images/banners/Alien_poster.jpg', '에이리언: 로물루스', '공포, SF', '케일리 스패니, 데이비드 존슨…', '페데 알바레즈',
'영화 역사상 가장 위대한 시리즈 <에이리언> 리들리 스콧 제작 · <맨 인 더 다크> 페데 알바레즈 감독의 숨 막히는 서바이벌 스릴러로 돌아오다! 2142년, 부모 세대가 맞닥뜨렸던 암울한 미래를 피하려는 청년들이 더 나은 삶을 찾기 위해 식민지를 떠날 계획을 세운다. 하지만 버려진 우주 기지 로물루스에 도착한 이들은 악몽과도 같은 에이리언의 무자비한 공격에 쫓기기 시작한다. 그 누구도 그들의 절규를 들을 수 없는 우주 한가운데, 생존을 위한 치열한 사투를 벌여야 하는데... 폐쇄된 공간에서 펼쳐지는 압도적인 공포를 느껴라!', '4', '15');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/EXECUTIONER.jpg', '/FP/resources/images/banners/EXECUTIONER_poster.jpg', '베테랑2', '범죄, 액션', '황정민, 정해인…', '류승완',
'가족들도 못 챙기고 밤낮없이 범죄들과 싸우는 베테랑 형사 서도철과 강력범죄수사대 형사들. 어느 날, 한 교수의 죽음이 이전에 발생했던 살인 사건들과 연관성이 있는 것으로 밝혀지며 전국은 연쇄살인범으로 인해 떠들썩해진다. 이에 단서를 추적하며 수사를 시작한 형사들. 하지만 이들을 비웃기라도 하듯, 연쇄살인범은 다음 살인 대상을 지목하는 예고편을 인터넷에 공개하며 또 한 번 전 국민을 흔들어 놓는다. 강력범죄수사대는 서도철의 눈에 든 정의감 넘치는 막내 형사 박선우를 투입한다. 그리고 사건은 새로운 방향으로 흐르게 되는데...', '4', '15');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/Demonslayer.jpg', '/FP/resources/images/banners/Demonslayer_poster.png', '귀멸의 칼날: 무한열차편', '애니메이션, 액션, 모험', '하나에 나츠키, 키토 아카리…', '소토자키 하루오',
'나비저택에서의 치료를 마친 탄지로 일행은 단기간에 40명 이상의 사람이 행방불명이 된 무한열차를 수색하는 임무를 맡게 된다. 무한열차에 탑승한 탄지로와 젠이츠, 이노스케 그리고 네즈코는 귀살대 최강의 검사인 주 가운데 한 명인 염주 렌고쿠 쿄쥬로와 합류하여, 어둠 속을 달리는 무한 열차 안 에서 혈귀와 맞서 싸우기 시작한다.', '5', '15');

INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/insideOut2.jpg', '/FP/resources/images/banners/insideOut2_poster.jpg', '인사이드아웃2', '애니메이션, 드라마, 코미디', '에이미 포엘러, 마야호크…', '켈시 맨',
'디즈니·픽사의 대표작 <인사이드 아웃> 새로운 감정과 함께 돌아오다! 13살이 된 라일리의 행복을 위해 매일 바쁘게 머릿속 감정 컨트롤 본부를 운영하는 기쁨, 슬픔, 버럭, 까칠, 소심. 그러던 어느 날, 낯선 감정인 불안, 당황, 따분, 부럽이가 본부에 등장하고, 언제나 최악의 상황을 대비하며 제멋대로인 불안이와 기존 감정들은 계속 충돌한다. 결국 새로운 감정들에 의해 본부에서 쫓겨나게 된 기존 감정들은 다시 본부로 돌아가기 위해 위험천만한 모험을 시작하는데… 2024년, 전 세계를 공감으로 물들인 유쾌한 상상이 다시 시작된다!', '5', '7');


INSERT INTO movie (mv_num,  image_url, poster_url, title, genre, actor, director, summary, star, age_limit) 
VALUES (null, '/FP/resources/images/banners/Heartsping.jpg', '/FP/resources/images/banners/Heartsping_poster.jpg', '사랑의하츄핑', '애니메이션, 판타지, 뮤지컬', '이지현, 조경이…', '김수훈',
'처음 본 순간, 한눈에 반해버렸어! 설레는 운명이 시작된 우리의 첫 만남! 인생의 소울메이트를 꼭 만나길 바라는 로미 우연한 기회에 하츄핑을 처음 본 뒤, 운명의 인연임을 알아본다. 로미는 하츄핑을 찾기 위해 반대를 무릅쓰고 새로운 길을 떠나지만, 마침내 만나게 된 하츄핑은 인간과의 소통을 거부하는데…', '4', '7');

 
 
 
 
 
 
 
 
 
 
 