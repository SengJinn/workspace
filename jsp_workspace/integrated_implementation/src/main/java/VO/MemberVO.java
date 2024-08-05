package VO;

public class MemberVO {
	
	private int num;
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String phone;

	
	public MemberVO(int num, String id, String pass, String name, String addr, String phone) {
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	
	public MemberVO(String id, String pass, String name, String addr, String phone) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	
	public MemberVO(String id, String pass, String name) {
		this.id = id;
		this.pass = pass;
		this.name = name;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
