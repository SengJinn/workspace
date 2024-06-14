package t2_priority_name;

public class PriorityExample {
	public static void main(String[] args) {
		// priority - 우선 순위
		Thread t = Thread.currentThread();
		System.out.println(t);
		// 스레드 이름
		System.out.println(t.getName());
		// 스레드 우선순위
		System.out.println(t.getPriority());
		
		// Thread가 제공해주는 우선순위 지정 가능 정수값
		System.out.println(Thread.MAX_PRIORITY);
		System.out.println(Thread.NORM_PRIORITY);
		System.out.println(Thread.MIN_PRIORITY);
		System.out.println("===================================");
		
		for(int i = 1; i<=10; i++) {
			
			Thread calc = new CalcThread("CalcThread-" + i);
			if(i == 7) {
				// 7번 calcThread만 우선순위를 맥스로 지정
				calc.setPriority(Thread.MAX_PRIORITY);
			}
			calc.start();
		} // end create thread for
	}// end main
}
