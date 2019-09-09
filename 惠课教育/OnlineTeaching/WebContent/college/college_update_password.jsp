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
<script type="text/javascript" src="/OnlineTeaching/js/college_update_password.js"></script>

<body>


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
       <a href="exit">注销</a>
      </li>
        <li>
       <a href="college_check_order">查看我的课程</a>
      </li>
      
      <li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人修改 <span class="caret"></span></a>
          <ul class="dropdown-menu">

              <li><a href="college_update_information1">修改个人信息</a></li>
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


<span style="font-size: 20px;">大学生修改密码</span>


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
        <a href="college_check_order"> <input type="button" style="width: 20%" class="btn btn-danger" value="返回"></a>
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