package ssm.mapper.commentMapper;

import java.util.List;

import ssm.pojo.Comment.CustomerComment;

public interface CommentMapper {

	List<CustomerComment> selectCommentByD_id(String d_id);

	
	
}
