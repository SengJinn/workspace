package test2_1;

// 실행 class 실행 단축기 ctrl+f11
// f11만 실행하면 디버깅 모드
public class Test {

	public static void main(String[] args) {

		Student kim = new Student();
		kim.school = "Computer Study";
		kim.grade = 4;
		kim.name = "홍길동";
		
		Student choi = new Student("부산아카데미", 1, "최기근");
		System.out.println(choi.school);
		System.out.println(choi.grade);
		System.out.println(choi.name);
	}

}
