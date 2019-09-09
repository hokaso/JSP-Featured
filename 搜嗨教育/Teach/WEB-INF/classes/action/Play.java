package action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Comment;
import bean.Course;
import bean.Fileone;
import work.GetPlayWork;

public class Play extends ActionSupport{
	private String cno;
	private String sno;
	private String commentTxt;
	
	public String getCommentTxt() {
		return commentTxt;
	}

	public void setCommentTxt(String commentTxt) {
		this.commentTxt = commentTxt;
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
	public String UserPlay(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session =request.getSession();
		GetPlayWork get = new GetPlayWork();
		Course course = get.getPlay(cno);
		String teacherName=get.getTeacherName(course.getTno());
		List<Fileone> fileones = get.getPlayList(cno);
		//查到的数据转到前台
		List<Comment> comments = get.Comment(cno);
		session.setAttribute("course", course);
		request.setAttribute("fileones", fileones);
		session.setAttribute("teacherName", teacherName);
		request.setAttribute("comments", comments);
		return SUCCESS;
	}
	public void PlayComment() throws IOException{
		System.out.println(cno+" "+sno);
		HttpServletResponse response = ServletActionContext.getResponse();
		GetPlayWork get = new GetPlayWork();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		boolean result = get.PlayComment(sno,cno,commentTxt,d);
		if(result){
			response.getWriter().write(result+"");
		}
	}
}
