package ssm.service.mallService.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mallMapper.CartMapper;
import ssm.pojo.Goods.CartEntity;
import ssm.pojo.Goods.CartItemEntity;
import ssm.service.mallService.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 查找指定用户的购物车
	 * @param id
	 * @return
	 */
	@Override
	public CartEntity findCartByUid(String u_id) {
		return cartMapper.findCartByUid(u_id);
	}

	/**
	 * 创建购物车
	 * @param cart
	 */
	/*@Override
	public void createCart(CartEntity cart) {
		// TODO Auto-generated method stub
		cartMapper.createCart(cart);
	}*/
	
	@Override
	public void createCart(CartEntity cart, CartItemEntity cartItem) {
		// TODO Auto-generated method stub
		cartMapper.createCart(cart);
		cartMapper.addItemToCart(cartItem);
	}

	/**
	 * 添加到购物车（单个添加）
	 * @param cartItem
	 */
	@Override
	public void addItemToCart(CartItemEntity cartItem) {
		// TODO Auto-generated method stub
		cartMapper.addItemToCart(cartItem);
	}

	/**
	 * 修改商品数量
	 * @param cartItem
	 */
	@Override
	public void updateItemCount(CartItemEntity cartItem) {
		// TODO Auto-generated method stub
		cartMapper.updateItemCount(cartItem);
	}

	/**
	 * 根据id查找条目
	 * @param item_id
	 * @return
	 */
	@Override
	public CartItemEntity findCartItemById(String item_id) {
		return cartMapper.findCartItemById(item_id);
	}

	/**
	 * 修改条目数量
	 * @param cartItem
	 */
	@Override
	public void updateCartItemCount(CartItemEntity cartItem) {
		// TODO Auto-generated method stub
		cartMapper.updateCartItemCount(cartItem);
	}

	/**
	 * 删除条目
	 * @param item_ids
	 */
	@Override
	public void deleteCartItem(List<String> item_ids) {
		CartMapper cartMapper = sqlSessionTemplate.getMapper(CartMapper.class);
		
		for (String string : item_ids) {
			cartMapper.deleteCartItem(string);
		}
	}
}
