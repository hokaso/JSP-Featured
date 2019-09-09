package bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Look implements Serializable{
	private String lno;
	private String sno;
	private String fno;
	private Timestamp ltime;
	
	public String getLno() {
		return lno;
	}
	public void setLno(String lno) {
		this.lno = lno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public Timestamp getLtime() {
		return ltime;
	}
	public void setLtime(Timestamp ltime) {
		this.ltime = ltime;
	}
	
	
	
}
