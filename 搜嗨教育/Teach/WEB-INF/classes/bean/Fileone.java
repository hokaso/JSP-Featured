package bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Fileone implements Serializable{
	private String fno;
	private String fname;
	private String cno;
	private Timestamp ftime;
	private String fupload;
	private int fcounts;
	private int fprice;
	
	public Timestamp getFtime() {
		return ftime;
	}
	public void setFtime(Timestamp ftime) {
		this.ftime = ftime;
	}
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	
	public String getFupload() {
		return fupload;
	}
	public void setFupload(String fupload) {
		this.fupload = fupload;
	}
	public int getFcounts() {
		return fcounts;
	}
	public void setFcounts(int fcounts) {
		this.fcounts = fcounts;
	}
	public int getFprice() {
		return fprice;
	}
	public void setFprice(int fprice) {
		this.fprice = fprice;
	}
	
}
