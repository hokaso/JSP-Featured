package Pet.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.service.LoginRegService;
import net.sf.json.JSONArray;

/**
 * 
 */
@Controller
public class LoginRegAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Member member;
    

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public LoginRegService getLoginRegService() {
		return loginRegService;
	}

	private LoginRegService loginRegService;
    private JSONArray root;
	private HttpServletRequest request;
	private HttpServletResponse response;

    public void setLoginRegService(LoginRegService loginRegService) {
        this.loginRegService = loginRegService;
    }

    /**
     * 注册
     */
    public String register() {
        if (loginRegService.register(member)) {
            root = JSONArray.fromObject(1);
        }else{
            root = JSONArray.fromObject(0);
        }
        return SUCCESS;
    }

    /**
     * 
     */
    public String login() {
    	//Member member1 = new Member();
        member.setId(Integer.parseInt(request.getParameter("userid")));
        member.setPwd(request.getParameter("password"));
        Member loginMember = loginRegService.login(member);
        if (loginMember == null) {
            root = JSONArray.fromObject(0);
            return SUCCESS;
        } else {
            root = JSONArray.fromObject(loginMember);
            String jsonstr = root.toString();
            try {
				//URLEncoder.encode(jsonstr, "utf-8");
				Cookie cookie = new Cookie("news_user",URLEncoder.encode(jsonstr, "utf-8"));
	            response.addCookie(cookie);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return SUCCESS;
        }
    }

    public JSONArray getRoot() {
        return root;
    }

    public void setRoot(JSONArray root) {
        this.root = root;
    }

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response= response;
		
	}
}
