package api_practice;

import java.util.Scanner;

public class Practice03StringCaseExample {

	public static void main(String[] args) {
		String chars = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		
		System.out.println("문자나 숫자를 입력해 주세요.");
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		
		for(int i = 0 ; i < chars.length() ; i++) {
			char charValue = chars.charAt(i);
			String what1 = String.valueOf(charValue);
			boolean charContains = str.contains(what1);
			System.out.println("영어문자 : " + charContains);
			break;
		}

		for(int i = 0 ; i < numbers.length() ; i++) {
			char numValue = numbers.charAt(i);
			String what2 = String.valueOf(numValue);
			boolean numContains = str.contains(what2);
			System.out.println("숫자 : " + numContains);
			break;
		}
		
		
	
		
		
	}
}








