function check_after_password(){
	var after_password=document.getElementById("after_password").value;
	
	if(after_password.length<6||after_password.length>10)
		{
		alert("新密码只能在6-10位间！");
		return false;
		}
	else{
		load();
		return true;
	}
}


function load()
{

	    var ajax;
	    var before_password=document.getElementById("before_password").value;
	    var after_password=document.getElementById("after_password").value;
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
					if(result=="修改密码成功")
						{
						var showdiv = document.getElementById("span_result");
						
						showdiv.innerHTML = result+"，即将跳转到登录页面！";
						setInterval("change()",3000);
						}else
							{
							var showdiv = document.getElementById("span_result");
							
							showdiv.innerHTML = result+"，请重新输入";
							
							}
				} else if (ajax.status == 404) {
					var showdiv = document.getElementById("panel");
					showdiv.innerHTML = "请求资源不存在";
				} else if (ajax.status == 500) {
					var showdiv = document.getElementById("panel");
					showdiv.innerHTML = "服务器繁忙";
				}
			}
			
	    }
	
	ajax.open("get", "junior_update_password2?before_password="+before_password+"&after_password="+after_password);
			ajax.send(null);
	}
	
	function change()
	{
		window.location.href="login";
}
	