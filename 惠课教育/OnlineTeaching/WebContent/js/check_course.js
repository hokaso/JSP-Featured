function check_all(){
	
	if(check_price()&&check_intro()){
		return true;
	}
	else
		{
		return false;
		}
	
	
}

function check_price(){
	var price=document.getElementById("course_price").value;

	if(price>=10&&price<=50){
		return true;
	}
	else
		{
		alert("课程价格只能在10-50元每小时之间！");
		return false;
		}
	
}

function check_intro(){
	var intro=document.getElementById("course_intro").value;
	
	if(price<=50){
		return true;
	}
	else
		{
		alert("介绍只能在50字以内！");
		return false;
		}
	
}