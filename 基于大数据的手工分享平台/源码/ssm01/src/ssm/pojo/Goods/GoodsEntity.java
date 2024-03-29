package ssm.pojo.Goods;

import java.util.ArrayList;
import java.util.List;

public class GoodsEntity {

	private String goods_id;
	private String goods_name;
	private String goods_price;
	private int goods_stock;
	private int goods_state;
	private String goods_coverPic;
	private int goods_category;
	private double goods_sale_price;
	private double goods_perchase_price;
	private String goods_describe;
	private int goods_sales_volume;

	public double getGoods_sale_price() {
		return goods_sale_price;
	}

	public void setGoods_sale_price(double goods_sale_price) {
		this.goods_sale_price = goods_sale_price;
	}

	public double getGoods_perchase_price() {
		return goods_perchase_price;
	}

	public void setGoods_perchase_price(double goods_perchase_price) {
		this.goods_perchase_price = goods_perchase_price;
	}

	private List<GoodsSpecs> goodsSpecs = new ArrayList<GoodsSpecs>();

	public GoodsEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsEntity(String goods_id, String goods_name, String goods_price, int goods_stock, int goods_state,
			String goods_coverPic, int goods_category, String goods_describe) {
		super();
		this.goods_id = goods_id;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_stock = goods_stock;
		this.goods_state = goods_state;
		this.goods_coverPic = goods_coverPic;
		this.goods_category = goods_category;
		this.goods_describe = goods_describe;
	}

	public int getGoods_sales_volume() {
		return goods_sales_volume;
	}

	public void setGoods_sales_volume(int goods_sales_volume) {
		this.goods_sales_volume = goods_sales_volume;
	}
	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}

	public int getGoods_stock() {
		return goods_stock;
	}

	public void setGoods_stock(int goods_stock) {
		this.goods_stock = goods_stock;
	}

	public int getGoods_state() {
		return goods_state;
	}

	public void setGoods_state(int goods_state) {
		this.goods_state = goods_state;
	}

	public String getGoods_coverPic() {
		return goods_coverPic;
	}

	public void setGoods_coverPic(String goods_coverPic) {
		this.goods_coverPic = goods_coverPic;
	}

	public int getGoods_category() {
		return goods_category;
	}

	public void setGoods_category(int goods_category) {
		this.goods_category = goods_category;
	}

	public String getGoods_describe() {
		return goods_describe;
	}

	public void setGoods_describe(String goods_describe) {
		this.goods_describe = goods_describe;
	}

	public List<GoodsSpecs> getGoodsSpecs() {
		return goodsSpecs;
	}

	public void setGoodsSpecs(List<GoodsSpecs> goodsSpecs) {
		this.goodsSpecs = goodsSpecs;
	}

	@Override
	public String toString() {
		return "GoodsEntity [goods_id=" + goods_id + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_stock=" + goods_stock + ", goods_state=" + goods_state + ", goods_coverPic=" + goods_coverPic
				+ ", goods_category=" + goods_category + ", goods_describe=" + goods_describe + ", goodsSpecs="
				+ goodsSpecs + "]";
	}
}
