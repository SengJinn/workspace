import java.util.Scanner;

public class Practice04SalaryExample {

	public static void main(String[] args) {
		/*
		 문자열 형태로 사원명을 입력받아 변수에 저장하고, 
		 시급 과 근무 시간을 정수로 입력받아 아래와 같이 
		  급여명세서가 출력 될 수 있도록 코드를 작성하시오. 
		  - 급여금액 : 시급 * 근무 시간
		  - 공제합계 : 급여금액의 3%
		  - 실지급액 : 급여금액 – 공제합계
		  - 정수로 계산
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.println("사원명을 입력하세요 > ");
		String 사원명 = sc.next();
		
		System.out.println("시급을 입력하세요 > ");
		int 시급 = sc.nextInt();
		
		System.out.println("근무시간을 입력하세요 > ");
		int 근무시간 = sc.nextInt();
		
		int 급여금액 = 시급 * 근무시간;
		int 공제금액 = 급여금액 * 3 / 100; 		  // 3%
		공제금액 = (int)(급여금액 * 0.03);		  // 3%
		
		int 실지급액 = 급여금액 - 공제금액;
		System.out.println("급여 명세서");
		System.out.println("사원명 : " + 사원명);
		System.out.println("급여금액 : " + 급여금액);
		System.out.println("공제금액 : " + 공제금액);
		System.out.println("실지급액 : " + 실지급액);
		
		
	}
	
}











