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
<script type="text/javascript" src="/OnlineTeaching/js/junior_update_password.js"></script>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="course_show_all">惠课</a>
    </div>
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
        </li>

         <%}else
         {%>
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
         <%} %>
         </ul>
         </ul>
    </div>
  </div>
</nav>

<table class="table table-hover" style="width:100%">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 25%">
            <span class="input-group-addon" id="basic-addon1">原密码</span>
            <input type="password"  id="before_password" class="form-control"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 25%">
            <span class="input-group-addon" id="basic-addon1">新密码(6-10位)</span>
            <input type="password"  id="after_password" class="form-control"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
        <input type="button" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="提交" onclick="return check_after_password()">
         <input type="button" style="width: 20%" class="btn btn-danger" value="返回"></a>
        </div> 
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 35%">
        
<span id="span_result" style="font-size: 20px"></span>
               </div> 
    </td></tr>
    
</table>
</body>
</html>