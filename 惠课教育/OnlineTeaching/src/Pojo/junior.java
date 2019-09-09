package Pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class junior {
private String junior_id;
private String junior_name;
private String junior_password;

@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date junior_birth;
private String junior_phone;
private String junior_gender;
private String junior_address;

public String getJunior_gender() {
	return junior_gender;
}
public void setJunior_gender(String junior_gender) {
	this.junior_gender = junior_gender;
}
public String getJunior_id() {
	return junior_id;
}
public void setJunior_id(String junior_id) {
	this.junior_id = junior_id;
}
public String getJunior_name() {
	return junior_name;
}
public void setJunior_name(String junior_name) {
	this.junior_name = junior_name;
}
public String getJunior_password() {
	return junior_password;
}
public void setJunior_password(String junior_password) {
	this.junior_password = junior_password;
}

public Date getJunior_birth() {
	return junior_birth;
}
public void setJunior_birth(Date junior_birth) {
	this.junior_birth = junior_birth;
}
public String getJunior_phone() {
	return junior_phone;
}
public void setJunior_phone(String junior_phone) {
	this.junior_phone = junior_phone;
}
public String getJunior_address() {
	return junior_address;
}
public void setJunior_address(String junior_address) {
	this.junior_address = junior_address;
}
public junior() {
	super();
}
@Override
public String toString() {
	return "junior [junior_id=" + junior_id + ", junior_name=" + junior_name + ", junior_password=" + junior_password
			+ ", junior_birth=" + junior_birth + ", junior_phone=" + junior_phone + ", junior_gender=" + junior_gender
			+ ", junior_address=" + junior_address + "]";
}


}
