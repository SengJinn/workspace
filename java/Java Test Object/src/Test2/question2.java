package Test2;

import java.util.Scanner;

public class question2 {

	public static void main(String[] args) {
	
		Scanner sc = new Scanner(System.in);
		
	while(true) {
		System.out.println("문자열을 입력해 주세요>>");
		String str = sc.nextLine();
		
		int index = str.indexOf("java");

		if(index == -1) {
			System.out.println("java가 존재하지 않습니다.");
			continue;
			
		}else {
			System.out.println("java가 존재합니다.");
			System.err.println("시스템을 종료합니다.");
			break;
		}
		
		}
	}
}


