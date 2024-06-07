package guide_answer.practice03;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class PracticeMap {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		//Map<Key, Value>
		Map<String, Location> manage = new HashMap<>();
		
		System.out.println("도시, 경도, 위도를 한번에 입력해주세요.(q는 입력완료)");
		// 코드 작성
		// 반복하면서 도시의 경도 위도 정보를 입력 받음
		// 입력받은 값이 q면 종료
		while(true) {
			System.out.print(">> ");
			String answer = sc.nextLine(); // 공백 상관없이 한 줄을 입력 받음
			// 문자열.trim() 문자열에 좌우 공백 제거
			if(answer.trim().equals("q")) {
				// 입력 종료
				break; // end while
			}
			
			// 부산, 30.1 , 40.1 
			// 서울 , 70.1 , 120.1
			// 1. String[] str = 문자열.split("구분자");
			// 2. StringTokenizer st = new StringTokenizer("문자열");
			//	 0		1		 2
			// [부산] [ 30.1 ] [ 40.1 ]
			String[] strs = answer.split(",");
			if(strs.length != 3) {
				System.out.println("잘못된 입력입니다.");
				continue;
			}
			System.out.println(Arrays.toString(strs));
			
			String city = strs[0].trim();	// 도시이름 key
			// Location - value
			String lng = strs[1];			// 경도
			String lat = strs[2];			// 위도
			
			Location location = new Location(Double.parseDouble(lng), Double.parseDouble(lat)); // double 타입으로 변경
	
		// 도시이름을 key 값으로 location 정보 저장
		manage.put(city, location);
	} // end while
		
		//도시 경도 위도 정보 등록 완료
		System.out.println("------------------------------------------------");
		// 등록된 도시 경도 위도 정보 출력
		// Set keySet(), Set entrySet(), Collection values();
		Set<String> keySet = manage.keySet();
		for(String key : keySet) {
			// key : 도시이름
			// V v = Map.get(key);
			Location location = manage.get(key);
			System.out.println(key+" "+location.getLongitude()+" "+location.getLatitude());
		}
		
		System.out.println("------------------------------------------------");
		
		// 도시 이름을 입력 받아
		// 일치하는 도시의 map entry를 찾아서 출력
		while(true) {
			System.out.println("도시 이름 (q는 종료) >> ");
			String city = sc.next();
			if(city.trim().equals("q")) {
				break; // while 종료
			}
			if(manage.containsKey(city)) {
				// map 에 사용자가 입력한 도시이름이 key 값으로 존재
				Location loc = manage.get(city);
				System.out.println(city+" "+loc);
			} else {
				System.out.println(city+"는 없습니다.");
			}
		}// end while
		
		System.out.println("시스템 종료");
	}

}
