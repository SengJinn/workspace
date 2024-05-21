package extends5_polymorphism.base;

public class Student extends Person{
	//name, birth
	String classroom;		//교실
	String StudentName;		//학번
	String grade;			//학년

	//alt + s , a
		public Student(String name, int birth, String classroom, String studentName, String grade) {
		super(name, birth);
		this.classroom = classroom;
		StudentName = studentName;
		this.grade = grade;
	}
	// alt + s + s , s

		@Override
		public String toString() {
			return "Student [classroom=" + classroom + ", StudentName=" + StudentName + ", grade=" + grade + "]";
		}
		
}
