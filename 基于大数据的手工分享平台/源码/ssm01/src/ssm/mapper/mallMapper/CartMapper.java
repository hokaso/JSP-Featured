package ssm.mapper.mallMapper;

import ssm.pojo.Goods.CartEntity;
import ssm.pojo.Goods.CartItemEntity;

public interface CartMapper {

	/**
	 * 查找指定用户的购物车
	 * @param id
	 * @return
	 */
	public CartEntity findCartById(String u_id);
	
	/**
	 * 创建购物车
	 * @param cart
	 */
	public void createCart(CartEntity cart);
	
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
	 * 查找指定用户的购物车
	 * @param u_id
	 * @return
	 */
	public CartEntity findCartByUid(String u_id);
	
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
	 * 删除指定的条目
	 */
	public void deleteCartItem(String cart_item_id);
}
