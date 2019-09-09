package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Course;
import DbUtils.Uploadcourse;

public class Authorshow extends ActionSupport{
	private String teacherno;
	
	public String getTeacherno() {
		return teacherno;
	}

	public void setTeacherno(String teacherno) {
		this.teacherno = teacherno;
	}

	public String flag3() {
		System.out.println(teacherno);
		HttpServletRequest request=ServletActionContext.getRequest();
	    HttpSession session=request.getSession();
	    Uploadcourse up=new Uploadcourse();
	    List<Course> list1=up.search(teacherno);
	    String price=up.Price(teacherno);
	    session.setAttribute("price", price);
	    session.setAttribute("allcourse", list1);
	    return SUCCESS;
	    
	}
}
