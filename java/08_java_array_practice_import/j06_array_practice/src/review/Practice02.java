package review;

import java.util.Scanner;

/**
 * 총 5개의 정수를 저장할 수 있는 배열을 생성 하고 사용자로부터 정수를 입력받아 배열에 저장하고, 
 * 저장된 값들을 출력하는 소스코드를 작성하세요.
 */
public class Practice02 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		// 코드 작성
		int[] array = new int[5];
		System.out.println("배열에 등록할 숫자를 입력하세요.");
		int number1 = scanner.nextInt();
		int number2 = scanner.nextInt();
		int number3 = scanner.nextInt();
		int number4 = scanner.nextInt();
		int number5 = scanner.nextInt();
		
		array = new int[] {number1, number2 ,number3 ,number4, number5,};
		
		System.out.print("등록된 숫자는");
		for(int i : array) {
			System.out.print(i + " ");
		}
		
	} // end main
} // end class
