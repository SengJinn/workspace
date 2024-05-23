package practice_01_03;


public class Practice_03 {

	public static void main(String[] args) {
		// code 작성
		
		int[] list = new int [10];
		
		System.out.print("최초의 리스트 : ");
		
		for(int i=0; i < list.length; i++) {		
			// 0보다 크고 1보다 작은 소수에 100을 곱하고 정수로 전환 -> 0부터 99까지의 숫자가 됨 -> 1을 더해서 1부터 100까지의 정수 출력
			// 출력한 난수를 배열 list에 저장
			list[i] = (int) (Math.random()*100 +1);
			System.out.print(list[i] + " ");
		} //end for
		
		// 앞에 뽑은 수가 뒤에 뽑은 수보다 작을 때 두 숫자의 순서를 바꿈
		for(int i=0; i<list.length; i++) {
			for(int j = i+1; j<list.length; j++) {
				if(list[i] < list[j]) {
					int temp = list[i];
					list[i] = list[j];
					list[j] = temp;
				}
			}
		}
		
		System.out.println();
		
		System.out.print("정렬된 리스트 : ");
		for(int i : list) {
			System.out.print(i + " ");
		}

		
	}// end main
}//end class
