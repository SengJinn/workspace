package c5_compare;

import java.util.Arrays;
import java.util.Comparator;
import java.util.TreeSet;

public class ComparatorExample {
	public static void main(String[] args) {
		
		DescendingComparator comparator = new DescendingComparator();
		
		// java.util - ctrl + shift _ o 자동 임폴트
		TreeSet<Fruit> treeSet = new TreeSet<>(comparator);
		treeSet.add(new Fruit("포도", 3000));
		treeSet.add(new Fruit("딸기", 1500));
		treeSet.add(new Fruit("수박", 10000));
		treeSet.add(new Fruit("토마토", 4500));
		System.out.println(treeSet);
		
		Comparator<Fruit> fruitCompare = new Comparator<Fruit>() {
			@Override
			public int compare(Fruit o1, Fruit o2) {
				return o1.getName().compareTo(o2.getName());
			}
		};
		TreeSet<Fruit> treeSet2 = new TreeSet<>(fruitCompare);
		treeSet2.add(new Fruit("포도", 3000));
		treeSet2.add(new Fruit("딸기", 1500));
		treeSet2.add(new Fruit("수박", 10000));
		treeSet2.add(new Fruit("토마토", 4500));
		System.out.println(treeSet2);
		
		System.out.println("======================================");
		
		Integer[] arrays = new Integer[] {10,70,90,80};
		Arrays.sort(arrays);
		System.out.println(Arrays.toString(arrays));
		
		Arrays.sort(arrays, new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				return o2 - o1; //역순 정렬
			}
		});
		System.out.println(Arrays.toString(arrays));
	}
}
