package Pet.action;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Controller;

import Pet.entity.UploadStatus;
import net.sf.json.JSONObject;

@Controller
public class GetFileUploadProgress implements ServletRequestAware,ServletResponseAware{
			
	
	private File resource;
    private String resourceFileName;
    private String resourceContentType;
	private HttpServletRequest request;
	private HttpServletResponse response;
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
	/**
     * 获取文件上传的进度
     */
    public void getFileUploadProgress() throws Exception{
    	
    	HttpSession session=request.getSession();
    	
        UploadStatus status =(UploadStatus) session.getAttribute("uploadStatus");
 
        if (status == null) {
            System.out.println("uploadStatus is null");
            return;
        }
 
        long startTime = status.getStartTime(); //上传开始时间
        long currentTime = System.currentTimeMillis(); //现在时间
        long time = (currentTime - startTime) / 1000 + 1; //已传输的时间 单位:s
 
        //传输速度单位:byte/s
        double velocity = ((double) status.getBytesRead()) / (double) time;
        //估计总时间
        double totalTime = status.getContentLength();
        //估计剩余时间
        double timeLeft = totalTime - time;
        //已经完成的百分比
        int percent = (int) (100 * (double) status.getBytesRead() / (double) status.getContentLength());
        //已经完成数单位:m
        double length = ((double) status.getBytesRead()) / 1024 / 1024;
        //总长度 单位:m
        double totalLength = ((double) status.getContentLength()) / 1024 / 1024;
 
        System.out.println("bytesRead:"+status.getBytesRead());
        System.out.println("ContentLength:"+status.getContentLength());
 
//        System.out.println("percent:"+percent);
//        System.out.println("length:"+length);
//        System.out.println("totalLength:"+totalLength);
//        System.out.println("velocity:"+velocity);
//        System.out.println("time:"+time);
//        System.out.println("totalTime:"+totalTime);
//        System.out.println("timeLeft:"+timeLeft);
//        System.out.println("fileNumber:"+status.getItems());
 
        JSONObject jsonObject = new JSONObject();
 
 
        jsonObject.put("percent", String.valueOf(percent));
        jsonObject.put("length", String.valueOf(length));
        jsonObject.put("totalLength", String.valueOf(totalLength));
        jsonObject.put("velocity", String.valueOf(velocity));
        jsonObject.put("time", String.valueOf(time));
        jsonObject.put("totalTime", String.valueOf(totalTime));
        jsonObject.put("timeLeft", String.valueOf(timeLeft));
        jsonObject.put("fileNumber", String.valueOf(status.getItems()));
 
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
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
