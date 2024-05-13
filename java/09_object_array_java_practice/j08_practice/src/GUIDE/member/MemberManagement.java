package GUIDE.member;

import java.util.Scanner;

import object_array_guide.account.Account;

public class MemberManagement{

	// 사용자 입력
	Scanner sc = new Scanner(System.in);
	
	// 회원정보 저장
	Member[] members = new Member[100];
	
	// 관리자 계정
	Member master = new Member(100,"master","root","root");
	
	// 로그인한 회원
	Member loginMember = null;
	
	// 프로그램 flag (true : 진행 , false : 종료) 
	boolean isRun = true;
	
	// 메뉴 번호 선택
	int selectNo;

	// 프로그램 실행용 생성자
	MemberManagement() {
		// 회원목록 배열 마지막 인덱스에 관리자 계정 저장
		members[members.length-1] = master;
		// 회원관리 메소드 호출
		isRun();
	}
	
	/*
	 * 기능 관리 
	 */
	
	// 프로그램 실행
	void isRun() {
		while(isRun) {
			System.out.println("========================================================");
			System.out.println("1.회원가입 2.로그인 3.회원목록 4.회원정보수정 5.회원탈퇴 6.프로그램종료");
			System.out.println("========================================================");
			
			System.out.println("번호 입력 >");
			int selectNo = sc.nextInt();
			
			if(selectNo == 1) {
				// 회원가입
				join();
			}else if(selectNo ==2) {
				// 로그인
				login();
			}else if(selectNo ==3) {
				// 회원목록
				select();
			}else if(selectNo ==4) {
				// 회원정보수정
				update();
			}else if(selectNo ==5) {
				// 회원탈퇴
				delete();
			}else if(selectNo ==6) {
				// 프로그램종료
				isRun = false;
				sc.close();
			}
		}
		System.out.println("프로그램 종료");
	}
	
	// 프로그램 종료
	void terminate() {
		
	}

	// 회원 가입
	void join() {
		System.out.println("사용자 정보를 입력해주세요. >");
		System.out.println("ID를 입력해주세요. >");
		String userID = sc.next();
		
		System.out.println("사용자 정보를 입력해주세요. >");
		System.out.println("비밀번호를 입력해주세요. >");
		String userPW = sc.next();
		
		System.out.println("비밀번호를 확인해주세요. >");
		String userPWCheck = sc.next();
		
		System.out.println("이름을 입력해주세요. >");
		String userName = sc.next();
		
		Member newmember = new Member();
		newmember.mName = userName;
		newmember.mId = userID;
		newmember.mPw = userPW;
		
		boolean registAccount = memberIdCheck(userID);
		if(!registAccount || !userPW.equals(userPWCheck)) {
			System.out.println("이미 사용 중인 ID거나 비밀번호가 일치하지 않습니다.");
		}else {
			for(int i = 0; i < members.length; i++) {
				if(members[i] == null){
					members[i] = newmember;
					System.out.println("회원가입이 완료되었습니다.");
					break; }//end if2
			}//end for
		}//end if1
	}//end join
	
	// 로그인
	void login() {
		System.out.println("아이디를 입력해주세요. > ");
		String userID = sc.next();
		
		System.out.println("비밀번호를 입력해주세요. >");
		String userPW = sc.next();
		
		Member m = new Member();
		m.mId = userID;
		m.mPw = userPW;
		
		loginMember = findMember(m);
		if(loginMember == master) {
			System.out.println("정상적으로 로그인되었습니다.");
			String info = loginMember.toString();
			System.out.println("관리자 계정입니다.");
		} if(loginMember != null) {
			System.out.println("정상적으로 로그인되었습니다.");
			String info = loginMember.toString();
			
		}else {
			System.out.println("일치하는 멤버가 없습니다.");
		}	
		
	}//end login

	// 회원목록 - 로그인한 회원이 관리자 일때만 노출 
	void select() {
		if(loginMember == master) {
			for(Member mems : members) {
				String info = mems.toString();
			}
		} else {
			System.out.println("관리자만 확인 가능한 메뉴입니다.");
		} //로그인 멤버가 널일 때 어떻게 할지 적어주기
	}
	
	// 회원정보 수정 - 로그인한 회원 정보랑 일치 하거나 관리자 일때만 수정(이름정보만 수정)
	void update() {
		System.out.println("내 정보 수정 >");
		System.out.println("비밀번호를 한 번 더 입력해주세요.");
		String userPW = sc.next();
		
		if(userPW == loginMember.mPw) {
			System.out.println("수정할 이름을 입력해주세요.");
			String correctName = sc.next();
			for(int i=0; i<members.length; i++) {
				if(members[i].equals(loginMember)) {
					members[i].mName = correctName;
				} //end if
			} // end for
			System.out.println("내 정보 수정 완료");
		} // end if
		else {
			System.out.println("비밀번호가 옳지 않습니다.");
			return;
		}
	}// end update
	
	// 회원탈퇴 - 삭제 할려는 정보가 본인 정보일때만 삭제
	void delete() {
		System.out.println("회원 탈퇴 >");
		System.out.println("정말로 탈퇴하시겠습니까? y/n");
		String YN = sc.next();
		
		switch(YN) {
		case"y": case"Y": case "ㅛ":
			deleteMember();
		case"n": case"N": case "ㅜ":
			System.out.println("탈퇴가 취소되었습니다.");
			break;
		default :
			System.out.println("확인할 수 없는 명령어입니다.");
		}
	}
	
	// 사용자 아이디 중복 체크
	boolean memberIdCheck(String mId) {
		for(Member m : members) {
			if(m != null && m.mId.equals(mId)) {
				return false;
			}
		}		
		return true;
	}
	
	// 회원 아이디와 비밀번호로 회원 찾기
	Member findMember(Member m) {
		for(Member member : members) {
			if(member != null && member.equals(m)) {
				return member;
			}
		}
		return null;
	}
	
	// 회원 정보 삭제
	void deleteMember() {
		for(int i=0; i<members.length; i++) {
			if(members[i].equals(loginMember)) {
				members[i] = null;
				loginMember = null;
				System.out.println("회원탈퇴 완료");
				return;
			}
		}
	}
}
