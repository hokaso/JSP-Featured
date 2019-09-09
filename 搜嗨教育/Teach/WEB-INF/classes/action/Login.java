package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Manager;
import bean.Student;
import work.LoginWork;

public class Login extends ActionSupport{
	//’À∫≈∫Õ√‹¬Î
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

	//”√ªßµ«¬º
	public void UserLogin() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
	    LoginWork lw = new LoginWork();
	    Manager m = lw.ExaAdmin(account,password);
	    if(m!=null){
	    	session.setAttribute("manager", m);
	    	response.getWriter().write("manager");
	    }else{
	    	Student sd = lw.ExaLogin(account,password);
			session.setAttribute("student", sd);
			if(sd!=null){
				response.getWriter().write("µ«¬º≥…π¶");
				
			}else{
				response.getWriter().write("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			}

	    }
		
	}
}
