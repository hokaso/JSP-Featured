<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Pojo.junior"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
<script type="text/javascript" src="/OnlineTeaching/js/check_junior.js"></script>
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


<%
junior junior= (junior)request.getAttribute("junior");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

%>


<form action="junior_update_information2" method="post">
<table class="table table-hover" style="width:100%">
   <input type="text" name="junior_id" value="<%=junior.getJunior_id() %>" style="display: none;">
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">姓名：(2-10位)</span>
            <input type="text"  id="junior_name" name="junior_name" class="form-control" value="<%=junior.getJunior_name() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">性别:</span>
            <select name="junior_gender" class="form-control">
          <option value="男" <%if(junior.getJunior_gender().equals("男")){out.print("selected='selected'");} %>>男</option>
          <option value="女" <%if(junior.getJunior_gender().equals("女")){out.print("selected='selected'");} %>>女</option>
            </select>
        </div>
    </td></tr>

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">出生日期</span>
           <input type="date" value="<%=sdf.format(junior.getJunior_birth())  %>" name="junior_birth" class="form-control" value=""  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">联系电话：</span>
            <input type="text"  name="junior_phone" id="junior_phone" class="form-control" value="<%=junior.getJunior_phone() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
    
 <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址(10-25位)</span>
            <input type="text" id="junior_address" name="junior_address" class="form-control" value="<%=junior.getJunior_address() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>

    <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
        <input type="reset" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="重置">
         <input type="submit" style="width: 20%" class="btn btn-danger" value="更新" onclick="return check_junior_update()">
        </div> 
    </td></tr>

</table>
</form>
</body>
</html>