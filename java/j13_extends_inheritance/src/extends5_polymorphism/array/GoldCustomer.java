package extends5_polymorphism.array;

// Gold 등급 고객 정보 관리 class
public class GoldCustomer extends Customer {
	
	double saleRatio;	//할인율
	
	//public GoldCustomer() {super();}
	public GoldCustomer(int customerID, String customerName) {
		super(customerID, customerName);
		super.customerGrade = "GOLD";
		super.bonusRatio = 0.02;
		this.saleRatio = 0.1;
		
		
	}
	// alt + s+ v
	@Override
	public int calcPrice(int price) {
		// 보너스 포인트 적립
		bonusPoint += (price * bonusRatio);
		return price - (int)(price * saleRatio);
	}
	
}
