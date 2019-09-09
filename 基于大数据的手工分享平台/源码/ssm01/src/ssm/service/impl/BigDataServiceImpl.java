package ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.commentMapper.CommentMapper;
import ssm.mapper.mineMapper.CustomerMapper;
import ssm.mapper.mineMapper.DynamicMapper;
import ssm.pojo.Comment.CustomerComment;
import ssm.pojo.Mine.Customer;
import ssm.pojo.Mine.Dynamic;
import ssm.service.BigDataService;
import ssm.service.CommentService;
import ssm.service.CustomerService;

@Service
public class BigDataServiceImpl implements BigDataService {

	@Autowired
	DynamicMapper dynamicMapper;

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

	public DynamicMapper getDynamicMapper() {
		return dynamicMapper;
	}

	public void setDynamicMapper(DynamicMapper dynamicMapper) {
		this.dynamicMapper = dynamicMapper;
	}
	
	
}
