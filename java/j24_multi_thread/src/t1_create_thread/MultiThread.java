package t1_create_thread;

public class MultiThread {

	public static void main(String[] args) {
		System.out.println("Main 시작");
		
		// 작업을 정의하고 있는 스레드 객체 생성
		Thread t = new BeepThread();
		// t.run(); // 스레드 생성 X, instance의 run(); 호출 및 실행
		// JVM이 새로운 스레드를 생성하고 작업을 시키도록 명령
		// 새로운 작업 스레드 생성 및 생성된 스레드의 run(); 호출
		t.start();
		
		// Runnable 인터페이스 구현 객체
		// 스레드가 처리할 작업을 정의하는 인터페이스
		Runnable run = new PrintTask();
		// 생성자의 매개변수로 스레드가 처리해야할 작업 전달.
		Thread printThread = new Thread(run); 
		printThread.start();
		
		Thread t2 = new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println("Work Task");
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {}
				System.out.println("Work Task 종료");
			} // end task
		});
		t2.start();
		
		Thread t3 = new Thread(()->{
			// run method 블럭
			Thread current = Thread.currentThread();
			System.out.println(current);
		});
		t3.start();
		
		System.out.println("Main 종료");
	} // end main

}
