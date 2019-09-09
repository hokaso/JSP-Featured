package Pet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="manager")
public class Manager {
	
	private Integer id;
	private String userName;
	private String password;
    private String userPhone;
    private String userEmail;
    private String userAuthority;
    @Column(name = "userPhone", length = 20)
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@Column(name = "userEmail", length = 20)
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Column(name = "userAuthority", length = 20)
	public String getUserAuthority() {
		return userAuthority;
	}
	public void setUserAuthority(String userAuthority) {
		this.userAuthority = userAuthority;
	}
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "id", length=11)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "userName", length = 20)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name = "password", length = 20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	}
