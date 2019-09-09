package ssm.pojo.Goods;

public class GoodsSpecs {

	private String specs_id;
	private String goods_id;
	private String specs_attrs;
	private int specs_stock;
	private double specs_price;
	private String specs_img;
	private String specs_create_time;
	private String specs_update_time;
	private double specs_perchase_price;
	
	private GoodsEntity goods;

	
	public double getSpecs_perchase_price() {
		return specs_perchase_price;
	}

	public void setSpecs_perchase_price(double specs_perchase_price) {
		this.specs_perchase_price = specs_perchase_price;
	}

	public String getSpecs_id() {
		return specs_id;
	}

	public void setSpecs_id(String specs_id) {
		this.specs_id = specs_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getSpecs_attrs() {
		return specs_attrs;
	}

	public void setSpecs_attrs(String specs_attrs) {
		this.specs_attrs = specs_attrs;
	}

	public int getSpecs_stock() {
		return specs_stock;
	}

	public void setSpecs_stock(int specs_stock) {
		this.specs_stock = specs_stock;
	}

	public double getSpecs_price() {
		return specs_price;
	}

	public void setSpecs_price(double specs_price) {
		this.specs_price = specs_price;
	}

	public String getSpecs_img() {
		return specs_img;
	}

	public void setSpecs_img(String specs_img) {
		this.specs_img = specs_img;
	}

	public String getSpecs_create_time() {
		return specs_create_time;
	}

	public void setSpecs_create_time(String specs_create_time) {
		this.specs_create_time = specs_create_time;
	}

	public String getSpecs_update_time() {
		return specs_update_time;
	}

	public void setSpecs_update_time(String specs_update_time) {
		this.specs_update_time = specs_update_time;
	}

	public GoodsEntity getGoods() {
		return goods;
	}

	public void setGoods(GoodsEntity goods) {
		this.goods = goods;
	}

	@Override
	public String toString() {
		return "GoodsSpecs [specs_id=" + specs_id + ", goods_id=" + goods_id + ", specs_attrs=" + specs_attrs
				+ ", specs_stock=" + specs_stock + ", specs_price=" + specs_price + ", specs_img=" + specs_img
				+ ", specs_create_time=" + specs_create_time + ", specs_update_time=" + specs_update_time + "]";
	}
}
