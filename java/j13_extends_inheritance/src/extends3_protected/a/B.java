package extends3_protected.a;

public final class B {
	
	public B(){
		A a = new A();
		a.a = 100;		// public 
		a.b = 200;		// protected
		a.c = 300;		// default
		
		// class block 외부 (객체외부)에서는 접근 불가
		// a.d = 400;		// private 
		
		a.methodA();
	}

}
