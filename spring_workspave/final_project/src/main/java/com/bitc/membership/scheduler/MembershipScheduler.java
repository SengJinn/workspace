package com.bitc.membership.scheduler;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bitc.member.model.MemberVO;
import com.bitc.membership.dao.MembershipDAO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
@EnableScheduling
public class MembershipScheduler {

	private MembershipDAO dao;
	
	@Scheduled(fixedRate = 60000) // 1분마다 실행
	public void updateSessionMembershipStatus() {
		System.out.println("스케줄러 실행");

		// 현재 세션을 가져오기
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attrs.getRequest().getSession();

		// 세션에서 멤버 정보를 가져오기
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			Date expiration = member.getExpiryDate();
			Date now = new Date();

			// 만료일 비교
			if (expiration.before(now)) {
				// 만료된 경우 DB에서 상태 업데이트
				dao.expiration(member.getEmail());

				// 세션 갱신
				MemberVO updatedMember = dao.getMemberByEmail(member.getEmail()); // 갱신된 정보를 다시 가져오기
				session.setAttribute("member", updatedMember);
			}
		}
	}
}
