package bean;

import java.sql.Timestamp;

public class Student {
	private String sno;
	private String sname;
	private String spassword;
	private String ssex;
	private String smail;
	private int scoin;
	private String strend;
	private Timestamp sregisterTime;
	
	public Timestamp getSregisterTime() {
		return sregisterTime;
	}
	public void setSregisterTime(Timestamp sregisterTime) {
		this.sregisterTime = sregisterTime;
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
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSmail() {
		return smail;
	}
	public void setSmail(String smail) {
		this.smail = smail;
	}
	public int getScoin() {
		return scoin;
	}
	public void setScoin(int scoin) {
		this.scoin = scoin;
	}
	public String getStrend() {
		return strend;
	}
	public void setStrend(String strend) {
		this.strend = strend;
	}
	
}
