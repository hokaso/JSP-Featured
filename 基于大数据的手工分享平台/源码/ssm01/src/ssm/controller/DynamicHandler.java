package ssm.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ssm.pojo.Mine.Dynamic;
import ssm.service.DynamicService;

@Controller
public class DynamicHandler {

	@Autowired
	private DynamicService dynamicService;
	
	@RequestMapping("/findCommuityDynamic.action")
	@ResponseBody
	public void findCommuityDynamic(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		String type = req.getParameter("type");
		String category = req.getParameter("category");
		List<Map<String,Object>> list = dynamicService.findCommuityDynamic(type,category);
		for (Map<String, Object> map : list) {
			map.put("total_like", map.get("total_like")+"");
			map.put("total_comment", map.get("total_comment")+"");
		}
		System.out.println(list);
		
		Gson gson = new Gson();
		String data = gson.toJson(list);
		OutputStream os = resp.getOutputStream();
		//处理乱码问题
		os.write(data.getBytes("UTF-8"));
		os.flush();
		return ;
		
		
	}

}
