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
import ssm.service.CommentService;
import ssm.service.CustomerService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;
	
	@Override
	public List<CustomerComment> selectCommentByD_id(String d_id) {
		// TODO Auto-generated method stub
		List<CustomerComment> list = commentMapper.selectCommentByD_id(d_id);
		return list;
	}


}
