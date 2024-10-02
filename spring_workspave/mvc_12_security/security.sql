-- security.sql

CREATE TABLE security_member(
	u_no INT PRIMARY KEY AUTO_INCREMENT,
	u_id VARCHAR(200) NOT NULL UNIQUE,
	u_pw VARCHAR(300) NOT NULL,
	u_name VARCHAR(20) NOT NULL
);

SELECT * FROM security_member;

-- 권한 table
CREATE TABLE security_member_auth(
	u_id VARCHAR(200) NOT NULL, 
	u_auth VARCHAR(50) NOT NULL,
	CONSTRAINT fk_member_auth FOREIGN KEY(u_id) 
	REFERENCES security_member(u_id)
);

INSERT INTO security_member_auth(u_id,u_auth) 
VALUES('hap0p9y@nate.com', 'ROLE_ADMIN');

INSERT INTO security_member_auth(u_id,u_auth) 
VALUES('hap0p9y@nate.com', 'ROLE_MEMBER');

SELECT * FROM security_member_auth WHERE u_id = 'hap0p9y@nate.com';





