package ssm.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ssm.pojo.Comment.CustomerComment;
import ssm.pojo.Mine.Customer;
import ssm.service.CommentService;
import ssm.service.CustomerService;
import ssm.service.impl.CustomerServiceImpl;

@Controller
public class CommentHandler {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/selectCommentByD_id.action")
	@ResponseBody
	public void selectCommentByD_id(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		
		
		resp.setContentType("text/html;charset=utf-8");
		String d_id = req.getParameter("d_id");
	
		List<CustomerComment> data = commentService.selectCommentByD_id(d_id);
		System.out.println(data.size());
		Gson gson = new Gson();
		String json = gson.toJson(data);
		OutputStream os = resp.getOutputStream();
		os.write(json.getBytes("UTF-8"));
		os.flush();

		return;
		
	}
	
}
