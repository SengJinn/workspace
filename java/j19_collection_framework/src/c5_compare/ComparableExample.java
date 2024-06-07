package c5_compare;

import java.util.TreeSet;

public class ComparableExample {
	public static void main(String[] args) {
		
		TreeSet<Integer> intSet = new TreeSet<>();
		intSet.add(50);
		intSet.add(70);
		intSet.add(60);
		intSet.add(50);
		System.out.println(intSet);
		System.out.println("==========================");
		
		Person person = new Person("김동찬", 27);
		Comparable<Person> compare = person;
		
		// if(person instanceof Comparable<person>)
		
		TreeSet<Person> set = new TreeSet<>();
		//set.add(100);
		set.add(new Person("최기근", 26));
		System.out.println("---------------------------");
		set.add(new Person("정승진", 21));
		System.out.println("---------------------------");
		set.add(new Person("최수빈", 65));
		System.out.println("---------------------------");
		set.add(new Person("서석희", 20));
		System.out.println("---------------------------");
		
		System.out.println(set);
	}
}
