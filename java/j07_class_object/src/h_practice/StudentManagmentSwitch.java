package h_practice;

import java.util.Scanner;

public class StudentManagmentSwitch {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in); // import 추가
		
		// 학생 정보를 저장할 배열
		Student[] students = null;
		
		while(true) {
			System.out.println("=====================================");
			System.out.println("1.학생수|2.정보입력|3.정보확인|4.분석|5.종료");
			System.out.println("=====================================");
			System.out.println("메뉴 번호를 입력해 주세요(1~5)");
			
			// console에서 정수값을 입력받아 selectNo변수에 저장
			int selectNo = sc.nextInt();
			
			/*
			 	1. 학생수를 입력받아 Student 객체가 저장될 students 배열 생성
			    	- 입력받은 학생 수만큼의 크기를 가짐.
			    2. 생성된 students 배열의 항목 수만큼(배열의 크기만큼)
			       학생의 정보를 입력받아 Student 객체를 생성하여 저장하고
			       배열항목에 저장
			       - int(number), String(name), int(score)
			       sc.next();		// console을 통해서 문자열 입력받음
		        3. students 배열에 저장된 학생들의 정보를 출력(field 정보 출력)
		        4. 1. students 배열에 저장된 학생들의 점수를 전체합계, 평균을 구해서 출력
		           2. students 배열에 저장된 학생들의 점수를 연산하여
		              최고득점자 이름, 최저득점자의 이름을 출력
		        5. 프로그램 종료
			 */
			
			// selectNo 부여된 번호에 따라 기능 분류
			switch(selectNo) {
				case 1 :
					System.out.println("1.학생 수 입력");
					int count = sc.nextInt();
					students = new Student[count];
					System.out.println("등록할 학생 수는 : " + count);
					break;
				case 2 : 
					System.out.println("2.학생 정보 입력");
					for(int i = 0; i < students.length; i++) {
						int num = i + 1;
						System.out.println(num+"번째 학생의 이름 입력 > ");
						String name = sc.next();
						System.out.println(num+"번째 학생의 점수 입력 > ");
						int score = sc.nextInt();
						students[i] = new Student(num, name, score);
					}
					break;
				case 3 : 
					System.out.println("3.학생 정보 확인");
					for(int i = 0; i < students.length; i++) {
						String info = students[i].getInfo();
						System.out.println(info);
					}
					break;
				case 4 : 
					System.out.println("4.학생 정보 분석");
					int total = 0;				// 총점
					double avg = 0;				// 평균
					Student stuMax;				// 최고 득점자 학생 정보
					Student stuMin;				// 최저 득점자 학생 정보
					stuMax = students[0]; 
					stuMin = students[0];
					
					for(Student s : students) {
						int score = s.score;
						total += score;
						if(stuMax.score < score) stuMax = s;
						if(stuMin.score > score) stuMin = s;
					} // end for
					
					System.out.println("전체합계 : " + total);
					avg = total / (double)students.length;
					System.out.printf("평균점수 : %.1f %n", avg);
					System.out.println("최고득점자 정보 : " + stuMax.getInfo());
					System.out.println("최저득점자 정보 : " + stuMin.getInfo());
					break;
				case 5 : 
					System.out.println("프로그램 종료");
					// break;
					return; // main method 즉시 종료
				default : 
					System.out.println("메뉴에 없는 번호입니다.");
					
			}
			
			
		} // end while
		
	}// end main

} // end StudentManagement class