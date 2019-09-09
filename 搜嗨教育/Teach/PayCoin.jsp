<%@page import="bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/PayCoin.css">
</head>
<body>
	
	<%
		Student student = (Student)session.getAttribute("student");
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
		<div class="section-nav">
			<form action="check/pay">
				<input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no">
				<input type="hidden" name="WIDsubject" id="WIDsubject">
				<input type="hidden" name="flag" value="kobe">
				<div class="section-nav-item">
					<div class="point">
						<span class="span-mask"><span>1</span></span>
						<label for="" class="label1">充值账号：</label>
					</div>
					
					<input type="text" class="money" value="<%=student.getSno()%>"><br>
				</div>
				<div class="section-nav-item">
					<div class="point">
						<span class="span-mask"><span>2</span></span>
						<label for="" class="label1">充值金额：</label>
					</div>
					<input type="text" class="money" name="WIDtotal_amount" ><br>
					<input type="submit" value="支付宝支付" class="pay-btn">
				</div>
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
                <a href="#"><img src="../img/wanan.png" alt="无法显示">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert" >
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
</body>
<script type="text/javascript">
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
	document.getElementById("WIDsubject").value = "测试";
}
GetDateNow();
</script>
</html>