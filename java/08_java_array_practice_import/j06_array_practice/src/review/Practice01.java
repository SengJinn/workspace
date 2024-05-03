package review;

/**
 * numbers 배열 중에서 값이 짝수인 요소(항목)만 출력하는 소스코드를 작성하시오.
 */
public class Practice01 {

	public static void main(String[] args) {

		int[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		

		
		// 코드 작성
		for(int i : numbers) {
			if(i % 2 == 0) {
				System.out.println(i);
			}
		}
		
		
		
	} // end main

} // end class
