<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String a=(String)request.getParameter("WIDout_trade_no");
String b=(String)request.getParameter("WIDtotal_amount");
String c=(String)request.getParameter("WIDsubject");
out.print(a+b+c);
%>
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
GetDateNow();</script>
</html>