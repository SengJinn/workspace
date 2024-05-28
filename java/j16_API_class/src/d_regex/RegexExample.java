package d_regex;

import java.util.Scanner;
import java.util.regex.Pattern;

/**
 * Regular Expression
 * 정규 표현식
 */
public class RegexExample {

	public static void main(String[] args) {
		String regeExp = "(02|010)-\\d{3,4}-\\d{4}";
		
		Scanner sc = new Scanner(System.in);
		System.out.println("전화번호를 입력해주세요. ex)010-9486-7166");
		String phone = sc.next();
		// Pattern.matches("정규식 문자열", "비교할 문자열");
		boolean result = Pattern.matches(regeExp, phone);
		if(result) {
			System.out.println("전화번호가 정규식과 일치합니다.");
		}else {
			System.out.println("입력하신 값이 정규식과 일치하지 않습니다.");
		}
		
		// hap0p9y@yahoo.co.kr
		// hap0p9y@yahoo.com
		regeExp = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		String data = "angel@naver.co.kr";
		
		if(Pattern.matches(regeExp, data)) {
			System.out.println("이메일 형식입니다.");
		}else {
			System.out.println("이메일 형식이 아닙니다.");
		}
		
		
	}

}
