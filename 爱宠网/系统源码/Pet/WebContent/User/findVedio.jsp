<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%@ taglib prefix="c" uri=http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>已下载视频</title>
</head>
<body>
<table>
	<tr>
	<th>视频名称</th>
	<th>视频简介</th>
	<th>观看</th>
	</tr>
	<s:iterator value="page1.list">
	<tr>
	<td>
	<span class="VedioName"><s:property value="address"/></span>
	</td>
	</tr>
	<tr>
	<td>
	<span class="VedioTitle"><s:property value="vedioTitle"/></span>
	</td>
	</tr>
	<tr>
	<td>
	<span class="VedioSee"><a href="See.jsp?Address=<s:property value='%{address}' />"></a></span>
	</td>
	</tr>
	</s:iterator>
</table>
</body>
</html>