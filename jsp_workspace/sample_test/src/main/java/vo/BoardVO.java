package vo;

import java.util.Date;

public class BoardVO {

	private int num;					
	private String title;				
	private String name;
	private String password;
	private String message;
	private Date writeDate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getBoard_date() {
		return writeDate;
	}
	public void setBoard_date(Date board_date) {
		this.writeDate = board_date;
	}
	
	public BoardVO(int num, String title, String name, String password, String message, Date board_date) {
		super();
		this.num = num;
		this.title = title;
		this.name = name;
		this.password = password;
		this.message = message;
		this.writeDate = board_date;
	}
	
	@Override
	public String toString() {
		return "boardVO [num=" + num + ", title=" + title + ", name=" + name + ", password=" + password + ", message="
				+ message + ", board_date=" + writeDate + "]";
	}
	

}
