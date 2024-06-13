package serializable;

import java.io.*;

import f09_object.serializable.Person;

public class ObjectInputExample {

	public static void main(String[] args) {
		try {
			ObjectInputStream ois = new ObjectInputStream(
				new FileInputStream("c:\\Temp\\person.dat")
			);
			while(true) { // 반복하면서 Person 객체 정보 읽기
				try {
					// Object p = ois.readObject();
					Person p = (Person)ois.readObject();
					System.out.println(p);
				} catch (ClassNotFoundException e) {
					//직렬화된 클래스를 현재 프로젝트에서 찾을 수 없음
					e.printStackTrace();
					break;
				} catch(EOFException e) {
					// 모든 객체를 다 읽음.
					System.out.println(e.getMessage());
					break;
				}
			}// end while
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
