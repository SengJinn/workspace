package extends3_protected.a;


/**
 * protected 같은 패키지 내부에서는 
 * 다른 클래스의 접근 허용
 * 외부 패키지에서는 상속받은 자식 class의 인스턴스를
 * 통해서만 접근가능
 */
public class A {
	
	public int a;
	protected int b;
	int c;
	private int d;
	
	public A(){
		// 객체 내부에서만 접근 가능
		this.d = 100;
	}
	
	protected void methodA() {
		System.out.println("A class의 methodA");
	}
	// 리턴타입 식별자(매개변수){실행블럭} : 기본틀
	// final 접근제한자 static 순서 상관 없음.
	final protected void methodB() {
		System.out.println("A class의 methodB");
	}
	
}






