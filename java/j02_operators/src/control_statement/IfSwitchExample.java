package control_statement;

public class IfSwitchExample {
	
	public static void main(String[] args) {
		// 조건문
		// if, switch
		int num1 = 10;
		int num2 = 20;
		
		if(num1 > num2) System.out.println("num1이 num2보다 큽니다.");
		
		if(num1 == num2) {
			System.out.println("num1이 num2가 일치합니다.");
		}
		
		int score = 75;
		
		if(score >= 90){
			System.out.println("A");	
			if(score >= 97) {
				System.out.println("A+");
			} else if (score >= 94) {
				System.out.println("A0");
			} else {
				System.out.println("A-");
			}
		}else if(score>=80){
			System.out.println("B");
		}else if(score>=70){
			System.out.println("C");
		}else if(score>=60){
			System.out.println("D");
		}else {
			System.out.println("F");
		}
		
		System.out.println(score);
		switch(score / 10) {
		case 10 : case 9: // 100, 99~90
			System.out.println("A 학점입니다.");
			if(score >= 97) {
				System.out.println("A+입니다.");
			}else if(score>=94) {
				System.out.println("A0입니다.");
			}else {
				System.out.println("A-입니다.");
			}
			break;
		case 8: //89~80
			System.out.println("B 학점입니다.");
			break;
		case 7: //79~70
			System.out.println("C 학점입니다.");
			break;
		case 6: //69~60
			System.out.println("D 학점입니다.");	
			break;
		default: 
			System.out.println("F 학점입니다.");	
		} //switch end
		
		System.out.println("main 종료");
	} //end main method
	
}//end class
