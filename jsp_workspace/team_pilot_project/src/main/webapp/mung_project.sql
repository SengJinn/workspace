-- ************************************************************
-- ****** mung_project.sql 파일 사용 하실 때 꼭 팀에게 말해주세요 ******
-- ******       아직 트랜잭션(저장, 롤백 기능) 구현 안했습니다 !    ******
-- ************************************************************

-- =====================================================================================
-- [회원 SQL] : mung_member.sql

-- mung_member 테이블 생성 : 와일드카드로  값을 받을때는 입력 받을것만 파라미터로 전달 받으면 된다. ( 회원번호 : 자동증가, 날짜 : now()는 안해도됨)
CREATE TABLE  IF NOT EXISTS mung_member(
num INT PRIMARY KEY AUTO_INCREMENT COMMENT '회원번호',
id VARCHAR(255) NOT NULL UNIQUE COMMENT '회원아이디',
pass VARCHAR(255) NOT NULL COMMENT '회원비밀번호',
name VARCHAR(255) NOT NULL COMMENT '회원이름',
email VARCHAR(255) NOT NULL UNIQUE COMMENT '회원이메일',
joinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일자'
); 

-- 테이블 내용확인
SELECT * FROM mung_member; 
-- 테이블 구조 확인
DESC mung_member; 

-- =====================================================================================
-- [멍뮤니티 SQL] : free_write.sql

-- 방명록 작성자 이름
-- 작성자 확인 비밀번호
-- 방명록 메세지

CREATE TABLE IF NOT EXISTS freewrite(
	num INT PRIMARY KEY AUTO_INCREMENT COMMENT '게시글 번호',
	title VARCHAR(20) NOT NULL COMMENT '게시글 제목',
	guestName VARCHAR(20) NOT NULL COMMENT '게시글 작성자',
	checkNumber VARCHAR(30) NOT NULL COMMENT '게시글 확인용 번호',
	message TEXT COMMENT '게시글 내용 메시지',
	writeDate DATETIME NOT NULL COMMENT '게시글 작성 날짜'
);

-- 테이블 내용확인
SELECT * FROM freewrite;
-- 테이블 구조 확인
DESCRIBE freewrite; 

-- =====================================================================================
-- [명령문]

-- 해당 스키마 사용 
-- USE mung_project;

-- DB 연동 후  이클립스에서 table 정보 확인
-- 실행할 쿼리 블럭 선택 후 alt+x, alt+c

-- 해당 스키마가 존재하지 않으면 생성 
-- CREATE SCHEMA IF NOT EXISTS mung_project;

-- 해당 스키마가 존재하면 삭제 
-- DROP SCHEMA IF EXISTS mung_project;

-- 테이블 검색  
-- SELECT * FROM 테이블이름 ;

-- 테이블 구조 확인
-- DESC 테이블이름;

-- 공통 DB 계정 생성 
-- CREATE USER 'mung_admin'@'%' IDENTIFIED BY '1234';
-- GRANT ALL PRIVILEGES ON mung_project.* TO 'mung_admin'@'%' WITH GRANT OPTION;

-- 계정 삭제
-- DROP USER 'admin_mung'@'%';