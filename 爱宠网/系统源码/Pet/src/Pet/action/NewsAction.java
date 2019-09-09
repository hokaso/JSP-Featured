package Pet.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Pet.dao.NewsDao;
import Pet.entity.News;
import Pet.entity.NewsTypePO;
import Pet.entity.PageBean;
import Pet.service.NewsService;
import Pet.utils.Constant;



/**
 * Created by GUOFENG on 2017/4/16.
 */
@Controller
public class NewsAction extends ActionSupport implements ModelDriven<News>{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    @Resource
	private NewsService newsService;
	private News news = new News();
	private File file;
    private String fileFileName;
    private String checkNews;

    
    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String addNews() {
        if (file != null) {
            try {
                File tempFile = new File(Constant.systemPath, fileFileName);
                FileUtils.copyFile(file, tempFile);
                news.setNewsImg(fileFileName);
            } catch (IOException e) {
                return INPUT;
            }
        }
        newsService.addNews(news);
        return "addNewsSuccess";
    }


    public String findNewsByCondition() {
    	if (news.getNewsTypePO() == null) {
            NewsTypePO newsTypePO = new NewsTypePO();
            newsTypePO.setTypeId(0);
            news.setNewsTypePO(newsTypePO);
        }
        if (news.getNewsKey() == null) {
        	news.setNewsKey("");
        }
        ActionContext.getContext().getSession().put("find_type", news.getNewsTypePO().getTypeId());
        ActionContext.getContext().getSession().put("find_key", news.getNewsKey().trim());
        PageBean<News> pageBean = newsService.findNewsByCondition(
                currentPage,
                news.getNewsTypePO().getTypeId(),
                news.getNewsKey()
        );
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findNewsByConditionSuccess";
    }

    public String deleteNews() {
    	System.out.println("删除成功");
        newsService.deleteNews(news);
        return "deleteNewsSuccess";
    }


    public String deleteMoreNews() {
        String[] checkNewsIDs = this.getCheckNews().split(",");
        newsService.deleteMoreNews(checkNewsIDs);
		System.out.println("删除成功");
        return "deleteMoreNewsSuccess";
    }


    public String getCheckNews() {
        return checkNews;
    }

    public void setCheckNews(String checkNews) {
        this.checkNews = checkNews;
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

	@Override
	public News getModel() {
		// TODO Auto-generated method stub
		return news;
	}
}
