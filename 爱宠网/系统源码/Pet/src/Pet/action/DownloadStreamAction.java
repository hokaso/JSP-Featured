package Pet.action;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Pet.entity.PageBean;
import Pet.entity.Vedio1;
import Pet.service.DownloadService;
import Pet.service.MemberService;
public class DownloadStreamAction extends ActionSupport implements ModelDriven<Vedio1>{
    private static final long serialVersionUID = -2747191035343710583L;
    private String fileName;
    private String vedio1id;
    private String vedioTitle;
    private String vedioContent;
    private String vedioKey;
    private String vedioAuthor;
    private String vedioDate;
    private int id;
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//private String member_id;
//    public String getMember_id() {
//		return member_id;
//	}
//	public void setMember_id(String member_id) {
//		this.member_id = member_id;
//	}
	public String getVedioDate() {
		return vedioDate;
	}
	public void setVedioDate(String vedioDate) {
		this.vedioDate = vedioDate;
	}
	public String getVedioTitle() {
		return vedioTitle;
	}
	public void setVedioTitle(String vedioTitle) {
		this.vedioTitle = vedioTitle;
	}
	public String getVedioContent() {
		return vedioContent;
	}
	public void setVedioContent(String vedioContent) {
		this.vedioContent = vedioContent;
	}
	public String getVedioKey() {
		return vedioKey;
	}
	public void setVedioKey(String vedioKey) {
		this.vedioKey = vedioKey;
	}
	public String getVedioAuthor() {
		return vedioAuthor;
	}
	public void setVedioAuthor(String vedioAuthor) {
		this.vedioAuthor = vedioAuthor;
	}
	Vedio1 ve1 = new Vedio1();
    @Resource
    private MemberService  memberService;
    @Resource
    private DownloadService downloadService;
    public String getVedio1id() {
		return vedio1id;
	}
	public void setVedio1id(String vedio1id) {
		this.vedio1id = vedio1id;
	}
	public void setFileName(String fileName) throws Exception {
    	
        if(ServletActionContext.getRequest().getMethod().equals("GET")){
        
            byte[] bytes = fileName.getBytes("ISO8859-1");
            fileName=new String(bytes,"utf-8");
        
        }
        this.fileName = fileName;
    }
    public String getFileName() throws Exception {
        return URLEncoder.encode(fileName, "utf-8");
    }
    public InputStream getVedioStream() throws Exception {
        InputStream inputStream = ServletActionContext.getServletContext().getResourceAsStream("/vedio/"+fileName);
        System.out.println(inputStream);
        ve1.setId(Integer.parseInt(vedio1id));
        ve1.setAddress(fileName);
        Date time = new Date();
        ve1.setVedioDate(time);
        ve1.setVedioAuthor(vedioAuthor);
        memberService.addVedio1(ve1);
        return inputStream;
    }
	@Override
	public Vedio1 getModel() {
		// TODO Auto-generated method stub
		return ve1;
	}
	 private String checkVedio1;

	    
	    private int currentPage = 1;

	    public void setCurrentPage(int currentPage) {
	        this.currentPage = currentPage;
	    }
	    public String findVedio1ByCondition() {
	    	if (ve1.getVedioTitle() == null) {
	    		ve1.setVedioTitle("");
	         }
	        ActionContext.getContext().getSession().put("find_key", ve1.getVedioTitle());
	        PageBean<Vedio1> pageBean = downloadService.findDownloadByCondition(
	                currentPage,
	                ve1.getVedioTitle()
	        );
	        ActionContext.getContext().getValueStack().push(pageBean);
	        return "findDownloadByConditionSuccess";
	    }

	    public String deleteVedio1() {
	    	downloadService.deleteDownload(ve1);
	        return "deleteDownloadSuccess";
	    }


	    public String deleteMoreVedio1() {
	    
	        String[] checkVedio1IDs = this.getCheckVedio1().split(",");
	        downloadService.deleteMoreDownload(checkVedio1IDs);
	        return "deleteMoreDownloadSuccess";
	    }


	    public String getCheckVedio1() {
	        return checkVedio1;
	    }

	    public void setCheckVedio1(String checkVedio1) {
	        this.checkVedio1= checkVedio1;
	    }
}