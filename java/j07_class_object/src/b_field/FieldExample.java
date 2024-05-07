package b_field;

public class FieldExample {
	// main()가 포함되는 실행 가능한 class
	public static void main(String[] args) {
		
		Field f = new Field();
		int field = f.intField;
		double d = f.doubleField;
		boolean bool = f.boolField;
		String str = f.strField;
		
		System.out.println(field);
		System.out.println(d);
		System.out.println(bool);
		System.out.println(str);
		
		Field f2 = new Field();
		f2.intField = 200;
		f2.doubleField = 3.141592;
		f2.boolField = true;
		f2.strField = "잘까?";
		
		System.out.println(f == f2);
	}

}
