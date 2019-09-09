package Pet.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opensymphony.xwork2.ActionSupport;

import Pet.entity.Danmu;
import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.entity.News;
import Pet.entity.Vedio;
import Pet.entity.Vedio1;
import Pet.service.Constant;
import Pet.service.ManagerService;
import Pet.service.MemberService;
import Pet.service.VedioService;
import Pet.tool.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class ManagerAction extends ActionSupport implements ServletRequestAware,Constant{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int page;
    private Page page1;
	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public Page getPage1() {
		return page1;
	}



	public void setPage1(Page page1) {
		this.page1 = page1;
	}
	private HttpServletRequest request;

	@Autowired
	private ManagerService managerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private VedioService vedioService;
	private Manager manager;
	
	private String error;
	private String oldPassword;
	private String hql;
	
	public String getHql() {
		return hql;
	}



	public void setHql(String hql) {
		this.hql = hql;
	}



	public Manager getManager() {
		return manager;
	}



	public void setManager(Manager manager) {
		this.manager = manager;
	}



	public String getError() {
		return error;
	}



	public void setError(String error) {
		this.error = error;
	}


	public String login()throws Exception{
		HttpSession session=request.getSession();
		Manager currentmanager=managerService.findManagerByIdAndPassword(manager);
		if(currentmanager!=null){
			session.setAttribute("admininfo", currentmanager);
			return "loginSuccess";
        }
		else{
			error="用后名或者密码错误！";
			return "login1";
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
    public void find() {
    	Date date = new Date();
    	SimpleDateFormat date1 =new SimpleDateFormat("yy-MM-dd");
    	int page2 = Integer.parseInt(request.getParameter("page2"));
    	HttpSession session=request.getSession();
    	
    		
    		hql = "from News";
    		List<News> list=managerService.find(hql,page2);
            HttpServletResponse hsr = ServletActionContext.getResponse();
            JSONArray json = new JSONArray();
            for(News a : list){
                JSONObject jo = new JSONObject();
                
                jo.put("newsDate",date1.format(date));
                jo.put("newsId", a.getNewsId());
                jo.put("newsContent", a.getNewsContent());
                jo.put("newsTitle", a.getNewsTitle());
                json.add(jo);
            }
            try {
                //System.out.println(json.toString());
                hsr.setCharacterEncoding("UTF-8");
                hsr.getWriter().write(json.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        	
}
    /**
     * news fenye
     * @return
     */
    @ResponseBody
    public String getPageList() {
        this.page1 = managerService.queryForPage(Constant.EVERYPAGE, page);
        HttpSession session=request.getSession();
        session.setAttribute("news", this.page1);
        System.out.println("成功");
        return SUCCESS;
    }
    /**
     * news search
     * @return
     */
    public String search() {
    	String T = request.getParameter("s");
    	this.page1 = managerService.queryForPage1(Constant.EVERYPAGE, page,T);
    	List<News> list = this.page1.getList();
		return "newList";
    	
    }
    /**
     * vedio fenye 
     * @return
     */
    @ResponseBody
    public String getPageList1() {
        this.page1 = managerService.queryForPage2(Constant.EVERYPAGE, page);
        HttpSession session=request.getSession();
        session.setAttribute("vedio", this.page1);
        System.out.println("成功");
        return "SUCCESS1";
    }
    /**
     * vedio search
     * @return
     */
    public String search1() {
    	String T = request.getParameter("s");
    	this.page1 = managerService.queryForPage3(Constant.EVERYPAGE, page,T);
    	List<Vedio> list = this.page1.getList();
		return "vedioList";
    	
    }
    @ResponseBody
    public String getPageList2() {
        this.page1 = managerService.queryForPage4(Constant.EVERYPAGE, page);
        HttpSession session=request.getSession();
        session.setAttribute("vedio1", this.page1);
        System.out.println("成功");
        return "SUCCESS2";
    }
    /**
     * vedio search
     * @return
     */
    public String search2() {
    	String T = request.getParameter("s");
    	this.page1 = managerService.queryForPage5(Constant.EVERYPAGE, page,T);
    	List<Vedio1> list = this.page1.getList();
		return "vedio1List";
    	
    }
    public String updatePassword() {
        if (manager.getId() == 0) {
            return "updatePwdSuccess";
        }
        oldPassword=request.getParameter("oldPassword");
        managerService.updatePassword(manager, oldPassword);
        return "updatePwdSuccess";
    }


    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }
    private Danmu danmu;
	public Danmu getDanmu() {
		return danmu;
	}

	public void setDanmu(Danmu danmu) {
		this.danmu = danmu;
	}
    
    private int id;
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void findDanmu() throws IOException {
		System.out.println(managerService);
		int id=Integer.parseInt(request.getParameter("id"));
		List<Danmu> danmuList = managerService.findDanmus(id);
		HttpServletResponse response = ServletActionContext.getResponse();
		if(danmuList.size()!=0&&danmuList!=null) {
			JSONArray json = new JSONArray();
            for(Danmu a : danmuList){
                JSONObject jo = new JSONObject();
                jo.put("text", a.getText());
                jo.put("color", a.getColor());
                jo.put("size", a.getSize());
                jo.put("position",a.getPosition());
                jo.put("time",a.getTime());
                json.add(jo);
            }
            try {
                //System.out.println(json.toString());
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json.toString());
                System.out.println(json.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
		}
	}

	public void addDanmu() {
		System.out.println("方法进入成功");
		System.out.println(request.getParameter("json"));
		JSONObject json=JSONObject.fromObject(request.getParameter("json"));
//		JSONArray jsonParam = JSONArray.fromObject(object)
//		for(int i=0;i<jsonParam.size();i++)
//		{
//			JSONObject obj=(JSONObject)jsonParam.get(i);  
			String text=(String) json.get("text");
			
			String color=(String)json.get("color");
			
			//int size = (int) json.get("size");
			int size = Integer.parseInt(json.get("size").toString());
			//System.out.println("1111111");
			int position = Integer.parseInt(json.get("position").toString());
			//int position = Integer.parseInt((String) json.get("position"));
			int time = Integer.parseInt(json.get("time").toString());
			//int time = Integer.parseInt((String) json.get("time"));
			int id = Integer.parseInt(request.getParameter("id1"));//弹幕发送人
			int id2 = Integer.parseInt(request.getParameter("id2"));//视频编号
			System.out.println(id);
			Danmu danmu1 = new Danmu();
			danmu1.setText(text);
			danmu1.setColor(color);
			danmu1.setSize(size);
			danmu1.setPosition(position);
			danmu1.setTime(time);
			Member member = memberService.find(id);
			Vedio vedio = vedioService.find(id2);
			member.setId(id);
			vedio.setId(id2);
			danmu1.setMember(member);
			danmu1.setVedio(vedio);
			
			managerService.addDanmu(danmu1);
//		}
	
	}
	public void find1() {
    	Date date = new Date();
    	SimpleDateFormat date1 =new SimpleDateFormat("yy-MM-dd");
    	int page2 = Integer.parseInt(request.getParameter("page2"));
    	HttpSession session=request.getSession();
    	
    		
    		hql = "from Vedio";
    		List<Vedio> list=managerService.find1(hql,page2);
            HttpServletResponse hsr = ServletActionContext.getResponse();
            JSONArray json = new JSONArray();
            for(Vedio a : list){
                JSONObject jo = new JSONObject();
                
                jo.put("vedioDate",date1.format(date));
                jo.put("id", a.getId());
                jo.put("vedioContent", a.getVedioContent());
                jo.put("vedioTitle", a.getVedioTitle());
                json.add(jo);
            }
            try {
                //System.out.println(json.toString());
                hsr.setCharacterEncoding("UTF-8");
                hsr.getWriter().write(json.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        	
}
}
