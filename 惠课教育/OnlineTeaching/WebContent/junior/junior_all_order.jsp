<%@page import="Pojo.teach"%>
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
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
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



<%if(session.getAttribute("junior")!=null){ %>
<a href="junior_excel_controller">
<input type="button" class="btn btn-success" value="生成Excel报表">
</a> 
<%} %>

  <table class="table table-hover">
  <tr>
  <th>订单号</th>
  <th>课程号</th>
  <th>大学生ID</th>
  <th>课程状态</th>
  <th>评分状态</th>
  </tr>
  
 


  
<% 
if(request.getAttribute("list")!=null)
{
List<teach> list=(List<teach>)request.getAttribute("list");

for(int i=0;i<list.size();i++)
{
	teach teach=list.get(i);
%>

<tr><td><%=teach.getTeach_id() %></td>
<td><a href="course_show_details?course_id=<%=teach.getCourse_id() %>"><%=teach.getCourse_id() %></a></td>
<td><a href="college_details?college_id=<%=teach.getCollege_id() %>"><%=teach.getCollege_id() %></a></td>
<td><%=teach.getTeach_statue() %></td>


<%if(teach.getScore_statue()==null){ %>
<td>未开启</td></tr>
<%}
else if(teach.getScore_statue().equals("未评分")){%>
<td>未评分，<a href="junior_score?teach_id=<%=teach.getTeach_id() %>">点击链接去评分</a></td></tr>
<%}else if(teach.getScore_statue().equals("已评分")) {%>
<td>已评分(<%=teach.getCollege_score() %>分)</td></tr>
<%}} }
else if(request.getAttribute("list")==null)
{%>
订单为空，请<a href="course_show_all">返回</a>
<%} %>

   </table>

</body>
</html>