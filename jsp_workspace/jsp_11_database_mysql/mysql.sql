CREATE SCHEMA `digital_jsp`;
CREATE DATABASE `digital_jsp`;

/*
	INSERT SELECT UPDATE DELETE
    Create Read Update Delete
	CRUD
*/

CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY AUTO_INCREMENT,	-- 회원 번호
	id VARCHAR(300) NOT NULL UNIQUE,	-- 회원 아이디
    pass VARCHAR(300) NOT NULL,			-- 비밀번호
    name VARCHAR(50),					-- 이름
    addr VARCHAR(300)					-- 주소
);

-- SELECT * FROM digital_jsp.member;
SELECT * FROM member;

-- table에 값 삽입, INSERT INTO table VALUES(값...);
-- num, id, pass, name, addr
INSERT INTO member VALUES(null,'id001', 'pw001', '김동하','개성');

INSERT INTO member (id,pass,name,addr)
VALUES('id002','pw002','IRON MAN', 'NEW YORK');

COMMIT;

SELECT * FROM member ORDER BY num DESC;

SELECT num, id, name, addr FROM member ORDER BY num DESC;

DELETE FROM member WHERE id = id001;

DELETE FROM member WHERE  num = 5;

rollback;

SELECT @@autocommit;

SET AUTOCOMMIT = TRUE;
-- AUTOCOMMIT 해제
SET AUTOCOMMIT = false;

UPDATE member SET name ='SPIDER MAN', addr = '퀸즈'
WHERE num='11';

SELECT * FROM member;

SELECT * FROM member WHERE id = 'id001' AND pass='pw001';

commit;

-- SQL Injection

SELECT * FROM member WHERE id = 'id001' ; -- ' AND pass = 'skdjlksdjflksjfdlskjf';
SELECT * FROM member WHERE id = 'id001' ; -- ' AND pass = 'sfdfs!!!!!!!!!';
-- ' OR 1 = 1 --
SELECT * FROM member WHERE id = 'id001' AND pass = '' Or 1 = 1; --

-- PREPARE EXECUTE문
PREPARE mQuery FROM "SELECT * FROM member WHERE id = ? AND pass =?";

SET @tempVal1 = 'id001';
SET @tempVal2 = 'pw001';

EXECUTE mQuery USING @tempVal1, @tempVal2;

-- Procedure 
DELIMITER $$
	CREATE PROCEDURE loginCheck(
		IN _id VARCHAR(300),
        IN _pass VARCHAR(300)
    )
BEGIN
	SELECT * FROM member WHERE id = _id AND pass = _pass;
END $$
DELIMITER ;


CALL loginCheck('id001', 'pw001');
