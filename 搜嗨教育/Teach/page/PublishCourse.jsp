<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="bean.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/PublishCourse.css">
<body>
<%
	List<Course> cnum=(List<Course>)session.getAttribute("allcourse"); 
	String price=(String)session.getAttribute("price");
   //String tnum=(String)session.getAttribute("teacherno");
   
   
%>
<div id="tital">
		<div><h1 id="alltital" >嗨嗖教育</h1><h1 id="alltital2">成功从此刻开始！</h1></div>
		<div id="alltital3">
			<ul id="nav">
        <li><a href="../homepage/homepage">首页</a></li>
        <li><a href="#">发布课程</a></li>
        <li><a href="#">返回首页</a></li>
        <li><a href="#">我的收益:<%=price %>元</a></li>
        <li><a href="#">联系我们</a></li> 
        </ul>
		</div>
	</div>
	<div id="center">
		<div id="form1">
			<form action="../homepage/AddcourseAction" method="post" enctype="multipart/form-data">
				<div><h2 align="center" id="title1">创建课程</h2></div>
			  	<div class="same1">讲师编号：<input type="text" value="<%=cnum.get(0).getTno()%>" id="input1" class="same" name="tno"></div><br>
			  	<div class="same1">课程编号：<input type="text" value="" id="input2" class="same" name="cno"></div><br>
			  	<div class="same1">课程类型：<select name="ctype" id="input3" class="same" >
			  		<option value="电脑办公">电脑办公</option>
			  		<option value="平面设计">平面设计</option>
			  		<option value="程序开发">程序开发</option>
			  		<option value="网页设计">网页设计</option>
			  		<option value="影视动画">影视动画</option>
			  		<option value="室内设计">室内设计</option>
			  		<option value="室外设计">室外设计</option>
			  	</select></div><br>
			  	<div class="same1">课程名称：<input type="text" value="" id="input4" class="same" name="cname"></div><br>
			  	<div class="same1">课程描述：<input type="text" value="" id="input5" class="same" name="cdescribe"></div><br> 
			  	<div class="same1">课程价格：<input type="text" class="same" name="cprice"></div>
			  	<div class="same1">上传文件：<input type="file" id="input7" class="same" name="filename" ></div><br>
			  	<div align="center"><input type="submit" value="提交" id="input6"></div>
			  </form>
		</div>
		<div id="form3">
			<form action="">
			<div><h2 align="center" id="title3">已创建课程</h2></div>
			<div align="center"><select id="input14" onchange="sign()"> 
			<%for(int j=0;j<cnum.size();j++){ %>
			<option value="<%=cnum.get(j).getCno()%>"><%=cnum.get(j).getCname()%></option>
			<%} %>
			</select>
			</div>
			</form>
		</div>
		<div id="form2">
			<form action="../homepage/AddchapterAction" method="post" enctype="multipart/form-data">
				<div><h2 align="center" id="title2">发布课程</h2></div>
				<div class="same1">课程编号：<input type="text" value="" id="input8" class="same" name="cno"></div><br>
				<div class="same1">文件编号：<input type="text" value="" id="input9" class="same" name="fno"></div><br>
				<div class="same1">文件名字：<input type="text" value="" id="input10" class="same" name="fname"></div><br>
				<div class="same1">课程金币：<input type="text" value="" id="input11" class="same" name="fprice"></div><br>
				<div class="same1">上传视频：<input type="file" value="" id="input12" class="same" name="upload"></div><br>
				<div align="center"><input type="submit" value="提交" id="input13"></div>
			</form>
		</div>
	</div>
	<footer class="footer">
		<div class="copyright">
            <p>
                &copyright
                <a href="#">嗨嗖教育1.0 </a>haisou.com
                <a href="#">京ICP证070791号</a>
                <a href="#">京ICP备01210001</a>
                <a href="#">京ICP备01210001教育服务规则</a>
            </p>
            <div >
                <a href="#">广播电视台许可证（京）字第02121号</a>
                <a href="#"><img src="HTML/wanan.png" alt="无法显示">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
	<script type="text/javascript">
	function sign() {
		var course1=document.getElementById('input14');
		var courseno=document.getElementById('input8');
		courseno.value=course1.value;
		alert(course1.value);
	}
	</script>
</body>
</html>