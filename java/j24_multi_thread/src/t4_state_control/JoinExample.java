package t4_state_control;

public class JoinExample {
	
	public static void main(String[] args) {
		// join()이 호출된 스레드가 작업을 종료할 때까지
		// 다른 thread를 일시 정지 시킴
		Thread t1 = new Thread(()->{
			int sum = 0;
			for(int i =1; i<=100; i++) {
				sum += i;
				try {
					Thread.sleep(10);
				} catch (InterruptedException e) {}
				System.out.println(Thread.currentThread().getName() + "sum : " + sum );
			}// end for
			System.out.println("sum Thread 종료 : " + sum);
		});
		t1.setName("SumThread");
		t1.start();
		
		try {
			// join()을 호출한 스레드는 일시 정지
			// t1.join();
			t1.join(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println("t1 작업 종료");
		
		System.out.println("Main 종료");
	} // end main
	
}
