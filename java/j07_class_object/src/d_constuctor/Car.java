package d_constuctor;

public class Car {
	String nation = "korea";	// 제조국가
	String company;				// 제조회사
	String model;				// 모델명
	String color;				// 색상
	
	int maxSpeed;				// 최대속도
	int speed;					// 현재속도
	
	// 전달받는 매개변수가 없는 기본생성자
	// class에 선언된 생성자가 없으면 컴파일러가 자동으로 추가
	public Car() {
		System.out.println("Car 기본 생성자 호출");
	}
	
	// 3개의 매개변수를 전달받는 생성자 정의
	Car(String c, String m, int i){
		company = c;
		model = m;
		maxSpeed = i;
	}
	Car(String company, String model, String color){
		this.company = company;
		this.model = model;
		this.color = color;
	}
	
	//전체 필드를 매개변수로 전달받아 초기화시키는 생성자 추가
	// 생성자 자동 완성 alt + s + a
	Car(String nation, String company, String model, String color, int maxSpeed, int speed){
		this(company,model,color); //이 객체의 다른 생성자 호출
		this.nation = nation;
//		this.company = company;
//		this.model = model;
//		this.color = color;
		this.maxSpeed = maxSpeed;
		this. speed = speed;
	}
	
}	
