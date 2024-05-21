package extends5_polymorphism.array;

// VIP 고객 관리용 class
public class VIPCustomer extends GoldCustomer{
	
	int agentID;	// 담당 직원

	public VIPCustomer(int customerID, String customerName, int agentID) {
		super(customerID, customerName);
		this.customerGrade = "VIP";
		this.bonusRatio = 0.05;
		this.saleRatio = 0.2;
		this.agentID = agentID;
	}
	
	@Override
	public String toString() {
		return super.toString() + "담당직원 번호는" + this.agentID + "입니다.";
	}

}

