package ssm.controller.mallController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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

import ssm.pojo.Goods.CartEntity;
import ssm.pojo.Goods.CartItemEntity;
import ssm.pojo.Goods.GoodsSpecs;
import ssm.service.mallService.CartService;
import ssm.service.mallService.GoodsService;
import ssm.utils.FormatUtil;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private GoodsService goodsService;

	/**
	 * 商品添加到购物车
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/cartAdd.action")
	@ResponseBody
	public void cartAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletInputStream is = request.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = is.read(buffer)) != -1) {
			System.out.println("len=" + len);
			baos.write(buffer, 0, len);
		}
		String json = baos.toString();
		CartEntity cart = new Gson().fromJson(json, CartEntity.class);

		// 从数据库中查找
		CartEntity myCart = cartService.findCartByUid(cart.getCustomer().getU_id());

		// System.out.println("---" + myCart);

		/*
		 * 判断该用户是是否存在购物车 如果不存在，则创建一辆购物车，并保存商品 如果存在则，将商品加入到已存在的购物车中
		 */
		CartItemEntity newItem = cart.getCartItem();
		if (myCart == null) {
			cart.setCart_id(FormatUtil.createUUID());
			newItem.setCart(cart);
			newItem.setCart_item_id(FormatUtil.createUUID());
			// 创建一辆购物车并保存数据
			cartService.createCart(cart, newItem);
		} else {
			// 判断是否已经存在的标志，默认值不存在
			boolean exist = false;
			List<CartItemEntity> items = myCart.getCartItemList();
			for (CartItemEntity item : items) {
				String oldItemId = item.getSpecs().getSpecs_id();
				String newItemId = newItem.getSpecs().getSpecs_id();
				if (oldItemId.equals(newItemId)) {
					int newCount = item.getCart_item_count() + newItem.getCart_item_count();
					// 获取该商品要添加的规格
					GoodsSpecs specs = goodsService.findSpecsById(item.getSpecs().getSpecs_id());
					// 如果添加的数量大于规格数量，添加失败
					if (newCount > specs.getSpecs_stock()) {
						String result = "over stock";
						response.setContentType("text/json;charset=utf-8");
						response.getWriter().write(result);
						return;
					}
					item.setCart_item_count(newCount);
					cartService.updateItemCount(item);
					exist = true; // 修改存在标志
					break;
				}
			}

			if (!exist) {
				newItem.setCart_item_id(FormatUtil.createUUID());
				newItem.setCart(myCart);
				cartService.addItemToCart(newItem); // 不存在则保存新的条目
			}
		}
		String result = "success";
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(result);
	}

	/**
	 * 查找用户购物车
	 * 
	 * @param u_id
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/findCartByUid.action")
	@ResponseBody
	public void findCartByUid(String u_id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		CartEntity cart = cartService.findCartByUid(u_id);
		String json = new Gson().toJson(cart);
		//System.out.println(json);
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
	}

	/**
	 * 修改购物车中的商品数量
	 * 
	 * @param u_id
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/changeCartItemCount.action")
	@ResponseBody
	public void changeCartItemCount(String cart_item_id, Integer cart_item_count, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String result = "1111";
		CartItemEntity item = cartService.findCartItemById(cart_item_id);
		
		if(item.getGoods().getGoods_state() != 1) {
			result = "stop_sell";
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(result);
			return;
		}
		
		if(item.getSpecs().getSpecs_stock() < cart_item_count) {
			result = "max_stock";
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(result);
			return;
		}
		
		item.setCart_item_count(cart_item_count);
		System.out.println("1111111111111111111111111111");
		cartService.updateCartItemCount(item);
		result = "success";
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(result);
	}
	
	/**
	 * 删除购物车中的条目
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteCartItem.action")
	@ResponseBody
	public void deleteCartItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletInputStream is = request.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = is.read(buffer)) != -1) {
			System.out.println("len=" + len);
			baos.write(buffer, 0, len);
		}
		String json = baos.toString();
		//System.out.println(json);
		List<CartItemEntity> items = new Gson().fromJson(json, new TypeToken<List<CartItemEntity>>(){}.getType());
		List<String> item_ids = new ArrayList<String>();
		for (CartItemEntity cartItemEntity : items) {
			System.out.println(cartItemEntity.getCart_item_id());
			item_ids.add(cartItemEntity.getCart_item_id());
		}
		cartService.deleteCartItem(item_ids);
	}
}
