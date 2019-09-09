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

import Pet.dao.VedioDao;
import Pet.entity.Vedio;
import Pet.entity.VedioTypePO;
import Pet.entity.News;
import Pet.entity.PageBean;
import Pet.service.VedioService;
import Pet.service.VedioService;
import Pet.utils.Constant;


/**
 * Created by GUOFENG on 2017/4/16.
 */
@Controller
public class VedioAction extends ActionSupport implements ModelDriven<Vedio>{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    @Resource
	private VedioService vedioService;
    Vedio vedio=new Vedio() ;
    
   
   

	private File file;
    private String fileFileName;
    private String checkVedio;
    
    
    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String addVedio() {
    	System.out.println("添加进入");
        if (file != null) {
            try {
                File tempFile = new File(Constant.systemPath, fileFileName);
                FileUtils.copyFile(file, tempFile);
                vedio.setAddress(fileFileName);
            } catch (IOException e) {
                return INPUT;
            }
        }
        System.out.println(vedio.getAddress());
        System.out.println(vedio.getVedioAuthor());
        System.out.println(vedio.getVedioKey());
        System.out.println(vedio.getVedioTitle());
        vedioService.addVedio(vedio);
        return "addVedioSuccess";
    }


    public String findVedioByCondition() {
        if (vedio.getVedioTypePO() == null) {
            VedioTypePO vedioTypePO = new VedioTypePO();
            vedioTypePO.setTypeId(0);
            vedio.setVedioTypePO(vedioTypePO);
        }
        if (vedio.getVedioKey() == null) {
            vedio.setVedioKey("");
        }
        ActionContext.getContext().getSession().put("find_type", vedio.getVedioTypePO().getTypeId());
        ActionContext.getContext().getSession().put("find_key", vedio.getVedioKey().trim());
        PageBean<Vedio> pageBean = vedioService.findVedioByCondition(
                currentPage,
                vedio.getVedioTypePO().getTypeId(),
                vedio.getVedioKey()
        );
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findVedioByConditionSuccess";
    }

    public String deleteVedio() {
    	System.out.println(vedio.getId()+"*");
        vedioService.deleteVedio(vedio);
        return "deleteVedioSuccess";
    }


    public String deleteMoreVedio() {
    	System.out.println("464654645");
        String[] checkVedioIDs = this.getCheckVedio().split(",");
        System.out.println(vedioService);
        //vedioDao.deleteMoreVedio(checkVedioIDs);
        vedioService.deleteMoreVedio(checkVedioIDs);
		System.out.println("删除成功");
        return "deleteMoreVedioSuccess";
    }


    public String getCheckVedio() {
        return checkVedio;
    }

    public void setCheckVedio(String checkVedio) {
        this.checkVedio = checkVedio;
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
	public Vedio getModel() {
		// TODO Auto-generated method stub
		return vedio;
	}
}
