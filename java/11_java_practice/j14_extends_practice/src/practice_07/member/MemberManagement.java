package practice_07.member;

import java.util.Scanner;

public class MemberManagement{
	
	// 사용자 입력
	private Scanner sc = new Scanner(System.in);
	
	// 회원정보 저장
	private Member[] members = new Member[100];
	
	// 관리자 계정
	private Member master = new Member(100,"master","root","root");
	
	// 로그인한 회원
	private Member loginMember = null;
	
	// 프로그램 flag (true : 진행 , false : 종료) 
	private boolean isRun = true;
	
	// 메뉴 번호 선택
	private int selectNo;
	
	// 프로그램 실행용 생성자
	public MemberManagement() {
		// 관리자 계정을 99인덱스에 저장
		members[members.length - 1] = master;
	}

	public void isRun() {
		System.out.println("프로그램 시작!");
		while (isRun) {
			System.out.println("===========================================================");
			System.out.println("1.회원가입 |2.로그인 |3.회원목록|4.회원정보수정|5.회원탈퇴|6.프로그램종료");
			System.out.println("===========================================================");
			System.out.println("메뉴 선택 > ");
			
			if(!sc.hasNextInt()){
				System.out.println("번호를 입력해주세요. ");
				sc.next();
				continue;
			}

			selectNo = sc.nextInt();
			switch (selectNo) {
				case 1:
					System.out.println("== 회원가입 == ");
					join();
					break;
				case 2:
					System.out.println("== 로그인 == ");
					login();
					break;
				case 3:
					System.out.println("== 회원목록 == ");
					select();
					break;
				case 4:
					System.out.println("== 회원정보수정 == ");
					update();
					break;
				case 5:
					System.out.println("== 회원탈퇴 == ");
					delete();
					break;
				case 6:
					System.out.println("== 종료 == ");
					terminate();
					break;
				default:
					System.out.println("선택할 수 없는 번호입니다.");
			}
		}
	}

	
	private void terminate() {
		isRun = false;
	}

	private void join() {
		System.out.println("아이디를 입력해주세요");
		String mId = sc.next();
		System.out.println("비밀번호를 입력해주세요");
		String mPw = sc.next();
		System.out.println("이름을 입력해주세요");
		String mName = sc.next();
		System.out.println("비밀번호를 한번 더 입력해주세요");
		String rePw = sc.next();
		
		// 멤버 정보 값을 저장할 새 객체
		Member member = new Member();
		
		// 멤버 체크를 통해 일치하는 아이디가 있는지 검토 || 비밀번호와 비밀번호 확인이 같은지 체크
		if(!memberIdCheck(mId) || !mPw.equals(rePw)) {
			System.err.println("이미 사용 중인 아이디이거나 비밀번호가 일치하지 않습니다.");
			return; 
			}
		
		// 받은 아이디와 패스워드를 setter를 통해 객체에 저장
		member.setId(mId);	member.setPw(mPw);	member.setName(mName);
		// 배열 안에 멤버 정보를 저장
		for(int i = 0; i < members.length; i++) {
			if(members[i] == null) {
				member.setNum( i + 1 );
				members[i] = member;
				System.out.println("회원가입이 완료되었습니다.");
				break;
			}
		}
		
	}//end join

	private void login() {
		System.out.println("아이디를 입력해주세요 > ");
		String mId = sc.next();
		System.out.println("비밀번호를 입력해주세요 >");
		String mPw = sc.next();
		
		// 로그인용 생성자를 통해 정보가 일치하는 멤버를 findMember로 찾음
		Member m = findMember(new Member(mId, mPw));
		
		// findmember에서 결과값이 null로 반환되지 않았을 때, loginmember에 m의 정보를 저장함
		if(m != null) {
			loginMember = m;
			System.out.println("로그인 되었습니다.");
			System.out.println(m);
		}
		// null값으로 반환됐을 경우 일치하는 정보가 없음을 알림
		if(m == null) {
			System.err.println("회원 정보가 일치하지 않습니다.");
			return;
		}
		// 관리자 id로 로그인 했을 경우
		if(m.getId().equals("root")) {
			System.out.println("관리자 계정으로 로그인 되었습니다.");
		}
		
	}

