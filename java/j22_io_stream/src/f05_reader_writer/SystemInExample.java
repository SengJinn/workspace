package f05_reader_writer;

import java.io.IOException;
import java.io.InputStream;

public class SystemInExample {

	public static void main(String[] args) throws IOException {
		
		InputStream is = System.in;
		
		while(true) {
			int i = is.read();
			System.out.println(i);
			if(i == 'q') break;
			System.out.println("입력 받은 값은 : " + (char)i);
		}
		
		// 입력 스트림에 13 10   Enter 제거 
		System.out.println(is.read());
		System.out.println(is.read());
	
		// is.close(); Stream closed
		
		System.out.println("입력해 주세요!");
		byte[] bytes = new byte[100];
		int readBytes = is.read(bytes);
		String str = new String(bytes, 0 , readBytes);
		System.out.println(str);
		
		is.close();
		
	}

}
