package com.scmaster.milanmall.member.vo;

public class MallMember {
	private String member_id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phonenum;
	private String joindate;
	private String outdate;
	public MallMember() {
		super();
	}
	public MallMember(String member_id, String password, String name, String email, String address, String phonenum,
			String joindate, String outdate) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phonenum = phonenum;
		this.joindate = joindate;
		this.outdate = outdate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	@Override
	public String toString() {
		return "MallMember [member_id=" + member_id + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", address=" + address + ", phonenum=" + phonenum + ", joindate=" + joindate + ", outdate=" + outdate
				+ "]";
	}
	
	
	
}
