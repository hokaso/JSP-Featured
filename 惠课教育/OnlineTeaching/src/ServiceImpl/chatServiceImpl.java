package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import Mapper.chatMapper;
import Pojo.chatPojo;
import Service.chatService;
import WebSocket.chat;

@Component
public class chatServiceImpl implements chatService {

	@Resource
	private chatMapper chatMapper;
	
	
	public void deleteAll(String user_id) {
		chatMapper.chat_deleteAll(user_id);

	}

	@Override
	public void deleteOne(String junior_id, String college_id) {
		chatMapper.chat_deleteOne(junior_id, college_id);
	}

	@Override
	public int chat_college_news(String college_id) {
		int i=chatMapper.chat_college_news(college_id);
		return i;
	}

	@Override
	public void chat_add_news(String junior_id, String college_id) {
		chatMapper.chat_add_news(junior_id, college_id);
		
	}

	@Override
	public void chat_update_news(String junior, String college, int status) {
		chatMapper.chat_update_news(junior, college, status);
		
	}

	@Override
	public List<chatPojo> chat_find_news(String college_id) {
		
	List<chatPojo> list=	chatMapper.chat_find_news(college_id);
		return list;
	}

	@Override
	public void chat_go_off(String user_id) {
		chatMapper.chat_go_off(user_id);
		
	}

	@Override
	public List<chatPojo> chat_get_go_off_all(String user_id) {
	List<chatPojo> list=chatMapper.chat_get_go_off_all(user_id);
		return list;
	}

}
