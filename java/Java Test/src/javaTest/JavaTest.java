package javaTest;

import java.util.Scanner;

public class JavaTest {
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		String str = ("HELLO JAVA");
		System.out.println(str);
		
	// ----------------------------------------------------
		
		Scanner sc = new Scanner(System.in);
//		
//		System.out.printf("반지름을 입력하시오.:");
//		Double radius = sc.nextDouble(); //반지름
//		
//		Double area = (radius * radius * 3.14); //원의 면적
//		
//		System.out.println(area);
		
	// ----------------------------------------------------
		
//		int i = 1;
//		int sum = 0;
//		System.out.println("-결과:");
//		for(; i<11; i++) {
//			System.out.print (i);
//			sum = sum + i;
//		}
//		System.out.println("");
//		System.out.println("합:" + sum);
		
	// -----------------------------------------------------
		
//		int j = 1; 
//		int o = 0; //홀수의 합
//		for(;j<100;j++) {
//			if(j % 2 != 0) {
//				o = o+j;
//			}
//		}
//		System.out.println("");
//		System.out.println("홀수의 합:" + o);
		
	// -----------------------------------------------------
		
//		System.out.println("윗변을 입력");
//		int 윗변 = sc.nextInt();
//		
//		System.out.println("아랫변을 입력");
//		int 아랫변 = sc.nextInt();
//		
//		System.out.println("높이를 입력");
//		int 높이 = sc.nextInt();
//		
//		Double 넓이 = (double)((윗변+아랫변)*높이)/2 ;
//		System.out.println( "넓이:" + 넓이 );
		
	// ------------------------------------------------------
		
//		System.out.println( "사원명을 입력하세요 >");
//		String 사원명 = sc.next();
//		System.out.println( "시급을 입력하세요 >");
//		int 시급 = sc.nextInt();
//		System.out.println( "근무시간을 입력하세요 >");
//		int 시간 = sc.nextInt();
//		System.out.println( "급여 명세서");
//		System.out.println( "사원명:" + 사원명 );
//		int 급여금액 = 시급 * 시간;
//		System.out.println( "급여금액:" + 급여금액 );
//		double 공제합계 = 급여금액 * 0.03;
//		System.out.println( "공제합계:" + (int)공제합계);
//		int 실지급액 = 급여금액 - (int)공제합계;
//		System.out.println( "실지급액:" + 실지급액 );
		
	// -------------------------------------------------------
		
//		short s1 = 100;
//		short s2 = 200;
//		short result = (short) (s1+s2);
		
	// -------------------------------------------------------
//		System.out.println("첫번째 정수:");
//		int n1 = sc.nextInt();
//		System.out.println("두번째 정수:");
//		int n2 = sc.nextInt();
//		
//		while(true) {
//			if(n1>n2) {
//				System.out.printf("큰 수는");
//				System.out.println(n1);
//				break;
//			} if(n1<n2) {
//				System.out.printf("큰 수는");
//				System.out.println(n2);
//				break;
//			} if(n1 == n2) {
//				System.out.println("수가 같다.");
//				break;
//			}
//		}
	// --------------------------------------------------------
		
//		System.out.printf("성적을 입력하시오1:");
//		int s1 = sc.nextInt();
//		System.out.printf("성적을 입력하시오2:");
//		int s2 = sc.nextInt();
//		System.out.printf("성적을 입력하시오3:");
//		int s3 = sc.nextInt();
//		System.out.printf("성적을 입력하시오4:");
//		int s4 = sc.nextInt();
//		System.out.printf("성적을 입력하시오5:");
//		int s5 = sc.nextInt();
//		
//		int avr = (s1+s2+s3+s4+s5)/5 ; 
//		System.out.println("평균 성적은"+avr+"입니다");
		
	// ----------------------------------------------------------
		
//		while(true) {
//			System.out.println("점수를 입력해주세요.");
//			int score = sc.nextInt();
//		
//			if(score>=90) {
//				System.out.println("A학점입니다.");
//				continue;
//			}
//			if(score>=80) {
//				System.out.println("B학점입니다.");
//				continue;
//			}
//			if(score>=70) {
//				System.out.println("C학점입니다.");
//				continue;
//			}
//			if(score>=60) {
//				System.out.println("D학점입니다.");
//				continue;
//			}
//			if(score<60) {
//				System.out.println("F학점입니다.");
//				continue;
//			}
//		}
		
	// -------------------------------------------------------------
		
		int count = 0;
		for(int i=9 ; i>=2 ; i--) {
			for(int j=9; j>=2 ; j--) {
				int ij = i*j;
				System.out.print(i + "*" + j + "=" + ij + "\t" );
					count++;
					if(count % 8 == 0) {
						System.out.println("");
			}
		}
	}//end for
		
	}// end main
	
	// ---------------------------------------------------------------
	
	
	
} // end class
