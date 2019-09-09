
// 显示表单
function showTable1()
{
	var table1=document.getElementById("table1");
	var table2=document.getElementById("table2");
	
	table1.style.visibility="visible";
	table2.style.visibility="collapse";

	}
//显示表单	
function showTable2()
{	
	var table1=document.getElementById("table1");
    var table2=document.getElementById("table2");
    table2.style.visibility="visible";
    table1.style.visibility="collapse";
	}
	
//通过ajax检查junior_id是否重复
function check1()
{
	
	    var ajax;
	    var junior_id=document.getElementById("junior_id").value;
	    if (window.XMLHttpRequest)
	    {
			ajax = new XMLHttpRequest();
		} else if (window.ActiveXObject) 
		{
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		}
	    
	    ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				if (ajax.status == 200) {
					var result = ajax.responseText;
					if(result=="账号可用")
						{
						if(junior_id!="")
							{
						var showdiv = document.getElementById("span_result1");
						showdiv.innerHTML = result;
							}
						}else
							{
							var showdiv = document.getElementById("span_result1");
							showdiv.innerHTML = result;
							}
				} else if (ajax.status == 404) {
					var showdiv = document.getElementById("span_result1");
					showdiv.innerHTML = "请求资源不存在";
				
				} else if (ajax.status == 500) {
					var showdiv = document.getElementById("span_result1");
					showdiv.innerHTML = "服务器繁忙";
				}
			}
			
	    }
	
	ajax.open("get", "junior_register_check?junior_id="+junior_id);
	ajax.send(null);
	
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

function check_junior_id(){
	var junior_id=document.getElementById("junior_id").value;
	var id_length=junior_id.length;
	if(id_length<6||id_length>10)
		{
		alert("账号长度必须在6-10位");
		return false;
		}
	else
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

function check_junior_password(){
	
	var junior_password=document.getElementById("junior_password").value;
	var password_length=junior_password.length;
	if(password_length<6||password_length>10)
		{
		alert("密码长度必须在6-10位");
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

function check2()
{
	check1();
	check_junior_phone();
	
	var a=document.getElementById("span_result1").innerHTML;
	if(a=="账号可用"&&check_junior_phone()&&check_junior_id()
			&&check_junior_password()&&check_junior_password()&&check_junior_name()&&check_junior_address())
	{
	return true;
	}
    else
	{
	return false;
	}
	}

//college

function check3()
{
	    var ajax;
	    var college_id=document.getElementById("college_id").value;
	    if (window.XMLHttpRequest)
	    {
			ajax = new XMLHttpRequest();
		} else if (window.ActiveXObject) 
		{
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		}
	    
	    ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				if (ajax.status == 200) {
					var result = ajax.responseText;
					if(result=="账号可用")
						{
						if(document.getElementById("college_id").value!="")
							{
						var showdiv = document.getElementById("span_result2");
						showdiv.innerHTML = result;
							}
						}else
							{
							var showdiv = document.getElementById("span_result2");
							showdiv.innerHTML = result;
							}
				} else if (ajax.status == 404) {
					var showdiv = document.getElementById("span_result2");
					showdiv.innerHTML = "请求资源不存在";
				
				} else if (ajax.status == 500) {
					var showdiv = document.getElementById("span_result2");
					showdiv.innerHTML = "服务器繁忙";
			
				}
			}
			
	    }
	
	ajax.open("get", "college_register_check?college_id="+college_id);
	ajax.send(null);
	
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

function check_college_id(){
	var college_id=document.getElementById("college_id").value;
	var id_length=college_id.length;
	if(id_length<6||id_length>10)
		{
		alert("账号长度必须在6-10位");
		return false;
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

function check_college_password(){
	
	var college_password=document.getElementById("college_password").value;
	var password_length=college_password.length;
	if(password_length<6||password_length>10)
		{
		alert("密码长度必须在6-10位");
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



function check4()
{
	//college
	check3();
	
	var a=document.getElementById("span_result2").innerHTML;
	if(a=="账号可用"&&check_college_id()
			&&check_college_password()&&check_college_password()&&check_college_name()&&check_college_address())
{
		return true;
		}
	else
		{
		return false;
		}
	}



