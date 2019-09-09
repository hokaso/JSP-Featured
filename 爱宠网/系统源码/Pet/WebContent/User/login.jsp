<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
	<title>Fullscreen Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
			<meta name="author" content="">

				<!-- CSS -->
				<link rel='stylesheet'
					href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'/>
					<link rel="stylesheet" href="../assets/css/reset.css"/>
						<link rel="stylesheet" href="../assets/css/supersized.css"/>
							<link rel="stylesheet" href="../assets/css/style.css"/>
</head>

<body>

	<div class="page-container">
		<h1>Login</h1>
		<form action="Member_login.action" method="post">

			<input type="text" name="member.account" class="username"
				placeholder="Account(the max is ten)" maxlength="10"/> <input type="password" name="member.pwd"
				class="password" placeholder="Password(the max is ten)" maxlength="10" />
  				<input type="text" name="checkcode" id="checkcodeID" maxlength="4" size="4"/>
  				<a href="javascript:void(0)" onClick="change()"><img src="image.jsp" width="98" height="31"  id="imgID"/></a>
                <a href="javascript:void(0)" onClick="change()">看不清，换一个</a>
                
  				 <span id="show"></span>
  				
			<button type="submit" id="submit" disabled="true">Sign me in</button>
			<button type="reset" name="submit">Reset</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>
	  <script>
  document.getElementById("checkcodeID").onkeyup = function() {
	var checkcode = this.value;
	// 去除空格
	checkcode = trim(checkcode);
	if (checkcode.length == 4) {
		// 获取ajax对象
		var ajax = createAjax();
		// 获取去空格的内容

		var method = "POST";
		var url = "http://localhost:8080/Pet/checkRequest_check.action?time="
				+ new Date().getTime();
		// 准备发送异步请求
		ajax.open(method, url);
		// 设置请求头POST提交方式才需要
		ajax.setRequestHeader("content-type",
				"application/x-www-form-urlencoded");
		// 拼接实体内容
		var content = "checkcode=" + checkcode;
		// 发送请求
		ajax.send(content);

		// 监听服务器状态变化
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				if (ajax.status == 200) {
					// 获取服务器内容
					var tip = ajax.responseText;
					// 获取图片路径 然后进行放入td中
					var img = document.createElement("img");
					img.src = tip;
					img.style.width = "14px";
					img.style.height = "14px";
					var td = document.getElementById("show");
					td.innerHTML = "";
					td.appendChild(img);
					document.getElementById("submit").disabled = false;
				}
			}
		}

	}

}  
  </script>
  <script language="javascript" src="../JS/scripts2.js"></script>
	<script src="../assets/js/jquery-1.8.2.min.js"></script>
	<script src="../assets/js/supersized.3.2.7.min.js"></script>
	<script src="../assets/js/supersized-init.js"></script>
	<script src="../assets/js/scripts2.js"></script>

</body>

</html>

