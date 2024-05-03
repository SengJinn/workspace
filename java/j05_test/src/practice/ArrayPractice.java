package practice;

import java.util.Scanner;

public class ArrayPractice {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 50, 3, 60, -3};
		for(int i=0; i<arr.length; i++) {
			//System.out.println(i + "번째 인덱스 항목 :" + arr[i]);
			if(arr[i]==60) {
				System.out.println("60은" + i + "번째 인덱스에 위치");
				break;
			}// end if
		}// end for
		
		// 0	1	2	3	4	5	6
		// {10, 20, 30, 50, 3, 60, -3};
		for(int i=0; i<arr.length; i++) {
			if(i==3) {
				continue;
			}
			System.out.println("arr[" + i + "] : " + arr[i]);
		}
		
		Scanner sc = new Scanner(System.in);
		System.out.println("변경할 인덱스 번호 입력");
		int index = sc.nextInt();
		arr[index] = 1000;
		for(int i : arr) {
			System.out.println(i + " ");
		}
		
		/*
		  인덱스 번호 2개를 입력받아, 그 값이 저장된 위치를 서로 바꾸고 출력하시오.
  		예) 인덱스: 1    인덱스: 2
		변경전    		{10, 20, 30, 50, 3, 60, -3};
		변경후       		{10, 30, 20, 50, 3, 60, -3}
		 */
		System.out.println("변경할 첫번째 인덱스 번호를 입력 > ");
		int first = sc.nextInt();
		System.out.println("변경할 두번째 인덱스 번호를 입력 > ");
		int second = sc.nextInt();
		System.out.println("변경할 인덱스 번호 1 : " + first+", 2 : "+second);
		// 1 : 0, 2 : 4
//                      0   1   2   3  4   5   6 
//		변경전    		{10, 20, 30, 50, 3, 60, -3};
		int temp = arr[first];		// temp == 10;
		arr[first] = arr[second];
//		변경후    		{3, 20, 30, 50, 3, 60, -3};
		arr[second] = temp;
//		변경후    		{3, 20, 30, 50, 10, 60, -3};
		
		for(int i : arr) {
			System.out.print(i+" ");
		}
		System.out.println();
		
		
	   final int size = 10; // final 변수는 값의 재할당을 불가하게 함
       int[] seats = new int[size];
       while (true) {
    	   System.out.println("\n-----------------------------------------");
    	   for(int i =0; i < size ; i++) 
    		   System.out.print( i+1 + " ");
    	   System.out.println("\n-----------------------------------------");  
    	   for(int i =0; i < size ; i++) 
    		   System.out.print( seats[i] + " ");
    	   System.out.println("\n-----------------------------------------"); 
    	   
    	   //seats = new int[10]; <-예약 좌석 초기화 후 반복하고 싶을 때
    	   
    	   System.out.println("원하시는 좌석번호를 입력하세요(종료는 -1)");
    	   int s = sc.nextInt();
    	   
    	   if(s == -1) { System.out.println("종료되었습니다.");
    		   break; 
    	   }
    	   
    	   if(s < 1 || s > 10) {
    		   System.out.println("선택할 수 없는 자리입니다.");
    		   continue;
    	   }
    	   
    	   if(seats[s-1] == 1) {
	        	System.out.println("예약할 수 없습니다.");
	        	continue;
	        } if (seats[s-1] == 0) {
    	   seats[s-1] = 1;
    	   System.out.println("예약되었습니다."); }       
       } //end while
		
		
	}//end main
}//end class
