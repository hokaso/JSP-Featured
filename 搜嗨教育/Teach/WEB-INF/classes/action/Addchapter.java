package action;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

import DbUtils.Uploadcourse;

public class Addchapter extends ActionSupport{
	private String cno;
	private String fno;
	private String fname;
	private String fprice;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
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
	public String getFprice() {
		return fprice;
	}
	public void setFprice(String fprice) {
		this.fprice = fprice;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String addchapter() {
		String realpath="E:/Myvideos";
		File saveDir=new File(realpath);
		File saveFile=new File(saveDir,uploadFileName);
		try {
			FileUtils.copyFile(upload,saveFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp time2 = new Timestamp(System.currentTimeMillis());
		int num=Integer.parseInt(fprice);
		Uploadcourse uo=new Uploadcourse();
//		System.out.println(fno);
//		System.out.println(fname);
//		System.out.println(cno);
//		System.out.println(time2);
//		System.out.println(uploadFileName);
//		System.out.println(num);
//		return SUCCESS;
		boolean label=uo.addchapter(fno, fname, cno, time2, uploadFileName, num);
		if(label==true) {
			return SUCCESS;
		}
		else {
			return "ERROR";
		}
	}
}
