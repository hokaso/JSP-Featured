<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="text-align:center">
<%
String message =(String) session.getAttribute("message");
String error = "用后名或者密码错误";
%>
<c:choose>
	<c:when test="${message==error}">
	用后名或者密码错误,<a href="login.jsp">返回登录</a>
	</c:when>
	<c:otherwise>
	用户未激活,请用您邮箱中激活再登陆<a href='index.jsp'>点击返回首页</a>
	</c:otherwise>
</c:choose>
</body>
</html>