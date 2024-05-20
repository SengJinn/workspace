package extends2_phone_example;

public class AndroidSmartPhone extends DMBPhone {
	
	String url;		// 인터넷 검색 기능

	/*
	AndroidSmartPhone(){
		// DMBPhone(); DMBPhone class는  기본생성자가 존재하지 않으므로
		// 기본 생성자를 호출하여 객체 생성 불가.
		super();
	}
	*/
	AndroidSmartPhone(String model, String color, int channel) {
		super(model, color, channel);
	}

	// alt + s , a
	// 생성자 자동 완성
	public AndroidSmartPhone(String model, String color, int channel, String url) {
		super(model, color, channel);
		this.url = url;
	}
	
	void turnOnInternet() {
		System.out.println("인터넷을 "+this.url+"을 켭니다.");
	}
	
	void turnOffInternet() {
		System.out.println("인터넷을 끕니다.");
	}
	
	void setUrl(String url) {
		this.url = url;
		System.out.println(url+"을 검색합니다.");
	}
	
	// method 재정의 override // overriding
	// 부모(상위) class가 정의한 method를 자식(하위) class에 맞게 다시 정이하는 것
	// @Override
	// 재정의된 method는 상위클래스의 접근 제한자보다 
 	// 좁은 범위의 접근제한자를 가질수 없음.
	// private void bell() {
	public void bell() {
		System.out.println("디지털 벨소리가 울립니다.");
	}

}












