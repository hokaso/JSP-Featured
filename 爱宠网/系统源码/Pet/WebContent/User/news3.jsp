<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="Pet.tool.Page"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Video 1</title>
<!--// Stylesheets //-->
<link href="CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<link href="CSS/style2.css" rel="stylesheet" type="text/css" />
<!--// Javascript //-->
<script type="text/javascript" src="<c:url value="JS/jquery.min.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/ddsmoothmenu.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/menu.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/contentslider.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/jquery.1.4.2.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/jquery.lint.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/jquery.scroll.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/scroll.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/jquery.idTabs.min.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/switch.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/tabs.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/cufon-yui.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/cufon.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="JS/font.js"></c:url>"></script>
</head>
<body class="bg2">
<% %>
<%@include file="head.jsp"%>
		<!-- Content Section -->
		<div id="content_sec">
			<!-- Bread Crumb -->
			<div id="crumb">
				<h5>You are here:</h5>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">About Us </a></li>
					<li class="last"><a href="#">Information</a></li>
				</ul>
			</div>
			<!-- Column 1 -->
			<s:iterator value="page1.list">
			<div class="col1">
				<div class="news">
					<h2 class="heading">News</h2>
					<ul class="newslisting" id="c_ul">
						<li class="tocenter">
						 <div class="desc">
						<span class="featured"><s:property value="year"/></span>
						</div>
						<div class="date">
						<p class="time">
						<s:property value="month"/>
						</p>
						<h1 class="day">
						<s:property value="day"/>
						</h1>
						</div>
						<span class="featured"><p class="txt" id="txt"><s:property value="newsTitle" /></span>
						<div class="desc">
						<a href="User/news2.jsp?newsId=<s:property value='%{newsId}' />">Read more</a>        
						</div>
						</li>
						</s:iterator>
					</ul>
					<h3>PAGE:</h3><%@include file="page.jsp"%>
				</div>
				<div class="clear"></div>
				<!-- Pagination -->
				<div class="paginations">
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- Column 2 -->
		<div class="col2">
			<!-- Tabs -->
			<div class="clear"></div>
			<!-- Top Searches -->
			<div class="clear"></div>
			<!-- Advertisment -->
			<div class="adv">
				<a href="#"><img src="../images/adv1.gif" alt="" /></a>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</div>
	<div class="clear"></div>
	<!-- Footer -->
		<div class="inner">
			<!-- Top button Section -->
			<div class="topbutonsec">
				<a href="#">Top</a>
			</div>
			<div class="clear"></div>
			<!-- Footer - Search - Share -->
			<div class="foot_search_share">
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<!-- Footer content -->
			<div class="footer_cont">
				<div id="footer">
					<div id="copyrights">
						<div class="inner">
							<p>
								Copyright © 2013 VidSea. All rights reserved.More Templates <a
									href="http://www.cssmoban.com/" target="_blank" title="">xy</a>
								- Collect from <a href="http://www.cssmoban.com/" title="xy"
									target="_blank">XY</a>
							</p>
							<div class="recent_videos">
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
</body>
</html>
