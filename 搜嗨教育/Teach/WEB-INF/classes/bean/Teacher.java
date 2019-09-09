package bean;

import java.sql.Timestamp;

public class Teacher {
	private String tno;
	private String tname;
	private String tsex;
	private String tpassword;
	private String tphone;
	private Timestamp tregisterTime;
	private String temail;
	private int flag;
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public Timestamp getTregisterTime() {
		return tregisterTime;
	}
	public void setTregisterTime(Timestamp tregisterTime) {
		this.tregisterTime = tregisterTime;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public String getTpassword() {
		return tpassword;
	}
	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}
	public String getTphone() {
		return tphone;
	}
	public void setTphone(String tphone) {
		this.tphone = tphone;
	}
	
}
