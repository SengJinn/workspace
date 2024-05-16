package final_test;

public class Car {
	
	static String company;				// 제조사
	// final 필드는 객체 생성 시에 초기화가 되어 있어야 하고 
	// 초기된 필드는 값을 변경할 수 없는 읽기전용 필드가 됨
	final String model;			// 차량의 모델명
	final int maxSpeed;			// 자동차가 낼 수 있는 최대 속도 
	// 자동차 마다 최고속도는 틀려질 수 있지만 정해지면 변경되지 않는다.
	
	int speed;				// 자동차의 현재 속도
	
	/*
	 * 최저 속도는 모두 0이고 변경될 수 없으며 모든 차들이 같은 값을 가질 수 있도록
	 * 공유 되어야 한다.
	 * - 생산되는 차마다 독립적인 값을 가질 필요없는 공유자원이자 변경되지 않아야 할 값
	 *   상수  == constant
	 */
	final static int MIN_SPEED = 0;
	
	Car(String model, int maxSpeed){
		this.model = model;
		this.maxSpeed = maxSpeed;
	}

}







