<%@page import="ServiceImpl.teachServiceImpl"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="Pojo.college"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Pojo.course"%>
<%@page import="java.util.List"%>
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
      <a class="navbar-brand" href="">惠课</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%
         if(session.getAttribute("college")!=null)
         {
	String college_id=(String)session.getAttribute("college");
          %>
      <ul class="nav navbar-nav navbar-right">
         <li>
       <a href="chat_online_college1">查看聊天</a>
      </li>
        <li>
       <a href="exit">注销</a>
      </li>
      <li>
       <a href="college_course_upload">上传课程</a>
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
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- 该页面显示该大学生所有的课程订单的情况 -->
<a href="college_excel_controller">
<input type="button" class="btn btn-success" value="生成Excel报表"></a>
<div class="container-fluid">
<table class="table table-hover">
<tr>
<th>课程号</th>
<th>课程类别</th>
<th>课程名称</th>
<th>课程时间</th>
<th>课程状态</th>
<th>查看</th>
</tr>

<% 
if(request.getAttribute("list")!=null)
{
	ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
	teachServiceImpl teachServiceImpl=(teachServiceImpl)ac.getBean("teachServiceImpl");
	
	List<course> list=(List<course>)request.getAttribute("list");

	
	for(int i=0;i<list.size();i++)
	{
		course course=list.get(i);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<tr>
<td><%=course.getCourse_id() %></td>
<td><%=course.getCourse_type() %></td>
<td><%=course.getCourse_name() %></td>
<td><%=sdf.format(course.getCourse_time())%></td>
<td><%=course.getCourse_statue()%>
<%if(course.getCourse_statue().equals("已被购买")){ %>
(<%=teachServiceImpl.teach_find_by_course_id(course.getCourse_id()).getTeach_statue() %>)</td>
<%} %>
<%if(course.getCourse_statue().equals("已被购买")){ %>
<td><a href="college_order_details?course_id=<%=course.getCourse_id() %>">查看订单详情</a></td>
<%} else if(course.getCourse_statue().equals("未被购买")){%>

<td><a href="college_course_details?course_id=<%=course.getCourse_id() %>">查看课程详情</a>/<a href="course_update_information1?course_id=<%=course.getCourse_id()%>">修改</a></td>

<%} %>
</tr>

<%}
	}%>

</table>

	</div>

</body>
</html>