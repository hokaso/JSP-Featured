<%@page import="Utiles.getAgeByBirth"%>
<%@page import="Pojo.course"%>
<%@page import="Pojo.junior"%>
<%@page import="ServiceImpl.courseServiceImpl"%>
<%@page import="ServiceImpl.juniorServiceImpl"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="Pojo.teach"%>
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
      <a class="navbar-brand" href="college_check_order">惠课</a>
    </div>

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
      
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人修改 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="college_update_information1">修改个人信息</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="college_update_password">修改密码</a></li>
            </li>
          </ul> 
        <%}else{%>
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
         <%} %>
         </ul>
    </div>
  </div>
</nav>

<% 
ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
juniorServiceImpl js=(juniorServiceImpl)ac.getBean("juniorServiceImpl");
courseServiceImpl cs=(courseServiceImpl)ac.getBean("courseServiceImpl");

if(request.getAttribute("teach")!=null)
{
teach teach=(teach)request.getAttribute("teach");
junior junior=js.junior_find_by_id(teach.getJunior_id());
course course=cs.course_find_by_id(teach.getCourse_id());
%>

<table class="table table-hover" style="width:100%">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">订单编号:</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=teach.getTeach_id() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">学生id(点击查看详情):</span>
           <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
					 <input type="text" readonly="readonly" class="form-control" value="<%=teach.getJunior_id() %>" aria-describedby="basic-addon1">
           </a>
         </div> 
     </td></tr>
     
       
         <div id="collapseOne" class="accordion-body collapse" >
					
			 <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">学生姓名:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=junior.getJunior_name() %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">学生性别:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=junior.getJunior_gender() %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">学生年纪:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=new getAgeByBirth().getAgeByBirth(junior.getJunior_birth()) %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">学生号码:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=junior.getJunior_phone()%>" aria-describedby="basic-addon1">
             </div>
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">学生地址:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=junior.getJunior_address() %>" aria-describedby="basic-addon1">
             </div>
                  
		 </div>
		
     
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程id(点击查看详情):</span>
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" >
            <input type="text" readonly="readonly" class="form-control" value="<%=teach.getCourse_id()%>" aria-describedby="basic-addon1">
       </a>
        </div>
    </td></tr>
    
    
    <div id="collapseTwo" class="accordion-body collapse" >
					
			 <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">课程名称:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_name()%>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">课程价格:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_price() %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">课程状态:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_statue() %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">课程介绍:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_intro()%>" aria-describedby="basic-addon1">
             </div>
           
                  
		 </div>
    
    
    

 <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">授课状态</span>
            <input type="text" readonly="readonly" class="form-control" value="<%=teach.getTeach_statue() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>

<%
 if(teach.getTeach_statue().equals("未授课")) 
 {
	
 %> 

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">

         <a href="teach_teach?teach_id=<%=teach.getTeach_id() %>"><input type="button" value="授课" class="btn btn-success" style="width: 100%;margin-right: 10%"></a>
      </div> 
    </td></tr>
<%} }%>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
          <a href="college_check_order"><input type="button" style="width: 100%" class="btn btn-danger" value="返回"></a>
        </div> 
    </td></tr>
</table>
</body>
</html>