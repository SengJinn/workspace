package static_test;

public class Student {
	
	// 정적멤버
	static String school; // 모든 Student 객체가 공유하는 공유자원
	
	// 인스턴스 멤버 - 생성된 인스턴스마다 존재하는 멤버
	String name;
	int age;
	String grade;
	
	// instance 인스턴스 멤버를 사용하는 method는 인스턴스 멤버 method로 사용
	String studentInfo() {
		return school+"학교의 "+this.name+"학생은 나이가 " + this.age+"입니다.";
	}
	
	// 인스턴스 멤버를 사용하지 않는 method는 static 정적 멤버로 사용
	static void study(String subject) {
		System.out.println(subject+" 과목을  공부합니다.");
	}
	
	
}










