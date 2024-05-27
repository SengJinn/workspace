package c_string.method;

public class String03SubstringExample {
	public static void main(String[] args){
		String ssn = "820604 - 1234567";
		// ssn 문자열에 "-"이 위치하고 있는 인덱스 번호 반환
		int index = ssn.indexOf("-");
		
		String birth = ssn.substring(0, index);
		System.out.println("생년월일은" + birth + "입니다.");
		
		// 매개변수로 전달된 인덱스부터 뒤에 있는 모든 문자열을 잘라내어
		// 새로운 문자열 반환
		String rrn = ssn.substring(index + 1);
		System.out.println(rrn);
	
		String fileName = "cat.navi.png";
		
		index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index + 1);
		System.out.println(ext);
		
		// Png pNg pnG pNg . . . . . .
		// ext.equals("Png")
		// ext.equals("png") . . .
		String lowerExt = ext.toLowerCase();
		System.out.println(lowerExt);
		if(lowerExt.equals("png")) {
			System.out.println("png 파일 입니다.");
		}
		// 알파벳을 대문자로 변경한 새로운 문자열 반환
		String upperExt = ext.toUpperCase();
		System.out.println(upperExt);
		if(upperExt.equals("PNG")) {
			System.out.println("PNG 파일 입니다.");
		}
		
		// 대소문자 무시하고 문자열이 같은지 비교
		if(ext.equalsIgnoreCase("Png")) {
			System.out.println("png 이미지 파일입니다.");
		}
				
	}
}
