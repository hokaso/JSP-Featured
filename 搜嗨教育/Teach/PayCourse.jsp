<%@page import="bean.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PayCourse</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/PayCourse.css">
</head>
<body>
<%
Course course = (Course)session.getAttribute("course");
String teacherName=(String)session.getAttribute("teacherName");
%>
<header class="header">
		<div class="header-nav clear-fix">
			<div class="header-nav-left">
				<ul class="clear-fix">
					<li><span>欢迎您，时间不懂</span> <span class="span1"></span></li>
					<li><a href="">网站首页</a><span class="span1"></span></li>
					<li><a href="">购买教程</a><span class="span1"></span></li>
					<li><a href="">在线咨询</a></li>
				</ul>
			</div>
			<div class="header-nav-right">客服电话：4008-3232-13</div>
		</div>
	</header>
	<div class="section">
		<div class="section-nav clear-fix">
			<div class="section-nav-left">
				<img src="../img/<%=course.getCphoto() %>" alt="">
			</div>
			<div class="section-nav-right">
				<form action="check/pay">
					<input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no" >
					<input type="hidden" name="WIDsubject" id="WIDsubject">
					<input type="hidden" class="money" name="WIDtotal_amount" value="<%=course.getCprice() %>">
					<input type="hidden" name="flag" value="1">
					<div class="section-nav-right-item1"><%=course.getCdescribe() %></div>
					<div class="section-nav-right-item2">
						<span class="teacher">教师：<%=teacherName %></span>
					</div>
					<div class="section-nav-right-item3">
						<span class="price-span">价格：</span>
						<span class="price2-span">￥<%=course.getCprice() %>元</span>
					</div>
					<div class="section-nav-right-item4">
						<span>想成功就盘他！不成功我切吊。</span>
					</div>
					<div class="section-nav-right-item5">
						<input type="submit" value="立即购买" id="sub">
					</div>
				</form>
			</div>
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
                <a href="#"><img src="../img/wanan.png" alt="无法显示">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert" >
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
	<script>
		function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		document.getElementById("WIDsubject").value = "付款";
	}
	GetDateNow();
	</script>
</body>
</html>