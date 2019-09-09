<%@page import="Utiles.getAgeByBirth"%>
<%@page import="Pojo.college"%>
<%@page import="ServiceImpl.collegeServiceImpl"%>
<%@page import="Pojo.course"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="ServiceImpl.courseServiceImpl"%>
<%@page import="Pojo.teach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
<script type="text/javascript">

function check(){
	var score=document.getElementById("college_score").value;
	if(score>100||score<1)
		{
		alert("分数只能在1~100之间");
		return false;
		}else
			{
			return true;
			}
}

</script>
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
            ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
       	 courseServiceImpl cs=(courseServiceImpl)ac.getBean("courseServiceImpl");
    		collegeServiceImpl cls=(collegeServiceImpl)ac.getBean("collegeServiceImpl");
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
<%
teach teach=(teach)request.getAttribute("teach");
course course=cs.course_find_by_id(teach.getCourse_id());
college college=cls.college_find_by_id(teach.getCollege_id());
%>
<form action="junior_update_score" method="post">
<table class="table table-hover" style="width:100%">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">订单编号</span>
            <input type="text" readonly="readonly" name="teach_id" class="form-control" value="<%=teach.getTeach_id() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">学生id(点击查看详情)</span>
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" >
            <input type="text" readonly="readonly" class="form-control" value="<%=teach.getJunior_id() %>"  aria-describedby="basic-addon1">
        </a>
        </div>
    </td></tr>
    
    
    <div id="collapseOne" class="accordion-body collapse" >
					
			 <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">大学生名称:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_name()%>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">大学生性别:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_gender() %>" aria-describedby="basic-addon1">
             </div> 
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">大学生年龄:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=new getAgeByBirth().getAgeByBirth(college.getCollege_birth()) %>" aria-describedby="basic-addon1">
             </div>
             
             <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">大学生号码:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_phone() %>" aria-describedby="basic-addon1">
             </div>
     
      <div class="input-group" style="width: 50%; left: 20.5%">
               <span class="input-group-addon" id="basic-addon1">大学生地址:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=college.getCollege_address() %>" aria-describedby="basic-addon1">
             </div>
		 </div>    
    

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程id(点击查看详情)</span>
             <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" >
            <input type="text" readonly="readonly" class="form-control" value="<%=teach.getCourse_id()%>"  aria-describedby="basic-addon1">
        </a>
        </div>
    </td></tr>
    
    
<!--     这里显示课程详细 -->
    
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
               <span class="input-group-addon" id="basic-addon1">课程介绍:</span>
			   <input type="text" readonly="readonly" class="form-control" value="<%=course.getCourse_intro()%>" aria-describedby="basic-addon1">
             </div>
     
		 </div>
    
    
    
    
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">授课状态</span>
            <input type="text"  readonly="readonly" class="form-control" value="<%=teach.getTeach_statue() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
 <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">请输入分数(1-100)</span>
            <input type="text" id="college_score" required="required" class="form-control" name="college_score"  aria-describedby="basic-addon1">
        </div>
    </td></tr>

    <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
        <input type="submit" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="提交分数" onclick="return check()">
          <a href="junior_check_order"><input type="button" style="width: 20%" class="btn btn-danger" value="返回"></a>
        </div> 
    </td></tr>

</table>
</form>
</body>
</html>