package ssm.pojo.Goods;

import java.io.Serializable;

import ssm.pojo.Mine.Customer;

/**
 * @author Administrator
 *
 */
public class GoodsCommentEntity implements Serializable {

	private String goods_comment_id;
	private String goods_comment_content;
	private String goods_comment_time;
	private int goods_degree;
	private String u_id;
	private String order_id;
	// private String headPicPath;// 用户头像路径
	private String goods_id;
	private GoodsSpecs specs;
	private GoodsEntity goods;

	private Customer customer;

	public GoodsSpecs getSpecs() {
		return specs;
	}

	public void setSpecs(GoodsSpecs specs) {
		this.specs = specs;
	}

	public GoodsEntity getGoods() {
		return goods;
	}

	public void setGoods(GoodsEntity goods) {
		this.goods = goods;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public GoodsCommentEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGoods_comment_id() {
		return goods_comment_id;
	}

	public void setGoods_comment_id(String goods_comment_id) {
		this.goods_comment_id = goods_comment_id;
	}

	public String getGoods_comment_content() {
		return goods_comment_content;
	}

	public void setGoods_comment_content(String goods_comment_content) {
		this.goods_comment_content = goods_comment_content;
	}

	public String getGoods_comment_time() {
		return goods_comment_time;
	}

	public void setGoods_comment_time(String goods_comment_time) {
		this.goods_comment_time = goods_comment_time;
	}

	public int getGoods_degree() {
		return goods_degree;
	}

	public void setGoods_degree(int goods_degree) {
		this.goods_degree = goods_degree;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "GoodsCommentEntity [goods_comment_id=" + goods_comment_id + ", goods_comment_content="
				+ goods_comment_content + ", goods_comment_time=" + goods_comment_time + ", goods_degree="
				+ goods_degree + ", u_id=" + u_id + ", order_id=" + order_id + ", goods_id=" + goods_id + ", specs="
				+ specs + ", goods=" + goods + "]";
	}
}
