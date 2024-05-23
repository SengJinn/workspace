package practice_04;

public class Car {
	Car(){} // 기본 생성자 추가
	
	String color;
	int speed;
	int gear;
	
	// 변수 값을 받아 초기화
	public Car(String color, int speed, int gear) {
		this.color = color;
		this.speed = speed;
		this.gear = gear;
	}
	
	// 받은 정수를 기어에 더한 다음 다시 저장하는 메소드
	public void changeGear(int number) {
		this.gear = gear + number;
	}
	
	// 스피드에 10을 추가하여 저장하는 메소드
	public void speedUP() {
		this.speed = speed + 10;
	}
	
	// 스피드에 10을 감소시켜 저장하는 메소드
	void speedDown() {
		this.speed = speed - 10;
	}
	
	// 출력용 메소드
	@Override
	public String toString() {
		return "Car [color=" + color + ", speed=" + speed + ", gear=" + gear + "]";
	}

}

