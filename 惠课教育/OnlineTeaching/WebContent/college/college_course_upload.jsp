<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/OnlineTeaching/js/check_course.js"></script>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="college_check_order">惠课</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%
         if(session.getAttribute("college")!=null)
         {
	String college_id=(String)session.getAttribute("college");
          %>
      <ul class="nav navbar-nav navbar-right">
        <li>
       <a href="exit">注销</a>
      </li>
       <li>
       <a href="college_check_order">查看我的课程</a>
      </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人修改 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="college_update_information1">修改个人信息</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="college_update_password">修改密码</a></li>
        </li>
      
           </ul> 
         <%}else
         {%>
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
      
         <%} %>
         </ul>
    </div>
  </div>
</nav>

<% if(session.getAttribute("college")!=null){%>


<form action="course_add" method="post" enctype="multipart/form-data">
<table class="table table-hover">

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程名称:</span>
            <input type="text"  required="required" name="course_name" id="course_type" class="form-control" aria-describedby="basic-addon1" >
        </div>
     </td></tr>
     
        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程类别:</span>
            <select name="course_type" class="form-control" required="required">
							<option value="语文">语文</option>
							<option value="数学">数学</option>
							<option value="英语">英语</option>
							<option value="政治">政治</option>
							<option value="地理">地理</option>
							<option value="生物">生物</option>
							<option value="历史">历史</option>
							<option value="物理">物理</option>
							<option value="化学">化学</option>
						</select>
        </div>
     </td></tr>


    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">授课日期</span>
           <input type="date"   required="required" name="course_time" class="form-control" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">介绍(50字内)：</span>
            <input type="text"  id="course_intro" required="required" name="course_intro" class="form-control" aria-describedby="basic-addon1" >
        </div>
    </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">价格(10-50每小时)：</span>
            <input type="text"  required="required" name="course_price" id="course_price" class="form-control" aria-describedby="basic-addon1" >
        </div>
     </td></tr>

        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">图片:</span>
          <input type="file" name="file" required="required" class="form-control" aria-describedby="basic-addon1" > </div>
        </td></tr>

        <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
        <input type="submit" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="提交" onclick="return check_all()">
        <a href="college_check_order"> <input type="button" style="width: 20%" class="btn btn-danger" value="返回"></a>
        </div> 
    </td></tr>
    
</table>
</form>
<%} %>
</body>
</html>