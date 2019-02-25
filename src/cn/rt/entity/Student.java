package cn.rt.entity;

public class Student {
	/**
	 * 
	 * 学生类
	 * 
	 */
	public String sno;  
	public String sname;
	public String spassword;
	public String sinfo;
	
	
	
	public String getSinfo() {
		return sinfo;
	}
	public void setSinfo(String sinfo) {
		this.sinfo = sinfo;
	}
	public Student(String sno, String spassword) {
		super();
		this.sno = sno;
		this.spassword = spassword;
	}
	public Student(String sno, String sname, String spassword, String sinfo) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.spassword = spassword;
		this.sinfo = sinfo;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public Student() {
		// TODO Auto-generated constructor stub
	}

}
