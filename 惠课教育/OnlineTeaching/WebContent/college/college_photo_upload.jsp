<%@page import="Pojo.college"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 该网页是给审核不通过的学生所用的 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
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
      <a class="navbar-brand" href="course_show_all">惠课(返回首页)</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

       
      
       
    </div>
  </div>
</nav>




<%
if(request.getAttribute("college")!=null)
{
	college college=(college)request.getAttribute("college");

	%>

<form action="college_photo_upload2" method="post" enctype="multipart/form-data">
<table  class="table table-hover">
       
        <input type="text"   name="college_id" id="college_id"  value="<%=college.getCollege_id() %>" style="display:none;">
    
        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">学生证图片:</span>
          <input type="file" name="file" required="required" class="form-control" aria-describedby="basic-addon1" > </div>
        </td></tr>
    
	    <tr><td>
	       <div class="input-group" style="width: 50%; left: 30%">
	        <input type="submit" style="width: 70%" class="btn btn-danger" value="更新" >
	       </div> 
	    </td></tr>
    
</table>
</form>
<% 
}
%>


</body>
</html>