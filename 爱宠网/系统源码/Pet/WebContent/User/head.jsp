<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>头部</title>
<link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="../CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<!--// Javascript //
<script type="text/javascript" src="../JS/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../JS/jquery.min.js"></script>
<script type="text/javascript" src="../JS/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../JS/menu.js"></script>
<script type="text/javascript" src="../JS/contentslider.js"></script>
<script type="text/javascript" src="../JS/jquery.scroll.js"></script>
<script type="text/javascript" src="../JS/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../JS/switch.js"></script>
<script type="text/javascript" src="../JS/cufon-yui.js"></script>
<script type="text/javascript" src="../JS/cufon.js"></script>
<script type="text/javascript" src="../JS/font.js"></script>-->
</head>
<body>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
<span class="biglines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
	<!-- Top Section -->
    <div class="top_sec">
    	<!-- Top Section Left Links -->
        <div class="toplinks">
        	<ul>
                <c:if test="${empty currentMember }">
							<li><a href="${basePath}/Pet/User/login.jsp">Login</a></li>
							<li><a href="regist.jsp">Signup</a></li>
						</c:if>
						<c:if test="${not empty currentMember}">
						    
							<li>${currentMember.account}:你好!</li>
							<li><a href="${basePath}/Pet/User/center.jsp">Personal Center</a></li>
							<li><a href="javascript:Exit1()">Exit</a></li>
						</c:if>
            </ul>
        </div>
        <script type="text/javascript">
        function Exit1(){
        	 sessionStorage.clear();  //清除所有session值
        	  window.location.href="${basePath}/Pet/User/login.jsp";
        
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
    <div id="masthead">
    	<!-- Logo -->
        <div class="logo">
        	<a href="${basePath}/Pet/User/index.jsp"><img src="${basePath}/Pet/images/logo.png" alt="" /></a>
        </div>
        <!-- Navigation -->
        <div class="navigation">
        	<div id="smoothmenu1" class="ddsmoothmenu">
                <ul>
                    <li><a href="${basePath}/Pet/User/index.jsp" class="staticlinks">Home</a></li>
                    <li><a href="/Pet/Manager_getPageList1.action?page=1" class="staticlinks">Videos</a></li>
                    <li><a href="/Pet/Manager_getPageList.action?page=1" class="staticlinks">News</a></li>
                </ul>
            	<div class="clear"></div>
            </div>
        </div>
        <!-- Search 
        <div class="search">
        <form method="post" action="Manager_search.action" id="form1">
        	<input type="text" value="Enter keyword to search" id="searchBox" name="s" onblur="if(this.value == '') { this.value = 'Enter keyword to search'; }" onfocus="if(this.value == 'Enter keyword to search') { this.value = ''; }" class="bar" />
            <a href="javascript:void(0)" class="go"  onclick="form1.submit()">&nbsp;</a>
         </form>
        </div>-->
    </div>
    <div class="clear"></div>
</body>
</html>