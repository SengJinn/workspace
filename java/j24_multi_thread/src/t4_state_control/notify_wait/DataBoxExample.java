package t4_state_control.notify_wait;

public class DataBoxExample {
	
	public static void main(String[] args) {
		// 공유 자원
		DataBox dataBox = new DataBox();
		Thread p =new ProducerThread(dataBox);
		p.start();
		
		Thread c = new ConsumerThread(dataBox);
		c.start();
	}// end main
}
