package practice_04;

public class CarExample {
	/**
	 * Car class 작성
	 */
	public static void main(String[] args) {
		Car mycar = new Car();
		mycar.color = "red";
		mycar.speed = 0;
		mycar.changeGear(1);
		mycar.speedUP();
		
		System.out.println(mycar);
		mycar.speedDown();
		System.out.println(mycar);
	}
	
}



