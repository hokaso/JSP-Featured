<%@page import="Pojo.college"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
<body>
<%
college college=(college)request.getAttribute("college");
int score=(int)request.getAttribute("score");
%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="course_show_all">惠课</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%
         if(session.getAttribute("junior")!=null)
         {
	String college_id=(String)session.getAttribute("college");
          %>
      <ul class="nav navbar-nav navbar-right">
       <li>
       <a href="exit">注销</a>
      </li>
        <li>
       <a href="junior_check_order">查看我的订单</a>
      </li>
       
      <li>
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
    </div>
  </div>
</nav>


<form action="college_update_information2" method="post">
<table class="table table-hover" style="width:100%">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">大学生姓名</span>
            <input type="text" readonly="readonly" college_name" name="college_name" class="form-control" value="<%=college.getCollege_name() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">大学生姓别</span>
            <input type="text" readonly="readonly" college_name" name="college_gender" class="form-control" value="<%=college.getCollege_gender()%>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
   

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">联系电话：</span>
            <input type="text" readonly="readonly" class="form-control" id="college_phone" value="<%=college.getCollege_phone() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
   
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址：</span>
            <input type="text" readonly="readonly" class="form-control"value="<%=college.getCollege_address() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">平均分：</span>
            <%
            if(score==0)
            {
            %>
            <input type="text" readonly="readonly" class="form-control"value="该大学生还没有被评分"  aria-describedby="basic-addon1">
       <%}else{ %>
         <input type="text" readonly="readonly" class="form-control"value="<%=score%>"  aria-describedby="basic-addon1">
       <%} %>
        </div>
    </td></tr>
   
    <tr><td>
        <div class="input-group" style="width: 50%; left: 25%">
        <a href="course_show_all"> <input type="button" style="width: 75%" class="btn btn-success" value="返回"></a>
        </div> 
    </td></tr>

</table>
</form>

</body>
</html>