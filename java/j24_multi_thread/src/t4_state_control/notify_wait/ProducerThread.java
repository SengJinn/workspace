package t4_state_control.notify_wait;

// 데이터 제공 thread
public class ProducerThread extends Thread {
	private DataBox dataBox;
	
	public ProducerThread(DataBox dataBox) {
		this.dataBox = dataBox;
	}
	
	@Override
	public void run() {
		for(int i = 0; i<=3 ; i++) {
			String data = "Data - " + i;
			dataBox.setData(data);
		}
	}
}
