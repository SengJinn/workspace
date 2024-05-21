package extends5_polymorphism.array;

//고객 정보를 저장하는 class - 고객 관리용 - 소비자
public class Customer {

	int customerID;			// 소비자 아이디
	String customerName;	// 소비자 이름
	String customerGrade;	// 소비자 등급
	int bonusPoint;			// 보너스 포인트
	double bonusRatio;		// 보너스 비율(적립율)
	
	public Customer(int customerID, String customerName) {
		super();
		this.customerID = customerID;
		this.customerName = customerName;
		this.customerGrade = "SILVER";
		this.bonusRatio = 0.01;
	}
	
	// 보너스 포인트 적립 후 구매 가격 반환
	public int calcPrice(int price) {
		// 상품 가격을 매개변수로 전달 받아 보너스 적립후
		// 구매한 상품 금액을 반환
		bonusPoint += price * bonusRatio;
		return price;
	}
	
	@Override //재정의된 메소드인지 컴파일 단계에서 check
	// Customer 객체의 정보를 문자열로 반환
	public String toString() {
		return customerName + "님의 등급은 " + customerGrade + "이며" + " 보너스 포인트는 " + bonusPoint + "입니다.";
	}
}
