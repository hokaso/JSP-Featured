<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	&nbsp;
	<table>
		<tr>
			<td width="15%" class="tocenter">当前第 <s:property
					value="page1.currentPage" /> 页
			</td>
			<td colspan="4" width="55%" class="tocenter"><s:if
					test="%{page1.currentPage == 1}">第一页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
				<s:else>
					<a href="/Pet/Manager_search.action?page=1">第一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a
						href="/Pet/Manager_search.action?page=<s:property value="%{page1.currentPage-1}"/>&s=<s:property value="page1.name"/>">上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</s:else> <s:if test="%{page1.currentPage != page1.totalPage}">
					<a
						href="/Pet/Manager_search.action?page=<s:property value="%{page1.currentPage+1}"/>&s=<s:property value="page1.name"/>">下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a
						href="/Pet/Manager_search.action?page=<s:property value="page1.totalPage"/>&s=<s:property value="page1.name"/>">最后一页</a>
				</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 最后一页</s:else></td>
			<td width="13%" class="tocenter">共 <s:property
					value="page1.totalPage" /> 页
			</td>
			<td width="17%" class="tocenter">共 <s:property
					value="page1.allRow" /> 条记录
			</td>
		</tr>
	</table>
</body>
</html>