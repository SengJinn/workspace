package guide_answer.practice01;

import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class EmailManager {
    public static void main(String[] args) {
    	
        Set<String> emails = new HashSet<>();
        
        Scanner scanner = new Scanner(System.in);
        
        int choice = 0;

        outter : do {
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
                    
                    // add return true : 중복 없이 추가
                    // add return false : 중복되어 삽입되지 않음
                    boolean isChecked = emails.add(emailToAdd);
                    if(isChecked) {
                    	System.out.println("이메일이 이미 존재합니다.");
                    }else {
                    	emails.add(emailToAdd);
                        System.out.println("이메일이 추가되었습니다.");
                    }
                    
                    /*
                    boolean isChecked = emails.contains(emailToAdd);
                    if(isChecked) {
                    	System.out.println("이메일이 이미 존재합니다.");
                    }else {
                    	emails.add(emailToAdd);
                        System.out.println("이메일이 추가되었습니다.");
                    }
                    */
                    
                    /*
                    // emails set 저장된 이메일 정보인지 확인
                    for(String email : emails) {
                    	if(email.equals(emailToAdd)) {
                    		System.out.println("이미 존재하는 이메일입니다.");
                    		continue outter; // 이름이 outter인 반복문으로 continue
                    	}
                    }
                    // 중복되는 이메일이 아닐 경우에는 set에 사용자가 입력한 이메일 추가
                    emails.add(emailToAdd);
                    System.out.println("이메일이 추가되었습니다.");
                    */
                    
                    break;
                case 2:
                    System.out.print("삭제할 이메일을 입력하세요: ");
                    String emailToRemove = scanner.next();
                    
                    if(emails.remove(emailToRemove)) {
                    	System.out.println("이메일이 삭제되었습니다.");
                    }else {
                    	System.out.println("이메일을 찾을 수 없습니다.");
                    }
                    
                    break;
                case 3:
                    System.out.print("검색할 이메일을 입력하세요: ");
                    String emailToSearch = scanner.next();
                    
                    if(emails.contains(emailToSearch)) {
                    	System.out.println("이메일" + emailToSearch + "가 목록에 있습니다.");
                    }else {
                    	System.out.println("이메일" + emailToSearch + "가 목록에 없습니다.");
                    }
                    
                    break;
                case 4:
                    System.out.println("모든 이메일:");
                    for(String s : emails) {
                    	System.out.println(s);
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
