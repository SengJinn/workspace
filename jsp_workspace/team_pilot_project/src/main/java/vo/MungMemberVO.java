package vo;

import java.util.Date;

public class MungMemberVO {

	private int num;
	private String id;
	private String pass;
	private String name;
	private String email;
	private Date joinDate;
	
	
	public MungMemberVO() {}
	
	public MungMemberVO(int num, String id, String pass, String name, String email, Date joinDate) {
		super();
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}


	public MungMemberVO( String id, String pass, String name, String email) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;

	}
	
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MungMemberVO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email
				+ ", joinDate=" + joinDate + "]";
	}
	

}

