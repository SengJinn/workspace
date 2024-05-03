package review;

/**
 * numbsers 배열에서 가장 큰 수, 가장 작은 수 를 찾아 출력하는 Java 프로그램을 작성하세요.
 */
public class Practice03 {

	public static void main(String[] args) {
		
		int[] numbers = { 25, 13, 45, 67, 33, 92, 17 };
		// 코드 작성
		int max = 0; int min = 0;
		max = min = numbers[0];
		
		for(int i : numbers) {
			if(i > max) {
				max = i;
			}if(i < min) {
				min = i;
			}
		}
		
		System.out.println("가장 큰 수는 : "+ max);
		System.out.println("가장 작은 수는 : "+ min);
		
		
	} // end main

} // end class
