package cn.rt.entity;


public class Question {

	/**
	 * 
	 * 问题�?
	 * 
	 */
	public String qno;
	public String qtitle;
	public String qtype;
	public String qtext;
	public String qtime;
	public String sno;
	public Question() {}
	public Question(String qno, String qtitle, String qtype, String qtext, String qtime, String sno) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qtype = qtype;
		this.qtext = qtext;
		this.qtime = qtime;
		this.sno = sno;
	}
	public String getQno() {
		return qno;
	}
	public void setQno(String qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public String getQtext() {
		return qtext;
	}
	public void setQtext(String qtext) {
		this.qtext = qtext;
	}
	public String getQtime() {
		return qtime;
	}
	public void setQtime(String qtime) {
		this.qtime = qtime;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	
	

}
