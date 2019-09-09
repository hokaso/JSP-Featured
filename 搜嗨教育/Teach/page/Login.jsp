<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript" src="../js/login.js"></script>
<script type="text/javascript" src="../js/login_check.js"></script>
</head>
<body id="style3">
	<div >
	<div class="login-header">
        <span class="h1">嗨嗖教育</span>
        <span class="mingyan">成功从此刻开始</span>
    </div>
	<div id="loopDiv">
       <div id="img1"><img src="HTML/img1.jpg" alt="产品图片" id="pic" width="100%" height="100%"></div>
        <ul id="list">
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>6</li>
            <li>7</li>
            <li>8</li>
        </ul>
        <div id="left" class="chooseBut"><</div>
        <div id="right" class="chooseBut">></div>
    </div>
    <div style="border: 0px solid; width: 390px;height: 500px; box-shadow: #1E90FF 10px 10px 30px 5px; background-color: #F5F5F5;" id="style1"><br><br>
		<div><div align="center"><a href="" class="tital1" id="but1">登录</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="../page/Register.html" class="tital1" id="but2">注册</a></div></div><br><br><br><br>
		
		<div><div align="center" style="color: #00BFFF">账户：<input type="text" value="" size="20" placeholder="请输入你的账号" style="width: 180px;height: 30px" class="text" name="phoneNum" id="account"></div></div><br>
		<div><div align="center" style="color: #00BFFF">密码：<input type="password" value="" size="20" placeholder="请输入你的密码" style="width: 180px;height: 30px" class="text" name="pwd" id="password"></div></div><br><br>
		<span id="result"></span>
		<div><div align="center"><input type="button" value="登录" style="font-size: 20px; color: #FFFFFF;background-color: #00BFFF;width: 250px; height: 31px " class="text" onclick="login_check()"></div></div>
		
		</div>
		</div>
    
</body>
</html>