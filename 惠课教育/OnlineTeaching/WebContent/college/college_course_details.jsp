<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Utiles.TimeToString"%>
<%@page import="Utiles.getAgeByBirth"%>
<%@page import="Pojo.course"%>
<%@page import="Pojo.junior"%>
<%@page import="ServiceImpl.courseServiceImpl"%>
<%@page import="ServiceImpl.juniorServiceImpl"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="Pojo.teach"%>
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
        <%}else{%>
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
         <%} %>
         </ul>
    </div>
  </div>
</nav>

<% 
if(request.getAttribute("course")!=null)
{
course course=(course)request.getAttribute("course");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>

<table class="table table-hover" style="width:100%">

    
     
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程id</span>
            <a class="accordion-toggle" data-toggle="collapse"  >
            <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_id()%>" aria-describedby="basic-addon1">
       </a>
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程名称</span>
            <a class="accordion-toggle" data-toggle="collapse"  >
            <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_name()%>" aria-describedby="basic-addon1">
       </a>
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程介绍</span>
            <a class="accordion-toggle" data-toggle="collapse"  >
            <input type="textarea" readonly="readonly" class="form-control" value="<%=course.getCourse_intro()%>" aria-describedby="basic-addon1">
       </a>
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">上课时间</span>
            <a class="accordion-toggle" data-toggle="collapse"  >
            <input type="text" readonly="readonly" class="form-control" value="<%=sdf.format(course.getCourse_time())%>" aria-describedby="basic-addon1">
       </a>
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程价格</span>
            <a class="accordion-toggle" data-toggle="collapse"  >
            <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_price()%>" aria-describedby="basic-addon1">
       </a>
        </div>
     </td></tr>


     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1"> 课程图片:</span>
            <img src="<%=course.getCourse_photo() %>" width="60%" height="60%" >
              </div>
     </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
          <a href="college_check_order"><input type="button" style="width: 35%;margin-right: 30%;" class="btn btn-danger" value="返回"></a>
        <a href="course_update_information1?course_id=<%=course.getCourse_id() %>"><input type="button" style="width:35%" class="btn btn-success" value="修改"></a>
      
        </div> 
    </td></tr>
    
</table>
<%} %>
</body>
</html>