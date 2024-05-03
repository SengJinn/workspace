package j05_test;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		
//		for(int i = 2; i <= 9; i++) {
//			for(int j = 2; j <= 9; j++) {
//			System.out.printf("%d * %d = %02d\t",i ,j,(i*j));
//			}
//			System.out.println();
//			}
		
		Scanner sc = new Scanner(System.in);
		
		int total = 0, sum = 0;
		System.out.println("숫자를 입력하세요 > ");
		int num = sc.nextInt();
		for (int i = 1; i <= num; i++) {
		total += i;
		if (i % 3 == 0) {
		sum += i;
		}
		}
		System.out.printf("1부터 %d까지의 총합계 : %d \n", num, total);
		System.out.printf("1부터 %d까지의 3의 배수의 총합계 : %d", num, sum);
		
		//matrix[0] == {1,2,3}; matrix[0][0], matrix[0][1], matrix[0][2]
		//matrix[1] == {4,5,6}; matrix[1][0], matrix[1][1], matrix[1][2]
		//matrix[2] == {7,8,9}; matrix[2][0], matrix[2][1], matrix[2][2]
		int[][] matrix = {
				{1, 2, 3},
				{4, 5, 6},
				{7, 8, 9}
				};
				int count = 0;
				for(int i = 0; i < matrix.length; i ++) {
				for(int j = 0 ; j < matrix[i].length; j++) {
				count += matrix[i][j];
				}
				}
				System.out.println("총합은 : " + count);
		
		
	}//end main
}//end class
