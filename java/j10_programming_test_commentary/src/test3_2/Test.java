package test3_2;

public class Test {

	public static void main(String[] args) {
		// method가 호출된 시점에 컴퓨터 시간 정보를 이용해서
		// random한 실수를 0 ~ 1 미만 
		// 0.0 ~ 0.999999999999
		double result = Math.random();
		// 1~100까지의 랜덤한 정수
		// 0.0 ~ 99.9999999
		// 0 ~ 99
		int randomNumber = (int)(result * 100);
		
		int sum = 0;
		
		// 10회 반복하는 반복문
		// i값이 0에서부터 10보다 작을 때까지 1씩 증가하면서 반복
		for(int i = 0; i<10; i++) {
			int num = (int)(Math.random()*100) + 1;
			System.out.print(num + " ");
			sum = sum+num;
		}
		System.out.println("난수 총합계 : " + sum);
		
	}
}


