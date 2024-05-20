package extends2_phone_example;

public class DMBPhone extends Phone{
	
	int channel;		// 공중파 채널
	
	DMBPhone(String model, String color, int channel){
		super(model,color);
		this.channel = channel;
	}
	
	void turnOnDMB() {
		System.out.println("DMB를 켭니다.");
	}
	
	void turnOffDMB() {
		System.out.println("DMB를 끕니다.");
	}
	
	void setChannel(int channel) {
		if(channel < 1) {
			this.channel = 11;
		}else {
			this.channel = channel;
		}
		System.out.println("채널이 " + this.channel+"로 변경됨");
	}
	
	
}










