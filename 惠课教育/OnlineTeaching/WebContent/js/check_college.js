function check_college_update(){
	
	if(check_college_name()&&check_college_address()&&check_college_phone())
        {
		return true;
		}
	else
		{
		return false;
		}
	
}


function check_college_phone()
{var num=/^[1][3,5,8][0-9]{9}$/;
var college_phone=document.getElementById("college_phone");
var ss=college_phone.value;
if(!num.test(ss))
	{
      alert("电话格式不正确！");
      return false
	}
else
	{
	return true;
	}
}


function check_college_name(){
	var college_name=document.getElementById("college_name").value;
	var name_length=college_name.length;
	if(name_length<2||name_length>10)
		{
		alert("姓名长度必须在2-10位");
		return false;
		}
	else
		{
		return true;
		}
}


function check_college_address(){
	
	var college_address=document.getElementById("college_address").value;
	var address_length=college_address.length;
	if(address_length<10||address_length>25)
		{
		alert("地址长度必须在10-25位");
		return false;
		}
	else
		{
		return true;
		}
	
}