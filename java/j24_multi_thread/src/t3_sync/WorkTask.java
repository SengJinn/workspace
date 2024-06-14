package t3_sync;

public class WorkTask implements Runnable{
	
	// 출금할 계좌 정보
	Account account;
	
	WorkTask(Account account){
		this.account = account;
	}

	@Override
	public void run() {
		// 계좌 정보의 잔고가 0보다 큰 동안 반복
		while(account.getBalance() > 0) {
			// 출금할 금액을 1000 ~ 5000 랜덤 하게 설정
			int money = (int)(Math.random() * 5 + 1) * 1000;
			boolean isDenied = false;
			
			synchronized (account) {
				// 출금 요청 후 처리 결과 반환
				isDenied = account.withDraw(money);
			}
			
			// 출금 결과에 따른 출력
			if(isDenied) {
				System.out.printf(
					"%s 출금 : %d원, 남은 금액 : %d원 %n",
					Thread.currentThread().getName(), // 수행한 스레드 이름
					money,							  // 출금 금액
					account.getBalance()			  // 남은 금액
				);
			}else {
				System.out.println("출금 금액 부족 - 거부");
			}
			
		} // end while
		
	} // end run

}