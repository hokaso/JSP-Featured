<%@page import="Pojo.college"%>
<%@page import="java.util.List"%>
<%@page import="ServiceImpl.staffServiceImpl"%>
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
         if(session.getAttribute("staff")!=null)
         {
	
          %>
      <ul class="nav navbar-nav navbar-right">
        <li>
       <a href="exit">注销</a>
      </li>
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

<!-- 显示所有注册账号的大学生 -->

<table class="table table-hover">
<th>大学生id</th>
<th>状态</th>
<th>详情</th>

<%
if(request.getAttribute("list")==null)
{
	response.sendRedirect("check_all_college");
}
else
{
	
List<college> list=(List<college>)request.getAttribute("list");

for(int i=0;i<list.size();i++)
{
	%>
	
	<tr>
	<td><%=list.get(i).getCollege_id() %></td>
	
	<td>

	<%
	if(list.get(i).getCollege_statue()==0)
	{
		out.print("待审核");
	
	
	%>
	
	</td>
	
	<td><a href="staff_register_introduction?college_id=<%=list.get(i).getCollege_id() %>">查看</a></td>
	
	<%}else if(list.get(i).getCollege_statue()==2)
	{
		out.print("先前不通过，待重新审核");
	%>
	
	
	<td>待重新上传</td>
	
	<%
	
	} %>
	</tr>
	<%
	
}
}
%>
</table>
</body>
</html>