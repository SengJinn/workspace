package javaTest;

import java.util.Scanner;

public class Javatest_forstudent {
	public static void main(String[] args) {	
//		
//
//		for(int i=1 ; i<10 ; i++) {
//			System.out.println
//			("7 * " + i + " = " + 7*i);
//		}
//		

//		for(int i = 2 ; i<10 ; i++) {
//			for(int j = 2; j<10 ; j++) {
//				System.out.print
//				(j + " * " + i + " = " + i*j + "\t");
//			}
//			System.out.println();
//		}
//
//
		//Scanner sc = new Scanner(System.in);
//		System.out.println("숫자를 입력하세요 >");
//		int number = sc.nextInt();
//		int sum1 = 0;
//		int sum2 = 0;
//		
//		for(int i=1 ; i <= number ; i++) {
//			if(i>0) {
//				sum1 += i;
//			} if(i % 3 == 0) {
//				sum2 += i;
//			}
//		}
//		System.out.println("1부터 " + number + "까지의 총합계 : " + sum1);
//		System.out.println("1부터 " + number + "까지의 3의 배수의 총합계 : " + sum2);
//
//			for(int i : numbers) {
//			System.out.println(i);
//		}
//		
//public class Javatest_forstudent {
//	public static void main(String[] args) {
//		int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//		int count = 0;
//		
//		for(int i : numbers) {
//			if( i % 2 != 0 ) {
//				count++;
//			}
//		}
//		System.out.println("홀수의 개수는 : " + count);
		
//		int[][] matrix = {
//				{1, 2, 3},
//				{4, 5, 6},
//				{7, 8, 9}
//			};
//		int sum = 0;
//		
//		for(int[] i : matrix) {
//			for(int j : i) {
//				sum += j;
//			}	
//		}
//		System.out.println("총합은 : " + sum);

		
//		int[] arr = {10, 20, 30, 50, 3, 60, -3};
//		for(int i : arr) {
//	    	   if(i != 50) {System.out.print( i + " " );}
//       }	
		
//        int[] arr = {10, 20, 30, 50, 3, 60, -3};
//        int number = sc.nextInt();
//
//        arr[number] = 1000 ;
//        
//        for(int i : arr) {
//     	   System.out.println( i );
//       }	
        
//       int[] arr = {10, 20, 30, 50, 3, 60, -3};
//       int number = sc.nextInt();
//       int number2 = sc.nextInt();
//		// 저장된 두 위치의 값을 변경하기 - swap
//       int temp = arr[number];
//       arr[number] = arr[number2];
//       arr[number2] = temp;
//	        
//       for(int i : arr) {
//    	   System.out.println( i );
//       }	
//       
       
//       final int size = 10;
//       int[] seats = new int[size];
//       
//       while (true) {
//    	   System.out.println("\n-----------------------------------------");
//    	   for(int i =0; i < size ; i++) 
//    		   System.out.print( i+1 + " ");
//    	   System.out.println("\n-----------------------------------------");  
//    	   for(int i =0; i < size ; i++) 
//    		   System.out.print( seats[i] + " ");
//    	   System.out.println("\n-----------------------------------------"); 
//    	   
//    	   //seats = new int[10]; <-예약 좌석 초기화 후 반복하고 싶을 때
//    	   
//    	   System.out.println("원하시는 좌석번호를 입력하세요(종료는 -1)");
//    	   int s = sc.nextInt();
//    	   
//    	   if(s == -1) { System.out.println("종료되었습니다.");
//    		   break; 
//    	   }
//    	 
//    	   seats[s-1] = 1;
//
//    	   System.out.println("예약되었습니다.");
//       } 
        		
		
//		  SCREEN
// [1][2][3][4][5][6][7][8][9][10]	[행]
		                              
// [□][□][□][□][□][□][□][□][□][□]	[A열]
// [□][□][□][□][□][□][□][□][□][□]	[B열]
// [□][□][□][□][□][□][□][□][□][□]	[C열]		
// [□][□][□][□][□][□][□][□][□][□]	[D열]	
// [□][□][□][□][□][□][□][□][□][□]	[E열]
// [□][□][□][□][□][□][□][□][□][□]	[F열]
// [□][□][□][□][□][□][□][□][□][□]	[G열]
// [□][□][□][□][□][□][□][□][□][□]	[H열]
// [□][□][□][□][□][□][□][□][□][□]	[I열]
// [□][□][□][□][□][□][□][□][□][□]	[J열]
 
		Scanner sc = new Scanner(System.in);
		
		// 문자열 11개를 저장하는 배열 을 10개 저장하는 2차원 배열
		String[][] seats = new String[10][11];
		
		
        char columnLabel = 'A'; // == 65
        
        for (int i = 0; i < seats.length; i++) {
        	
            for (int j = 0; j < seats[i].length; j++) {
                seats[i][j] = (j == seats[i].length - 1) ? " [" + (String)(columnLabel++ + "열") + "]" : "[□]";
            }
            
        }
        while(true) {
	        System.out.println("             SCREEN");
	        for (String[] row : seats) {
	            for (String seat : row) {
	                System.out.print(seat);
	            }
	            System.out.println();
	        }
	        
	        System.out.println("예약할 좌석의 열을 입력해주세요");
	        
	        char input = sc.next().charAt(0); // 문자열에서 제일 앞의 한개의 문자만 추출
	        System.out.println("입혁한 열 : "+input); // 'A' == 65, 'B' == 66
	        System.out.println("예약할 좌석의 행을 입력해주세요");
	        int num = sc.nextInt(); // 
	        System.out.println("선택하신 좌석운 : " +input+"열" +num+"행입니다.");
	        
	        // A, 1   seats[0][0] ,  65 - 65      ==  	0
	        // J, 10   seats[9][9] , 74 - 65      ==    9
	        int columnInput = input - 65; // 
	        int rowInput = num - 1;
	        
	        if(seats[columnInput][rowInput] == "[■]") {
	        	System.out.println("예약할 수 없습니다.");
	        	continue;
	        }
	        
	        System.out.println("예약 완료 하시겠습니까? y/n");
	        if( sc.next().charAt(0) == 'y') {
	        	seats[columnInput][rowInput] = "[■]";
	        }
        }
	
	
	}//end main
}//end class










