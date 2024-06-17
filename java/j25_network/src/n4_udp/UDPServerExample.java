package n4_udp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPServerExample {

	public static void main(String[] args) {
		
		try {
			DatagramSocket datagramSocket = new DatagramSocket(5003);
			while(true) {
				DatagramPacket packet = new DatagramPacket(
					new byte[100],				// 데이터를 저장할 배열
					100							// 저장할 데이터 길이
				);
				// 수신완료 시 까지 - blocking - 대기
				System.out.println("blocking");
				datagramSocket.receive(packet);
				System.out.println(packet.getAddress());
				System.out.println("receive");
				String data = new String(packet.getData(), 0, packet.getLength());
				System.out.println("[ 받은 내용 : "+data+"]");
			} // end while
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}