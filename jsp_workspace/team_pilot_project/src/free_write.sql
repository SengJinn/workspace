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

-- table 정보 확인
-- 실행할 쿼리 블럭 지정후 alt+x, alt+c
DESCRIBE freewrite;
DROP TABLE IF EXISTS freewrite;

SELECT * FROM freewrite;

-- sample data 추가
INSERT INTO freewrite(guestName, password, message)
SELECT guestName, password, message FROM guestBook;

SELECT * FROM free_write WHERE num = 13;