package n4_udp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetSocketAddress;

public class UDPClientExample {

	public static void main(String[] args) {
		/*
		 * UDP - User Datagram Protocol
		 * 사용자 데이터그램 전송 규칙
		 * 데이터가 전송되기 전에 연결이 설정 되지 않음.
		 * 통신속도가 빠르다.
		 * 데이터가 전송시 유실될 위험성이 크므로 신뢰성이 떨어짐
		 */
		
		try {
			// Data의 수신 발신을 담당하는 객체
			DatagramSocket datagramSocket = new DatagramSocket();
			for(int i = 1; i < 4; i++) {
				String message = "message-"+i;
				byte[] bytes = message.getBytes();
				//packet 네트워크를 통해 전송하기 쉽도록 자른 데이터 전송 단위
				DatagramPacket packet = new DatagramPacket(
					bytes,				// 전송할 데이터
					0,					// 시작 인덱스 번호
					bytes.length,		// 전송할 데이터 크기- 길이
					// 데이터를 전송할 위치
					new InetSocketAddress("10.100.205.231",5003)
				);
				// packet에 저장된 정보로 데이터 발신
				datagramSocket.send(packet);
				System.out.println("발신 완료 : " + bytes.length);
			} // end for
			datagramSocket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
