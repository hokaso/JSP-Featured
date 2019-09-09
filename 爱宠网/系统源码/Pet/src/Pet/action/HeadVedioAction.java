package Pet.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Pet.entity.HeadVedio;
import Pet.entity.PageBean;
import Pet.service.HeadVedioService;
import Pet.utils.Constant;
import Pet.utils.MyFileUtils;

/**
 * Created by GUOFENG on 2017/4/19.
 */
public class HeadVedioAction extends ActionSupport implements ModelDriven<HeadVedio> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HeadVedio headVedio= new HeadVedio();
	@Autowired
    private HeadVedioService headVedioService;
    private File file;
    private String fileFileName;

    public void setHeadVedioService(HeadVedioService headVedioService) {
        this.headVedioService = headVedioService;
    }

    @Override
    public HeadVedio getModel() {
        return headVedio;
    }

    public String addOrUpdateHeadVedio() {
    	System.out.println("hfashfjhhfsdhf");
    	System.out.println(file+"456");
        if (file != null) {
            try {
            	
                File tempFile = new File(Constant.systemPath, fileFileName);
                FileUtils.copyFile(file, tempFile);
                headVedio.setHeadImg(fileFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return INPUT;
            }
        }
        HeadVedio getHeadVedio = headVedioService.existHeadVedio(headVedio);
        if (getHeadVedio != null) {
            //删除
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + getHeadVedio.getHeadImg());
            //更新
            headVedioService.updateHeadVedio(headVedio);
        } else {
            //添加
            headVedioService.addHeadVedio(headVedio);
        }
        return "addOrUpdateHeadVedioSuccess";
    }

    public String deleteHeadVedio() {
        headVedioService.deleteHeadVedio(headVedio);
        return "deleteHeadVedioSuccess";
    }

    public String findHeadVedio() {
    	System.out.println("成功");
        PageBean<HeadVedio> pageBean = headVedioService.findHeadVedio();
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findHeadVedioHeadVedio";
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
