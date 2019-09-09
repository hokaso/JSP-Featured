package Pet.action;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import Pet.entity.SiteInfoPO;
import Pet.service.SiteInfoService;

/**
 * Created by GUOFENG on 2017/4/17.
 */
@Controller
public class SiteInfoAction extends ActionSupport {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public SiteInfoPO getSiteInfoPO() {
		return siteInfoPO;
	}

	public void setSiteInfoPO(SiteInfoPO siteInfoPO) {
		this.siteInfoPO = siteInfoPO;
	}
	private SiteInfoPO siteInfoPO ;
	@Autowired
    private SiteInfoService siteInfoService;

    /**
     * 
     *
     * @return
     */
    public String findInfo() {
        siteInfoPO = siteInfoService.findInfo(1);
        ActionContext.getContext().getSession().put("siteinfo", siteInfoPO);
        return "findInfoSuccess";
    }
    public String saveInfo() {
        siteInfoService.saveInfo(siteInfoPO);
        return "saveInfoSuccess";
    }

}
