package c_string.split_tokenizer;

import java.util.StringTokenizer;

public class StringTokenizerExample {
	public static void main(String[] args) {
		
		String text = "이나영/김희선/박보영/원빈/장동건/최기근";
		StringTokenizer st = new StringTokenizer(text,"/"); // import 추가
		// 구분자로 분리된 아이템(token) 개수 반환
		int countTokens = st.countTokens();
		System.out.println(countTokens);
		for(int i = 0; i < countTokens ; i++) {
			String token = st.nextToken();
			System.out.println(token);
		}
		
		// 더 읽을 요소(token)이 존재하지 않는데 호출하면 오류 발생
		// st.nextToken();
		
		System.out.println("===========================");
		text = "홍길동|페이커,최기근,이순신&김유신";
		// st = new StringTokenizer(text, "|,&");
		st = new StringTokenizer(text);
		
		// 꺼내올 token이 존재하면 true
		// 더이상 꺼내올 token이 존재하지 않으면 false
		while(st.hasMoreTokens()) {
			// 구분자를 따로 지정하지 않으면 공백을 기준으로 분리
			// String token = st.nextToken();
			String token = st.nextToken("|,&");
			System.out.println(token);
		}
		
	}
}
