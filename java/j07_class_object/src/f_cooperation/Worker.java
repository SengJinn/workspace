package f_cooperation;

public class Worker {
	String workerName; 	//직장인 이름
	int money; 			//보유 금액
	
	// 직장인 이름과 보유금액을 생성자를 통해서 초기화
	Worker(String workerName, int money){
		this.workerName = workerName;
		this.money = money;
	}
	
	// 버스에 금액 지불
	// 지불한 금액 만큼 보유 금액에서 차감
	void takeBus(Bus bus) {
		bus.take(1700);
		this.money -= 1700;
	}
	
	void takeSubway(Subway subway) {
		subway.take(1350);
		money -= 1350;
	}
	
	void showInfo() {
		System.out.println(workerName + "님의 보유금액은" + money +"입니다.");
	}
}	
