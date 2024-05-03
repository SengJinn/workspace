package javaTest;

import java.util.Scanner;

public class TheaterReserveRowColumn {
	public static void main(String[] args) {
		//해당 자리에 저장된 값이 0이면 빈자리
		//예약 완료된 자리는 1로 표현
		byte[][] seats = new byte[10][10];
		Scanner sc = new Scanner(System.in);
		
//		seats[1][2] = 1;
//		for(byte[] line : seats) {
//			for(byte column : line) {
//			if(column == 0)
//			{System.out.printf("[□]");}
//			else
//			{System.out.printf("[■]");}
//				//System.out.printf("[%d]", column);
//			} //한라인 출력
//			System.out.println();
//			//출력후 줄바꿈
//		}//end for
		
		//극장 예약 프로그램 종료 flag
		boolean isRun = true;
		
		while(isRun) {
			System.out.println("           [SCREEN]");
			//열 번호를 출력
			for(int i = 1; i <= seats.length; i++) {
				System.out.print("["+ i + "]");
			}
			System.out.println(" [열]"); // 좌석번호 출력 후 줄바꿈
			//좌석 표시
			for(int i = 0; i < seats.length; i++) {
				for(int j = 0; j < seats[i].length; j++) {
				if(seats[i][j] == 0)
				{System.out.printf("[□]");}
			    else
			    {System.out.printf("[■]");}
				} //end 한행의 열정보 출력
				System.out.println(" ["+(char)(i+65)+"]행");
			} // 10개의 행 정보 출력, 상영관 그리기 완료, 좌석표시 끝
			
			System.out.println();
			System.out.println("예약할 좌석의 행이름을 입력해주세요");
			String s = sc.next(); //A~J
			System.out.println(s);
			//"ABCDEF" , charAt(0) == 'A'
			// A == 65
			// J == 74
			char inputRow = s.charAt(0);
			System.out.println(inputRow);
			if(inputRow<65 || inputRow>74) {
				System.out.println("선택할 수 없는 행입니다.");
				continue;
			}
			
			//65~74일 경우 수행
			System.out.println("선택하신 행 이름은 : " + inputRow);
			
			//좌석 열 번호 입력받기 1~10
			System.out.println("예약하실 좌석의 열번호를 입력해 주세요.(1~10)");
			boolean isNumber = sc.hasNextInt();
			if(!isNumber) {
				System.out.println("예약 가능한 열 번호를 입력하세요.");
				continue;
			}
			
			int inputColumn = sc.nextInt();
			
			if(inputColumn<1 || inputColumn > 10) {
				System.out.println("사용할 수 없는 열번호입니다.");
				continue;
			}
			
			//정상적인 행과 열 정보 입력시 출력
			System.out.printf("선택하신 좌석은 %s행 %d열입니다. %n",inputRow, inputColumn);
			
			//중복 예약인지 확인
			//inputRow == A == 65 == 0
			// inputRow == J == 74 == 9
			int row = inputRow - 65;
			// 1~10 : 0~9 인덱스로 변환
			int column = inputColumn - 1;
			
			if(seats[row][column] != 0){
				//이미 예약된 자리
				System.out.println("이미 예약이 완료된 좌석입니다.");
				continue;
			}
			
			//예약 진행
			System.out.println("예약을 완료 하시겠습니까? y/n");
			String selected = sc.next();
			
			switch(selected) {
				case"y": case"Y": case "ㅛ":
					seats[row][column] = 1;
					System.out.println("예약이 완료되었습니다.");
				case"n": case"N": case "ㅜ":
					System.out.println("예약이 취소되었습니다.");
					break;
				default :
					System.out.println("프로그램을 종료합니다.");
					isRun = false;
			}
			
		}//end while
		
	}//end main
}//end class
