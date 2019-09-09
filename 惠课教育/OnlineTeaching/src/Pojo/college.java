package Pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class college {
private String college_id;
private String college_password;
private String college_name;
private String college_gender;
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date college_birth;
private String college_phone;
private String college_photo;
private String college_address;
private int college_statue;


public college() {
	super();
}
public String getCollege_photo() {
	return college_photo;
}
public void setCollege_photo(String college_photo) {
	this.college_photo = college_photo;
}

public int getCollege_statue() {
	return college_statue;
}
public void setCollege_statue(int college_statue) {
	this.college_statue = college_statue;
}


public String getCollege_id() {
	return college_id;
}
public void setCollege_id(String college_id) {
	this.college_id = college_id;
}
public String getCollege_name() {
	return college_name;
}
public void setCollege_name(String college_name) {
	this.college_name = college_name;
}
public String getCollege_gender() {
	return college_gender;
}
public void setCollege_gender(String college_gender) {
	this.college_gender = college_gender;
}

public Date getCollege_birth() {
	return college_birth;
}
public void setCollege_birth(Date college_birth) {
	this.college_birth = college_birth;
}
public String getCollege_phone() {
	return college_phone;
}
public void setCollege_phone(String college_phone) {
	this.college_phone = college_phone;
}
public String getCollege_address() {
	return college_address;
}
public void setCollege_address(String college_address) {
	this.college_address = college_address;
}
public String getCollege_password() {
	return college_password;
}
public void setCollege_password(String college_password) {
	this.college_password = college_password;
}
@Override
public String toString() {
	return "college [college_id=" + college_id + ", college_password=" + college_password + ", college_name="
			+ college_name + ", college_gender=" + college_gender + ", college_birth=" + college_birth
			+ ", college_phone=" + college_phone + ", college_photo=" + college_photo + ", college_address="
			+ college_address + ", college_statue=" + college_statue + "]";
}



}
