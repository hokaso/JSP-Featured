<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/OnlineTeaching/jquery/jquery-3.3.1.js"></script>
    <script  src="/OnlineTeaching/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/bootstrap.min.css">
<script type="text/javascript" src="/OnlineTeaching/js/check_id.js"></script>

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
      <a class="navbar-brand" href="course_show_all">惠课(返回首页)</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

       
      <ul class="nav navbar-nav navbar-right">
       
         <ul class="nav navbar-nav navbar-right">
          <li>
       <a href="login">登录</a>
      </li>
         
         </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<input type="button" onclick="showTable1()" class="form-control btn-danger"  value="中小学生注册">
<input type="button" onclick="showTable2()" class="form-control btn-danger"  value="大学生注册">
<form action="junior_register" method="post">

<table id="table1" style="visibility:collapse" class="table table-hover">
<tr><td><h3>中小学生</h3></td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">账号：(6-10位)</span>
            <input type="text" class="form-control"  required="required" id="junior_id" name="junior_id" aria-describedby="basic-addon1" onchange="check1()" >
        <span id="span_result1" class="input-group-addon"></span>
        </div>
    </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">姓名：(2-10位)</span>
            <input type="text" class="form-control" id="junior_name" required="required" name="junior_name" aria-describedby="basic-addon1" >
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">密码：(6-10位)</span>
            <input type="password"  required="required" id="junior_password" class="form-control" name="junior_password" aria-describedby="basic-addon1" >
        </div>
    </td></tr>

  
   <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">性别:</span>
            <select name="junior_gender" class="form-control"  required="required">
          <option value="男">男</option>
          <option value="女">女</option>
            </select>
        </div>
    </td></tr>
  
  
  <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">出生日期(例:1960-01-01)</span>
           <input type="date"   required="required" name="junior_birth" class="form-control" value=""  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">联系电话：</span>
            <input type="text"  required="required" id="junior_phone" name="junior_phone" class="form-control" aria-describedby="basic-addon1" onchange="check_junior_phone()" >
        </div>
    </td></tr>
    
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址(10-25位)</span>
            <input type="text" name="junior_address" id="junior_address" required="required" class="form-control" aria-describedby="basic-addon1">
        </div>
    </td></tr>
   
   <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
         <input type="submit" style="width: 20%" class="btn btn-danger" value="注册" onclick="return check2()"></a>
        </div> 
    </td></tr>

</table>
</form>


<form action="college_register" method="post" enctype="multipart/form-data">
<table id="table2" style="visibility:collapse" class="table table-hover">
<tr><td><h3>大学生注册</h3></td></tr>
    <tr><td>
         <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">账号：(6-10位)</span>
            <input type="text"  required="required" name="college_id" id="college_id" required="required"  class="form-control"  onchange="check3()" aria-describedby="basic-addon1">
         <span class="input-group-addon" id="span_result2"></span>
        </div>    
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">密码：(6-10位)</span>
            <input type="password" required="required" class="form-control" id="college_password" name="college_password" aria-describedby="basic-addon1" >
        </div>
    </td></tr>
    
    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">姓名：(2-10位)</span>
            <input type="text" required="required" name="college_name" class="form-control" id="college_name"  aria-describedby="basic-addon1">
        </div>
    </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">性别:</span>
            <select name="college_gender" class="form-control" required="required">
          <option value="男">男</option>
          <option value="女">女</option>
            </select>
        </div>
     </td></tr>
    
        <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">学生证图片:</span>
          <input type="file" name="file" required="required" class="form-control" aria-describedby="basic-addon1" > </div>
        </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">出生日期:(例:1960-01-01)</span>
           <input type="date"  required="required" name="college_birth" class="form-control" aria-describedby="basic-addon1">
        </div>
      </td></tr>
    
    
       <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">联系电话：</span>
            <input type="text" required="required" name="college_phone" id="college_phone" class="form-control"  aria-describedby="basic-addon1" onchange="check_college_phone()">
        </div>
    </td></tr>
    
      <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">地址(10-25位)</span>
            <input type="text"  required="required" name="college_address" class="form-control" id="college_address"  aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
     <tr><td>
        <div class="input-group" style="width: 50%; left: 30%">
         <input type="submit" style="width: 20%" class="btn btn-danger" value="注册" onclick="return check4()"></a>
        </div> 
    </td></tr>
    
</table>
</form>
</body>
</html>