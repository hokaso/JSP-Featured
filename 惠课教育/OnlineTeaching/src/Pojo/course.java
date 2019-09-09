package Pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class course {
private int course_id;
private String college_id;
private String course_name;

@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date course_time;
private String course_statue;
private String course_intro;
private int course_price;
private String course_photo;
private String course_type;

public course() {
	super();
}

public int getCourse_id() {
	return course_id;
}

public void setCourse_id(int course_id) {
	this.course_id = course_id;
}

public String getCollege_id() {
	return college_id;
}

public void setCollege_id(String college_id) {
	this.college_id = college_id;
}

public String getCourse_name() {
	return course_name;
}

public void setCourse_name(String course_name) {
	this.course_name = course_name;
}

public Date getCourse_time() {
	return course_time;
}

public void setCourse_time(Date course_time) {
	this.course_time = course_time;
}

public String getCourse_statue() {
	return course_statue;
}

public void setCourse_statue(String course_statue) {
	this.course_statue = course_statue;
}

public String getCourse_intro() {
	return course_intro;
}

public void setCourse_intro(String course_intro) {
	this.course_intro = course_intro;
}

public int getCourse_price() {
	return course_price;
}

public void setCourse_price(int course_price) {
	this.course_price = course_price;
}

public String getCourse_photo() {
	return course_photo;
}

public void setCourse_photo(String course_photo) {
	this.course_photo = course_photo;
}

public String getCourse_type() {
	return course_type;
}

public void setCourse_type(String course_type) {
	this.course_type = course_type;
}


}
