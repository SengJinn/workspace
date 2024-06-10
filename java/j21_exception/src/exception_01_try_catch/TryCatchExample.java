package exception_01_try_catch;

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

public class TryCatchExample {

	public static void main(String[] args) {
		
		System.out.println("Main START");
		
		//4개의 정수값을 저장할 배열 생성
		int[] scores = new int[4];
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			try {
				System.out.println("배열에 삽입하려는 인덱스 번호를 입력 > ");
				int index = sc.nextInt();
				System.out.println("점수를 입력하세요. > ");
				int score = sc.nextInt();
				scores[index] = score;
				
				System.out.println("입력하려는 점수를 한 번 더 입력해주세요.");
				String num = sc.next();
				
				int number = Integer.parseInt(num);
				
				// 한번 더 입력받아 일치하는 값일 때 배열에 값 추가
				if(score == number) {
					scores[index] = score;
				}else {
					System.out.println("일치하지 않습니다.");
					scores[index] = 0;
				}
				
				//사용할 수 없는 인덱스 번호(음수)일 경우 while문 종료
				if(index < 0) break;
			} catch(ArrayIndexOutOfBoundsException e) {
				// 배열에 사용할 수 있는 인덱스 번호를 벗어남
				System.out.println("배열에 사용할 수 없는 인덱스 번호입니다.");
				System.out.println("다시 입력해주세요.");
				continue;
			} catch(InputMismatchException e) {// java.util package import
				System.out.println("정수가 입력되지 않음");
				sc.next(); // 정수가 아닌 사용되지 못 한 입력값을 제거
				continue;
			} catch(Exception e){
				// 발생된 예외에 대한 정보를 console에 입력
				// e.printStackTrace();
				break; //while 종료
			} // catch(NumberFormatException e){}
			finally {
				System.out.println(Arrays.toString(scores));
				System.out.println("항상 실행");
			}
			
		}// end while
		
		// scores 배열에 저장된 항목 값 출력
		System.out.println(Arrays.toString(scores));
		System.out.println("Main END");

	}

}
