package ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mineMapper.CustomerMapper;
import ssm.mapper.mineMapper.DynamicMapper;
import ssm.pojo.Mine.Customer;
import ssm.pojo.Mine.Dynamic;
import ssm.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMapper customerMapper;
	@Autowired
	DynamicMapper dynamicMapper;
	
	
	@Override
	public Customer selectByUsernameAndPassword(Customer customer) {
		
		customer = customerMapper.selectByUsernameAndPassword(customer);
		if(customer!=null) {
			List<Customer> followList = customerMapper.selectFollowDetail(customer.getU_id());
			List<Customer> fanList = customerMapper.selectFanDetail(customer.getU_id());
			List<Dynamic> dynamicList = dynamicMapper.selectMyDynamic(customer.getU_id());
			customer.setFanList(fanList);
			customer.setFollowList(followList);
			for(Dynamic d : dynamicList) {
				int like = dynamicMapper.selectDynamicLikeCount(d.getD_id());
				d.setTotal_like(like);
				int comment =  dynamicMapper.selectDynamicCommentCount(d.getD_id());
				d.setTotal_comment(comment);
			}
			customer.setDynamicList(dynamicList);
		}
		
		return customer;
	}
	@Override
	public void updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updateCustomer(customer);
	}
	@Override
	public String findFollow_Fan(String u_id) {
		
		int dynamic = customerMapper.findDynamicCount(u_id);
		int follow = customerMapper.findfollowCount(u_id);
		int fan = customerMapper.findfanCount(u_id);
		
		return dynamic+","+follow+","+fan;
		
	}
	@Override
	public List<Customer> selectFollowDetail(String u_id) {	
		
		return customerMapper.selectFollowDetail(u_id);
		
	}
	@Override
	public List<Customer> selectFanDetail(String u_id) {

		return customerMapper.selectFanDetail(u_id);
		
	}
	
	//后台管理
	@Override
	public List<Customer> findallCustomer() {
		// TODO Auto-generated method stub
		return customerMapper.selectallCustomer();
	}
	@Override
	public Customer findCustomer(String u_id) {
		
		return customerMapper.selectByU_id(u_id);
	}
	@Override
	public void editCustomer(Customer customer) {
		customerMapper.editCustomer(customer);
		
	}
	@Override
	public void deleteCustomer(String u_id) {
		customerMapper.deleteCustomer(u_id);
		
	}
	@Override
	public void addCustomer(Customer customer) {
		customerMapper.addCustomer(customer);
	}

	@Override
	public List<Customer> SelectHighRisk() {
		// TODO Auto-generated method stub
		List<Customer> HighRiskList = customerMapper.SelectHighRisk();
		return HighRiskList;
	}
	
	@Override
	public List<Dynamic> ProductDownSuggestion() {
		// TODO Auto-generated method stub
		List<Dynamic> DownSuggestionList = dynamicMapper.ProductDownSuggestion();
		return DownSuggestionList;
	}

	@Override
	public List<Dynamic> ProductUpSuggestion() {
		// TODO Auto-generated method stub
		List<Dynamic> UpSuggestionList = dynamicMapper.ProductUpSuggestion();
		return UpSuggestionList;
	}
	
	@Override
	public void updataCustomerCancellationCount(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updataCustomerCancellationCount(customer);
	}
	@Override
	public Customer findCustomerById(String u_id) {
		// TODO Auto-generated method stub
		return customerMapper.findCustomerById(u_id);
	}
	
	/**
	 * 修改个人信息
	 * @param customer
	 */
	@Override
	public void updateCustomerInfo(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updateCustomerInfo(customer);	
	}
	
	/**
	 * 修改密码
	 * @param customer
	 */
	@Override
	public void updateCustomerPwd(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updateCustomerPwd(customer);
	}

}
