package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Student;
import bean.Teacher;
import work.LoginWork;

public class CheckTeacher extends ActionSupport{
	private String account;
	private String password;
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public void CheckTeacher() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
	    LoginWork lw = new LoginWork();
//		Student sd = lw.ExaLogin(account,password);
	    //检查是否为老师
	    int result = lw.ExaTeacher(account,password);
		if(result==0){
			response.getWriter().write("true");
			
		}else{
			response.getWriter().write("false");
		}
	}
	public void CheckTeacherSuccess() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
	    LoginWork lw = new LoginWork();
//		Student sd = lw.ExaLogin(account,password);
	    //检查是否为老师
	    int result = lw.ExaTeacherSuccess(account,password);
		if(result==0){
			response.getWriter().write("0");
			
		}else if(result==1){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("-1");
		}
	}
}
