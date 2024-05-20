package extends1_base;

class Car// extends Object
{
	
	String company;
	int maxSpeed;
	
	Car(){
		super();
		System.out.println("Car 기본 생성자 호출");
	}
	
	Car(String company){
		this.company = company;
		System.out.println("Car company를 매개변수로 전달받는 생성자 호출");
	}
	
	public String toString() {
		return "Car[ company = "+this.company+", maxSpeed = "+this.maxSpeed+"]";
	}
} // end Car class

// Car 기능도 할 수 있다.
// Bus는 Car다.
class Bus extends Car{
	Bus(){
		super(); // 자식 객체 생성 초기화 전 부모 생성자 호출
		// 생략되면 컴파일러가 기본생성자 호출 자동으로 추가
		System.out.println("Bus 기본생성자 호출");
	}
} // end Bus class

// is a
// 택시는 차다
class Taxi extends Car{
	
	Taxi(String company){
		// this.company = company;
		// super.company = company;
		super(company);
		System.out.println("taxi company를 넘겨받는 생성자 호출");
	}
	
}

public class CarExample {

	public static void main(String[] args) {
		Bus bus = new Bus();
		bus.company = "KIA";
		bus.maxSpeed = 180;
		System.out.println(bus.toString());
		
		Taxi taxi = new Taxi("BMW");
		taxi.maxSpeed = 280;
		String str = taxi.toString();
		System.out.println(str);
	}

}









