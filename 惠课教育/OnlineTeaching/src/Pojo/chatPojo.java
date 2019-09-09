package Pojo;

public class chatPojo {

	private String junior_id;
	private String college_id;
	private int status;
	public String getJunior_id() {
		return junior_id;
	}
	public void setJunior_id(String junior_id) {
		this.junior_id = junior_id;
	}
	
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "chatPojo [junior_id=" + junior_id + ", college_id=" + college_id + ", status=" + status
				+ "]";
	}
	
}
