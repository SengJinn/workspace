package t3_sync;

public class Account {
	
	// 현재 저장된 금액
	private int balance = 10000;
	
	// 잔금 확인
	public int getBalance() {
		return this.balance;
	}
	
	// 매개변수로 전달받은 금액을 출금 하고
	// 출금 성공 여부 반환
	//synchronized public boolean withDraw(int money) {
	// public synchronized boolean withDraw(int money) {
	public boolean withDraw(int money) {
		if(this.balance >= money) {
			
			try {
				// 1초간 작업 대기
				Thread.sleep(1000);
			} catch (InterruptedException e) {}
			
			// 출금 가능한 금액.
			this.balance -= money;
			return true;
		}
		// 출금 할 수 없는 금액.
		return false;
	}

}
