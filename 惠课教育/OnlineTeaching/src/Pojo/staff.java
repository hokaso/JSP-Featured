package Pojo;

public class staff {
private String staff_id;
private String staff_password;
public String getStaff_id() {
	return staff_id;
}
public void setStaff_id(String staff_id) {
	this.staff_id = staff_id;
}
public String getStaff_password() {
	return staff_password;
}
public void setStaff_password(String staff_password) {
	this.staff_password = staff_password;
}
public staff() {
	super();
}
@Override
public String toString() {
	return "staff [staff_id=" + staff_id + ", staff_password=" + staff_password + "]";
}

}
