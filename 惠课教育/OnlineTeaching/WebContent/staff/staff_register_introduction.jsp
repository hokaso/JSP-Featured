<%@page import="Utiles.getAgeByBirth"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="ServiceImpl.collegeServiceImpl"%>
<%@page import="Service.collegeService"%>
<%@page import="Pojo.college"%>
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
         if(session.getAttribute("staff")!=null)
         {
	
          %>
      <ul class="nav navbar-nav navbar-right">
        <li>
       <a href="exit">注销</a>
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


<!-- 审核某大学生的页面 -->
<%
ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
collegeServiceImpl csi=(collegeServiceImpl)ac.getBean("collegeServiceImpl");
if(request.getParameter("college_id")!=null)
{
String college_id=request.getParameter("college_id");
college college=csi.college_find_by_id(college_id);
String id=college.getCollege_id();

%>

<table class="table table-hover" style="width:100%">



    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">账号：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=id%>" aria-describedby="basic-addon1">
        </div>
    </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">姓名：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_name() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>

  <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">性别：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_gender() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">年龄：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=new getAgeByBirth().getAgeByBirth(college.getCollege_birth()) %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">号码：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_phone() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>

 <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址：</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_address() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">学生证照片：</span>
          <img src="<%=college.getCollege_photo() %>" width="70%">
               </div>
    </td></tr>
    
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
          <a href="update_college_statue?college_id=<%=id %>&college_statue=1"><input type="button" style="width:30%" class="btn btn-success" value="通过"></a> 
          <a href="update_college_statue?college_id=<%=id %>&college_statue=2"><input type="button" style="width:30%"  class="btn btn-primary" value="不通过"></a>
<%}%>
        <a href="check_all_college"><input class="btn btn-danger" style="width:30%"  type="button" value="返回"></a>
               </div>
    </td></tr>





</table>
</body>
</html>