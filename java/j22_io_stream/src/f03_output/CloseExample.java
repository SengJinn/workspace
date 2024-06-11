package f03_output;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Scanner;

public class CloseExample {

	public static void main(String[] args) {
		
		InputStream is = null;
		OutputStream os = null;
		
		String path = "C:\\Temp\\file.txt";
		
		// 운영체제 콘솔에서 입력받도록 연결된 InputStream
		// Scanner 는 매개변수로 전달받은 입력스트림을 통해
		// 자바 데이터 타입으로 값을 입력 받을 수 있도로고 설계된 객체
		Scanner sc = new Scanner(System.in);
		
		try {
			is = new FileInputStream(path);
			byte[] bytes = new byte[is.available()];
			System.out.println("bytes length : " + bytes.length);
			int readBytes = is.read(bytes);
			
			String result = new String(bytes, 0 , readBytes);
			System.out.println("저장된 문자열 : " + result);
			
			// is.close();
			System.out.println("추가로 저장할 문자열을 입력해 주세요 > ");
			String add = sc.next();
			
			os = new FileOutputStream(path, true);
			bytes = add.getBytes();
			os.write(bytes);
			os.flush();
			System.out.println("출력완료");
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(os != null) os.close();
			} catch (IOException e) {}		
			if(is != null) {
				try {
					is.close();
				} catch (IOException e) {}
			}
			
		}

	}

}