package Pet.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.entity.SiteInfoPO;
import Pet.service.FooterService;
import net.sf.json.JSONArray;

/**
 * 
 */
@Controller
public class FooterAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
    private FooterService footerService;
    private JSONArray root;

    public void setFooterService(FooterService footerService) {
        this.footerService = footerService;
    }

    public JSONArray getRoot() {
        return root;
    }

    public void setRoot(JSONArray root) {
        this.root = root;
    }

    /**
     * 
     *
     * @return
     */
    public String findFooter() {
        SiteInfoPO siteInfoPO = footerService.findFooter(1);
        root = JSONArray.fromObject(siteInfoPO);
        return SUCCESS;
    }

}
