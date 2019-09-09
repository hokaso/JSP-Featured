<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.net.URLDecoder,Pet.entity.Member" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Video 1</title>
<!--// Stylesheets //-->
<link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="../CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<!--// Javascript //-->
<script type="text/javascript" src="../JS/jquery.min.js"></script>
<script type="text/javascript" src="../JS/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../JS/menu.js"></script>
<script type="text/javascript" src="../JS/contentslider.js"></script>
<script type="text/javascript" src="../JS/jquery.3.1.1.js"></script>
<script type="text/javascript" src="../JS/jquery.lint.js"></script>
<script type="text/javascript" src="../JS/jquery.scroll.js"></script>
<script type="text/javascript" src="../S/scroll.js"></script>
<script type="text/javascript" src="../JS/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../JS/switch.js"></script>
<script type="text/javascript" src="../JS/tabs.js"></script>
<script type="text/javascript" src="../JS/cufon-yui.js"></script>
<script type="text/javascript" src="../JS/cufon.js"></script>
<script type="text/javascript" src="../JS/font.js"></script>

</head>
<body class="bg2">
	<%@include file="head.jsp"%>
	<%
	boolean flag=true;
	Member member = (Member)request.getSession().getAttribute("currentMember");
	if(member==null){
		flag=false;
	}
	%>
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
		<div class="leftnav">
			<div class="image" >
					<h2 class="heading">Blog</h2>
					<c:if test="${not flag}">
					<div style="margin-left: 20px; float: left;">
						<ul>
							<li style="list-style-type:none"><a href="user.jsp" target="right">
							<p class="icon-caret-right"  style="font-size:20px;font-weight:bold;">设置个人信息</p></a></li>
							</br>
							<li style="list-style-type:none"><a href="../User/upload.jsp" target="right"><span
									class="icon-caret-right" style="font-size:20px;font-weight:bold;">上传视频</span></a></li>
							</br>
							<li style="list-style-type:none"><a href="resource_findResourceByCondition.action?idea=<%=member.getId()%>" target="right"><span
									class="icon-caret-right" style="font-size:20px;font-weight:bold;">已上传视频</span></a></li>
							</br>
						</ul>
					</div>
					<div style="float: left; margin-left: 20px;">
						<iframe src="../User/welcome.html" name="right" scrolling="no" marginwidth="1" marginheight="1" frameborder="1"
							width="800" height="700">
						</iframe>
				</div>
				</c:if>
			</div>
			<c:if test="${flag}">
						<p>
						session已失效，请点击返回登录&nbsp;<a href="login.jsp" style="background-color:red">返回</a>
						</p>
			</c:if>
		</div>
		<div class="clear"></div>
		<!-- Footer -->
		<!-- Footer -->
		<div class="inner">
			<!-- Top button Section -->
			<div class="topbutonsec">
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
			<!--<script type="text/javascript" src="JS/scripts4.js"></script>-->
			<!--<script type="text/javascript" src="JS/scripts3.js"></script>-->
		</div>
</body>
</html>
