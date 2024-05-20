package extends2_phone_example;

public class PhoneExample {

	public static void main(String[] args) {
		// 기본적인 기능을 하는 1세대 폰
		Phone phone = new Phone("걸리버","GOLD");
		phone.powerOn();
		phone.bell();
		phone.pickUp();
		phone.sendVoice("여보세요~?");
		phone.receiveVoice("이번에 새로 나온 좋은 상품이 있는데...");
		phone.sendVoice("Rjedu");
		phone.hangUp();
		phone.powerOff();
		
		System.out.println("DMBPhone =============");
		DMBPhone dmbPhone = new DMBPhone("가로본능","SILVER",8);
		dmbPhone.powerOn();
		dmbPhone.bell();
		dmbPhone.pickUp();
		dmbPhone.sendVoice("hi");
		dmbPhone.receiveVoice("sorry");
		dmbPhone.hangUp();
		dmbPhone.turnOnDMB();
		dmbPhone.setChannel(11);
		dmbPhone.turnOffDMB();
		dmbPhone.powerOff();
		
		System.out.println("AndroidSmartPhone =======");
		AndroidSmartPhone smartPhone 
						= new AndroidSmartPhone("옴니아","silver",7,"http://google.com");
		smartPhone.powerOn();	// Phone 기능
		smartPhone.turnOnDMB(); // DMBPhone 기능
		smartPhone.turnOffDMB();
		smartPhone.turnOnInternet();
		smartPhone.setUrl("상속이란 무엇인가?");
		smartPhone.turnOffInternet();
		smartPhone.bell();
		smartPhone.powerOff();
		
	}

}






