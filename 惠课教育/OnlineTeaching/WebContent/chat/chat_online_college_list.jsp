<%@page import="Pojo.chatPojo"%>
<%@page import="WebSocket.chat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="refresh" content="3">
<title>Insert title here</title>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
</head>
<body>
<%List<chatPojo> list=(List<chatPojo>)request.getAttribute("list"); %>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="college_check_order">惠课</a>
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
<div class="container-fluid">
<table class="table table-hover">

<tr>
<th>中小学生id</th>
<th>聊天状态</th>
<th>进入聊天</th>
</tr>

<%for(int i=0;i<list.size();i++){ %>
<tr>
<td><%=list.get(i).getJunior_id() %></td>
<td><%=list.get(i).getStatus() %></td>
<td><a href="chat_online_college2?junior_id=<%=list.get(i).getJunior_id() %>" target="_blank"><input type="button" value="chat" class="btn btn-success"></a></td>
</tr>
<%} %>

</table>
</div>
</body>
</html>