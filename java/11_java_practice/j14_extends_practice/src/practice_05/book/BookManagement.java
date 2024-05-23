package practice_05.book;

import java.util.Scanner;

public class BookManagement {
	
	// 문자열 입력
	private Scanner scanLine = new Scanner(System.in);
	// 선택번호 입력
	private Scanner scanSelectnum = new Scanner(System.in);
	
	// 도서목록
	private static Book[] books = new Book[100];
	// 프로그램 실행 flag
	private boolean isRun = true;
	// 메인 메뉴 선택 번호
	private int selectNo = 0;
	// 도서관리 번호
	private int count = 1;	

	public BookManagement(){}
	
	public void run() {
		while(isRun) {
			System.out.println("================================================");
			System.out.println("1.도서등록 | 2. 도서목록 | 3.도서수정 | 4.도서삭제 | 5. 종료");
			System.out.println("================================================");
			selectNo = getSelectNum("번호를 선택하세요>");
			
			switch(selectNo) {
				case 1 :
					registerBook();
					break;
				case 2 :
					selectBook();
					break;
				case 3 :
					updateBook();
					break;
				case 4 : 
					deleteBook();
					break;
				case 5 : 
					terminate();
					break;	
				default : 
					System.out.println("등록된 메뉴가 아닙니다.");
			}
		}
	}
	
	// 프로그램 종료
	public void terminate() {
		this.isRun = false;
		System.out.println("프로그램 종료");
	}

	// 도서 등록
	public void  registerBook() {
		System.out.println("1. 도서등록");
		String title = getData("등록할 도서의 제목을 입력해 주세요 >");
		String author = getData("등록할 도서의 저자를 입력해 주세요 >");
		
		// 배열에 책을 저장할 객체 생성
		Book book = new Book();
		
		// private class에 접근할 수 없으므로 public인 setter를 통해 값을 받음
		book.setTitle(title);
		book.setAuthor(author);
		
		for(int i = 0; i < books.length; i++) {
			// books 배열이 비어있을 경우 값을 저장
			if(books[i] == null) {
				// num class가 private이므로 setNum을 통해 값을 받음
				book.setNum( i + 1 );
				books[i] = book;
				System.out.println("등록되었습니다.");
				break;
			}
		}// end for
	}// end registerBook
	
	// 도서 목록 출력
	public void selectBook() {
		System.out.println("2. 도서목록");
			// 배열이 비어있지 않을 때 안에 저장된 값을 출력
			for(Book b : books) {
				if(b != null) {
					System.out.println(b);
				} 
			}
	}//end selectBook

	// 도서 정보 수정
	public void updateBook() {
		System.out.println("3. 도서수정");
		int bookNum = getSelectNum("수정 하실 책의 관리번호를 입력해주세요.");
		// bookNum을 통해 받은 값을 findBook을 통해 비교 후 일치하면 해당 책 정보를 correctBook에 저장
		Book correctBook = findBook(bookNum);
		
		System.out.println(correctBook);
		
		boolean letscorrect = true;
		
		while(letscorrect) {
			System.out.println("================================");
			System.out.println("1.제목 수정 | 2.저자 수정 | 3.수정 완료");
			System.out.println("================================");
			int selectNo = getSelectNum("번호 입력 > ");
			
			switch(selectNo) {
				case 1 : 
					System.out.println("제목 수정");
					// 입력 받은 값을 title에 저장
					String title = getData("제목 입력 > ");
					// setTitle을 통해 앞에 받은 제목을 다시 correctBook에 저장
					correctBook.setTitle(title);
					System.out.println("제목을 수정하였습니다.");
					break;
				case 2 : 
					System.out.println("저자 수정");
					// 입력 받은 값을 author에 저장
					String author = getData("저자 입력 > ");
					// setAuthor을 통해 앞에 받은 저자 이름을 다시 correctBook에 저장
					correctBook.setAuthor(author);
					System.out.println("저자를 수정하였습니다.");
					break;
				case 3 : 
					System.out.println("수정을 완료하였습니다.");
					letscorrect = false;
					break;
			}
		} // end while
	}// end updateBook
	
	// 도서 목록에서 책 정보 삭제
	public void deleteBook() {
		System.out.println("4. 도서삭제");
		int bookNum = getSelectNum("삭제할 도서의 관리번호를 입력해주세요.");
		// bookNum을 통해 받은 값을 findBook을 통해 비교 후 일치하면 해당 책 정보를 deleteBook에 저장
		Book delBook = findBook(bookNum);
		System.out.println(delBook);
		
		// 등록된 책이 없을 경우
		if(delBook == null) {
			System.out.println("찾으시는 책이 존재하지 않습니다.");
			return;
		}
		//    0      1      2    3
		// [0X001][0X001][null][null]
		for(int i=0 ; i<books.length; i++) {
			// Book b = null;
			// Book b = 0X002;
			// 등록된 책이 존재하며 해당책이 deleteBook과 같을 경우
			if(books[i] != null && books[i] == delBook) {
				books[i] = null;
				System.out.println("해당 도서를 삭제하였습니다.");
				break;
			}
		}

	}
	
	// 도서관리번호로 책 정보 찾기
	public Book findBook(int num) {
		for(Book b : books) {
			// 배열이 비어있지 않을 때 getNum을 통해 배열 속 정보를 받아 입력한 정보와 비교
			if(b != null && b.getNum() == num) {
				return b;
			}
		}
		return null;
	}
	
	// 사용자에게 메시지를 전달 받아 출력하고 문자열 값 받아 반환
	String getData(String message) {
		System.out.println(message);
		return scanLine.nextLine();
	}
	
	// 번호 선택 받기
	int getSelectNum(String message) {
		System.out.println(message);
		if(!scanSelectnum.hasNextInt()) {
			System.out.println("숫자를 입력해주세요.");
			scanSelectnum.next();
			return 0;
		}
		return scanSelectnum.nextInt();
	}
		
}




