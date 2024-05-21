package extends5_polymorphism.array;

public class CustomerExample {
	public static void main(String[] args) {
		
		// 고객 10명의 정보를 저장하는 배열
		Customer[] customerList = new Customer[10];
		
		Customer customerLee = new Customer(10110, "이다한");
		customerList[0] = customerLee;
		customerList[1] = new Customer(10111, "이진우");
		
		customerList[2] = new GoldCustomer(20110, "이유리");
		customerList[3] = new GoldCustomer(20111, "정승진");
		customerList[4] = new VIPCustomer(77777, "김기환", 10111);
		
		System.out.println("== 고객 정보 ==");
		//등록된 고객 정보 출력
		for(Customer c : customerList) {
			if(c != null) System.out.println(c); //c.String();
		}
		
		System.out.println("== 할인율과 보너스 포인트 꼐산 ==");
		int price = 100000;
		
		//같은 값을 지불한 고객 등급별 정보 출력
		for(Customer c : customerList) {
			if( c != null) {
				int cost = c.calcPrice(price);
				System.out.println(c.customerName + "님이" + cost + "원을 지불하였습니다.");
				System.out.println(c); // 지불 완료 후 고객 정보 출력
			}
		}
		
		
	}// end main method
}// end CustimerExample class
