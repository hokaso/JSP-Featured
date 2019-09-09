package Pet.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Pet.entity.HeadNews;
import Pet.entity.PageBean;
import Pet.service.HeadNewsService;
import Pet.utils.Constant;
import Pet.utils.MyFileUtils;

/**
 * Created by GUOFENG on 2017/4/19.
 */
public class HeadNewsAction extends ActionSupport implements ModelDriven<HeadNews> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HeadNews headNews= new HeadNews();
	@Autowired
    private HeadNewsService headNewsService;
    private File file;
    private String fileFileName;

    public void setHeadNewsService(HeadNewsService headNewsService) {
        this.headNewsService = headNewsService;
    }

    @Override
    public HeadNews getModel() {
        return headNews;
    }

    public String addOrUpdateHeadNews() {
    	System.out.println("hfashfjhhfsdhf");
    	System.out.println(file+"456");
        if (file != null) {
            try {
            	
                File tempFile = new File(Constant.systemPath, fileFileName);
                FileUtils.copyFile(file, tempFile);
                //System.out.println(fileFileName);
                headNews.setHeadImg(fileFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return INPUT;
            }
        }
        HeadNews getHeadNews = headNewsService.existHeadNews(headNews);
        if (getHeadNews != null) {
            //É¾³ý
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + getHeadNews.getHeadImg());
            //¸üÐÂ
            headNewsService.updateHeadNews(headNews);
        } else {
            //Ìí¼Ó
            headNewsService.addHeadNews(headNews);
        }
        return "addOrUpdateHeadNewsSuccess";
    }

    public String deleteHeadNews() {
        headNewsService.deleteHeadNews(headNews);
        return "deleteHeadNewsSuccess";
    }

    public String findHeadNews() {
        PageBean<HeadNews> pageBean = headNewsService.findHeadNews();
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findHeadNewsHeadNews";
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
}
