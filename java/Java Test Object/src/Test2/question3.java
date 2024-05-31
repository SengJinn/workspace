package Test2;

import java.util.Arrays;

public class question3 {
	public static void main(String[] args) {
		
		int[] array1 = { 1, 2, 3, 4, 5 };
		int[] array2 = { 6, 7, 8, 9, 10 };
		
		int[] mergedArray = null;
		
		// 코드 작성
		mergedArray = Arrays.copyOf(array1, array1.length + array2.length);
		System.arraycopy(array2, 0, mergedArray, array1.length, array2.length);
		Arrays.sort(mergedArray);
		
		System.out.print("array1 : ");
		System.out.println(Arrays.toString(array1));
		System.out.print("array2 : ");
		System.out.println(Arrays.toString(array2));
		System.out.print("병합된 배열 : ");
		System.out.println(Arrays.toString(mergedArray));

	} // end main method
	
}

