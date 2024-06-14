package t5_daemon;

import java.util.Map;
import java.util.Set;

class AutoSaveThread extends Thread{
	
	public void save() {
		System.out.println("작업 내용을 저장합니다.");
	}
	
	@Override
	public void run() {
		while(true) {
			System.out.println(Thread.currentThread());
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {}
			save();
		} // end while
	} // end run
} // end AutoSaveThread 

/**
 * Daemon 프로그램 이란
 * 사용자가 직접적으로 제어하지 않고, 백그라운드에서 돌면서
 * 여러작업을 수행하는 프로그램
 * 
 * Daemon Thread - 주 스레드(일반스레드)에서 자동으로 관리되는 스레드
 * 모든 일반 스레드가 종료 되고 나면 데몬스레드도 종료 됨.
 * 
 */
public class DaeMonExample {

	public static void main(String[] args) {
		
		AutoSaveThread t = new AutoSaveThread();
		t.setName("AutoSaveThread");
		t.setDaemon(true); // 데몬 스레드 지정
		// 데몬 스레드 지정은 스레드가 실행되기 전에 지정되어야 함.
		t.start();
		// 해당 스레드가 데몬스레드 인지 여부를 boolean 타입으로 반환
		System.out.println("t isDaemon : " + t.isDaemon());
		
		Thread t1 = new Thread(()->{
			for(int i = 0; i < 5; i++) {
				System.out.println("t1 : " + i);
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {}
			}
		});
		t1.start();
		System.out.println("t1 isDaemon : " + t1.isDaemon());
		
		// 현재 동작 중인 모든 스레드 정보
		Map<Thread, StackTraceElement[]> map = Thread.getAllStackTraces();
		Set<Thread> threads = map.keySet();
		
		for(Thread thread : threads) {
			String isDaemon = (thread.isDaemon()) ? "(DAEMON)" : "(주)";
			System.out.println("Name : " + thread.getName() + isDaemon);
			System.out.println("\t 소속그룹 : " + thread.getThreadGroup().getName());
		}
		
		System.out.println("MAIN 종료");
	} // end main

}