	private void select() {
		// 로그인 멤버가 비어있지 않고 관리자 정보와 일치할 경우, null이 아닌 m값을 출력
		if (loginMember != null && loginMember.equals(master)) {
			for (Member m : members) {
				if (m != null)
					System.out.println(m);
			}
		} else {
			// 관리자 외의 아이디일 경우 출력
			System.err.println("관리자만 확인 가능한 메뉴입니다.");
		}
	}
	

	private void update() {
		// 개인회원 - 자기정보(이름) 만 수정 가능
		// 관리자 - 전체 회원 정보(이름) 수정 가능
		if (loginMember == null) {
			System.err.println("로그인 후 사용가능 한 메뉴입니다.");
			return;
		}

		if (loginMember.equals(master)) {
			System.out.println("== 관리자용 회원 정보 수정 ==");
			select();
			System.out.println("수정할 회원 번호를 입력해 주세요.");
			int Num = sc.nextInt();
			// 배열을 순회하여 입력한 회원 번호와 같은 번호를 가진 회원을 찾음
			// 배열이 null이 아니며 일치하는 번호에 회원 정보가 있을 경우 수정 가능
			for (int i = 0; i < members.length; i++) {
				if (members[i] != null && members[i].getNum() == Num) {
					System.out.println("수정할 회원의 이름을 입력해 주세요 > ");
					String name = sc.next();
					members[i].setName(name);
					
					System.out.println("수정할 회원의 아이디를 입력해 주세요 > ");
					String Id = sc.next();
					members[i].setId(Id);
					
					System.out.println("수정할 회원의 비밀번호를 입력해 주세요 > ");
					String PW = sc.next();
					members[i].setPw(PW);
					
					System.out.println("수정이 완료되었습니다.");
					return;
				}
			}
		}
		else {
			System.out.println("== 일반 회원용 정보 수정 ==");
			System.out.println("비밀번호를 한 번 더 입력해주세요.");
			String pw = sc.next();
			// 다시 입력한 패스워드와 일치하는 멤버 값이 없을 경우 안내
			if (!loginMember.getPw().equals(pw)) {
				System.err.println("비밀번호가 일치하지 않습니다.");
			}
			// 비밀번호 확인한 결과 일치하는 멤버가 있으면 해당 멤버의 정보 수정가능
			if (loginMember.getPw().equals(pw)) {
				System.out.println("수정할 이름을 입력해주세요. > ");
				String name = sc.next();
				loginMember.setName(name);
				
				System.out.println("수정할 아이디를 입력해 주세요 > ");
				String Id = sc.next();
				loginMember.setId(Id);
				
				System.out.println("수정할 비밀번호를 입력해 주세요 > ");
				String PW = sc.next();
				loginMember.setPw(PW);
				
				System.out.println("수정이 완료되었습니다.");
				System.out.println(loginMember);
				return;
			}
		}
	}

	private void delete() {
		// 로그인 멤버에 저장된 값이 없을 경우 
		if(loginMember == null) {
			System.err.println("로그인 후 사용할 수 있는 메뉴입니다.");
		} // 관리자 아이디로 로그인 했을 경우
		if(loginMember == master) {
			System.err.println("관리자 아이디는 삭제할 수 없습니다.");
		} // 사용자 아이디로 로그인할 경우 다시 한 번 확인한 뒤 삭제
		else {
			System.err.println("정말로 삭제 하시겠습니까? y/n");
			char str = sc.next().charAt(0);
			if(str == 'y'|| str == 'Y' || str == 'ㅛ') {
			deleteMember();
			}
			if(str == 'n' || str == 'N' || str == 'ㅜ') {
				System.err.println("회원 정보 삭제가 취소되었습니다.");
			}
		}
	}
	
	// 회원 정보 삭제
	private void deleteMember() {
		for(int i=0; i<members.length; i++) {
			if(members[i].equals(loginMember)) {
				members[i] = null;
				loginMember = null;
				System.out.println("회원 정보가 삭제되었습니다.");
				return;
			}
		}
	}
	
	// 사용자 아이디 중복 체크
	private boolean memberIdCheck(String mId) {
		for(Member m : members) {
			if(m != null && m.getId().equals(mId)) {
				return false;
			}
		}		
		return true;
	}
	
	// 회원 아이디와 비밀번호로 회원 찾기
	private Member findMember(Member m) {
		for(Member member : members) {
			if(member != null && member.equals(m)) {
				return member;
			}
		}
		return null;
	}
}
