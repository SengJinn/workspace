package a_base;

public class RadioRemoteControl implements RemoteControl {
	
	int frequency = 99; 	// 주파수
	
	@Override
	public void turnOn() {
		System.out.println("RADIO를 켭니다.");

	}

	@Override
	public void turnOff() {
		System.out.println("RADIO를 끕니다.");

	}

	@Override
	public void setValue(int value) {

		this.frequency = value;
	}

}
