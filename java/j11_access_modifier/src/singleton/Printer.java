package singleton;

public class Printer {
	
	private static Printer printer;
	
	// 프린터기의 객체 생성자 호출은 class 내부에서만 가능하도록 접근 제한
	private Printer() {}
	
	public static Printer getInstance() {
		if(printer == null) {
			printer = new Printer();
		}
		return printer;
	}
	
	public void print(String document) {
		System.out.println(document);
	}
	
}