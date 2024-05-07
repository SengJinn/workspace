package c_method;

public class DarkLamp {
	
	// 인스턴스 멤버 변수 - field 정의
	// lamp의 상태 켜짐과 거짐과 같은 정보를 저장
	boolean isOnOff; // false
	
	//램프를 끄고 켜는 기능
	void turnOnOff() {
		if(this.isOnOff) { // 최초 false
			isOnOff = false;
			System.out.println("램프를 끕니다."); // 출력 후 다시 돌아감 그러면 isOnOff가 참이 아니므로 else가 실행
		}else {
			isOnOff = true;
			System.out.println("램프를 켭니다.");
		}
	}
	
}
