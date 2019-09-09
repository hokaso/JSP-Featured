package ssm.service.mallService;

import java.util.List;

import ssm.pojo.Goods.CartEntity;
import ssm.pojo.Goods.CartItemEntity;

public interface CartService {

	/**
	 * 查找指定用户的购物车
	 * @param id
	 * @return
	 */
	public CartEntity findCartByUid(String u_id);
	
	/**
	 * 创建购物车
	 * @param cart
	 */
	/*public void createCart(CartEntity cart);*/
	public void createCart(CartEntity cart, CartItemEntity cartItem);
	
	/**
	 * 添加到购物车（单个添加）
	 * @param cartItem
	 */
	public void addItemToCart(CartItemEntity cartItem);
	
	/**
	 * 修改商品数量
	 * @param cartItem
	 */
	public void updateItemCount(CartItemEntity cartItem);
	
	/**
	 * 根据id查找条目
	 * @param item_id
	 * @return
	 */
	public CartItemEntity findCartItemById(String item_id);
	
	/**
	 * 修改条目数量
	 * @param cartItem
	 */
	public void updateCartItemCount(CartItemEntity cartItem);
	
	/**
	 * 删除条目
	 * @param item_ids
	 */
	public void deleteCartItem(List<String> item_ids);
}
