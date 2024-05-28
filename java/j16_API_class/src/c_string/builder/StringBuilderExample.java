package c_string.builder;

public class StringBuilderExample {
	public static void main(String[] args) {
		String a = "최기근";
		String b = "최기근";
		System.out.println(a.hashCode());
		System.out.println(b.hashCode());
		
		a += "천재";
		System.out.println(a.hashCode());
		a = a + "다";
		System.out.println(a.hashCode());
		
		StringBuilder sb = new StringBuilder("초기값 :");
		sb.append("자바 ");
		sb.append("Programming Study!!");
		sb.append(1.8);
		String result = sb.toString();
		System.out.println(result);
		
		System.out.println(sb.hashCode());
		// 초기값 : 자바 Programming Study!!1.8
		// 저장된 문자열에서 4번쩨 인덱스 2번째 매개변수 값을 삽입.
		sb.insert(4, 2);
		System.out.println(sb);
		System.out.println(sb.hashCode());
		
		// 해당 인덱스에 있는 문자를 두번째 매개변수 문자로 변경
		sb.setCharAt(4, '8');
		// 초기값 2: 자바 Programming Study!!1.8
		System.out.println(sb);
		
		//delete(시작인덱스, 해당자리까지) 문자열 삭제
		sb.delete(4,6);
		// 초기값 8: 자바 Programming Study!!1.8
		System.out.println(sb);
		
		// 지정한 인덱스의 문자 삭제
		// 초기값 자바 Programming Study!!1.8
		sb.deleteCharAt(4);
		System.out.println(sb);
		
		StringBuilder reverse = sb.reverse();
		System.out.println(reverse);
		System.out.println(reverse.hashCode());
		
	}
}
