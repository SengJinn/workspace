-- 어떤 테이블이 있는지 확인
SHOW tables; 

-- =====================================================================================
-- [회원 SQL]

-- mung_member 테이블 생성 : 와일드카드로  값을 받을때는 입력 받을것만 파라미터로 전달 받으면 된다. ( 회원번호 : 자동증가, 날짜 : now()는 안해도됨)
CREATE TABLE  IF NOT EXISTS mung_member(
num INT PRIMARY KEY AUTO_INCREMENT COMMENT '회원번호',
id VARCHAR(255) NOT NULL UNIQUE COMMENT '회원아이디',
pass VARCHAR(255) NOT NULL COMMENT '회원비밀번호',
name VARCHAR(255) NOT NULL COMMENT '회원이름',
email VARCHAR(255) NOT NULL UNIQUE COMMENT '회원이메일',
joinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일자'
); 

SELECT * FROM mung_member; 


-- =====================================================================================
-- [멍플레이스 추천장소(게시판 형태) SQL]


-- 해당 스키마가 존재하면 삭제 
-- DROP TABLE IF EXISTS place_lounge;

CREATE TABLE IF NOT EXISTS place_lounge(
	num INT PRIMARY KEY AUTO_INCREMENT COMMENT '게시글 번호',
	title VARCHAR(150) NOT NULL COMMENT '게시글 제목',
	guestName VARCHAR(20) NOT NULL COMMENT '게시글 작성자',
	checkNumber VARCHAR(30) NOT NULL COMMENT '게시글 확인용 번호',
	message TEXT COMMENT '게시글 내용 메시지',
	writeDate DATETIME NOT NULL COMMENT '게시글 작성 날짜'
);

SELECT * FROM place_lounge;

-- 게시글 삽입 
INSERT INTO place_lounge 
VALUES
(null,'[추천]애견카페 : 장안숲므로(기장군)','뽀삐엄마','1234','주소 : 부산 기장군 장안읍 방모산2길 37 | 영업시간 : 11:00 ~ 21:00 | 전화 : 0507-1372-7324 | 홈페이지 : https://janganforest.modoo.at/',now()),
(null,'[후기]애견카페 : 스포독(해운대구)','최크림','1234','주소 : 부산 해운대구 센텀동로 102 센텀필상가1관 옥상 | 영업시간 : 계절 마다 변동 | 전화 : 0507-1359-1972 | 홈페이지 : https://www.instagram.com/spodog_love',now()),
(null,'[후기]애견카페 : 힐링펫(기장군)','최모카','1234','주소 : 부산 기장군 장안읍 고무로 4 | 영업시간 : 11:00 ~ 21:00 | 전화 : 051-727-8256 | 홈페이지 : https://www.instagram.com/healing_pet_/?igshid=w6usqnx1nn3a',now()),
(null,'[추천]애견카페 : 하이멍(강서구)','콩아산책가자','1234','주소 : 부산 강서구 봉림길203번길 119-1 | 영업시간 : 11:00 ~ 21:00 | 전화 : 0507-1496-1641 | 홈페이지 : X',now()),
(null,'[추천]동물병원 : 헤아림 동물병원(동래구)','지랄견와와','1234','주소 : 부산 동래구 충렬대로 288 1층 | 영업시간 : 10:00 ~19:00 | 전화 : 051-555-1125 | 홈페이지 : X',now()),
(null,'[후기]동물병원 : 부산종합동물병원(부산진구)','내지갑돌려내','1234','주소 : 부산 부산진구 중앙대로 867 오성빌딩 2층 | 영업시간 : 24시간 진료 | 전화 : 051-817-4626 | 홈페이지 : X',now()),
(null,'[추천]동물병원 : 더에스동물병원(수영구)','춘식산책','1234','주소 : 부산 수영구 수영로464번길 6 3층 2호 | 영업시간 : 09:00 ~20:00 | 전화 : 051-913-758 | 홈페이지 : https://www.instagram.com/thesah0607/',now()),
(null,'[후기]애견동반음식점 : 굿손(부산진구)','초코코는촉촉','1234','주소 : 부산 진구 동성로25번길 15 1층 | 영업시간 : 11:30 ~21:00 | 전화 : 0507-1496-3357 | 홈페이지 : X',now()),
(null,'[후기]애견동반음식점 : 인사이드버거(해운대구)','시바스크림','1234','주소 : 부산광역시 해운대구 해운대해변로298번길24 팔레드시즈 | 영업시간 : 11:00 ~ 21:00 | 전화 : 0507-1377-2421 | 홈페이지 : X',now()),
(null,'[추천]애견동반음식점 : 해룸(부산진구)','대빵이','1234','주소 : 부산 진구 서전로38번길 35-12 | 영업시간 : 11:30 ~ 21:00 | 전화 : 0507-1404-9928 | 홈페이지 : https://app.catchtable.co.kr/ct/shop/__haelum',now()
);

-- sample data 삽입 (한번 실행할 떄 마다 2배씩 늘어난다.)
INSERT INTO place_lounge(title,guestName,checkNumber,message,writeDate)
SELECT title,guestName,checkNumber,message,writeDate FROM place_lounge;


-- =====================================================================================
-- [멍뮤니티 SQL] 

CREATE TABLE IF NOT EXISTS freewrite(
	num INT PRIMARY KEY AUTO_INCREMENT COMMENT '게시글 번호',
	title VARCHAR(20) NOT NULL COMMENT '게시글 제목',
	guestName VARCHAR(20) NOT NULL COMMENT '게시글 작성자',
	checkNumber VARCHAR(30) NOT NULL COMMENT '게시글 확인용 번호',
	message TEXT COMMENT '게시글 내용 메시지',
	writeDate DATETIME NOT NULL COMMENT '게시글 작성 날짜'
);

SELECT * FROM freewrite;

ALTER TABLE freewrite MODIFY COLUMN writeDate DATE;


-- sample data 삽입 (한번 실행할 떄 마다 2배씩 늘어난다.)
INSERT INTO freewrite(title,guestName,checkNumber,message,writeDate)
SELECT title,guestName,checkNumber,message,writeDate FROM freewrite;


-- =====================================================================================
-- [멍터테인먼트 - 뼈다귀게임 SQL]

CREATE TABLE IF NOT EXISTS scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM scores;


-- =====================================================================================

-- [명령문 모음]

-- 해당 스키마 사용 
-- USE mung_project;

-- DB 연동 후  이클립스에서 table 정보 확인
-- 실행할 쿼리 블럭 선택 후 alt+x, alt+c

-- 해당 스키마가 존재하지 않으면 생성 
-- CREATE SCHEMA IF NOT EXISTS mung_project;

-- 해당 스키마가 존재하면 삭제 
-- DROP SCHEMA IF EXISTS mung_project;

--
-- DELETE FROM 테이블이름 WHERE 삭제할 행의 조건;

-- 테이블 검색  
-- SELECT * FROM 테이블이름 ;

-- 테이블 구조 확인
-- DESC 테이블이름;

-- 공통 DB 계정 생성 
-- CREATE USER 'mung_admin'@'%' IDENTIFIED BY '1234';
-- GRANT ALL PRIVILEGES ON mung_project.* TO 'mung_admin'@'%' WITH GRANT OPTION;

-- DB 계정 삭제
-- DROP USER 'admin_mung'@'%';
