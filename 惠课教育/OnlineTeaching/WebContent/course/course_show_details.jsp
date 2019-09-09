<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Pojo.course"%>
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
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
   
      </button>
      <a class="navbar-brand" href="course_show_all">惠课</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  
            <%
         if(session.getAttribute("junior")!=null)
         {
	String junior_id=(String)session.getAttribute("junior");
          %>
      <ul class="nav navbar-nav navbar-right">
       <li>
       <a href="exit">注销</a>
      </li>
        <li>
       <a href="junior_check_order">查看我的订单</a>
      </li>
      
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人修改 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="junior_update_information1">修改个人信息</a></li>

            <li role="separator" class="divider"></li>
            <li><a href="junior_update_password">修改密码</a></li>
          </ul>
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



<!-- 显示某一课程的详情 -->
<% 
course course=(course)request.getAttribute("course");
%>
<table class="table table-hover">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程ID:</span>
            <input type="text" class="form-control" placeholder="Username" readonly="readonly" aria-describedby="basic-addon1" value="<%=course.getCourse_id() %>">
        </div>
    </td></tr>
    
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程名称:</span>
            <input type="text" class="form-control" readonly="readonly" placeholder="Username" aria-describedby="basic-addon1" value="<%=course.getCourse_name() %>">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">上课时间：</span>
            <input type="text" class="form-control" readonly="readonly" placeholder="Username" aria-describedby="basic-addon1" 
            value="<%SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
             out.print(sdf.format(course.getCourse_time()));%>">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程价格:</span>
            <input type="text" class="form-control" readonly="readonly" placeholder="Username" aria-describedby="basic-addon1" value="<%=course.getCourse_price()%>">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1"> 课程介绍：</span>
            <input type="text" class="form-control" readonly="readonly" placeholder="Username" aria-describedby="basic-addon1" value="<%=course.getCourse_intro() %>">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1"> 大学生ID：</span>
    <input type="text" readonly="readonly" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="<%=course.getCollege_id() %>">
      
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1"> 课程图片:</span>
            <img src="<%=course.getCourse_photo() %>" width="60%" >
              </div>
    </td></tr>
     <tr><td>
        <div class="input-group" style="width: 100%; left: 20%">
        
     <% 
 if(session.getAttribute("junior")!=null)
 {
	 if(course.getCourse_statue().equals("未被购买"))
	 {
 %>

<a href="teach_buy?course_id=<%=course.getCourse_id() %>&course_price=<%=course.getCourse_price() %>"><input type="button" style="width: 20%;margin-right: 10%" class="btn btn-success" value="购买"></a>

	<% 
	}
	 %>
	 
	 <a href="course_show_all"><input type="button" value="返回" class="btn btn-danger" style="width: 20%">
	 <%
	 
}else{
%>
 <a href="course_show_all"><input type="button" value="返回" class="btn btn-danger" style="width: 50%">
	
<%} %>
</div></td></tr>

</table>

</body>
</html>