package a7_encapsulation;

public class StudentExample {
	public static void main(String[] args) {
		System.out.println(Student.MIN_GRADE);
		System.out.println(Student.MAX_GRADE);
		
		Student choi = new Student();
		choi.name = "최기근";
		
		// private field 이므로
		// 외부에서 직접적인 접근 불가
		// choi.age = -20;
		
		choi.setAge(-20);
		System.out.println(choi.getAge());
	}
}
