package c_method;

/**
 * 전산학에서의 overload
 * 객체지향에서 하나의 method 또는 연산자가 입력된 값에 따라
 * 여러가지 동작을 하도록 하는 것
 */
public class MethodOverLoading {
	
	void methodA() {}
	
	// 중복된 식별자로 호출되는 method 구분 x
	// int methodA() {return 10;}
	
	void methodA(int a) {
		System.out.println("정수값을 매개변수로 받는 methodA " + a);
	}
	// 매개변수의 개수가 상이
	void methodA(double d) {
		System.out.println("실수값을 매개변수로 받는 methodA : " + d);
	}
	
	// 매개변수의 순서에 따라 메소드를 식별할 수 있음.
	void methodA(double d, int a) {
		System.out.println("실수값 1개, 정수값 1개를 전달받는 methodA");
	}
	
//	void methodA(int a, int b) {}
//	void methodA(int b, int a) {}
	
	// main method
	public static void main(String[] args) {
		MethodOverLoading over = new MethodOverLoading();
		// 매개변수의 개수에 따라 호출될 메소드를 식별할 수 있음.
		over.methodA();
		// 전달되는 매개변수의 타입에 따라서 메소드를 식별할 수 있음.
		over.methodA(10);
		over.methodA(10.0);
		
		//over.methodA(10.0, 10.0);
		
		AreaCalculator calc = new AreaCalculator();
		
		int area = calc.areaRectangle(10);
		System.out.println(area);
		
		area = calc.areaRectangle(10,20);
		System.out.println(area);
		
		double calcArea = calc.areaRectangle(10.0, 20.0);
		System.out.println(calcArea);
	}

}
