package operators;

import java.util.Scanner;
// 컨트롤 + 시프트 + O (import 자동완성)
/**
 * console을 통해서
 * 사용자가 우리에게 원하는 타입의 데이터를 입력받는 방법
 */
public class ScannerExample {
	public static void main(String[] args) {

		//java.util.Scanner sc = new java.util.Scanner(System.in);
		Scanner sc = new Scanner(System.in);
		
		System.out.println("정수값을 입력해주세요 > ");
		// 콘솔을 통해서 사용자가 입력한 정수값을 반환
		// 사용자가 값을 입력하고 enter로 종료를 알리기 전까지 blocking
		int a = sc.nextInt();
		System.out.printf("입력한 정수값은 %d입니다. %n", a);
		// 입력받은 데이터가 우리가 지정한 타입이 아닐 경우
		// Exception in thread "main"
		// java.util.InputMismatchException 오류 발생
		// 오류가 발생하면 프로그램 종료
		
		System.out.println("단어를 입력해주세요 >");
		String str = sc.next();
		System.out.println(str);
		
		System.out.println("실수를 입력해주세요 >");
		double r = sc.nextDouble();
		System.out.println("입력받은 실수:" + r);
		
		System.out.println("실행 여부를 true or false로 입력");
		boolean isRun = sc.nextBoolean();
		System.out.println("isRun :" + isRun);
		
		////////////////////////////////////////////////////////
		// 사용자가 입력한 데이터가 우리가 지정한 형식인지 확인 후 사용
		System.out.println("boolean 타입으로 값을 입력(true or false)");
		boolean isTrue = sc.hasNextBoolean();
		// boolean isInt = sc.hasNextInt();
		// boolean isDouble = sc.hasNextDouble();
		
		if(isTrue) {
			// boolean 타입으로 값을 입력
			boolean result = sc.nextBoolean();
			System.out.println("사용자가 입력한 boolean:" + result);
		}else {
			// boolean 타입으로 사용할 수 없는 값을 입력
			System.out.println("사용자가 입력한 값을 사용할 수 없음");
		}
		
		
		
		
	} //end main
	
}//end class
