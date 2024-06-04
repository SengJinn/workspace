package guide.practice02;

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
		while(true) {
			
		System.out.println("현재" + store.size() + "개 나라와 수도가 입력되어 있습니다."); 	
		System.out.println("국가 입력 (현재 : " + store.size() + "번째 국가 등록 / q는 종료)");
		String inputCountry = sc.next();
		char inputStop = inputCountry.charAt(0);
		
		if(inputStop == 'q') {
			System.err.println("입력을 종료합니다.");
			break;
		}
		
		for(Nation n : store) {
			if(store != null && n.getCountry().equals(inputCountry) ) {
			System.err.println(inputCountry + "은(는) 이미 있습니다.");
			return;
			} //end if
		}// end for
		
		System.out.println("수도 입력");
		String inputCapital = sc.next();
		Nation inputNation = new Nation(inputCountry, inputCapital) ;
		store.add( inputNation );
		continue;
		
		}// end while
	}// end input
	
	/**
	 * 국가 별 수도 이름 맞추기 게임 
	 */
	private void quiz() {
		for(int i = 0 ; i < store.size() ; i++) {
			System.out.println(store.get(i).getCountry() + "의 수도는?");
			String inputAnswer = sc.next();
			if (inputAnswer.equals(store.get(i).getCapital())) {
				System.out.println("정답!");
			} else {
				System.err.println("아닙니다. " + store.get(i).getCountry() + "의 수도는 " + store.get(i).getCapital() +"입니다.");
			}
		} System.out.println("모든 퀴즈를 풀었습니다.");
	}

	public static void main(String[] args) {
		CapitalQuiz quize = new CapitalQuiz();
		quize.run();
	}

}





