package t1_create_thread;

import java.awt.Toolkit;

public class SingleThreadExample {
	
	/**
	 * main method
	 * JVM(자바 가상머신)이 프로그램 실행시 생성한
	 * main thread에서 호출되는 method
	 * main thread 호출된 main method가 종료되면 프로세스도 종료 
	 * 
	 * main thread 하나로 작업을 처리할 경우
	 * single thread 환경이라고 함.
	 */
	public static void main(String[] args) {
		System.out.println("Main 시작!!!!");
		// 프로세스(process)란 운영체제에서 실행 중에 있는 프로그램을 의미
		// 하나의 프로세스는 독립적인 메모리 공간을 사용하며 다른 프로세스와 메모리를 공유하지 않음
		
		// 스레드(Thread) 하나의 프로세스 내부에서 실행되는 작업(단위)
		
		// Java에서 Multi Thread 지원을 위해 제공되는 객체 : Thread
		
		// 현재 명령줄이 실행되는 작업 스레드를 반환
		Thread t = Thread.currentThread();
		System.out.println(t);
		// Thread[id, name, priority, group name]
		// id는 java 19에 추가됨
		// Thread[#1, main,5, main]
		
		for(int i = 0; i < 5 ; i++) {
			System.out.println("띵!");
			// 현재 작업 중인 스레드를
			// 매개변수로 전달된 millis second 만큼
			try {
				Thread.sleep(500);// 0.5초만큼 대기
			} catch (InterruptedException e) {
				// Interrupted 작업을 방해하다, 가로막다, 중단시키다 등등등
				e.printStackTrace();
			} 
		} // end for
		System.out.println("출력 완료!");
		
		// java 프로그램에서 운영체제와 하드웨어를 제어하는 툴킷
		Toolkit tool = Toolkit.getDefaultToolkit();
		for(int i = 0 ; i < 5 ; i++) {
			// 컴퓨터의 비프음 발생
			tool.beep();
			try {
				// 0.5 초에 한 번씩 비프음 발생
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} // end for
		
		System.out.println("Main 종료!!!");
	} // end main
	
}



