function check_junior_update(){

	
	if(check_junior_phone()&&check_junior_name()&&check_junior_address())
	{
	return true;
	}
    else
	{
	return false;
	}
}


function check_junior_phone()
{
	var num=/^[1][3,5,8][0-9]{9}$/;
	var junior_phone=document.getElementById("junior_phone");
	var ss=junior_phone.value;
	if(!num.test(ss))
		{
	      alert("电话格式不正确！");
	     return false;
		}else
			{
			return true;
			}
}


function check_junior_name(){
	var junior_name=document.getElementById("junior_name").value;
	var name_length=junior_name.length;
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


function check_junior_address(){
	
	var junior_address=document.getElementById("junior_address").value;
	var address_length=junior_address.length;
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