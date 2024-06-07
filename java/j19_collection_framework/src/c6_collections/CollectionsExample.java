package c6_collections;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class CollectionsExample {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<>();
		for(int i = 1; i<=45; i++) {
			list.add(i);
		}
		System.out.println(list);
		
		Collections.shuffle(list); 	//섞는다.
		
		System.out.println(list);
		
		Collections.shuffle(list); 
		
		System.out.println(list);
		
		// 해당 리스트에서 필요한 부분만 추출해서 새로운 배열 생성
		// (시작 인덱스 번호, size)
		List<Integer> lotto = list.subList(0, 6);
		System.out.println(lotto);
		
		//오름차순 정렬
		Collections.sort(lotto);
		System.out.println(lotto);
		
		//역순 정렬 - 기존에 리스트에 나열된 순서에서 방향만 바꿈 - 오름차순 X, 내림차순 X
		Collections.reverse(lotto);
		
		System.out.println(lotto);
		
		Collections.sort(lotto);
		
		System.out.println(lotto);
		
		Collections.sort(lotto, Collections.reverseOrder());
		System.out.println(lotto);
		
		System.out.println("=========================================");
		
		Integer[] lottos = new Integer[lotto.size()];
		// List -> array
		lotto.toArray(lottos);
		System.out.println(Arrays.toString(lottos));
		Arrays.sort(lottos);
		System.out.println(Arrays.toString(lottos));
		
		Arrays.sort(lottos, Collections.reverseOrder());
		System.out.println(Arrays.toString(lottos));
		
		// array => List
		List<Integer> lottoList = Arrays.asList(lottos);
		System.out.println(lottoList);
		
	}

}
