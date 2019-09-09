package bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable{
	private String cono;
	private String cno;
	private String sno;
	private String com;
	private Timestamp time;
	public String getCono() {
		return cono;
	}
	public void setCono(String cono) {
		this.cono = cono;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
