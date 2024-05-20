package encapsulation_obj_array.book;

import java.util.Scanner;

public class BookManagement {
	
	// 문자열 입력
	private Scanner scanLine = new Scanner(System.in);
	// 선택번호 입력
	private Scanner scanSelectnum = new Scanner(System.in);
	
	// 도서목록을 저장할 배열
	private static Book[] books = new Book[100];
	// 프로그램 실행 flag
	private boolean isRun = true;
	// 메인 메뉴 선택 번호
	private int selectNo = 0;
	
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
			} // end switch
		} // end while
	} // end run method
	
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
		
		for(int i = 0; i < books.length; i++) {
			if(books[i] == null) {	
				books[i] = new Book(i+1, title, author);
				System.out.println("등록 완료");
				break; 
			}// end if
		} // end for 
	}// end resisterBook
	
	// 도서 목록 출력
	public void selectBook() {
		System.out.println("2. 도서목록");
		for(Book b : books) {
			if(b != null) {
				System.out.println(b);
			}
		}
	}

	// 도서 정보 수정
	public void updateBook() {
		System.out.println("3. 도서수정");
		int bookNum = getSelectNum("수정 하실 책의 관리번호를 입력해주세요.");
		
		Book updateBook = findBook(bookNum);
				
		if(updateBook == null) {
			System.out.println("잘못된 번호입니다.");
			return; 
		}
		
		System.out.println(updateBook.toString());
				
		boolean isUpdate = true;
				
		while(isUpdate) {
			System.out.println("==============================");
			System.out.println("1.제목수정 | 2.저자수정 | 3.수정완료");
			System.out.println("==============================");
					
					int no = getSelectNum("번호 입력 > ");
					
					switch(no) {
						case 1 :
							System.out.println("제목 수정");
							String title = getData("수정할 제목 입력 > ");
							updateBook.setTitle(title);
							break;
						case 2 : 
							System.out.println("저자 수정");
							String author = getData("수정할 저자 이름 입력 > ");
							updateBook.setAuthor(author);
							break;
						case 3 : 
							System.out.println("수정 완료");
							isUpdate = false;
							break;
						default : 
							System.out.println("등록된 메뉴가 아닙니다.");	
					}// end menu switch
					
				} // end update while
	}//end updatebook
	
	
	// 도서 목록에서 책 정보 삭제
	public void deleteBook() {
		System.out.println("4. 도서삭제");
		int bookNum = getSelectNum("삭제할 도서의 관리번호를 입력해주세요.");
		System.out.println("4. 도서삭제");
		
		for(int i = 0; i < books.length; i++) {
			if(books[i] != null && books[i].getNum() == bookNum) {
				books[i] = null;
				System.out.println("삭제완료");
				break;
			}
		} // end for : books 배열 순회
	}
	
	// 도서관리번호로 책 정보 찾기
	public Book findBook(int num) {
		for(int i = 0; i < books.length; i++) {
			if(books[i] != null && books[i].getNum() == num) {
				return books[i];
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
		
} // end BookManagement class




