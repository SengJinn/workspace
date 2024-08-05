-- 공지용 게시판  notice_board
CREATE TABLE notice_board(
	notice_num int primary key auto_increment,	-- 게시글 번호
	notice_category VARCHAR(20),				-- 게시글 분류
	notice_author VARCHAR(50),					-- 작성자 이름
	notice_title VARCHAR(50),					-- 제목
	notice_content TEXT,						-- 내용
	notice_date TIMESTAMP default now()			-- 작성 시간
);

SELECT count(*) FROM notice_board;

SELECT count(*) FROM notice_board
WHERE notice_author LIKE CONCAT('%','안녕','%');

SELECT * FROM notice_board;

SELECT * FROM notice_board ORDER BY notice_num DESC limit 10 OFFSET 0;
SELECT * FROM notice_board ORDER BY notice_num DESC limit 0, 10;

SELECT 'A' + 'B' FROM DUAL;

SELECT 1 + 2 FROM DUAL;

-- LIKE 절 pattern : _ , %
SELECT * FROM notice_board WHERE notice_title LIKE '%동%';

-- setString(1,"서울")
-- SELECT * FROM notice_board WHERE notice_title LIKE '%?%';
SELECT * FROM notice_board WHERE notice_title LIKE CONCAT('%', '서울', '%');

-- 검색된 전체 게시글 개수
SELECT count(*) FROM notice_board
WHERE notice_author LIKE CONCAT('%','안녕','%');

INSERT INTO notice_board (
SELECT null,notice_category, notice_author,notice_title,notice_content,notice_date FROM notice_board
);

SELECT count(*) FROM notice_board;

-- 공지 게시글 작성
INSERT INTO notice_board 
VALUES(null,'공지','최기근','장난입니다.','내용이 없습니다.내용이 없습니다.',now());

SELECT * FROM notice_board
WHERE 


