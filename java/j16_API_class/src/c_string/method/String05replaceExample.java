package c_string.method;

public class String05replaceExample {
	public static void main(String[] args) {
		// 문자열.replace("찾을문자열", "변경할 문자열");
		String oldStr = "자바는 어렵다! 자바는 그래도 해야한다. 자바!";
		
		String newStr = oldStr.replace("자바", "Java");
		
		System.out.println("oldStr : " + oldStr);
		System.out.println("newStr : " + newStr);
		
	}
}
