package guide.practice01;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class EmailManager {
    public static void main(String[] args) {
    	
        Set<String> emails = new HashSet<>();
        
        Scanner scanner = new Scanner(System.in);
        
        int choice = 0;

        do {
            System.out.println("1. 이메일 추가");
            System.out.println("2. 이메일 삭제");
            System.out.println("3. 특정 이메일 검색");
            System.out.println("4. 모든 이메일 출력");
            System.out.println("5. 종료");
            System.out.print("메뉴를 선택하세요: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("추가할 이메일을 입력하세요: ");
                    String emailToAdd = scanner.next();
                    emails.add(emailToAdd);
                    System.out.println(emailToAdd + "가 추가되었습니다.");    
                    break;
                    
                case 2:
                    System.out.print("삭제할 이메일을 입력하세요: ");
                    String emailToRemove = scanner.next();
                    
                    Iterator<String> iterator = emails.iterator();
            		
            		String s = iterator.next();
            		
            		if(s.equals(emailToRemove)) {
                	emails.remove(emailToRemove);
                	System.out.println(emailToRemove + "가 삭제되었습니다.");
            		} else {
            			System.out.println("찾으시는 이메일이 존재하지 않습니다.");
            		}
                    break;
                    
                case 3:
                    System.out.print("검색할 이메일을 입력하세요: ");
                    String emailToSearch = scanner.next();
            		
            		Iterator<String> iterator1 = emails.iterator();
            		
            		String s1 = iterator1.next();
            		
            		if(s1.equals(emailToSearch)) {
            			System.out.println(s1 + "는(은) 등록된 이메일입니다.");
            		} else {
            			System.out.println(s1 + "는(은) 등록된 이메일이 아닙니다.");
            		}
            		
                    break;
                    
                case 4:
                    System.out.println("모든 이메일:");
                    
                    Iterator<String> iterator2 = emails.iterator();
            		
            		while(iterator2.hasNext()) {
            			String s2 = iterator2.next();
            			System.out.println(s2 + " ");
            		} // end while
            		
            		boolean isEmpty = emails.isEmpty();
            		
            		if(isEmpty = true) {
            			System.out.println("등록된 이메일이 없습니다.");
            		} else {
            			System.out.println("이상이 등록된 이메일입니다.");
            		}
                    break;
                    
                case 5:
                    System.out.println("프로그램을 종료합니다.");
                    break;
                default:
                    System.out.println("잘못된 선택입니다. 다시 시도하세요.");
            }
        } while (choice != 5);

        scanner.close();
    }
}
