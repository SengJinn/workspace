package t3_sync;

public class SyncExample {

	public static void main(String[] args) {
		Account account = new Account();
		
		Thread choi = new Thread(new WorkTask(account));
		
		Thread lee = new Thread(new WorkTask(account));
		
		choi.setName("choi");
		choi.start();
		
		lee.setName("lee");
		lee.start();
		
	} // end main

}