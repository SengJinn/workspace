package t4_state_control.stop;

class InterruptThread extends Thread{
	@Override
	public void run() {
		while(true) {
			System.out.println("실행 1");
			boolean isFlag = Thread.interrupted();
			System.out.println("interrupted : " + isFlag);
			if(isFlag) {
				break; 	//while 탈출
			}
		}// end while
		System.out.println("while 종료");
		System.out.println("run method 종료");
	}// end run
}

public class InterruptedExample {
	
	public static void main(String[] args) {
		Thread t = new InterruptThread();
		t.start();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {}
		
		System.out.println("Interrupt 호출");
		t.interrupt(); // 호출 방해
	}
	
}
