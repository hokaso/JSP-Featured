package Pet.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import Pet.entity.CountInfoPO;
import Pet.service.CountInfoService;

/**
 * Created by GUOFENG on 2017/4/20.
 */
@Controller
public class CountInfoAction extends ActionSupport {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CountInfoPO countInfoPO;
	@Resource
	private CountInfoService countInfoService;


    public CountInfoPO getCountInfoPO() {
		return countInfoPO;
	}


	public void setCountInfoPO(CountInfoPO countInfoPO) {
		this.countInfoPO = countInfoPO;
	}





	public String countInfo() {
    	System.out.println(countInfoService);
        countInfoPO = countInfoService.countInfo();
        ActionContext.getContext().getSession().put("countinfo", countInfoPO);
        return "countInfoSuccess";
    }
}
