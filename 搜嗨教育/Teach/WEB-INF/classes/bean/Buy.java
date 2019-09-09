package bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Buy implements Serializable{
	private String bno;
	private String sno;
	private String cno;
	private Timestamp btime;
	
	public Timestamp getBtime() {
		return btime;
	}
	public void setBtime(Timestamp btime) {
		this.btime = btime;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	
}
