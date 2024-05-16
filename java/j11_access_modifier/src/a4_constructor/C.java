package a4_constructor;

import a3_constructor.A;
import a3_constructor.B;

public class C {
	
	A a = new A();		//public 생성자
	//default 접근 제한을 가진 생성자이므로
	//외부 package에서 접근 불가 호출 X
	//A a1 = new A(1); 	//default
	
	//class 외부에서 접근이 불가능하므로 생성자 호츨X
	//A a2 = new A("private 생성자");
	
	B b = new B();
}
