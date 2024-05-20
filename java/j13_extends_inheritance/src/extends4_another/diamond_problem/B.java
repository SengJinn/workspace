package extends4_another.diamond_problem;

public class B extends A{

	// alt + s, v      method 재정의
	@Override
	public void methodA() {
		System.out.println("B class의 methodA");
	}
	
	public void methodB() {
		System.out.println("B class의 methodB");
	}

}
