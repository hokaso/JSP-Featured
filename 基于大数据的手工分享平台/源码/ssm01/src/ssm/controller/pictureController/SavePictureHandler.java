package ssm.controller.pictureController;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.pojo.Mine.Customer;
import ssm.service.CustomerService;

@Controller
public class SavePictureHandler {

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/savePicture.action")
	@ResponseBody
	public String savePicture(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		
		resp.setCharacterEncoding("UTF-8");
		InputStream is = req.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		String type = req.getParameter("type");
		String uid = req.getParameter("uid");
		String contextpath = req.getServletContext().getRealPath("/")+"testImages/headpic/";
		File file = new File(contextpath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println(file.exists());
		}
		String picpath =System.currentTimeMillis()+".png";
		String savepath = "testImages/headpic/"+picpath;
		
		File picfile = new File(contextpath+picpath);
		System.out.println(contextpath+picpath);
		//保存用户头像
		if(type.equals("customer")) {
			int len;
			byte[] b = new byte[1024];
			while((len = is.read(b))!=-1) {
				baos.write(b, 0, len);
			}
			byte[] byt = baos.toByteArray();
			System.out.println(savepath);
			FileOutputStream fos = new FileOutputStream(picfile);
			fos.write(byt);
			//更新数据库
			Customer customer = new Customer();
			customer.setU_id(uid);
			customer.setHeadPicPath(savepath);
			customerService.updateCustomer(customer);
			
			baos.close();
			fos.close();
		}
		return savepath;
	}
	
}
