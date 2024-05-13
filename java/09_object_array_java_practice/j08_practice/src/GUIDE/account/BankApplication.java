package GUIDE.account;

import java.util.Scanner;

public class BankApplication {

	Account[] account = new Account[100];

	Scanner sc = new Scanner(System.in);
	Scanner scline = new Scanner(System.in);
	
	int count = 0;
	
	BankApplication() {
		// run();
	}

	void run() {
		// 1. 계좌생성
		// 2. 계좌조회
		// 3. 예금
		// 4. 출금
		// 5. 종료
		boolean isRun = true;


		while (isRun) {
			System.out.println("========================================");
			System.out.println("1.계좌생성 2.계좌조회 3.예금 4.출금 5.종료");
			System.out.println("========================================");

			int selectNo = sc.nextInt();

			if (selectNo == 1) {
				// 계좌생성
				createAccount();

			} else if (selectNo == 2) {
				// 계좌조회
				selectAccount();

			} else if (selectNo == 3) {
				// 예금
				deposit();
				
			} else if (selectNo == 4) {
				// 출금
				withdraw();
			} else if (selectNo == 5) {
				// 종료
				isRun = false;
				sc.close();
			}
		}
		System.out.println("프로그램 종료");
	}

	// 계좌생성
	void createAccount() {
		System.out.println("생성할 계좌의 번호를 입력해주세요. >");
		String ano = scline.next();

		System.out.println("계좌 주인의 이름을 입력해주세요. >");
		String owner = scline.next();

		System.out.println("생성할 계좌의 비밀번호를 입력해주세요. >");
		String password = scline.next();

		int balance = 0;

		Account acc = new Account();
		acc.ano = ano;
		acc.owner = owner;
		acc.password = password;
		acc.balance = balance;

		System.out.println("계좌 생성이 완료되었습니다." + acc.toString());

		account[count] = acc;
		count = count + 1;
	}

	// 계좌조회
	void selectAccount() {
		System.out.println("조회할 계좌번호를 입력해주세요. >");
		String inputAccount = scline.next();
		System.out.println("조회할 계좌의 비밀 번호를 입력해주세요. >");
		String inputPassword = scline.next();

		for (int i = 0; i < account.length; i++) {
			if (account[i] != null && inputAccount.equals(account[i].ano) && inputPassword.equals(account[i].password)) {
				System.out.println("비밀번호가 확인되었습니다.");
				System.out.println(account[i].toString());
			} if (account[i] != null && !(inputAccount.equals(account[i].ano))) {
				System.out.println("계좌번호가 일치하지 않습니다.");
			} if (account[i] != null && !(inputPassword.equals(account[i].password))) {
				System.out.println("비밀번호가 일치하지 않습니다.");
			}
		} // for문 끝
	}

	// 예금
	void deposit() {
		System.out.println("예금할 계좌번호를 입력해주세요. >");
		String inputAccount = scline.next();
		System.out.println("예금할 계좌의 비밀 번호를 입력해주세요. >");
		String inputPassword = scline.next();
		
		Account resistAccount = findAccount(inputAccount,inputPassword);
		if(resistAccount == null) {System.out.println("계좌 정보가 존재하지 않습니다.");}
		else {
		System.out.println("예금할 금액을 입력해주세요.");
		int inputBalance = sc.nextInt();
		
		resistAccount.balance = resistAccount.balance + inputBalance;
		System.out.println(inputBalance + "원이 입금되었으며, 총 잔액은 " + resistAccount.balance + "원입니다.");
				
		}
	}

	// 출금
	void withdraw() {

		System.out.println("출금할 계좌번호를 입력해주세요.");
		String outputMoneyAccount = scline.next();
		System.out.println("출금할 계좌의 비밀 번호를 입력해주세요. >");
		String outputPassword = scline.next();
		
		Account resistAccount = findAccount(outputMoneyAccount,outputPassword);
		if(resistAccount == null) {System.out.println("계좌 정보가 존재하지 않습니다.");}
		else {
			System.out.println("출금할 금액을 입력해주세요.");
			int outputBalance = sc.nextInt();
			if(resistAccount.balance < outputBalance ) {
		    System.out.println("잔액이 부족합니다."); return;
			}
			if(resistAccount.balance >= outputBalance ) {
				resistAccount.balance = resistAccount.balance - outputBalance;
				System.out.println(outputBalance + "원이 출금되었으며, 총 잔액은" + resistAccount.balance + "원입니다.");
				}
			} 	
		}//for문 종료


	// 계좌번호와 비밀번호가 일치하는 Account 객체를 찾아서 반환
	Account findAccount(String ano, String password) {
		for(int i = 0 ; i < account.length ; i++) {
			if(account[i] != null && account[i].ano.equals(ano) && account[i].password.equals(password)) {
				return account[i];
			}
		}
		return null;
	}

	public static void main(String[] args) {
		BankApplication ba = new BankApplication();
		ba.run();
	}
}
