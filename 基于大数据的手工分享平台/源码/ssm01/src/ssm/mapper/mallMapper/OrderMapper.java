package ssm.mapper.mallMapper;

import java.util.List;

import ssm.pojo.Goods.OrderEntity;
import ssm.pojo.Goods.OrderItemEntity;

public interface OrderMapper {

	/**
	 * 创建订单
	 * @param order
	 */
	public void creatOrder(OrderEntity order);
	
	/**
	 * 添加条目
	 * @param item
	 */
	public void insertOrderItems(OrderItemEntity item);
	
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
	 * 查看订单详细
	 * @param order_id
	 */
	public OrderEntity findOrderDetail(String order_id);
	
	/**
	 * 更新为已评论信息
	 * @param order_id
	 */
	public void updateIsCommented(String order_id);

}
