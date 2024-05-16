import java.util.Scanner;

public class Practice06InputScoreExample {

	public static void main(String[] args) {
		/*
		 사용자에게 5개의 정수를 입력받아 sum 변수에 저장하고 
		 그 값을 통해 평균을 정수로 출력하는 소스코드를 작성하시오.(sum / 5)
		 */
		Scanner sc = new Scanner(System.in);
		// 평균 = 총합계 / 항목개수
		// 총합계
		int sum = 0;
		/*
		System.out.print("성적을 입력해 주세요:");
		sum = sum + sc.nextInt();
		
		System.out.print("성적을 입력해 주세요:");
		sum = sum + sc.nextInt();
		
		//...
		*/
		for(int i = 0; i < 5; i++ ) {
			System.out.print("성적을 입력해 주세요:");
			sum = sum + sc.nextInt();
		}
		
		// 입력받은 누적 점수 총합계를 저장하는 sum을 이용하여 평균 연산
		int avg = sum / 5;
		System.out.println("평균성적은 " +avg+"입니다.");
	}

}






