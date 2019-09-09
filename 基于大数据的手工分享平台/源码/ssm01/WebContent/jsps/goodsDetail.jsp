<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/Site.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/zy.all.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css" />
<style>
	tr td{
    height : 30px;
    border-style:solid;
    border-width:1px;
    border-color:#E1E6EB;
    padding:0px 17px;
}
	th{
		background-color:darkgrey;
	}
</style>
</head>
<body>
<div style="position: absolute; left: 500px; top: 100px;">
	<table id="tbRecord" border="1" >
		<tr>
			<th>名称</th>
			<th>详情</th>
		</tr>
		<tr>
			<td>商品名称</td>
			<td>${goods.goods_name }</td>
		</tr>
		<tr>
			<td>商品分类</td>
			<td>${goods.goods_category }</td>
		</tr>
		<tr>
			<td>商品规格</td>
			<td>
				<c:forEach items="${goods.goodsSpecs }" var="goodsSpecs" varStatus="status">
					规格${status.index+1 }: ${goodsSpecs.specs_attrs } 价格：${goodsSpecs.specs_price } 库存：${goodsSpecs.specs_stock }
					<br/>
				</c:forEach>

			</td>
		</tr>
		<tr>
			<td>商品描述</td>
			<td><textarea rows="5" cols="50">${goods.goods_describe}</textarea></td>
		</tr>
	</table>
</div>
</body>
</html>