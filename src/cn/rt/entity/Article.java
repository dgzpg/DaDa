package cn.rt.entity;


public class Article {
	
	
	public String ano;
	public String atitle;
	public String atype;
	public String atext;
	public String atime;
	public String sno;
	public Article() {}
	public Article(String ano, String atitle, String atype, String atext, String atime, String sno) {
		super();
		this.ano = ano;
		this.atitle = atitle;
		this.atype = atype;
		this.atext = atext;
		this.atime = atime;
		this.sno = sno;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public String getAtext() {
		return atext;
	}

	public void setAtext(String atext) {
		this.atext = atext;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	
	


}
