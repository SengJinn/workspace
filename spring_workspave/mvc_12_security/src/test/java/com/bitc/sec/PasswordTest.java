package com.bitc.sec;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.sec.dao.MemberDAO;
import com.bitc.sec.vo.SecurityMemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {
		"classpath:spring/root-context.xml",	
		"classpath:spring/security-context.xml"	
	}
)
public class PasswordTest {
	
	@Autowired
	MemberDAO dao;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Test
	public void passwordEncoderTest () throws Exception{
		System.out.println(dao);
		System.out.println(encoder);
		// $2a$10$6YpM7YLC2AovHatQh8nTreLnwIupdNjzUd8E4wzfZCfIwImJ8CqYq
		// $2a$10$GIVGgv6HYljPJPhx9TJrve7wA03KBHgWI/Z4qh0aYruaoQfgNSGrC
		String u_pw = "chlrlrms1!";
		String encode = encoder.encode(u_pw);
		System.out.println("u_pw : " + u_pw);
		System.out.println("encode : " + encode);
		
		SecurityMemberVO vo = dao.getMemberById("hap0p9y@nate.com");
		String db_pw = vo.getU_pw();
		System.out.println("db_pw : " + db_pw);
		boolean isMatches =	encoder.matches(db_pw, encode);
		System.out.println("isMatches : " + isMatches);
	}

}












