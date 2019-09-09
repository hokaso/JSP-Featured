package ssm.controller.mallController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import ssm.pojo.Goods.GoodsCommentEntity;
import ssm.pojo.Goods.GoodsCommentImageEntity;
import ssm.service.mallService.GoodsCommentService;

@Controller
public class GoodsCommentController {

	@Autowired
	private GoodsCommentService goodsCommentService;

	@RequestMapping(value = "/loadGoodsComment.action")
	@ResponseBody
	public String loadGoodsComment(String goods_id, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		//System.out.println("loadGoodsComment->goods_degree = " + goods_degree);
		System.out.println("loadGoodsComment->goods_id = " + goods_id);

		List<GoodsCommentEntity> list;
		list = goodsCommentService.loadGoodsComment(goods_id);
		/*if (goods_degree == 0) {

			list = goodsCommentService.loadGoodsComment(goods_id);
		} else {
			GoodsCommentEntity goodsCommentEntity = new GoodsCommentEntity();
			goodsCommentEntity.setGoods_degree(goods_degree);
			goodsCommentEntity.setGoods_id(goods_id);
			list = goodsCommentService.loadGoodsCommentByDegree(goodsCommentEntity);
		}*/

		String json = new Gson().toJson(list);
		try {
			OutputStream os = response.getOutputStream();
			os.write(json.getBytes("utf-8"));
			os.flush();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 加载评论的图片
	 * @param goods_comment_id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loadGoodsCommentImage.action")
	@ResponseBody
	public String loadGoodsCommentImage(String goods_comment_id, HttpServletRequest request) {

		List<GoodsCommentImageEntity> list = goodsCommentService.loadGoodsCommentImage(goods_comment_id);

		String json = new Gson().toJson(list);
		return json;
	}
	
	/**
	 * 添加评论
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addGoodsComment.action")
	@ResponseBody
	public String addGoodsComment(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ServletInputStream is = request.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = is.read(buffer)) != -1) {
			// System.out.println("len=" + len);
			baos.write(buffer, 0, len);
		}
		String json = baos.toString();
		System.out.println(json);
		List<GoodsCommentEntity> comments = new Gson().fromJson(json, new TypeToken<List<GoodsCommentEntity>>() {}.getType());
		String order_id = comments.get(0).getOrder_id();
		
		goodsCommentService.addGoodsComment(comments, order_id);

		return "success";
	}

}
