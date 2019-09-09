<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="../CSS/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../CSS/style5.css"/>
<link rel="stylesheet" href="../CSS/danmuplayer.css"/>

    <script src="../JS/jquery-3.1.1.js" type="text/javascript"></script>
    <script src="../JS/jquery.cookie.js" type="text/javascript"></script>
    <script src="../JS/lib/jquery-3.1.1.min.js"></script>
    <script src="../JS/danmuplayer.js"></script>
</head>
<body class="bg2">
	<%
	
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	String fileName = request.getParameter("fileName");
	String id = request.getParameter("id");
	int id1 = Integer.parseInt(id);
	%>
<span class="biglines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
	<!-- Top Section -->
    <div class="top_sec" style="background-color:black">
    	<!-- Top Section Left Links -->
        <div class="toplinks">
        	<ul>
            	<li class="first"><a href="../User/index.jsp">Home</a></li>
                <c:if test="${empty currentMember }">
							<li><a href="${basePath}/Pet/User/login.jsp">Login</a></li>
							<li><a href="regist.jsp">Signup</a></li>
						</c:if>
						<c:if test="${not empty currentMember}">
							<li>${currentMember.account }:你好!</li>
							<li><a href="${basePath}/Pet/User/center.jsp">Personal Center</a></li>
							<li><a href="javascript:Exit()">Exit1</a></li>
						</c:if>
            </ul>
        </div>
        <script type="text/javascript">
        function Exit(){
        	 //sessionStorage.clear();  //清除所有session值
        	  //window.location.href="${basePath}/Pet/User/login.jsp";
        	var mymember="<%=session.getAttribute("currentMember")%>"; 
        	if(mymember!="null"){
        		 window.location.href="download.action?fileName=<%=fileName%>&vedio1id=<%=id1%>";
        	}else{
        		alert("请先登录，再下载");
        	}
        }
        </script>
        <!-- Top Section right Links -->
        <div class="links_icons">
        	<ul>
            </ul>
        </div>			
    </div>
    <div class="clear"></div>
    <!-- Header -->
    <div id="masthead" style="background-color:black">
    	<!-- Logo -->
        <div class="logo">
        	<a href="${basePath}/Pet/User/index.jsp"><img src="${basePath}/Pet/images/logo.png" alt="" /></a>
        </div>
        <!-- Navigation -->
        <div class="navigation">
        	<div id="smoothmenu1" class="ddsmoothmenu">
                <ul>
                    <li><a href="/Pet/Manager_getPageList1.action?page=1" class="staticlinks">Videos</a></li>
                    <li><a href="/Pet/Manager_getPageList.action?page=1" class="staticlinks">News</a></li>
                </ul>
            	<div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
	<!-- Content Section -->
	<div id="content_sec">

		<!-- Column 1 -->
		<div class="col1">
			<section>
			<div style="weight: 990">
				<div style="weight: 1000; height: 815" id="inner-page-title">
					<!-- 标题和描述 -->
					<div class="spe-title col-md-12">
						<h2 class="vedioTitle"></h2>
						<div class="title-line">
							<div class="tl-1"></div>
							<div class="tl-2"></div>
							<div class="tl-3"></div>
						</div>
						<p class="vedioKey"></p>
					</div>
					<!--===== 内容 ======-->
					<div class="rows">
						<div class="posts">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div id="danmup"></div>
								<div class="col-md-6 col-sm-6 col-xs-12">
								<!--<a href="download.action?fileName=<%=fileName%>&vedio1id=<%=id1%>">download</a>-->
								<a href="javascript:void(0)" onclick="Exit()">download</a>
								<h5>
									<span class="post_author">作者: <span class="vedioAuthor"></span></span>
									<span class="post_date">时间: <span class="vedioDate"></span></span>
								</h5>
								<p class="vedioContent"></p>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
			<script type="text/javascript" src="../JS/scripts11.js">var base="${basePath}";</script>
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
						<!--<li><i class="fa fa-user"></i><i class="fa fa-comment"></i> Hello</li>-->
					</ul>
				</div>
				<div class="col-sm-6 contact-block">
					<div class="col-sm-12 main-heading">
					</div>
					<form id="cmtform">
						<div>
							<textarea name="comment" id="comment" placeholder="请您登录后，发布评论!"
								style="height: 200px; weight: 250px; resize: none"></textarea>
						</div>
						<div">
							<input type="button" id="submit_comment"
								class="sppb-btn sppb-btn-default" value="发布评论"
								onclick="commentAjax()" />
							<div id="msg" class="message"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>
		<script type="text/javascript" src="../JS/scripts10.js">
			var base = "${basePath}";
		</script>
	</div>
	<!-- Column 2 -->
	<div class="clear"></div>
	<!-- Footer -->
	<section id="sp-bottom">
	<div class="container">
		<div class="row">
			<div id="sp-bottom1" class="col-sm-6 col-md-4">
				<h3 class="sp-module-title">联系方式</h3>
				<ul class="textwidget">
					<li><i class="fa fa-map-marker"><i class="hidden">地址</i></i> <span
						class="wsAddress"></span></li>
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
	<script type="text/javascript" src="../JS/scripts9.js">
		var base = "${basePath}";
	</script>
</body>
</html>