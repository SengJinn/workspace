package review;

/**
 * numbers 배열에 나열된 각 항목의 값을 오름차순으로 정렬하여 저장하고
 * 저장된 배열의 값을 출력하시오.
 */
public class Practice04 {
	
	public static void main(String[] args) {
		
		int[] numbers = { 25, 13, 45, 67, 33, 92, 17 };
		int max = 0; int min = 0;
		max = min = numbers[0];
		
		for(int i=0; i < numbers.length ; i++) {
			for(int j = i+1; j < numbers.length; j++) {
				// i == 0, j== 1 ~ 5
				// i == 1, j== 2 ~ 5
				// ...
				// i == 5, j== 6 X
				// 앞에 있는 값이 더 클 때 큰 수를 뒤로 배치.
				if(numbers[i] > numbers[j]) {
					int temp = numbers[i];
					numbers [i] = numbers[j];
					numbers[j] = temp;
				}
			}
		}
		
		for(int i : numbers) {
			System.out.println(i);
		}
		
	} // end main

} // end class
