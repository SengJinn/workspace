package h_practice;

public class Student {
	int number;		// 학번
	String name;	// 이름
	int score;		// 점수
	
	//기본 생성자 추가
	Student(){}
	
	//alt + s, a
	//전체 필드를 초기화하는 생성자 추가
	public Student(int number, String name, int score) {
		this.number = number;
		this.name = name;
		this.score = score;
	}
	
	// 학생이 가진 필드의 정보를 하나의 문자열로 변환
	String getInfo() {
		return "number:" + number + ", name :" + name + ", score" + score;
	}
	
}
