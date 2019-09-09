$(function(){
	$('input:checkbox[name=tno]').click(function(){
		var s=$(this).is(':checked')
		var check=$(this);
		if(s){
			var result1 = confirm("确认审核通过")
			if(result1){
				var ajax;
				var tno=$(this).val();
			    if (window.XMLHttpRequest) {
			        ajax = new XMLHttpRequest();
			    } else if (window.ActiveXObject) {
			        ajax = new ActiveXObject("Msxml2.XMLHTTP");
			    }
			    ajax.onreadystatechange = function () {
			        if (ajax.readyState == 4) {
			            if (ajax.status == 200) {

			                var result = ajax.responseText;
		
			                if (result == "true") {
			                	check.attr('disabled',true);
			                }
			                else {
			                	alert('错误')
			                }

			            } else if (ajax.status == 404) {
			                var showdiv = document.getElementById("result");
			                showdiv.innerHTML = "请求资源不存在";

			            } else if (ajax.status == 500) {
			                var showdiv = document.getElementById("result");
			                showdiv.innerHTML = "服务器繁忙";
			            }
			        }

			    }

			    ajax.open("get", "../admin/TeacherSuccess?tno="+tno);
			    ajax.send(null);

			}else{
				
			}
		}
	})
})
function login_check() {
	
	var result1 = confirm("确认审核通过")
	if(result1){
		var ajax;
	 
	    if (window.XMLHttpRequest) {
	        ajax = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        ajax = new ActiveXObject("Msxml2.XMLHTTP");
	    }

	    ajax.onreadystatechange = function () {
	        if (ajax.readyState == 4) {
	            if (ajax.status == 200) {

	                var result = ajax.responseText;
	                var showdiv = document.getElementById("result");
	                if(result=="manager"){
	                	window.location.href="../admin/adminAction";
	                }else
	                if (result == "登录成功") {
	                    result = result + "(3秒后跳转页面)";
	                    showdiv.innerHTML = result;
	                    window.location.href="../homepage/homepage.action";
	                }
	                else {
	                    showdiv.innerHTML = result;
	                }

	            } else if (ajax.status == 404) {
	                var showdiv = document.getElementById("result");
	                showdiv.innerHTML = "请求资源不存在";

	            } else if (ajax.status == 500) {
	                var showdiv = document.getElementById("result");
	                showdiv.innerHTML = "服务器繁忙";
	            }
	        }

	    }

	    ajax.open("get", "../login/login?account="+account+"&password="+password);
	    ajax.send(null);

	}else{
		
	}
    
}
