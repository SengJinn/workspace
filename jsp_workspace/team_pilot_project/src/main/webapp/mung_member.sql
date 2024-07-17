-- digital_jsp 스키마 사용
USE digital_jsp;

-- mung_member 테이블 삭제
DROP TABLE IF EXISTS mung_member;

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

-- sample data 추가
-- INSERT INTO mung_member(num, id, pass, name, email, joinDate)
-- SELECT num, id, pass, name, email, joinDate FROM mung_member; 

-- 임의 데이터 추가
-- INSERT INTO mung_member
-- VALUES(null,'id001', 'pw001', '이부산', 'eBusan@naver.com', now()),
-- (null,'id002', 'pw002', '이울산', 'eUlsan@naver.com', now()),
-- (null,'id003', 'pw003', '이용호', 'eYH@naver.com', now());

-- 원하는 회원 삭제
-- DELETE FROM mung_member WHERE email = 'eBusan@naver.com';


