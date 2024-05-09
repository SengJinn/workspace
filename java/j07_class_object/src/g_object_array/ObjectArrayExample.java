package g_object_array;


/*객체 타입의 배열*/
public class ObjectArrayExample {
	public static void main(String[] args) {
		
		//배열 선언
		Korean[] koreans = new Korean[3];
		// 	  0	    1	  2 
		// [null][null][null]
		System.out.println(koreans);
		for(int i = 0; i < koreans.length; i++) {
			System.out.println(i + ":" + koreans[i]);
		}
		
		Korean k1 = new Korean();
		k1.name = "최기근";
		k1.birth = "20020607";
		k1.age = 23;
		// koreans 배열의 0번째 인덱스 항목에
		// k1 객체의 주소값 저장
		koreans[0] = k1;
		//   0     1     2
		// [k1] [null] [null]
		
		koreans[1] = new Korean();
		koreans[1].name = "최수빈";
		koreans[1].birth = "16820721";
		koreans[1].age = 360;
		
		for(Korean k : koreans) {
			System.out.println(k);
			if(k!= null) {
				System.out.println(k.nation);
				System.out.println(k.name);
				System.out.println(k.birth);
				System.out.println(k.age);
			}
		}
		
		
		
	} // end main
} // end class
