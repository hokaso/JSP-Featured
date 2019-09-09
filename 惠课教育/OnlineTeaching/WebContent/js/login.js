
function go_college(){
	location.href="college_check_order"; 
}

function go_junior(){
	location.href="course_show_all"; 
}

function go_staff(){
	location.href="check_all_college"; 
}

function go_upload()
{
	var college_id=document.getElementById("user_id").value;
	location.href="college_photo_upload1?college_id="+college_id; 
}

function login()
{
	var user_type=$("input[type='radio']:checked").val();
	
	var user_id=document.getElementById("user_id").value;
	var user_password=document.getElementById("user_password").value;

	var result_span=document.getElementById("span_result").innerHTML;
	
	var tr=document.getElementById("tr_show");
	tr.style.display="";
	
	var ajax;
    
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
				var showdiv = document.getElementById("span_result");
				
				
				if(result=="学生登录成功"){
					result=result+"(3秒后跳转页面)";
					showdiv.innerHTML = result;
					setTimeout(go_junior, 3000);
				}
				else if(result=="客服登录成功"){
					result=result+"(3秒后跳转页面)";
					showdiv.innerHTML = result;
					setTimeout(go_staff, 3000);
				}
				else if(result=="大学生登录成功"){
					result=result+"(3秒后跳转页面)";
					showdiv.innerHTML = result;
					setTimeout(go_college, 3000);
				}else if(result=="资料审核不通过,请重新上传(3秒后自动跳转)") 
					{
					showdiv.innerHTML = result;
					setTimeout(go_upload, 3000);
					}
				else
					{
					showdiv.innerHTML = result;
					}
					
			} else if (ajax.status == 404) {
				var showdiv = document.getElementById("span_result");
				showdiv.innerHTML = "请求资源不存在";
			
			} else if (ajax.status == 500) {
				var showdiv = document.getElementById("span_result");
				showdiv.innerHTML = "服务器繁忙";
			}
		}
		
    }

ajax.open("get", "user_login?user_id="+user_id+"&user_password="+user_password+"&user_type="+user_type);
ajax.send(null);

}
