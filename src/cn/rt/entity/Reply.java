package cn.rt.entity;

public class Reply {

	/**
	 * 
	 * 回复类
	 * 
	 */
	private String rno;
	private String rtext;
	private String rtime;
	private String sno;
	private String qno;
	
	public String getQno() {
		return qno;
	}

	public void setQno(String qno) {
		this.qno = qno;
	}

	public Reply() {}
	
	public Reply(String rno, String rtext, String rtime, String sno, String qno) {
		super();
		this.rno = rno;
		this.rtext = rtext;
		this.rtime = rtime;
		this.sno = sno;
		this.qno = qno;
	}

	public Reply(String rno, String rtext, String rtime, String sno) {
		super();
		this.rno = rno;
		this.rtext = rtext;
		this.rtime = rtime;
		this.sno = sno;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getRtext() {
		return rtext;
	}
	public void setRtext(String rtext) {
		this.rtext = rtext;
	}
}
