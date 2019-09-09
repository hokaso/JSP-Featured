<%@page import="bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeacherRegister</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<link rel="stylesheet" type="text/css" href="../css/TeacherRegister.css">
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../js/TeacherRegister.js"></script>
</head>
<body>
<%
	Student student = (Student)session.getAttribute("student");
%>
	<header class="header clear-fix">
		<img src="../img/back.png" alt="">
		<h2>申请教师</h2>
	</header>
	<div class="imformation">
		<span>基本信息</span>
	</div>
	<section class="section clear-fix">
	<form action="../register/TeacherRegister" id="form1" method="post" enctype="multipart/form-data">
		<div class="section-left">
		
			<div class="section-left-nav clear-fix">
				<div class="section-left-item" id="num1">
					<img src="../img/phone.png" alt="" class="phone-img">
					<input type="text" placeholder="电话号码/Phone" value="<%=student.getSno() %>" class="phone" name="teacher.tno">
					<img src="../img/mistake.png" alt="" class="config-img">
				</div>
				<span class="config-text1 remind">手机号码格式错误</span>
			</div>
			<div class="section-left-nav clear-fix">
				<div class="section-left-item">
					<img src="../img/name.png" alt="" class="name-img">
					<input type="text" placeholder="昵称/Name" value="<%=student.getSname() %>" class="name" maxlength="20" name="teacher.tname">
					<img src="../img/mistake.png" alt="" class="config-img">
				</div>
				<span class="config-text2 remind">昵称的长度不能超过20</span>
			</div>	
			<div class="section-left-nav clear-fix">
				<div class="section-left-item">
					<img src="../img/password.png" alt="" class="password-img">
					<input type="password" placeholder="密码/Password" value="<%=student.getSpassword() %>" class="password" maxlength="20" name="teacher.tpassword">
					<img src="../img/mistake.png" alt="" class="config-img">
				</div>
				<span class="config-text3 remind">密码长度不能超过20</span>
			</div>	
			
			<div class="section-left-nav clear-fix">
				<div class="section-left-item">
					<label for="" class="label">性别/sex：</label>
					<label  class="label-sex"><input type="radio" <%if(student.getSsex().equals("男")){out.print("checked='checked'");} %> name="teacher.tsex" value="男"><span></span>男</label>
					<label class="label-sex"><input type="radio" <%if(student.getSsex().equals("女")){out.print("checked='checked'");} %> name="teacher.tsex" value="女"><span></span>女</label>
					<img src="../img/mistake.png" alt="" class="config-img" id="mistake-img">
				</div>
				<span class="config-text5 remind">请选择男或女</span>
			</div>	
			<div class="section-left-nav clear-fix">
				<div class="section-left-item">
					<img src="../img/email.png" alt="" class="email-img">
					<input type="text" placeholder="邮箱/Email" value="<%=student.getSmail() %>" class="email" name="teacher.temail">
					<img src="../img/mistake.png" alt="" class="config-img">
				</div>
				<span class="config-text6 remind">邮箱格式不正确</span>
			</div>	
			
				<div class="section-left-bottom">
					<input type="button" value="同意协议并注册 / Submit" class="register-submit">
					<div >
						<span><a href="">《嗨嗖教育规定》</a> <a href="http://www.cac.gov.cn/2015-02/04/c_1114246561.htm">《互联网用户账号规定》</a></span>
					
					</div>
					
				</div>
			
		</div>
		<div class="section-right">
			
			<div class="section-right-mid">
				<img src="../img/back.png" alt="">
			</div>
			<div class="section-right-bottom">
				<span class="question" id='shangchuan'>上传材料</span>
				<span class="question"><input type="file" id="files" name="upload"></span></span>
			</div>
		</div>
		</form>
	</section>
	<footer class="footer">
		<div class="copyright">
            <p>
                &copyright
                <a href="#">嗨嗖教育1.0 </a>haisou.com
                <a href="#">京ICP证070791号</a>
                <a href="#">京ICP备01210001</a>
                <a href="#">京ICP备01210001教育服务规则</a>
            </p>
            <div >
                <a href="#">广播电视台许可证（京）字第02121号</a>
                <a href="#"><img src="../img/wanan.png" alt="">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
</body>
</html>