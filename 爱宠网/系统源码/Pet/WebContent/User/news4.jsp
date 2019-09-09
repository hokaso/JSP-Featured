<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Video 1</title>
<!--// Stylesheets //-->
<link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="../CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<link href="../CSS/style2.css" rel="stylesheet" type="text/css" />
<link href="../CSS/style5.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../CSS/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="../CSS/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="../CSS/style5.css">
	<link rel="stylesheet" href="../CSS/login-register.css" type="text/css" />
	<!--// Javascript //-->
<script type="text/javascript"
	src="<c:url value="../JS/jquery.min.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/ddsmoothmenu.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/menu.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/contentslider.js"></c:url>"></script>
<script type="text/javascript" src="../JS/jquery.3.1.1.js"></script>
<script type="text/javascript"
	src="<c:url value="../JS/jquery.lint.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/jquery.scroll.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/scroll.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/jquery.idTabs.min.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/switch.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/tabs.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/cufon-yui.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/cufon.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="../JS/font.js"></c:url>"></script>
	<script src="../JS/jquery-3.2.1.js" type="text/javascript"></script>
<script src="../JS/jquery.cookie.js" type="text/javascript"></script>
<script src="../JS/login-register.js" type="text/javascript"></script>
</head>
<body class="bg2">
	<%@include file="head.jsp"%>
	<!-- Content Section -->
	<div id="content_sec">
		
		<!-- Column 1 -->
		<div class="col1">
			<section>
			<div style="weight:990">
				<div style="weight:1000;height:815"
					id="inner-page-title">
					<!-- 标题和描述 -->
					<div class="spe-title col-md-12">
						<h2 class="newsTitle"></h2>
						<div class="title-line">
							<div class="tl-1"></div>
							<div class="tl-2"></div>
							<div class="tl-3"></div>
						</div>
						<p class="newsKey"></p>
					</div>
					<!--===== 内容 ======-->
					<div class="rows">
						<div class="posts">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<img class="newsImg">
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<h5>
									<span class="post_author">作者: <span class="newsAuthor"></span></span>
									<span class="post_date">时间: <span class="newsDate"></span></span>
								</h5>
								<p class="newsContent"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
			<script type="text/javascript" src="../JS/scripts8.js">var base="${basePath}";</script>
			<div class="clear"></div>
			<!-- Pagination -->
			<div class="paginations"></div>
		</div>
		<div class="clear"></div>
		<section id="contact" class="space">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 contact-block">
						<div class="col-sm-12 main-heading">
							<h3>最新评论</h3>
						</div>
						<ul class="reviewul">
						</ul>
					</div>
					<div class="col-sm-6 contact-block">
						<div class="col-sm-12 main-heading">
						</div>
						<form id="cmtform">
							<div>
								<textarea  name="comment" id="comment"
									placeholder="请您登录后，发布评论!" style=" height:200px;weight:250px;resize: none"></textarea>
							</div>
							<div ">
								<input type="button" id="submit_comment"
									class="sppb-btn sppb-btn-default" value="发布评论"
									onclick="commentAjax()"/>
								<div id="msg" class="message"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	<script type="text/javascript" src="../JS/scripts7.js">var base="${basePath}";</script>
	</div>
	<!-- Column 2 -->
	<div class="col2">
		<div class="adv">
			<a href="#"><img src="../images/adv1.gif" alt="" /></a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<!-- Footer -->
	<section id="sp-bottom">
			<div class="container">
				<div class="row">
					<div id="sp-bottom1" class="col-sm-6 col-md-4">
						<h3 class="sp-module-title">联系方式</h3>
						<ul class="textwidget">
							<li><i class="fa fa-map-marker"><i class="hidden">地址</i></i>
								<span class="wsAddress"></span></li>
							<li><i class="fa fa-envelope"></i> <span class="wsEmail"></span></li>
							<li><i class="fa fa-qq"></i> <span class="wsQq"></span></li>
							<li><i class="fa fa-phone"></i> <span class="wsPhone"></span></li>
						</ul>
					</div>

					<div id="sp-bottom2" class="col-sm-6 col-md-4">
						<h3 class="sp-module-title">关键词</h3>
						<div class="tagspopular">
							<ul class="sitekeyul">
							</ul>
						</div>
					</div>
					<div id="sp-bottom3" class="col-sm-6 col-md-4">
						<h3 class="sp-module-title wsTitle"></h3>
						<ul class="textwidget">
							<li><i class="fa fa-newspaper-o"></i><span class="wsSite"></span></li>
							<li><i class="fa fa-book"></i><span class="wsDes"></span></li>
							<li><i class="fa fa-github"></i><span class="wsAdmin"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!--底部：版权-->
		<footer id="sp-footer">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p>
							<span class="wsFootor"></span>
						</p>
					</div>
				</div>
			</div>
		</footer>
	<script type="text/javascript" src="../JS/scripts9.js">var base="${basePath}";</script>
</body>
</html>
