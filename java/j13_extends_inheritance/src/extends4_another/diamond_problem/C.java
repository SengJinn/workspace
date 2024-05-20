package extends4_another.diamond_problem;

public class C extends A{

	// 재정의
	// alt + s , v
	@Override
	public void methodA() {
		System.out.println("C class의 methodA");
	}
	
	public void methodC() {
		System.out.println("C class의 methodC");
	}
	
}
