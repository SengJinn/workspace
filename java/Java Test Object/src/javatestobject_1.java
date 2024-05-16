
public class javatestobject_1 {
	public static void main(String[] args) {
//		Student kim = new Student();
//		kim.school = "Computer Study";
//		kim.grade = 4;
//		kim.name = "홍길동";
//		
//		Student choi = new Student("부산아카데미", 1, "최기근");
//		System.out.println(choi.school);
//		System.out.println(choi.grade);
//		System.out.println(choi.name);
		
//		Car myCar = new Car();
//		myCar.color = "red";
//		myCar.speed = 0;
//		myCar.gear = 1;
//		System.out.println(myCar.showInfo());
//		// speedUp method 호출 시 speed field의 값 10 증가
//		myCar.speedUp();
//		myCar.gear = 2;
//		System.out.println(myCar.showInfo());
//		// speedDown 메소드 호출 시 speed field의 값 10감소
//		myCar.speedDown();
//		myCar.gear = 1;
//		System.out.println(myCar.showInfo());
		
//		String[] strs = new String[5];
//		System.out.println(strs[0].equals(strs[1]));
		
//		int score = 95;
//		char grade'
//   	grade = (score > 90) ? 'A' : 'B' ;
//   	System.out.println(grade);
		
//		double random = Math.random();
//
//		int[] what = new int[10];
//		int sum = 0;
//		
//		for(int i =0; i < what.length; i++) {
//			what[i] = (int)(Math.random() * 100) + 1;
//			System.out.print(what[i] + " " );
//			
//			sum = what[i] + sum;
//			}
//		
//		System.out.println("난수 총합계 : " + sum);
		
		double random = Math.random();

		int[] what = new int[10];
		
		System.out.print("최초의 리스트 : ");
		for(int i =0; i < what.length; i++) {
			what[i] = (int)(Math.random() * 100) + 1;
			System.out.print(what[i] + " " );
			}
		
		for(int i=0; i < what.length ; i++) {
			for(int j = i+1; j < what.length; j++) {
				if(what[i] > what[j]) {
					int temp = what[i];
					what [i] = what[j];
					what[j] = temp;
				}
			}
		}
		
		System.out.println();
		
		System.out.print("정렬된 리스트 : ");
		for(int i : what) {
			System.out.print(i+" ");
		}
		
		
		
	} // end main
}