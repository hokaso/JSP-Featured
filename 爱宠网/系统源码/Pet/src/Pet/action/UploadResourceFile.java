package Pet.action;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import Pet.entity.Member;
import Pet.entity.Resource;
import Pet.service.ResourceService;
import net.sf.json.JSONObject;
@Controller
public class UploadResourceFile implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private File resource;
    private String resourceFileName;
    private String resourceContentType;
    private String name;
    private String introduce;
    private String id;
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Autowired
    private ResourceService resourceService;
    
	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public File getResource() {
		return resource;
	}

	public void setResource(File resource) {
		this.resource = resource;
	}

	public String getResourceFileName() {
		return resourceFileName;
	}

	public void setResourceFileName(String resourceFileName) {
		this.resourceFileName = resourceFileName;
	}

	public String getResourceContentType() {
		return resourceContentType;
	}

	public void setResourceContentType(String resourceContentType) {
		this.resourceContentType = resourceContentType;
	}

	public void uploadResourceFile()throws Exception {
 
        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
 
       if (resource != null) {
 
            Resource newNesource = new Resource();
            newNesource.setName(name);
            newNesource.setIntroduce(introduce);
          
            newNesource.setTime( DateFormat.getDateInstance().format(new Date()));
            newNesource.setDownloadTimes(0);
            newNesource.setSize(resource.length());
            int id1=Integer.parseInt(id);
            Member member = new Member();
            member.setId(id1);
            newNesource.setMember(member);
            resourceContentType = resourceFileName.substring(resourceFileName.lastIndexOf(".") + 1);//���������ļ�����
  
            resourceFileName = newNesource.getName() + "." + resourceContentType;//�洢���ļ�����Ϊ�û��˺���
 
           //String realpath1 = ServletActionContext.getServletContext().getRealPath("/vedio");
           // System.out.println(realpath);
            String realpath = "D:\\eclipse\\Pet\\WebContent\\User\\upload";
            File saveFile = new File(new File(realpath), resourceFileName);
            if (!saveFile.getParentFile().exists()) {
               
                saveFile.getParentFile().mkdirs();
            }
 
            FileUtils.copyFile(resource, saveFile);
            String savePath = saveFile.getAbsolutePath();
 
            newNesource.setDownloadUrl("upload/" + resourceFileName);
             resourceService. addResource(newNesource);
 
         
 
            jsonObject.put("saveStatus", "success");
            
        } else {
            System.out.println("file is null");
            jsonObject.put("saveStatus", "fail");
        }
        response.getWriter().write(jsonObject.toString());
    }

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}


}
