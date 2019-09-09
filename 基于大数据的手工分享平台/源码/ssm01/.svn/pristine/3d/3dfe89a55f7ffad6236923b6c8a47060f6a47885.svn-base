<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/plugs/Jqueryplugs.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/_layout.js"></script>
<script
	src="${pageContext.request.contextPath }/js/plugs/jquery.SuperSlide.source.js"></script>
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
<script>
$(function() {

	$(".tabs").slide({
		trigger : "click"
	});
	
	$("#btn").click(function(){
		$("#guige").append("<br/>名称：<input type='text' name='specs_attrs' style='width: 100px'/>"+
				" 库存：<input type='text' name='specs_stock' style='width: 100px'/>"+
				" 价格：<input type='text' name='specs_price' style='width: 100px'/>"+
				"<br/>--------------------------------------------------------------------");
	});
});
</script>
</head>
<body>
	<div style="padding-top: 30px;padding-left:300px">
		<form action="${pageContext.request.contextPath }/updateGoods.action"
			enctype="multipart/form-data" method="post">
			<input name="goods_id" type="hidden" value="${goods.goods_id }"/>
			<input name=goods_coverPic type="hidden" value="${goods.goods_coverPic }"/>
			<table>
				<tr>
					<td>商品名称：</td>
					<td><input type="text" id="goods_name" required
						placeholder="商品名称" name="goods_name" value="${goods.goods_name }"></td>
				</tr>
				<tr>
					<td>商品状态：</td>
					<td><select name="goods_state">
							<option value="">未选择</option>
							<option value="0"
								${goods.goods_state eq '0' ? "selected='selected'":"" }>0</option>
							<option value="1"
								${goods.goods_state eq '1' ? "selected='selected'":"" }>1</option>
					</select></td>
				</tr>
				<tr>
					<td>商品分类：</td>
					<td><select name="goods_category">
							<option value="">未选择</option>
							<c:forEach items="${categoryArr }" var="category" begin="1"
								varStatus="status">
								<option value="${status.index }"
									${goods.goods_state eq status.index ? "selected='selected'":"" }>${category }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>商品描述：</td>
					<td><textarea rows="5" cols="30" name="goods_describe">${goods.goods_describe }</textarea></td>
				</tr>
				<tr>
					<td>商品规格：</td>
					<td id="guige"><c:forEach items="${goods.goodsSpecs }" var="specs">
										<input type="hidden" name='specs_id' value="${specs.specs_id }"/>
									          名称：<input type='text' name='specs_attrs'
								value="${specs.specs_attrs }" style="width: 100px" />
										库存：<input type='text' name='specs_stock'
								value="${specs.specs_stock }" style="width: 100px" />
										价格：<input type='text' name='specs_price'
								value="${specs.specs_price }" style="width: 100px" />
							<br />
						</c:forEach></td>
				</tr>
				<tr>				
					<td><input type="submit" class="am-btn am-btn-success"
						value="修改商品" /></td>
				</tr>
			</table>
		</form>
		<br/>		
	</div>


</body>
</html>