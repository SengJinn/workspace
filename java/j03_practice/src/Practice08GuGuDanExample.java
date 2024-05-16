
public class Practice08GuGuDanExample {

	public static void main(String[] args) {
		/*
		 * 9 ~ 2 단까지의 구구단 출력
		 */
		// 9단 출력
		System.out.print("9 * 9 = 81\t");
		System.out.print("9 * 8 = 72\t");
		System.out.print("9 * 7 = 63\t");
		System.out.println("\n==========================");
		for(int i = 9; i > 1; i--) {
			System.out.print("9 * "+i+" = "+(9 * i)+"\t");
		}
		System.out.println();
		for(int i = 9; i > 1; i--) {
			System.out.print("8 * "+i+" = "+(8 * i)+"\t");
		}
		System.out.println("\n=============================");
		for(int j = 9; j >= 2; j--) {
			for(int i = 9; i > 1; i--) {
				System.out.print(j+" * "+i+" = "+(j * i)+"\t");
			}
			System.out.println();
		}
	}

}










