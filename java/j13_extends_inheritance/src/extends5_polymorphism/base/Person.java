package extends5_polymorphism.base;

public class Person // extends Object 
{
	
	String name;
	int birth;
	
	public Person(){
		// super();  
		// 부모 생성자 호출은 생략해도 컴파일러가 기본생성자 호출 추가
	}

	public Person(String name, int birth) {
		super();
		this.name = name;
		this.birth = birth;
	}


	// alt + s + v  method override

	// alt s + s , s
	// generate toString
	@Override
	public String toString() {
		return "Person [name=" + name + ", birth=" + birth + "]";
	}
	

}