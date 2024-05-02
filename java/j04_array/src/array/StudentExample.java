package array;

import java.util.Scanner;

public class StudentExample {
	public static void main(String[] args) {
		System.out.println("Main START");
		
		Scanner sc = new Scanner(System.in);
		
		//프로그램 종료 flag
		boolean isRun = true;
		
		//학생들의 점수를 저장할 배열(공간)
		int[] scores = null;
		
		while(isRun) {
			System.out.println("====================================");
			System.out.println("1.학생수|2.점수입력|3.전체점수|4.분석|5.종료");
			System.out.println("====================================");
			System.out.println("선택하실 기능의 번호를 입력하세요 > ");
			int selectNO = sc.nextInt();
			System.out.println("선택하신 번호는" + selectNO + "번입니다.");
			/*
 				1.학생수
 				  점수를 입력할 학생수를 입력받음.
 				  입력받은 학생수(정수값)만큼 배열을 생성하여 scores에 저장
 				  
 				2.1번에서 생성된 학생 수 만큼(배열의 크기 만큼) 학생의 점수를 입력받아
 				  scores 배열의 각 항목에 저장 (0 ~ scores.length -1)
 				  
 				3.scores 배열에 저장된 각 학생의 점수(배열 항목)를 출력
 				
 				4.분석 - scores 배열에 저장된 학생의 점수를 계산하여 전체 총점,
 						평균 점수, 최고 점수, 최저 점수를 출력
 				5.while문을 종료하여 프로그램 종료
 		    */
			
			if(selectNO != 1 && selectNO != 5 && scores == null){
					System.out.println("학생 수를 먼저 입력해주세요.");
					continue;
					// 혹은 selectNO = 1; 입력을 통해 1번으로 강제 이동
			}
 				
		
			if(selectNO == 1) {
				System.out.println("학생 수를 입력하세요 > ");
				int student = sc.nextInt();
				scores = new int [ student ];
				System.out.println("학생 수는"+ scores.length + "명 입니다.");
			} // if 1 end
			
			
			if(selectNO == 2) {
				System.out.println("점수를 입력하세요 > ");
					for(int i = 0; i < scores.length ; i++) {
						System.out.println((i+1)+"번째 학생 점수 입력 >");
						int testscore = sc.nextInt();
						scores[i] = testscore;
					}
				System.out.println("점수 입력 완료!");
			}// if 2 end
			
			
			if(selectNO == 3) {
				System.out.println("학생들의 점수 출력");
				for(int i=0; i<scores.length; i++) {
					System.out.print(scores[i]+" ");
				}
				System.out.println();
			}// if 3 end
			
			
			if(selectNO == 4) {
				System.out.println("점수 분석");
				int total = 0; //총점
				double avg = 0; //평균
				int max = 0, min = 0; // 최고, 최저 점수
				max = min = scores[0];
				
				for(int i : scores) {
					// scores 배열에 저장된 모든 항목의 값을 total
					// 변수에 누적해서 저장
					total += i;
					if(i > max) {
						max = i;
					}
					if(i < min) {
						min = i;
					}
				}
				
				avg = (double)total / scores.length;
				
				System.out.println("총점 :" + total);
				System.out.println("평균 :" + avg);
				System.out.println("최고 :" + max);
				System.out.println("최저 :" + min);
			}
			
			
			if(selectNO == 5) { isRun=false; 
				System.out.println("프로그램 종료");
			break;}
		}//end while
		
		System.out.println("Main END");
	} //end main
}//end class
