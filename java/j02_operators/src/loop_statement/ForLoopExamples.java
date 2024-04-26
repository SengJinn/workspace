package loop_statement;

/**
 *  반복문(iteration Statement, Loop Statement)
 *   - 프로그램 내에서 동일한 명령을 일정 횟수만큼 반복하여 수행하도록 제어하는 명령문
 *   - 반복문 종류 : for 문, while 문, do while 문
 *   - 반복 구간 탈출 및 조정 : break, continue
 */
public class ForLoopExamples {

	public static void main(String[] args) {
		/*
		 	for(초기화식;조건식;증감식){
		 		조건식이 만족할 경우 반복적으로 수행될 실행문들;
		 	}
		 */
		// 무한 반복 - 무한 loop - infinity loop
		//for(;;) {System.out.println("for 문 작업 수행");}
		
		int i = 1;
		int sum = 0;
		for(;;i++) {
			if(i>10) {
				break;
			}
			//sum = sum + i;
			sum += i;
		}
		System.out.println("Sum:" + sum);
		System.out.println("i:" + i);
		
		sum = 0;
		for(int j =3; j<=10; j+=3) {
			sum += j;		
		}
		System.out.println("sum : " + sum);
		// System.out.println("j : " + j);
		// 외부 for 문
		for(int o = 1; o < 11; o++) {
			System.out.println("o : " + o);
			// 내부 for 문
			for(int l = 1; l < 11; l++) {
				// 2로 나누어 떨어지는 짝수일때
				if(l % 2 == 0) {
					continue;
				}
				System.out.print(" l : " + l);
			} // 내부 for문 종료
			System.out.println();
		} // 외부 for문 종료
		
	}// end main

} // end class