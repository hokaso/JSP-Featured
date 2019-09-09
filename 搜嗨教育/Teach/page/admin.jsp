<%@page import="bean.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
<link rel="stylesheet" type="text/css" href="../css/index.css">
	<link rel="stylesheet" type="text/css" href="../css/admin.css">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">  
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="../js/admin.js"></script>
</head>
<body>
<%
List<Teacher> teachers = (List<Teacher>)request.getAttribute("teachers");
%>
<header class="header clear-fix">
		<div class="header-left">
			<span class="haisou">HaiShow</span>
			<span class="data-admin">后台数据管理</span>
		</div>
		<div class="header-right">
			<img src="../img/admins.png" alt="">
			<span class="admin">admin</span>
			<span class="exist"><a href="#">退出</a></span>
		</div>
	</header>
	<div class="section clear-fix">
		<div class="section-left">
			<div class="section-left-top">
				<span class="arrow"><span>></span></span>
				<span class="section-left-top-txt">Admin source</span>
			</div>
			<div class="section-left-main">
				<ul class="section-left-nav">
					<li class="section-left-nav-item">
						<div class="teach">
							<img src="../img/笔记.png" alt="">
							<span>教师申请列表</span>
						</div>
						
					</li>
					<li class="section-left-nav-item">
						<div class="teach">
							<img src="../img/笔记.png" alt="">
							<span>数据统计</span>
						</div>
					
				</ul>
			</div>
		</div>
		<div class="section-right">
			<div class="section-right-top">
				<span class="section-right-top-txt">教师申请列表</span>
				<div id="unline"></div>
			</div>
			<div class="section-right-table">
				<table class="table">
				   <thead>
				      <tr>
				         <th>编号</th>
				         <th>名称</th>
						  <th>性别</th>
				         <th>密码</th>
				         <th>文件</th>
				         <th>注册时间</th>
				         <th>邮箱</th>
				         <th>是否通过</th>
				      </tr>
				   </thead>
				   <tbody>
				   <%
				   	for(int i=0;i<teachers.size();i++){
				   %>
				      <tr>
				         <td><%=teachers.get(i).getTno() %></td>
				         <td><%=teachers.get(i).getTname() %></td>
						 <td><%=teachers.get(i).getTsex() %></td>
				         <td><%=teachers.get(i).getTpassword() %></td>
				         <td><a href="/video/<%=teachers.get(i).getTphone() %>"><%=teachers.get(i).getTphone() %></a> </td>
				         <td><%=teachers.get(i).getTregisterTime() %></td>
						 <td><%=teachers.get(i).getTemail() %></td>
				         <td><input type="checkbox" value="<%=teachers.get(i).getTno() %>" name="tno" id="tno<%=i%>"></td>
				      </tr>
				      <%} %>   
				   </tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>