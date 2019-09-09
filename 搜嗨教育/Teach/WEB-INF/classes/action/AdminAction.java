package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import bean.Teacher;
import work.AdminWork;
public class AdminAction extends ActionSupport{
	public String Admin(){
		AdminWork aw = new AdminWork();
		List<Teacher> teachers = aw.AdminTeacher();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		request.setAttribute("teachers", teachers);
		return SUCCESS;
	}
}
