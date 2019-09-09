package Pet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="member")
public class Member {
	
	private int id;
	private int account;
	private String pwd;
	private int state;
	private String email;
	private Vedio1 vedio1;
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator",strategy = GenerationType.IDENTITY)
	@Column(name = "id", length=11)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "account", length = 20)
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	@Column(name = "pwd", length = 20)
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Column(name = "state", length = 20)
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Column(name = "email", length = 20)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
