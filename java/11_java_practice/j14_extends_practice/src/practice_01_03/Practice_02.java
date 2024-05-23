package practice_01_03;


public class Practice_02 {

	public static void main(String[] args) {

		int[] lotto = new int[6];
		
		// int number = (int) (Math.random() * 45 + 1); // 참고
		// 작성

		
		for (int i =0; i < lotto.length; i++) {
			// 배열 lotto에 6개의 난수를 저장
			lotto[i] = (int) (Math.random() * 45 + 1);
		
			for(int j=0; j < i; j++) {
				// 앞에 뽑은 수가 뒤에 뽑은 수와 같을 때 i번째 배열을 다시 추첨(중복 방지)
				if(lotto[i] == lotto[j]) {
					i--;
					break;
					}// if end
				}// for end
			}
			// 앞에 뽑은 수가 뒤에 뽑은 수보다 클 때 두 숫자의 순서를 바꿈
			for(int i=0; i < lotto.length ; i++) {		
				for(int j = i+1; j < lotto.length; j++) {
					if(lotto[i] > lotto[j]) {
						int temp = lotto[i];
						lotto [i] = lotto[j];
						lotto[j] = temp;
				}// if end
			}//for end
		}//for end	
				
		// 결과 출력 코드 수정 x
		System.out.println("[ 결과 ]");			
			for (int i : lotto) {
				System.out.print("[" +i+ "]");
			} // 출력		
				

	}//end main
}//end class
