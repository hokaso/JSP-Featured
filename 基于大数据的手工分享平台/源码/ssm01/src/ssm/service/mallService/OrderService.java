package ssm.service.mallService;

import java.util.List;

import ssm.pojo.Goods.GoodsSpecs;
import ssm.pojo.Goods.OrderEntity;
import ssm.pojo.Goods.OrderItemEntity;
import ssm.pojo.Mine.Customer;

public interface OrderService {

	/**
	 * 创建订单（直接购买，不经过购物车）
	 * @param order
	 */
	public void creatOrder(OrderEntity order, List<OrderItemEntity> items);

	/**
	 * 创建订单
	 * @param order
	 */
	//public void creatOrder(OrderEntity order, List<OrderItemEntity> orderItemList, List<String> cartItemIdList);
	
	/**
	 * 查找用户订单
	 * @param u_id
	 */
	public List<OrderEntity> findOrdersByUid(String u_id);
	
	/**
	 * 修改订单状态
	 * @param order
	 */
	public void updateOrderState(OrderEntity order);
	
	/**
	 * 删除订单
	 * @param order
	 */
	public void deleteOrder(OrderEntity order);
	
	/**
	 * 用户申请退款
	 * @param order
	 * @param customer
	 */
	public void refundOrder(OrderEntity order, Customer customer);
	
	/**
	 * 查看订单详细
	 * @param order_id
	 */
	public OrderEntity findOrderDetail(String order_id);

	public void creatOrder(OrderEntity order, List<OrderItemEntity> orderItemList, List<GoodsSpecs> specsList);
	
}
