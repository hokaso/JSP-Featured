package Pet.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.dao.BaseDao;
import Pet.entity.Member;
import Pet.entity.Vedio1;
import Pet.service.MemberService;
import Pet.utils.Constant;
import net.sf.json.JSONArray;


@Controller
public class MemberAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private HttpServletRequest request;

	@Resource
	private MemberService memberService;
	
	private Member member;
	
	private Vedio1 vedio1;
	public Vedio1 getVedio1() {
		return vedio1;
	}



	public void setVedio1(Vedio1 vedio1) {
		this.vedio1 = vedio1;
	}



	public JSONArray getRoot() {
		return root;
	}



	public void setRoot(JSONArray root) {
		this.root = root;
	}
	private JSONArray root;
	
	private String error;
	public String getOldPassword() {
		return oldPassword;
	}



	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	private String oldPassword;
	private HttpServletResponse response;
	@Resource
	private BaseDao<Member> baseDao;
	public Member getMember() {
		return member;
	}



	public void setMember(Member member) {
		this.member = member;
	}



	public String getError() {
		return error;
	}



	public void setError(String error) {
		this.error = error;
	}

   private File file;
   private String fileFileName;
	public String login()throws Exception{
		HttpSession session=request.getSession();
		Member currentMember=memberService.findMemberByNameAndPassword(member);
		if(currentMember!=null&&currentMember.getState()!=0){
			session.setAttribute("currentMember", currentMember);
			root = JSONArray.fromObject(currentMember);
            String jsonstr = root.toString();
            Cookie cookie = new Cookie("user",URLEncoder.encode(jsonstr, "utf-8"));
            response.addCookie(cookie);
			return SUCCESS;
		}
		else if(currentMember!=null&&currentMember.getState()==0){
			
			session.setAttribute("message",currentMember.getEmail());
		    error="�û�δ���";
		    root = JSONArray.fromObject(0);
            String jsonstr = root.toString();
            Cookie cookie = new Cookie("user",URLEncoder.encode(jsonstr, "utf-8"));
            response.addCookie(cookie);
		    return ERROR;
		}
		else{
			error="�ú��������������";
			session.setAttribute("message",error);
			root = JSONArray.fromObject(0);
            String jsonstr = root.toString();
            Cookie cookie = new Cookie("user",URLEncoder.encode(jsonstr, "utf-8"));
            response.addCookie(cookie);
			return ERROR;
		}
	}
	public File getFile() {
		return file;
	}



	public void setFile(File file) {
		this.file = file;
	}



	public String getFileFileName() {
		return fileFileName;
	}



	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}



	public String regist() throws Exception{
		String account = String.valueOf(member.getAccount());
		String url = "";
        url += "?account="+account+"&pwd="+member.getPwd();
	    System.out.println(url);
		memberService.Insert(member);
		SendMail(member,url);
        return INPUT;
    }
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	public void SendMail(Member member, String url) {
		InputStream is = this.getClass().getResourceAsStream("/mailInfo.properties");
    	Properties prop = new Properties();
    	try {
			prop.load(is);//������Դ�ļ�
		} catch (IOException e1) {
			e1.printStackTrace();
		}
    	
        String msgText = "请点击下面链接进行激活\n" + "http://localhost:8080/Pet/Member_process.action"+url;
        String smtpHost = prop.get("smtpHost").toString();//SMTP��������
        String from = prop.get("mailName").toString();//�����˵�ַ
        String pwd = prop.get("pwd").toString();//����
        String to = member.getEmail();//�����˵�ַ
        // ����properties����
        Properties props = new Properties();
        //�����ʼ�������
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.auth","true");
        //ȡ��Ĭ�ϵ�Session
        Session session = Session.getDefaultInstance(props, null);

        // ����һ����Ϣ�������巢���˵�ַ�������˵�ַ
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));

            InternetAddress[] address = {new InternetAddress(to)};

            message.setRecipients(Message.RecipientType.TO, address);

            message.setSubject("����ע���û�");//�趨����

            message.setSentDate(new Date());//�趨����ʱ��

            message.setText(msgText);//��ǰ�涨���msgText�е������趨Ϊ�ʼ����ĵ�����

            message.saveChanges(); // implicit with send()
            //Э��
            Transport transport = session.getTransport("smtp");
            //�����˵�ַ���û���������
            transport.connect(smtpHost, from, pwd);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	public String process() throws Exception {
		Member member = new Member();
		HttpSession session = request.getSession();
		int account = Integer.parseInt(request.getParameter("account"));
		String pwd = request.getParameter("pwd");
		member.setAccount(account);
		member.setPwd(pwd);
		Member currentMember = memberService.findMemberByNameAndPassword(member);
		member.setState(1);
		member.setId(currentMember.getId());
		member.setEmail(currentMember.getEmail());
		memberService.update(member);
		session.setAttribute("message", currentMember);
		return LOGIN;
	}

	public String addVedio1() {
    
        if (file != null) {
            try {
                File tempFile = new File(Constant.systemPath, fileFileName);
                FileUtils.copyFile(file, tempFile);
                vedio1.setAddress(fileFileName);
            } catch (IOException e) {
                return INPUT;
            }
        }
        memberService.addVedio1(vedio1);
        return "addNewsSuccess";
    }


	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}
	 public String updatePassword() {
	        oldPassword=request.getParameter("oldPassword");
	        if(memberService.updatePassword(member, oldPassword))
	        return "updatePwdSuccess";
             return "updatePwdSuccess";
             }
}
