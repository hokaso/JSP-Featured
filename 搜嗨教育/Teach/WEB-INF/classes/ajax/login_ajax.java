package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import work.LoginWork;


@WebServlet("/login_ajax")
public class login_ajax extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		
	//	LoginWork lw = new LoginWork();
	//	Student sd = lw.ExaLogin(account,password);
		
	//	if(sd!=null){
		//	response.getWriter().write("µ«¬º≥…π¶");
			
	//	}else{
	//		response.getWriter().write("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
	//	}
	//	
	//	response.getWriter().write("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
		response.sendRedirect("http://www.baidu.com");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
