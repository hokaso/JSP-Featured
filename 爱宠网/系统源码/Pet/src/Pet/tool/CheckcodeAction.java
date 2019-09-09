package Pet.tool;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.http.HttpServletResponse;
 
import org.apache.struts2.ServletActionContext;
 
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
 
//验证码检查
public class CheckcodeAction extends ActionSupport{
 
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private  String checkcode;
public void setCheckcode(String checkcode) {
    this.checkcode = checkcode;
}
 
/**
 * 验证
 * @throws IOException 
 */
 
public String check() throws IOException {
    //图片路径
    String tip="images/cuo2.gif";
 
 
 
    //从服务器获取session中的验证码
    String checkcodeServer=(String) ActionContext.getContext().getSession().get("CHECKNUM");
 
    if(checkcode.equals(checkcodeServer)){
        tip="images/dui2.gif";
 
    }
    //以IO流的方式将tip变量输出到ajax异步对象中
    HttpServletResponse  response=ServletActionContext.getResponse();
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter pw=response.getWriter();
    pw.write(tip);
    pw.flush();
    pw.close();
 
    return null;
 
 
}
}
