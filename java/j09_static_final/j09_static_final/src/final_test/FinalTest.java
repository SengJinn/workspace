package final_test;

public class FinalTest {

	public static void main(String[] args) {
		int v = 100;
		v = 101;
		System.out.println(v);
		
		// read-only 할당 된 값을 변경할 수 없고
		// 읽기만 가능
		final int c = 100;
		// c = 10000;
		System.out.println(c);
		
		Car car = new Car("모닝",160);
		// car.maxSpeed = 280; // final 필드는 값의 재할당 불가
		System.out.println(car.model);
		System.out.println(car.maxSpeed);
		car.company = "KIA";
		car.company = "KIN";
		
		Car k3 = new Car("k3", 180);
		System.out.println(k3.model);
		System.out.println(k3.maxSpeed);
		System.out.println(k3.company);
		System.out.println(Car.company);
		
		// Car.MIN_SPEED = -10;
		System.err.println(Car.MIN_SPEED);
		
		System.out.println(Math.PI);
		System.out.println(Math.E);
		// Math.E = 10;
		
		System.out.println(Math.random());
	}

}










