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
<script type="text/javascript" src="/OnlineTeaching/js/login.js"></script>
<body>
<nav class="navbar navbar-default" >
    <div class="container-fluid">
        <!--左 上角首页-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            </button>
            <a class="navbar-brand" href="course_show_all">惠课(返回首页)</a>
        </div>
        
    </div>
</nav>
<form action="user_login" method="post">
<table class="table table-hover" style="width:100%">

    <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">账号</span>
            <input type="text" required="required" class="form-control" name="user_id" id="user_id" placeholder="Username" aria-describedby="basic-addon1">
        </div>
    </td></tr>

     <tr><td>
        <div class="input-group" style="width: 50%; left: 20%">
            <span class="input-group-addon" id="basic-addon1">密码</span>
            <input type="password" required="required" class="form-control" name="user_password" id="user_password" placeholder="UserPassword" aria-describedby="basic-addon1">
        </div>
    </td></tr>
    
    
    <tr style="display:none" id="tr_show"><td>
        <div class="input-group" style="width: 50%; left: 20%;">
            <span id="span_result" style="width:50%;margin-left: 40%;"></span>
      </div>
    </td></tr>
    
    

<tr>
<td>
  <div class="container body-content">
    <div class="row">
      <div class="text-center col-xs-10">

          <div class="btn-group" data-toggle="buttons" id="Select">
 
            <label class="btn btn-default">
              <input type="radio" name="user_type" value="junior" required="required">  中小学生
            </label>
            
            <label class="btn btn-default">
             <input type="radio" name="user_type" value="college" required="required">大学生
            </label>
            
            <label class="btn btn-default">
              <input type="radio" name="user_type" value="staff" required="required">客服
            </label>
            
         </div>
      </div>
    </div>
  </div>
  
  </td>
  </tr>

    <tr><td>
     
        <div class="input-group" style="width: 50%; left: 25%">
        <input type="button" style="width: 20%;margin-right: 10%" class="btn btn-primary" value="提交" onclick="login()">
       <a href="register"><input type="button" value="注册" class="btn btn-success" style="width: 20%;margin-right: 10%"></a>
          <a href="course_show_all"><input type="button" style="width: 20%" class="btn btn-danger" value="返回首页"></a>
        </div> 
    </td></tr>

</table>

</form>
</body>
</html>