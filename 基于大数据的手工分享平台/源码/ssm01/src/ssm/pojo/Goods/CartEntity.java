package ssm.pojo.Goods;

import java.util.List;

import ssm.pojo.Mine.Customer;

public class CartEntity {

	private String cart_id;
	private String u_id;
	private Customer customer;
	private List<CartItemEntity> cartItemList;
	private GoodsEntity goods;
	private CartItemEntity cartItem;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public CartItemEntity getCartItem() {
		return cartItem;
	}

	public void setCartItem(CartItemEntity cartItem) {
		this.cartItem = cartItem;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<CartItemEntity> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItemEntity> cartItemList) {
		this.cartItemList = cartItemList;
	}

	public GoodsEntity getGoods() {
		return goods;
	}

	public void setGoods(GoodsEntity goods) {
		this.goods = goods;
	}

	@Override
	public String toString() {
		return "CartEntity [cart_id=" + cart_id + ", u_id=" + u_id + ", customer=" + customer + ", goods=" + goods
				+ "]";
	}
}
