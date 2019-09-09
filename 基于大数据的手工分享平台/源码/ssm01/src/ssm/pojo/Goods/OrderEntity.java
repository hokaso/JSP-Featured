package ssm.pojo.Goods;

import java.io.Serializable;
import java.util.List;

import ssm.pojo.Mine.Customer;

public class OrderEntity implements Serializable {

	public static String STATE_UNPAID = "未付款";
	public static String STATE_UNDELIVER = "未发货";
	public static String STATE_DELIVERED = "已发货";
	public static String STATE_SIGNED = "已签收";
	public static String STATE_REFUND = "申请退款"; // （已生成了订单，但未付款，取消购买）
	public static String STATE_FAIL = "交易失败"; // （已付款，未发货，取消订单）
	public static String STATE_DELETE = "已删除"; // 用户选择“删除订单”

	private String order_id;
	private Customer customer;
	private String order_create_time;
	private String order_paytime;
	private String order_consigneeAddress;
	private String order_message;
	private String order_consigneeName;
	private String order_consigneePhone;
	private double order_totalPrice;
	private String order_state;
	private int order_delete;
	private int order_is_commented;
	private List<OrderItemEntity> itemList;

	public int getOrder_is_commented() {
		return order_is_commented;
	}

	public void setOrder_is_commented(int order_is_commented) {
		this.order_is_commented = order_is_commented;
	}

	public int getOrder_delete() {
		return order_delete;
	}

	public void setOrder_delete(int order_delete) {
		this.order_delete = order_delete;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public List<OrderItemEntity> getItemList() {
		return itemList;
	}

	public void setItemList(List<OrderItemEntity> itemList) {
		this.itemList = itemList;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getOrder_create_time() {
		return order_create_time;
	}

	public void setOrder_create_time(String order_create_time) {
		this.order_create_time = order_create_time;
	}

	public String getOrder_paytime() {
		return order_paytime;
	}

	public void setOrder_paytime(String order_paytime) {
		this.order_paytime = order_paytime;
	}

	public String getOrder_consigneeAddress() {
		return order_consigneeAddress;
	}

	public void setOrder_consigneeAddress(String order_consigneeAddress) {
		this.order_consigneeAddress = order_consigneeAddress;
	}

	public String getOrder_message() {
		return order_message;
	}

	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}

	public String getOrder_consigneeName() {
		return order_consigneeName;
	}

	public void setOrder_consigneeName(String order_consigneeName) {
		this.order_consigneeName = order_consigneeName;
	}

	public String getOrder_consigneePhone() {
		return order_consigneePhone;
	}

	public void setOrder_consigneePhone(String order_consigneePhone) {
		this.order_consigneePhone = order_consigneePhone;
	}

	public double getOrder_totalPrice() {
		return order_totalPrice;
	}

	public void setOrder_totalPrice(double order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}

	@Override
	public String toString() {
		return "OrderEntity [order_id=" + order_id + ", order_create_time=" + order_create_time + ", order_paytime="
				+ order_paytime + ", order_consigneeAddress=" + order_consigneeAddress + ", order_message="
				+ order_message + ", order_consigneeName=" + order_consigneeName + ", order_consigneePhone="
				+ order_consigneePhone + ", order_totalPrice=" + order_totalPrice + "]";
	}
}
