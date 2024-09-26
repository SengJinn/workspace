
-- 테이블 이름 변경 spring_member => spring_user
RENAME TABLE spring_member TO spring_user;

DESC spring_user;

CREATE TABLE IF NOT EXISTS spring_user(
	u_no INT PRIMARY KEY AUTO_INCREMENT,			-- 회원 번호
	u_id VARCHAR(200) NOT NULL UNIQUE,				-- 회원 아이디(email)
	u_pw VARCHAR(100) NOT NULL,						-- 비밀번호
	u_name VARCHAR(50) NOT NULL,					-- 이름 
	u_profile VARCHAR(300) NULL,					-- 프로필 이미지
	u_phone VARCHAR(20) NOT NULL,					-- 전화번호
	u_birth VARCHAR(20) NOT NULL,					-- 생년월일(19820607)
	u_addr VARCHAR(20),								-- 주소
	u_addr_detail VARCHAR(200),						-- 상세주소
	u_addr_post VARCHAR(50),						-- 우편번호
	u_point INT DEFAULT 0,							-- 포인트
	u_date TIMESTAMP NOT NULL DEFAULT now(),		-- 계정 생성일
	u_visit_date TIMESTAMP NOT NULL DEFAULT now(),	-- 최종 방문일(마지막 로그인)
	u_withdraw char(1) DEFAULT 'n'					-- 회원 탈퇴 여부(회원정보 숨김)   
);

-- 주소 저장 column 길이 확장 , u_addr
ALTER TABLE spring_user CHANGE COLUMN u_addr u_addr VARCHAR(200);

DESC spring_user;

SELECT * FROM spring_user;

show tables;

CREATE TABLE board_tbl(
	bno INT PRIMARY KEY auto_increment,
	title VARCHAR(200) NOT NULL,
	content TEXT NOT NULL,
	regdate TIMESTAMP NULL DEFAULT now(),
	viewcnt INT NULL DEFAULT 0,
	showboard char(1) NULL DEFAULT 'y',
	u_no INT NOT NULL,
	CONSTRAINT fk_board_tbl_uno 
	FOREIGN KEY(u_no) REFERENCES spring_user(u_no)
);

SELECT B.*, U.u_name AS writer FROM 
board_tbl AS B JOIN spring_user AS U 
ON B.u_no = U.u_no 
ORDER BY bno DESC limit 0 , 10;

SELECT * FROM 
board_tbl AS B JOIN spring_user AS U; 


UPDATE spring_user SET u_name = '원빈' 
WHERE u_no = 3;

INSERT INTO board_tbl(title,content,u_no) 
SELECT title,content,u_no FROM board_tbl;



SELECT B.*, U.u_name AS writer FROM 
board_tbl AS B JOIN spring_user AS U 
ON B.u_no = U.u_no 

WHERE title LIKE CONCAT('%','3일','%') 

-- ORDER BY bno DESC limit 0 , 10;

SELECT count(*) FROM 
board_tbl WHERE title LIKE CONCAT('%','3일','%') 

SELECT count(*) FROM 
board_tbl AS B JOIN spring_user AS U 
ON B.u_no = U.u_no 
WHERE title LIKE CONCAT('%','3일','%') 


SELECT B.*, U.u_name AS writer FROM 
board_tbl AS B JOIN spring_user AS U 
ON B.u_no = U.u_no 
WHERE U.u_name LIKE CONCAT('%','원','%') 	-- w			tw
OR title LIKE CONCAT('%','3일','%') 			--  t










