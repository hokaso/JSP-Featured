package Service;

import java.util.List;

import Pojo.chatPojo;
import WebSocket.chat;

public interface chatService {

	public void deleteAll(String user_id);
	public void deleteOne(String junior_id,String college_id);
    public int chat_college_news(String college_id);
    public void chat_add_news(String junior_id,String college_id);
    public void chat_update_news(String junior,String college,int status);
    public List<chatPojo> chat_find_news(String college_id);
    public void chat_go_off(String user_id);
    public List<chatPojo> chat_get_go_off_all(String user_id);
}
