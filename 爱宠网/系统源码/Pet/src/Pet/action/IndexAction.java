package Pet.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.service.IndexService;
import net.sf.json.JSONArray;

/**
 * 
 */
@Controller
public class IndexAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
    private IndexService indexService;
    private JSONArray root;
    
    private int hotCurrentPage = 1;
    private int societyCurrentPage = 1;
    private int techCurrentPage = 1;
    private int inteCurrentPage = 1;
    private int miliCurrentPage = 1;
    
    private int thisNewsId;
    
    private int thisVedioId;

    public int getThisVedioId() {
		return thisVedioId;
	}

	public void setThisVedioId(int thisVedioId) {
		this.thisVedioId = thisVedioId;
	}

	public void setIndexService(IndexService indexService) {
        this.indexService = indexService;
    }

    public JSONArray getRoot() {
        return root;
    }

    public void setRoot(JSONArray root) {
        this.root = root;
    }
/**
 *find News
 * @return
 */
    public String findThisNews() {
        root = JSONArray.fromObject(indexService.findNewsOfThis(thisNewsId));
        return SUCCESS;
    }
    /**
     * find Vedio
     * @return
     */
   public String findThisVedio() {
    	
        root = JSONArray.fromObject(indexService.findVedioOfThis(thisVedioId));
        return SUCCESS;
    }
    private void restrat() {
        hotCurrentPage = 0;
        societyCurrentPage = 0;
        techCurrentPage = 0;
        inteCurrentPage = 0;
        miliCurrentPage = 0;
    }

    public String findHeadNews() {
        restrat();
        root = JSONArray.fromObject(indexService.findNewsOfHead());
        return SUCCESS;
    }

    public String findHotNews() {
        int pageCount = 5;
        int pageSize = indexService.PageSizeOfHot(pageCount);
        if (hotCurrentPage < pageSize) {
            hotCurrentPage++;
        } else {
            hotCurrentPage = 1;
        }
        root = JSONArray.fromObject(indexService.findNewsOfHot(hotCurrentPage, pageCount));
        return SUCCESS;
    }

    public String findSocietyNews() {
        int pageCount = 5;
        int pageSize = indexService.PageSizeOfSociety(pageCount);
        if (societyCurrentPage < pageSize) {
            societyCurrentPage++;
        } else {
            societyCurrentPage = 1;
        }
        root = JSONArray.fromObject(indexService.findNewsOfSociety(societyCurrentPage, pageCount));
        return SUCCESS;
    }

    public String findTechNews() {
        int pageCount = 5;
        int pageSize = indexService.PageSizeOfTech(pageCount);
        if (techCurrentPage < pageSize) {
            techCurrentPage++;
        } else {
            techCurrentPage = 1;
        }
        root = JSONArray.fromObject(indexService.findNewsOfTech(techCurrentPage, pageCount));
        return SUCCESS;
    }

    public String findInteNews() {
        int pageCount = 5;
        int pageSize = indexService.PageSizeOfInte(pageCount);
        if (inteCurrentPage < pageSize) {
            inteCurrentPage++;
        } else {
            inteCurrentPage = 1;
        }
        root = JSONArray.fromObject(indexService.findNewsOfInte(inteCurrentPage, pageCount));
        return SUCCESS;
    }

    public String findMiliNews() {
        int pageCount = 5;
        int pageSize = indexService.PageSizeOfMili(pageCount);
        if (miliCurrentPage < pageSize) {
            miliCurrentPage++;
        } else {
            miliCurrentPage = 1;
        }
        root = JSONArray.fromObject(indexService.findNewsOfMili(miliCurrentPage, pageCount));
        return SUCCESS;
    }


    public void setHotCurrentPage(int hotCurrentPage) {
        this.hotCurrentPage = hotCurrentPage;
    }

    public void setSocietyCurrentPage(int societyCurrentPage) {
        this.societyCurrentPage = societyCurrentPage;
    }

    public void setTechCurrentPage(int techCurrentPage) {
        this.techCurrentPage = techCurrentPage;
    }

    public void setInteCurrentPage(int inteCurrentPage) {
        this.inteCurrentPage = inteCurrentPage;
    }

    public void setMiliCurrentPage(int miliCurrentPage) {
        this.miliCurrentPage = miliCurrentPage;
    }


    public int getThisNewsId() {
        return thisNewsId;
    }

    public void setThisNewsId(int thisNewsId) {
        this.thisNewsId = thisNewsId;
    }

}
