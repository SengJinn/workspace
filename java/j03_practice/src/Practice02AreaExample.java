import java.util.Scanner;

public class Practice02AreaExample {

	/*
	 *  사용자에게 반지름(radius)을 실수로 입력받아
	 *  원면적으로 계산하여 출력
	 *  원의면적 : 반지름 * 반지름 * 원주율(3.14)
	 */
	public static void main(String[] args) {
		
		// 콘솔을 통해서 사용자에게 값을 입력받아 
		// 개발자가 지정한 type으로 값을 전달하는 class
		// java.util package에 존재하므로 위치를 명시해야함.
		// eclipse에서는 auto import 로  ctrl + shift + o
		java.util.Scanner sc = new Scanner(System.in);
		
		double radius, area;
		System.out.print("반지름을 입력해 주세요 : ");
		// 콘솔에서 사용자가 입력한 값을 double 타입으로 전달
		radius = sc.nextDouble();
		// radius 변수에 저장된 값을 console에 출력
		// System.out.println(radius);
		// 원주율
		double pi = 3.14;
		area = radius * radius * pi;
		System.out.println("원의면적 : " + area);
		System.out.printf("반지름이 %f인 원의 면적은 : %.1f %n", radius, area);
		
		/*
		 * print, println 을 이용하여
		 * 1~10까지 숫자를 출력하고 
		 * 1~10까지의 전체 합계를 출력
		 */
		// 1 ~ 10까지의 전체 총합을 저장할 변수
		int sum = 0;
		
		//             i > 10 false
		for(int i = 1; i <= 10; i++) {
			System.out.print(i+" ");
			// i == 1,     sum == 0  ,   sum + i == 1
			// i == 2,     sum == 1  ,   sum + i == 3
			// ...
			sum = sum + i;
		}
		System.out.println();
		System.out.println("\n합 : " + sum);
		
	}
	
}









