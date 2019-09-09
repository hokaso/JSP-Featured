<%@page import="Utiles.getAgeByBirth"%>
<%@page import="ServiceImpl.collegeServiceImpl"%>
<%@page import="Pojo.course"%>
<%@page import="java.util.List"%>
<%@page import="ServiceImpl.courseServiceImpl"%>
<%@page import="Mapper.courseMapper"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/course_show_all.css">
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="course_show_all">惠课</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  
 
      <form class="navbar-form navbar-left" style="margin-left: 25%" method="post" action="course_find_by_name">
        <div class="input-group">
       <span  class="input-group-addon">查询课程：</span> <input type="text" class="form-control"  name="course_name">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
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
         
        </li>
           
         <%}else
         {%>
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
         <%} %>
         </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
 

<div class="news-course-nav">
	<div class="detail1" >
		<h3>课程类别</h3>
		<span><a href="course_find_by_type?course_type=语文">语文</a></span>
		<span><a href="course_find_by_type?course_type=数学">数学</a></span>
		<span><a href="course_find_by_type?course_type=英语">英语</a></span>
		<span><a href="course_find_by_type?course_type=政治">政治</a></span>
		<span><a href="course_find_by_type?course_type=历史">历史</a></span>
		<span><a href="course_find_by_type?course_type=地理">地理</a></span>
		<span><a href="course_find_by_type?course_type=物理">物理</a></span>
		<span><a href="course_find_by_type?course_type=化学">化学</a></span>
		<span><a href="course_find_by_type?course_type=生物">生物</a></span>
	</div>
	<div style="float:right;width:88%">
<% 
ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
courseServiceImpl courseServiceImpl=(courseServiceImpl)ac.getBean("courseServiceImpl");
collegeServiceImpl collegeServiceImpl=(collegeServiceImpl)ac.getBean("collegeServiceImpl");

List<course> list=null;
if(request.getAttribute("list")==null)
{
	list=courseServiceImpl.course_show_all();
	}
else {
	list=(List<course>)request.getAttribute("list");
	}
for(int i=0;i<list.size();i++)
{
%>

 <div class="col-sm-4 col-md-3"  style="float:left;">
    <div class="thumbnail">
      <a href="course_show_details?course_id=<%=list.get(i).getCourse_id() %>">
      <img src="<%=list.get(i).getCourse_photo() %>" alt="..." style="height:100px;width:40%;">
      </a>
      
      <div class="caption">
        <h3><%=list.get(i).getCourse_name() %></h3>
        <p>课程类别：<%=list.get(i).getCourse_type() %></a></p>
       
        大学生订单数：<%=courseServiceImpl.course_find_sales(list.get(i).getCollege_id()) %>单&nbsp;
         <p>大学生id：<a href="college_details?college_id=<%=list.get(i).getCollege_id() %>"><%=list.get(i).getCollege_id() %></a></p>
         
        <p>大学生姓名：
        <%=collegeServiceImpl.college_find_by_id(list.get(i).getCollege_id()).getCollege_name() %>
        </p>
        
        <p>大学生性别：<%=collegeServiceImpl.college_find_by_id(list.get(i).getCollege_id()).getCollege_gender() %></p>
        <p>大学生年龄：<%=new  getAgeByBirth().getAgeByBirth(collegeServiceImpl.college_find_by_id(list.get(i).getCollege_id()).getCollege_birth()) %></p>
        <p><a href="course_show_details?course_id=<%=list.get(i).getCourse_id() %>" class="btn btn-primary" role="button" style="width:100%">查看详情/购买</a> </p>
        <a href="chat_check_login?college_id=<%=list.get(i).getCollege_id() %>"  <%if(session.getAttribute("junior")!=null){ out.print("target='_blank'");} %>  ><input type="button" value="与大学生联系" style="width:100%;" class="btn btn-success"></a>
      </div>
    </div>
  </div>




<%} %>
<div style="clear:both;"></div>
</div>
<div style="clear:both;"></div>

</div>







</body>
</html>