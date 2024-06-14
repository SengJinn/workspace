package t3_sync;

import java.lang.Thread.State;
import java.util.*;
/*
 * single			multi
 * ArrayList		Vector
 * HashMap			Hashtable
 * StringBuilder	StringBuffer
 * */

public class VectorTest {

	public static void main(String[] args) {
		System.out.println("Main 시작");
		// List<String> array = new ArrayList<>();
		List<String> array = new Vector<>();
		
		Thread t1 = new Thread(()->{
			// Runnable run()
			for(int i = 0; i < 10000; i++) {
				array.add("최기근");
			}
			System.out.println("t1 종료");
		});
		// t1 스레드의 현재 상태 정보
		System.out.println(t1.getState());
		t1.start();
		System.out.println(t1.getState());
		
		Thread t2 = new Thread(()->{
			for(int i=0; i < 10000; i++) {
				array.add("천재");
			}
			System.out.println("t2 작업 완료");
		});
		t2.start();
		
		while(true) {
			if(t1.getState() == State.TERMINATED && t1.getState() == State.TERMINATED) {
				System.out.println("t1, t2 작업 완료");
				System.out.println("array size : "+array.size());
				break;
			}
		}
		System.out.println("Main 종료");
	}

}













