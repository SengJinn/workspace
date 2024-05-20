package extends2_phone_example;

public class Phone {
	
	String model;		// 전화기 모델명
	String color;		// 색상
	
	Phone(){}
	
	Phone(String model, String color){
		this.model = model;
		this.color = color;
	}
	
	void powerOn() {
		System.out.println("전원을 켭니다.");
	}
	
	void powerOff() {
		System.out.println("전원을 끕니다.");
	}
	
	void bell() {
		System.out.println("아날로그 벨소리가 울립니다.");
	}
	
	void pickUp() {
		System.out.println("전화를 받습니다.");
	}
	
	void hangUp() {
		System.out.println("전화를 끊습니다.");
	}
	
	void sendVoice(String message) {
		System.out.println("나 : " + message);
	}
	
	void receiveVoice(String message) {
		System.out.println("상대 : " + message);
	}
}












