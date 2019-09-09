<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"  import="java.net.URLDecoder,Pet.entity.Member"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Video 1</title>
<link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="../CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../CSS/index.css" type="text/css" />
<link rel="stylesheet" href="../CSS/index1.css" type="text/css" />
<link rel="stylesheet" href="../CSS/settings.css" type="text/css"/>
<link rel="stylesheet" href="../CSS/dynamic-captions.css" type="text/css"/>
<link rel="stylesheet" href="../CSS/static-captions.css" type="text/css"/>
<link rel="stylesheet" href="../depend/videoCT.css"/>
<!--// Javascript //-->
<script src="../JS/jquery-3.1.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../JS/ddsmoothmenu.js"></script>
<script type='text/javascript' src="../depend/jquery.min.js"></script>
<script type='text/javascript' src="../depend/videoCT.js"></script>
<script type='text/javascript' src="../depend/index2.js"></script>
</head>
<body>
    <%@include file="../User/head.jsp"%>
	<div id="banner">
		<div id="slider2" class="leftsecbanner">
			<div class="contentdiv">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
					width="660px" height="348px">
					<param name="movie" value="../vedio/flash.swf" />
					<param name="quality" value="high" />
					<param name="wmode" value="transparent" />
					<embed src="../vedio/flash.swf" width="640px" height="300px"
						quality="high"
						pluginspage="http://www.macromedia.com/go/getflashplayer"
						type="application/x-shockwave-flash" wmode="transparent"></embed>
				</object>
			</div>

		</div>
		<div id="paginate-slider2">

			<div class="box">
				<div class='line'>
					<span>News item</span><a id='more' href="/Pet/Manager_getPageList.action?page=1">more>></a>
				</div>
				<ul id="news">
				
				</ul>
			</div>
		</div>
		<script type="text/javascript" src="../JS/scripts4.js"></script>
	</div>
	<div class="clear"></div>
	<div id="paginate-slider2" style="background-color:black">
	<section>
	<video src="../vedio/1.mp4" controls width="1020"height="300"></video>
   </section>
	</div>
	<!-- Content Section -->
	<div id="content_sec">
		<!-- Column 1 -->
		<div class="col1">
			<!-- Featured Playlist -->
			<div class="carousel content-main">
				<!--<h3 class="heading">Wheel station</h3>-->
				<ul class="list">
					<li><img src="images/keji.jpg"></li>
					<li><img src="images/keji2.jpg"></li>
					<li><img src="images/keji3.jpg"></li>
					<li><img src="images/keji4.jpg"></li>
					<li><img src="images/maomi.jpg"></li>
					<li><img src="images/maomi1.jpg"></li>
					<li><img src="images/maomi2.jpg"></li>
				</ul>
			</div>
			<div style="text-align: center; clear: both">
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!-- Footer -->
	<div id="footer">
		<div id="copyrights">
			<div class="inner">
				<p>
					Copyright © 2019 MM. <a
						href="http://www.baidu.com/" target="_blank" title="">宠物xy</a>
				</p>
				<div class="recent_videos">
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../JS/jquery1.min.js"></script>
	<script type="text/javascript" src="../JS/index.js"></script>
	<script type="text/javascript">
		var setting = {
			width : 1000,
			height : 270,
			postWidth : 658,
			postHeight : 270,
			scale : 0.8,
			speed : 500,
			verticalAlign : "center"
		}
		$(".carousel").attr("data-setting",
				'{ "width":1000,"height":411,"postWidth":658}')
		Carousel.init($(".carousel"))
	</script>
</body>
</html>
