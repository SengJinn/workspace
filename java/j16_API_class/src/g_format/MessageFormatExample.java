package g_format;

import java.text.MessageFormat;

public class MessageFormatExample {
	public static void main(String[] args) {
		String text = "회원 ID : {0} \n회원이름 : {1} \n전화번호 : {2}";
		String result = MessageFormat.format(text,"id001", "최기근", "010-9486-7166");
		System.out.println(result);
		
		String text2 = "학번은 {0}, 이름은 {1}, 나이는 {2}";
		Object[] arguments = {1, "최기근", 25};
		String result2 = MessageFormat.format(text2, arguments);
		System.out.println(result2);
		
		System.out.println("=====================================");
		
		MessageFormat format = new MessageFormat(text2);
		String result3 = format.format(arguments);
		System.out.println(result3);
		
		String result4 = format.format(new Object[] {2, "장희지", 21});
		System.out.println(result4);
	}
}
