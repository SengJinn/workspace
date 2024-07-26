package vo;

import java.util.Date;

public class mungPlaceLoungeVO {

	private int num; 
	private String title ;
	private String guestName ;
	private String checkNumber ;
	private String message ;
	private Date writeDate ;

	public mungPlaceLoungeVO () {}
		
	public mungPlaceLoungeVO(int num, String title, String guestName, String checkNumber, String message,
			Date writeDate) {
		super();
		this.num = num;
		this.title = title;
		this.guestName = guestName;
		this.checkNumber = checkNumber;
		this.message = message;
		this.writeDate = writeDate;
	}

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

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(String checkNumber) {
		this.checkNumber = checkNumber;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "mungPlaceLoungeVO [num=" + num + ", title=" + title + ", guestName=" + guestName + ", checkNumber="
				+ checkNumber + ", message=" + message + ", writeDate=" + writeDate + "]";
	}
	
}
