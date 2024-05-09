package d_constuctor;

public class CarExample {
	public static void main(String[] args) {
		Car car = new Car();
		System.out.println(car.nation);
		System.out.println(car.company);
		
		car.company = "Benz";
		car.model = "S class";
		car.color = "BLACK";
		car.maxSpeed = 300;
		car.speed = 0 ;
		
		Car k5 = new Car("KIA", "k5", 210);
		System.out.println(k5.nation);
		System.out.println(k5.model);
		System.out.println(k5.company);
		System.out.println(k5.color);
		System.out.println(k5.maxSpeed);
		System.out.println(k5.speed);
		
		Car k7 = new Car("KIA", "k7","white");
		System.out.println(k7);
		
		System.out.println("============================");
		Car avante = new Car("대한민국", "HYUNDAI", "avante", "white", 300, 0);
		
		System.out.println(avante.nation);
		System.out.println(avante.company);
		System.out.println(avante.model);
		System.out.println(avante.color);
		System.out.println(avante.maxSpeed);
		System.out.println(avante.speed);

	}
}
