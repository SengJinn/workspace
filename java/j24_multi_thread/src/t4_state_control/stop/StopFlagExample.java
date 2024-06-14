package t4_state_control.stop;

import java.util.Scanner;

class PrintThread extends Thread{
	
	private boolean isRun = true;
	
	public void setIsRun(boolean isRun) {
		this.isRun = isRun;
	}
	
	@Override
	public void run() {
		long sum = 0;
		int i = 0;
		while(isRun) {
			sum += i;
			i++;
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {}
		} // end while
		System.out.println("run method 종료 : " + sum);
	} // end run
	
} // end PrintThread

public class StopFlagExample {

	public static void main(String[] args) {
		PrintThread pt = new PrintThread();
		pt.start();
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("출력할 문자열을 입력해 주세요 q는 종료");
			String answer = sc.next();
			System.out.println(answer);
			if(answer.equals("q")) {
				//PrintThread 도 작업 종료
				// pt.stop();
				pt.setIsRun(false);
				break; //while 종료
			}
		}// end while
		
		System.out.println("Main 종료");
	}// end main

}
