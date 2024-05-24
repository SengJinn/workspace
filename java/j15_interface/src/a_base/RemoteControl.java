package a_base;

public interface RemoteControl {
	
	public static final int MAX_VALUE = 30;
	// 따로 선언하지 않아도
	// interface의 field는 자동으로
	// public static final이 됨
	int MIN_VALUE = 0;
	
	// interface 추상 메소드만 선언 가능
	// void setValue (int value) {}
	public abstract void turnOn();
	void turnOff();
	void setValue(int value);
	
}
