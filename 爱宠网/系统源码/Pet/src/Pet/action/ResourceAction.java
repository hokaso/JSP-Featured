package Pet.action;




import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Pet.entity.Member;
import Pet.entity.PageBean;
import Pet.entity.Resource;
import Pet.service.ResourceService;



/**
 * Created by GUOFENG on 2017/4/16.
 */
@Controller
public class ResourceAction extends ActionSupport implements ModelDriven<Resource>,ServletRequestAware{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    @Autowired
	private ResourceService resourceService;
    Resource resource=new Resource() ;
    
    private String checkResource;
    
    private int currentPage = 1;
    
    private String idea;
    
    private String introduce;
    
	//在struts.xml取值就必须要有get方法
	public String getIdea() {
		return idea;
	}
	//在struts.xml中设值就必须要有set方法
	public void setIdea(String idea) {
		this.idea = idea;
	}
	public void setIdea1(String ieda) {
		int idea1 = Integer.parseInt(ieda);
		this.idea1 = idea1;
	}
	private int idea1=1;
	public int getIdea1() {
		return idea1;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	private HttpServletRequest request;
    
	public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
	
    public String findResourceByCondition() {
    	System.out.println(idea1+"###");
    	System.out.println(idea);
    	System.out.println(idea1+"###");
    	int idea2 = Integer.parseInt(idea);
    	 if (resource.getName() == null) {
    		 resource.setName("");
         }
    	//int id1=Integer.parseInt(request.getParameter("idea"));
    	 //idea1 = Integer.parseInt(idea);
    	 PageBean<Resource> pageBean = resourceService.findResourceByCondition(
                currentPage,
                idea2
        );
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findResourceByConditionSuccess";
    }
    public String findResourceByCondition1() {
    	
   	 if (resource.getIntroduce() == null) {
   		 resource.setIntroduce("");
        }
   	
   	 
       PageBean<Resource> pageBean = resourceService.findResourceByCondition1(
               currentPage,
               resource.getIntroduce()
       );
       ActionContext.getContext().getValueStack().push(pageBean);
       return "findResourceByConditionSuccess";
   }
    public String deleteResource() {
        resourceService.deleteResource(resource);
        return "deleteResourceSuccess";
    }


    public String deleteMoreResource() {
    
        String[] checkResourceIDs = this.getCheckResource().split(",");
        resourceService.deleteMoreResource(checkResourceIDs);
		System.out.println("删除成功");
        return "deleteMoreResourceSuccess";
    }


    public String getCheckResource() {
        return checkResource;
    }

    public void setCheckResource(String checkResource) {
        this.checkResource = checkResource;
    }

	@Override
	public Resource getModel() {
		// TODO Auto-generated method stub
		return resource;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
}
