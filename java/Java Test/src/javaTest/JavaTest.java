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
		
		System.out.println("\n=============================");
		for(int j = 9; j >= 2; j--) {
			for(int i = 9; i > 1; i--) {
				System.out.print(j+" * "+i+" = "+(j * i)+"\t");
			}
			System.out.println();
		}
		

	// ---------------------------------------------------------------
		
		//while 문 종료 flag, true = 계속 실행, false = 종료
		boolean isRun = true;
		// 사용자의 예금을 지정할 변수
		int money = 0;
		
		//if문 활용
		while(isRun) { // isRun이 true면 반복, false면 탈출
			System.out.println("=========================");
			System.out.println("1.예금 | 2.출금 | 3.잔액확인 | 4.종료");
			System.out.println("=========================");
			//메뉴 선택 번호 저장
			int selectNo = sc.nextInt();
			System.out.println("선택하신 메뉴번호는:" + selectNo);
			
			/*
			 * 1.예금 - 입금할 금액을 입력받아 money 변수에 누적 저장
			 * 2. 출금 -출금할 금액을 입력받아 money 변수에서 감소
			 * 		   단, 출금 금액은 예금된 금액을 초과할 수 없음.
			 * 3. 잔액 - money 변수(예금액)을 저장된 값을 출력
			 * 4. 종료 - 프로그램 종료 - while문을 종료시켜 main 종료
			 * */
			if(selectNo == 1) {
				//1.예금
				System.out.println("입금");
				System.out.println("입금하실 금액을 입력하세요.");
				int deposit = sc.nextInt();
				money = money + deposit;
				System.out.println(deposit+"원이 입금되었습니다.");
			}else if (selectNo == 2) {
				//2.출금
				System.out.println("출금");
				System.out.println("출금하실 금액을 입력해주세요.");
				int minus = sc.nextInt();
				//출금할 수 있는 금액인지 확인
				if(money<minus) {
					System.out.println("출금 금액이 예금된 금액보다 클 수 없습니다.");
					continue;
				}
				money = money - minus;
				System.out.println(minus+"원이 출금되었습니다.");
			}else if (selectNo == 3) {
				//3.잔액확인
				System.out.println("잔액확인");
				System.out.println("잔액:" + money + "원");
			}else if (selectNo == 4) {
				//4.종료
				isRun = false;
				//break;//즉시종료
			}else {
				System.out.println("선택하신 메뉴 번호는 존재하지 않습니다.");
			}
			
		}//end while
		
		//siwtch 활용
		switch (selectNo) {
		case 1:
			System.out.println("입금하실 금액을 입력하세요.");
			int deposit = sc.nextInt();
			money += deposit;
			System.out.println(deposit + "원이 입금되었습니다.");
			break;
		case 2:
			System.out.println("출금하실 금액을 입력하세요.");
			int minus = sc.nextInt();
			if(minus>money) {
				System.out.println("출금할 수 없는 금액");
			}else {
				// minus <= money
				money -= minus;
				System.out.println(minus+"원이 출금");
			}
			break;
		case 3:
			System.out.println("잔액은:"+money);
			break;
		case 4:
			System.out.println("종료합니다.");
			isRun = false;
			break;
		default:
			System.out.println("선택할 수 없는 메뉴 번호");
			break;
		} //end switch
		
		
		
		
		
		
		
	
		}// end main
} // end class
