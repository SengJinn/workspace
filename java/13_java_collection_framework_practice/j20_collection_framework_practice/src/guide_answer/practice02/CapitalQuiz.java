package guide_answer.practice02;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CapitalQuiz {
	
	private List<Nation> store = new ArrayList<>();
	private Scanner sc = new Scanner(System.in);
	
	/**
	 * 객체 생성시 store ArrayList에 8개의 국가에 대한 기본적인 정보 입력 
	 */
	public CapitalQuiz() {
		Nation nation = new Nation("한국", "서울");
		store.add(nation);
		
		store.add(new Nation("프랑스", "파리"));
		store.add(new Nation("그리스", "아테네"));
		store.add(new Nation("중극", "베이징"));
		store.add(new Nation("스페인", "마드리드"));
		store.add(new Nation("영국", "런던"));
		store.add(new Nation("독일", "베를린"));
		store.add(new Nation("러시아", "모스크바"));
	}
	
	/**
	 * 수도 맞추기 게임 시작
	 */
	public void run() {
		System.out.println("**** 수도 맞추기 게임을 시작합니다. ****");
		while(true) {
			System.out.println("입력 : 1, 퀴즈 : 2, 종료 : 3");
			int menu = sc.nextInt();
			switch(menu) {
				case 1 :
					// 국가별 수도 정보 추가
					input();
					break;
				case 2 : 
					// 국가 이름으로 수도 정보 맞추기
					quiz();
					break;
				case 3 : 
					System.out.println("게임을 종료합니다.");
					return;
				default :
					System.out.println("잘못된 입력입니다.");
			}
		}
	}
	
	/**
	 * 국가 등록 - 국가 이름, 수도 이름 Nation 정보 등록 
	 */
	private void input() {
		// List, Set에 등록된 항목 개수
		int size = store.size();
		System.out.println("현재" + size + "개의 나라와 수도가 입력되어 있습니다.");
		// 반복하면서 새로운 국가 정보 추가
		a : while(true) { // 사용자가 국가 이름에 q를 입력할 때까지 반복
			
			System.out.printf("국가 입력 (현재 %d번째 국가 등록 / q는 종료) >>", (store.size() + 1) );
			
			String country = sc.next();
			if(country.equals("q")) {
				System.out.println("입력을 종료합니다.");
				break;
			}
			
			System.out.println("수도 입력 >> ");
			String capitalCity = sc.next();
			
			Nation nation = new Nation(country, capitalCity);
			
			// contains는 동등한 객체인지 비교를
			// Object의 equals method로 비교
			boolean isChecked = store.contains(nation);
			
			if(isChecked) {
				System.out.println(country + "(은)는 이미 있습니다.");
				continue;
			}
			
			store.add(nation);
			System.out.println("국가 정보 추가 완료");
			
			/*
			// 중복 국가인지 확인
			for(Nation n : store) {
				// 리스트에 등록된 Nation 객체의 국가 이름과 사용자가 추가하려 하는 국가 이름이 일치 - 중복 국가 등록
				if(n.getCountry().equals(country)) {
					System.out.println(country + "는 이미 있습니다.");
					continue a;
				}
			}// end search for
			
			// for 문을 반복하는 동안 continue를 만나지 않음
			Nation nation = new Nation(country, capitalCity);
			store.add(nation);
			System.out.println("국가 정보 추가 완료");
			*/
			
			
		}// end while
	}
	
	/**
	 * 국가 별 수도 이름 맞추기 게임 
	 */
	private void quiz() {
		
		// 정답을 다 맞히면 리스트는 비어있는 상태이므로 get()ㅇ,러
		// 꺼내올 항목이 존재하지 않음.
		//if(store.size() == 0) {
		if(store.isEmpty()) {
			//지정된 항목이 없음
			System.out.println("모두 확인했습니다.");
			System.out.println("나라 정보를 추가하거나 종료하세요.");
			return; // end quiz
		}
		
		// 2번 메뉴 선택 시 list에 저장된 국가 정보 중에
		// random한 국가 정보 읽기
		// size() == 8
		//		0		1		2		 3		   4			7
		// [Nation] [Nation] [Nation] [Nation] [Nation] ... [Nation]
		// Nation quiz = store.get();
		// index store 리스트 항목에 접근할 수 있는 랜덤한 난수
		// 0 <= ~~ < store.size()
		int index = (int)(Math.random() * store.size());
		
		Nation quiz = store.get(index);
		
		System.out.println(quiz.getCountry() + "의 수도는?");
		// 출력된 국가의 수도 이름 입력
		String answer = sc.next();
		
		if(quiz.getCapital().equals(answer)) {
			//수도 이름이 일치함
			System.out.println("정답입니다.");
			// 정답을 맞힌 국가는 리스트에서 제거
			store.remove(index);
		}else {
			System.err.printf("아닙니다! %s의 수도는 %s입니다. %n", quiz.getCountry(), quiz.getCapital());
		}
	}

	public static void main(String[] args) {
		CapitalQuiz quize = new CapitalQuiz();
		quize.run();
	}

}





