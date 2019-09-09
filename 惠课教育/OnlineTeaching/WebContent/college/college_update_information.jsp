<%@page import="java.text.SimpleDateFormat"%>
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
<script type="text/javascript" src="/OnlineTeaching/js/check_college.js"></script>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
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
       
      <li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人修改 <span class="caret"></span></a>
          <ul class="dropdown-menu">

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

<%
college college=(college)request.getAttribute("college");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>

<form action="college_update_information2" method="post">
<table class="table table-hover" style="width:100%">
<input type="text" name="college_id" value="<%=college.getCollege_id() %>" style="display:none;">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">姓名：(2-10位)</span>
            <input type="text" id="college_name" name="college_name" class="form-control" value="<%=college.getCollege_name() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">性别:</span>
            <select name="college_gender" class="form-control">
          <option value="男" <%if(college.getCollege_gender().equals("男")){out.print("selected='selected'");} %>>男</option>
          <option value="女" <%if(college.getCollege_gender().equals("女")){out.print("selected='selected'");} %>>女</option>
            </select>
        </div>
    </td></tr>
    
        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">出生日期</span>
           <input type="date" value="<%=sdf.format(college.getCollege_birth())  %>" name="college_birth" class="form-control" value=""  aria-describedby="basic-addon1">
        </div>
        </td></tr>

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">联系电话：</span>
            <input type="text" id="college_phone" name="college_phone" class="form-control" id="college_phone" value="<%=college.getCollege_phone() %>"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
 <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址(10-25位)</span>
            <input type="text" name="college_address" id="college_address" class="form-control" value="<%=college.getCollege_address() %>" aria-describedby="basic-addon1">
        </div>
    </td></tr>


 <tr><td>
        <div class="input-group" style="width: 50%; left: 25%">
        <input type="reset" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="重置">
         <input type="submit" style="width: 20%;margin-right: 10%" class="btn btn-danger" onclick="return check_college_update()" value="更新">
        <a href="college_check_order"> <input type="button" style="width: 20%" class="btn btn-success" value="返回"></a>
        </div> 
    </td></tr>

</table>
</form>

</body>
</html>