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

-- [컨텐츠 정보 테이블]
CREATE TABLE IF NOT EXISTS movie(
	mv_num int PRIMARY KEY AUTO_INCREMENT ,
	image_name VARCHAR(50) NOT NULL,
    image_type VARCHAR(50) NOT NULL,
	image LONGBLOB NOT NULL,
    video_name VARCHAR(50) NOT NULL,
	video_type VARCHAR(50) NOT NULL,
    video LONGBLOB NOT NULL,
	title VARCHAR(20),
    genre VARCHAR(20),
    actor VARCHAR(255),
    director VARCHAR(255),
    summary VARCHAR(255),
    `comment` VARCHAR(255),
    star int(5.0)
);

CREATE TABLE IF NOT EXISTS drama LIKE `movie`;

CREATE TABLE IF NOT EXISTS docu LIKE `movie`;

CREATE TABLE IF NOT EXISTS ent LIKE `movie`;
 