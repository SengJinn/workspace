package object_array_guide.member;

import java.util.Scanner;

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
			System.out.println("===========================================================");
			System.out.println("1.회원가입|2.로그인|3.회원목록|4.회원정보수정|5.회원탈퇴|6.프로그램 종료");
			System.out.println("===========================================================");
			System.out.println("메뉴 선택 > ");
			
			if(!sc.hasNextInt()) {
				System.out.println("번호를 입력해주세요>");
				sc.next();
				continue;
			}
			selectNo = sc.nextInt();
			switch(selectNo) {
				case 1 : 
					System.out.println("== 회원가입 == ");
					join();
					break;
				case 2 : 
					System.out.println("== 로그인 == ");
					login();
					break;
				case 3 : 
					System.out.println("== 회원목록 == ");
					select();
					break;
				case 4 : 
					System.out.println("== 회원정보수정 == ");
					update();
					break;
				case 5 : 
					System.out.println("== 회원탈퇴 == ");
					delete();
					break;
				case 6 : 
					System.out.println("== 종료 == ");
					terminate();
					break;
				default :
					System.out.println("선택할 수 없는 번호입니다.");
			} // switch 종료
		} // while 종료
	} // run 종료
	
	// 프로그램 종료
	void terminate() {
		
	}

	// 회원 가입
	void join() {
		System.out.println("사용자 정보를 입력해주세요.");
		System.out.println("아이디를 입력해주세요.");
		String id = sc.next();
		System.out.println("비밀번호를 입력해주세요.");
		String pw = sc.next();
		System.out.println("비밀번호를 한 번 더 입력해주세요.");
		String rePw = sc.next();
		//입력한 정보가 사용가능한 정보인지 확인
		//사용가능한 id == 중복아이디 체크
		//사용가능한 비밀번호 pw와 rePw가 일치하는지 확인
		
		if(!memberIdCheck(id)){
		if(!memberIdCheck(id) || !pw.equals(rePw)) {
			System.err.println("이미 사용 중인 아이디이거나 비밀번호가 일치하지 않음");
			return; // join method 즉시 종료
			}
		}
		
		//사용 가능한 id 비밀번호 일치
		//회원가입 진행
		System.out.println("이름을 입력해주세요. >");
		String name = sc.next();
		
		//회원목록에서 빈자리 찾기
		for(int i = 0; i < members.length; i++) {
			if(members[i] == null) {
				members[i] = new Member(i+1, name, id,  pw);
				System.out.println("회원가입 완료");
				break;
			}
		}//end for
		
	}// end join method
	
	// 로그인
	void login() {
		System.out.println("아이디를 입력해주세요 >");
		String id = sc.next();
		System.out.println("비밀번호를 입력해주세요 >");
		String pw = sc.next();
		
		Member checkMember = new Member(id, pw);
		Member acceptMember = findMember(checkMember);
		
		if(acceptMember == null) {
			System.out.println("일치하는 회원 정보가 없습니다.");
			return;
		}
		
		// id와 pw가 일치하는 사용자 정보를 찾음.
		loginMember = acceptMember;
		System.out.println("정상적으로 로그인되었습니다.");
		System.out.println(loginMember.toString());
		
		//관리자 계정인지 여부 판별
		if(loginMember == master) {
			System.out.println("관리자 계정입니다.");
		}
		
	}//end login method

	// 회원목록 - 로그인한 회원이 관리자 일때만 노출 
	void select() {
		
		// 개인 회원 또는 로그인되지 않은 회원
		if(loginMember != master) {
			System.err.println("관리자만 확인 가능한 메뉴입니다.");
			return;
		}
		
		//회원 정보 출력
		//		     0      1      2          99
		// members [null] [null] [null] ... [null]
		for(Member m : members) {
			if(m != null) System.out.println(m.toString());
		}
		
	}
	
	// 회원정보 수정 - 로그인한 회원 정보랑 일치 하거나 관리자 일때만 수정(이름정보만 수정)
	void update() {
		// 개인회원 - 비번 확인 후 이름 정보 수정
		// 관리자 - 전체 회원중에 회원번호로 선택된 회원의 이름 정보 수정
		
		//로그인된 사용자인지 확인
		if(loginMember == null) {
			System.out.println("로그인 이후 사용 가능한 메뉴입니다.");
			return;
		}
		
		//로그인된 사용자
		if(loginMember == master) {
			//관리자
			System.out.println("관리자 회원 정보 수정");
			select();
			System.out.println("수정할 회원 번호를 입력해주세요.");
			int num = sc.nextInt();
			//전체 회원 정보를 순회하면서 회원 번호가 일치하는 사용자 정보 검색
			for(int i = 0; i>members.length; i++) {
				if(members[i] != null && members[i].mNum == num) {
					//회원 번호가 일치하는 회원 == members[i]
					System.out.println("수정할 회원의 이름을 입력해주세요.");
					String name = sc.next();
					members[i].mName = name;
					return;
				}// end update if
			}// end for
			
			System.out.println("일치하는 사용자를 찾을 수 없습니다.");
		}else {
			//개인회원
			System.out.println("내 정보 수정");
			System.out.println("비밀번호를 한 번 더 입력해주세요.");
			String pw = sc.next();
			// 로그인된 회원과 입력한 비밀번호가 일치할 경우
			// 로그인된 회원의 이름 정보 수정
			
		}
		
	}//end update method
	
	// 회원탈퇴 - 삭제 할려는 정보가 본인 정보일때만 삭제
	void delete() {
		if(loginMember == null) {
			System.out.println("로그인 이후 사용할 수 있는 기능입니다.");
			return;
		} // end check null
		
	//master 계정은 탈퇴 불가
	if(loginMember == master) {
		System.out.println("관리자 계정은 삭제할 수 없습니다.");
		return;
	} //end check master if
	
	//탈퇴 처리할 수 있는 개인회원으로 로그인된 사용자
	System.out.println("정말로 삭제하시겠습니까? y/n");
	String yn = sc.next();
	switch(yn){
		case "Y": case "y": case "ㅛ":
			break;
		default : System.out.println("회원탈퇴가 취소되었습니다.");
	}
	}//end delete method
	
	
	
	// 사용자 아이디 중복 체크 - 동일한 아이디 값으로 등록된 회원 정보 검색
	// 이미 존재하는 아이디 일경우 : false, 사용가능한 아이디 일 경우 : true
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



