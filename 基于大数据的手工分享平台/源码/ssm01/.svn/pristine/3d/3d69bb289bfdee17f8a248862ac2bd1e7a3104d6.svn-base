package ssm.controller.mallController;

import java.io.ByteArrayOutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlets.WebdavServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import ssm.pojo.Goods.MallCollection;
import ssm.service.mallService.MallCollectionService;
import ssm.utils.FormatUtil;

@Controller
public class MallCollectionController {
	
	@Autowired
	private MallCollectionService collectionService;
	
	/**
	 * 添加到收藏夹
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/addToGoodsCollection.action")
	@ResponseBody
	public void addToGoodsCollection(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ServletInputStream is = request.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = is.read(buffer)) != -1) {
			//System.out.println("len=" + len);
			baos.write(buffer, 0, len);
		}
		String json = baos.toString();
		
		// System.out.println(json);
		
		MallCollection newcollection = new Gson().fromJson(json, MallCollection.class);
		
		MallCollection collection = collectionService.findCollectionByGoodsIdUid(newcollection);
		String result = "";
		if(collection == null) {
			newcollection.setMall_collection_id(FormatUtil.createUUID());
			collectionService.addToGoodsCollection(newcollection);
			result = "success";
		} else {
			result = "existed";
		}
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping(value = "/findCollectionByUid.action")
	@ResponseBody
	public void findCollectionByUid(String u_id, HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<MallCollection> list = collectionService.findCollectionByUid(u_id);
		String json = new Gson().toJson(list);
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
	}
	
	/**
	 * 删除收藏夹
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteCollection.action")
	@ResponseBody
	public void deleteCollection(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ServletInputStream is = request.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = is.read(buffer)) != -1) {
			//System.out.println("len=" + len);
			baos.write(buffer, 0, len);
		}
		String json = baos.toString();
		System.out.println(json);
		
		List<MallCollection> items = new Gson().fromJson(json, new TypeToken<List<MallCollection>>(){}.getType());
		List<String> ids = new ArrayList<String>();
		if(items.size() > 0) {
			for (MallCollection item : items) {
				ids.add(item.getMall_collection_id());
			}
		}
		collectionService.deleteCollection(ids);
	}
	
}
