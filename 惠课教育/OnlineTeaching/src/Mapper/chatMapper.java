package Mapper;

import java.util.List;

import Pojo.chatPojo;
import WebSocket.chat;

public interface chatMapper {

	public void chat_deleteAll(String user_id);//当一个用户的session过期时，删除该用户全部chat表记录
	public void chat_deleteOne(String junior_id,String college_id);//当一个用户关闭窗口时，删除chat表中的该记录
    public int chat_college_news(String college_id);//检查一个大学生有多少消息
    public void chat_add_news(String junior_id,String college_id);//添加到chat表中
    public void chat_update_news(String junior,String college,int status);//改状态
 
    public List<chatPojo> chat_find_news(String college_id);
    
    public void chat_go_off(String user_id);
    
    public List<chatPojo> chat_get_go_off_all(String user_id);
    
}
