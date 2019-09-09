package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import work.AdminWork;

public class TeacherSuccess extends ActionSupport{
	private String tno;

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}
	public void TeacherSuccess() throws IOException{
		System.out.println(tno);
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
		AdminWork aw = new AdminWork();
		boolean result = aw.UpdateFlag(tno);
		if(result){
			response.getWriter().write("true");
		}else{
			response.getWriter().write("false");
		}
	}
}
