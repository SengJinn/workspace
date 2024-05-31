package generic.exam02;

public class ContainerExample {
	public static void main(String[] args) {
		Container<String, String> container1 = new Container<String, String>();
		container1.set("홍길동", "도적");
		String name1 = container1.getKey();
		String job = container1.getValue();
		System.out.printf("%s님의 직업은 %s입니다. %n", name1, job);
		System.out.println(container1);

		Container<String, Integer> container2 = new Container<String, Integer>();
		container2.set("홍길동", 35);
		String name2 = container2.getKey();
		int age = container2.getValue();
		System.out.printf("%s님의 나이는 %d세입니다. %n", name2, age);
		System.out.println(container2);
	}
}
