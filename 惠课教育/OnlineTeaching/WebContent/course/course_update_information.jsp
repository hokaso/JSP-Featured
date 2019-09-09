<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Pojo.course"%>
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
<script type="text/javascript" src="/OnlineTeaching/js/check_course.js"></script>
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

<% if(session.getAttribute("college")!=null){

	if(request.getAttribute("course")!=null)
	{
		
	course course=(course)request.getAttribute("course");
	String course_name=course.getCourse_name();
	String course_type=course.getCourse_type();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>


<form action="course_update_information2" method="post" enctype="multipart/form-data">
<table class="table table-hover">
   <input type="text" name="course_id" value="<%=course.getCourse_id() %>" style="display:none;">
    <input type="text" name="college_id" value="<%=course.getCollege_id() %>" style="display:none;">
    <input type="text" name="course_statue" value="<%=course.getCourse_statue() %>"  style="display:none;">
     <tr><td>
         <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程类别:</span>
            <select name="course_type" class="form-control" required="required">
							<option value="语文" <%if(course_type.equals("语文")){out.print("selected='selected'");} %>>语文</option>
							<option value="数学" <%if(course_type.equals("数学")){out.print("selected='selected'");} %>>数学</option>
							<option value="英语" <%if(course_type.equals("英语")){out.print("selected='selected'");} %>>英语</option>
							<option value="政治" <%if(course_type.equals("政治")){out.print("selected='selected'");} %>>政治</option>
							<option value="地理" <%if(course_type.equals("地理")){out.print("selected='selected'");} %>>地理</option>
							<option value="生物" <%if(course_type.equals("生物")){out.print("selected='selected'");} %>>生物</option>
							<option value="历史" <%if(course_type.equals("历史")){out.print("selected='selected'");} %>>历史</option>
							<option value="物理" <%if(course_type.equals("物理")){out.print("selected='selected'");} %>>物理</option>
							<option value="化学" <%if(course_type.equals("化学")){out.print("selected='selected'");} %>>化学</option>
						</select>
        </div>
     </td></tr>


    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">课程名称</span>
           <input type="text"   name="course_name" value="<%=course_name %>" required="required" class="form-control" aria-describedby="basic-addon1">
        </div>
    </td></tr>

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">授课日期</span>
           <input type="date"   name="course_time" value="<%=sdf.format(course.getCourse_time()) %>" class="form-control" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">介绍(50字内)：</span>
            <input type="text" id="course_intro"  value="<%=course.getCourse_intro() %>"required="required" name="course_intro" class="form-control" aria-describedby="basic-addon1" >
        </div>
        </td></tr>


        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">价格(10-50每小时)：</span>
            <input type="text" id="course_price" value="<%=course.getCourse_price() %>"required="required" name="course_price" class="form-control" aria-describedby="basic-addon1" >
        </div>
        </td></tr>

        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">图片:(上传空则不修改)</span>
          <input type="file" name="file"  class="form-control" aria-describedby="basic-addon1" ><img src="<%=course.getCourse_photo() %>" style="width:50%;height:50%"> </div>
        </td></tr>

        <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
        <input type="submit" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="提交" onclick="return check_all()">
        <a href="college_check_order"> <input type="button" style="width: 20%" class="btn btn-danger" value="返回"></a>
        </div> 
    </td></tr>
    
</table>
</form>
<%}} %>
</body>
</html>