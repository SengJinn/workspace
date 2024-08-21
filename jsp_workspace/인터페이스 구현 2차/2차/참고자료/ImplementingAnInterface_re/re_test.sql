
CREATE TABLE test_mvc_re(
	num int primary key auto_increment,		-- 회원 번호
	id VARCHAR(50) UNIQUE NOT NULL,			-- 회원 아이디(이메일)
	pass VARCHAR(100) NOT NULL,				-- 회원 비밀번호
	name VARCHAR(50),						-- 회원 이름
	addr VARCHAR(300) NOT NULL,				-- 주소
	phone VARCHAR(300) NOT NULL				-- 전화번호
);

DESC test_mvc_re;