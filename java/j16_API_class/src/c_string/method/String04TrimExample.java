package c_string.method;

import java.util.Scanner;

public class String04TrimExample {
	
	public static void main(String[] args) {
		// 문자열.trim() - 문자열의 좌우 저장된 공백을 제거한 새로운 문자열 반환
		String tel = "  010 9468 7166  ";
		int length = tel.length();
		System.out.println(length);
		
		String result = tel.trim();
		length = result.length();
		System.out.println("trim length : " + length);
		
		Scanner sc = new Scanner(System.in); //import추가
		String owner = "id001"; // 임의의 id 지정
		System.out.println("아이디를 입력해 주세요 >");
		String input = sc.nextLine();
		
		// 저장된 문자열이 일치하는지 비교
		if(owner.equals(input)) {
			System.out.println("일치합니다.");
		}else {
			System.out.println("일치하지 않습니다.");
		}
		
		System.out.println("좌우 공백 제거 후 비교");
		if(input.trim().equals(owner)) {
			System.out.println("일치합니다.");
		}else {
			System.out.println("일치하지 않습니다.");
		}
	}
	
}
