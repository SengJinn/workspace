package a_object.hashcode;

public class Key { // extends Object
	
	int number;
	
	// 생성자 추가   alt + s , a
	public Key(int number) {
		super();
		this.number = number;
	}

	@Override
	public int hashCode() {
		System.out.println("key 이 hashcode 호출 - " + this.number);
		return this.number;
	}

	@Override
	public boolean equals(Object obj) {
		System.out.println("key equals -" + this.number);
		// since java17
		if(obj instanceof Key key) {
			if(this.number == key.number) {
				return true;
			}
		}
		return super.equals(obj);
	}
	

}

