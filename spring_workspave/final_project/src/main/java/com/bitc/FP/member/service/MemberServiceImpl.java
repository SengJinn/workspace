package com.bitc.FP.member.service;

import java.lang.reflect.Member;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import com.bitc.FP.member.dao.*;
import com.bitc.FP.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service("ms")
@RequiredArgsConstructor // lombok
public class MemberServiceImpl implements MemberService {

// 	@Autowired
	private final MemberDAO dao; // = new MemberDAOImpl();

	@Override
	public boolean memberJoin(MemberVO member) {
		return dao.memberJoin(member);
	}

	@Override
	public MemberVO memberLogin(LoginDTO dto) {
        // 사용자 이름을 기준으로 사용자 정보를 찾음
		 MemberVO member = dao.memberLogin(dto.getEmail());

        // 사용자가 존재하고 비밀번호가 일치하는지 확인
        if (member != null && member.getPass().equals(dto.getPass())) {
            return member;  // 로그인 성공
        }

        return null;  // 로그인 실패
	}

//	@Override
//	public void logOut(HttpServletRequest request, HttpServletResponse response) {
//
//	}

}
