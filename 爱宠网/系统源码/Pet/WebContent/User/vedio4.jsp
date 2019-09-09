<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri=http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
<link href="../CSS/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/scrollbar.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../CSS/danmuplayer.css">
<script src="../JS/lib/jquery-3.1.1.min.js"></script>
<script src="../JS/danmuplayer.js"></script>
<!--<script src="../JS/lib/jquery-3.1.1.js"></script>  -->
<title>Insert title here</title>
</head>
<body>
<span class="biglines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
	<!-- Top Section -->
    <div class="top_sec">
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
<div id="danmup"></div>
<script type="text/javascript">
$("#danmup").danmuplayer({
  src:"../vedio/3.mp4",       //视频源
  width:800,            //视频宽度
  height:445,            //视频高度
  url_to_get_danmu: "Manager_findDanmu.action?id="+1,            //用来接收弹幕信息的url  (稍后介绍)
  url_to_post_danmu: "Manager_addDanmu.action"
});
</script>
</body>
</html>