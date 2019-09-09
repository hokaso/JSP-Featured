package action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Course;
import DbUtils.Uploadcourse;

public class Addcourse extends ActionSupport{
	private String tno;
	private String cno;
	private String ctype;
	private String cname;
	private String cdescribe;
	
	private File filename;
	
	private String filenameFileName;
	private String filenameContentType;
	
	
	
	public String getFilenameFileName() {
		return filenameFileName;
	}
	public void setFilenameFileName(String filenameFileName) {
		this.filenameFileName = filenameFileName;
	}
	public String getFilenameContentType() {
		return filenameContentType;
	}
	public void setFilenameContentType(String filenameContentType) {
		this.filenameContentType = filenameContentType;
	}
	public File getFilename() {
		return filename;
	}
	public void setFilename(File filename) {
		this.filename = filename;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdescribe() {
		return cdescribe;
	}
	public void setCdescribe(String cdescribe) {
		this.cdescribe = cdescribe;
	}
	
	public String addcourse() {
		
		String realpath="E:/img";
		File saveDir=new File(realpath);
		
		File saveFile=new File(saveDir,filenameFileName);
		System.out.println(saveFile);
		
		try {
			FileUtils.copyFile(filename,saveFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Timestamp time1 = new Timestamp(System.currentTimeMillis());
		Uploadcourse up=new Uploadcourse();
		boolean flag=up.addcourse(cno, cname, tno, ctype, cdescribe, filenameFileName, time1);
		
		if(flag==true) {
			HttpServletRequest request=ServletActionContext.getRequest();
		    HttpSession session=request.getSession();
		    Uploadcourse pu=new Uploadcourse();
		    List<Course> list2=pu.search(tno);
		    session.setAttribute("allcourse", list2);
//		    session.setAttribute("courseno", cno);
			return SUCCESS;
		}
		else {
			return "ERROR";
		}
	}
}
