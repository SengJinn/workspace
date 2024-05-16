import java.util.Scanner;

public class Practice07WhileExample {

	public static void main(String[] args) {
		/*
		 다음은 사용자에게 정수 값을 입력 받아 학점을 확인 하는 
		 애플리케이션의 실행 결과물이다. 
		 아래와 같이 실행될 수 있도록 소스코드를 작성하세요.
		 (단, while문과 조건문을 이용할 것.)
     		90~100    A학점
			80~89     B학점
			70~79     C학점
			60~69     D학점
			60미만     F학점
		 */
		Scanner sc = new Scanner(System.in); // import 추가
		
		while(true) {
			System.out.println("점수를 입력해 주세요.");
			int score = sc.nextInt();
			
			char grade = 'F';
			
			if(score <=100 && score >= 90) {
				grade = 'A';
			}else if(score <= 89 && score >= 80) {
				grade = 'B';
			}else if(score <= 79 && score >= 70) {
				grade = 'C';
			}else if(score <= 69 && score >= 60) {
				grade = 'D';
			}else if(score <= 59 && score >= 0) {
				grade = 'F';
			}else {
				// 100 ~ 0 까지의 정수가 아닐 경우
				break; // 가장가까운 반복문 즉시 탈출
			}
			
			System.out.printf("%c학점입니다. \n", grade);
			
		} // end while
		
	} // end main

}







