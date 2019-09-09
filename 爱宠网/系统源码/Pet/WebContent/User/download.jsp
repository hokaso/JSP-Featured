<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    英文需要编码
     <%-- <a href="/struts2_learn/DownloadAction?fileName=building.jpg"
        style="text-decoration: none">
        building.jpg 
    </a> <hr>--%>
    <c:url var="myURL" value="/DownloadAction">
        <c:param name="fileName" value="建筑.jpg" />
    </c:url>
    <a href="${myURL}" style="text-decoration: none"> 建筑.jpg </a> 
</body>
</html>