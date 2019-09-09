package ssm.service.mallService.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mallMapper.CartMapper;
import ssm.mapper.mallMapper.GoodsMapper;
import ssm.mapper.mallMapper.OrderMapper;
import ssm.mapper.mineMapper.CustomerMapper;
import ssm.pojo.Goods.GoodsSpecs;
import ssm.pojo.Goods.OrderEntity;
import ssm.pojo.Goods.OrderItemEntity;
import ssm.pojo.Mine.Customer;
import ssm.service.mallService.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private CustomerMapper customerMapper;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 创建订单（直接购买，不经过购物车）
	 * 
	 * @param order
	 */
	@Override
	public void creatOrder(OrderEntity order, List<OrderItemEntity> orderItemList) {
		// TODO Auto-generated method stub
		orderMapper.creatOrder(order);
		OrderMapper mapper = sqlSessionTemplate.getMapper(OrderMapper.class);
		CartMapper cartMapper = sqlSessionTemplate.getMapper(CartMapper.class);
		for (OrderItemEntity item : orderItemList) {
			mapper.insertOrderItems(item);
			cartMapper.deleteCartItem(item.getOrder_item_id());
		}
	}

	/**
	 * 创建订单
	 * 
	 * @param order
	 */
	/*@Override
	public void creatOrder(OrderEntity order, List<OrderItemEntity> orderItemList, List<String> cartItemIdList) {
		OrderMapper mapper = sqlSessionTemplate.getMapper(OrderMapper.class);
		CartMapper cartMapper = sqlSessionTemplate.getMapper(CartMapper.class);
		for (OrderItemEntity item : orderItemList) {
			mapper.insertOrderItems(item);
			cartMapper.deleteCartItem(item.getOrder_item_id());
		}

	}*/

	/**
	 * 查找用户订单
	 * @param u_id
	 */
	@Override
	public List<OrderEntity> findOrdersByUid(String u_id) {
		// TODO Auto-generated method stub
		return orderMapper.findOrdersByUid(u_id);
	}

	/**
	 * 修改订单状态
	 * @param order
	 */
	@Override
	public void updateOrderState(OrderEntity order) {
		// TODO Auto-generated method stub
		orderMapper.updateOrderState(order);
	}

	/**
	 * 删除订单
	 * @param order
	 */
	@Override
	public void deleteOrder(OrderEntity order) {
		// TODO Auto-generated method stub
		orderMapper.deleteOrder(order);
	}

	/**
	 * 用户申请退款
	 * @param order
	 * @param customer
	 */
	@Override
	public void refundOrder(OrderEntity order, Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updataCustomerCancellationCount(customer);
		orderMapper.updateOrderState(order);
	}

	/**
	 * 查看订单详细
	 * @param order_id
	 */
	@Override
	public OrderEntity findOrderDetail(String order_id) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderDetail(order_id);
	}

	/**
	 * 创建订单
	 */
	@Override
	public void creatOrder(OrderEntity order, List<OrderItemEntity> orderItemList, List<GoodsSpecs> specsList) {
		// TODO Auto-generated method stub
		orderMapper.creatOrder(order);
		OrderMapper mapper = sqlSessionTemplate.getMapper(OrderMapper.class);
		CartMapper cartMapper = sqlSessionTemplate.getMapper(CartMapper.class);
		GoodsMapper godosMapper = sqlSessionTemplate.getMapper(GoodsMapper.class);
		/*for (OrderItemEntity item : orderItemList) {
			mapper.insertOrderItems(item);
			cartMapper.deleteCartItem(item.getOrder_item_id());
		}*/
		for (int i = 0; i < orderItemList.size(); i++) {
			mapper.insertOrderItems(orderItemList.get(i));
			cartMapper.deleteCartItem(orderItemList.get(i).getOrder_item_id());
			godosMapper.updateSpecsStock(specsList.get(i));
		}
	}

}
