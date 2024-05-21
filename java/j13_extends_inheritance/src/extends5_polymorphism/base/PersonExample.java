package extends5_polymorphism.base;

public class PersonExample {

	public static void main(String[] args) {
		//  1           2          4     8
		// byte < short == char < int < long
		byte b = 65;
//		b = 129; 		// 컴파일러가 체크
		int i = b;		// 자동 타입 변환
		long lo = i;	// 묵시적 형변환
		
		char c = 'A';	// 컴파일 체크
		System.out.println(c);
		c = 65;			// 컴파일 체크
		System.out.println(c);
		c = (char)b;	// 명시적 형 변환
						// 강제 타입 변환
		// 4byte의 int type에 8byte long 타입 저장
		i = (int)lo;	// 강제 타입 변환
		
		// Person 다형성 
		Person p1 = new Person("최기근",19820607);
		// String info = p1.toString();
		// System.out.println(info);
		System.out.println(p1);
		// Object obj = p1;
		
		Student stu = new Student("김동하",19670602,"3반","45번","2학년");
		System.out.println(stu);
		
		Person stu2 = new Student("김동찬",20020608,"2반","1번","4학년");
		System.out.println(stu2.name);
		System.out.println(stu2.birth);
		// System.out.println(stu2.classRoom);
		System.out.println(stu2);
		
		Person teacher
			= new Teacher("제임스 고슬링",19640512,"EAD-134","JAVA","4학년");
		System.out.println(teacher);
		
		// teacher.teach();
		Teacher t1 = (Teacher)teacher;
		t1.teach();
		
		if(stu2 instanceof Teacher) {
			Teacher t2 = (Teacher)stu2;
			t2.teach();
		}else {
			System.out.println("stu2객체는 Teacher 티입이 아닙니다.");
		}
		
	} // end main method

}
