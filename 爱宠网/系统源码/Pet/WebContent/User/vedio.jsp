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
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript" src="JS/ddsmoothmenu.js"></script>
<script type="text/javascript" src="JS/menu.js"></script>
<script type="text/javascript" src="JS/contentslider.js"></script>
<script type="text/javascript" src="JS/jquery.scroll.js"></script>
<script type="text/javascript" src="JS/scroll.js"></script>
<script type="text/javascript" src="JS/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="JS/switch.js"></script>
<script type="text/javascript" src="JS/cufon-yui.js"></script>
<script type="text/javascript" src="JS/cufon.js"></script>
<script type="text/javascript" src="JS/font.js"></script>
</head>
<body class="bg2">
<span class="biglines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
 <%@include file="../User/head.jsp" %>
	<!-- Top Section -->
    <!--<div class="top_sec">
        <div class="toplinks">
        	<ul>
            	<li class="first"><a href="../User/index.jsp">Home</a></li>
                <c:if test="${empty currentMember }">
							<li><a href="../Pet/User/login.jsp">Login</a></li>
							<li><a href="regist.jsp">Signup</a></li>
						</c:if>
						<c:if test="${not empty currentMember}">
							<li>${currentMember.account }:你好!</li>
							<li><a href="../Pet/User/center.jsp">Personal Center</a></li>
							<li><a href="javascript:Exit()">Exit1</a></li>
						</c:if>
            </ul>
        </div>
        <script type="text/javascript">
        function Exit(){
        	 sessionStorage.clear();  //清除所有session值
        	  window.location.href="../Pet/User/login.jsp";
        
        }
        </script>
        <div class="links_icons">
   
        	<ul>
            </ul>
        </div>			
    </div>-->
			<!-- Column 1 -->
			<div class="col1">
				<div class="news">
					<h2 class="heading">Vedio</h2>
					<ul class="newslisting" id="c_ul">
				       <s:iterator value="page1.list">
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
						<span class="featured"><p class="txt" id="txt"><s:property value="vedioTitle" /></span>
						<div class="desc">
						<a href="User/vedio2.jsp?id=<s:property value='%{id}'/>&fileName=<s:property value='%{address}'/>">Read more</a>
                        <!--<a href="download.action?fileName=<s:property value='%{address}' />">download</a>-->
						</div>
						</li>
						</s:iterator>
					</ul>
					<h3>PAGE:</h3><%@include file="page3.jsp"%>
				</div>
				<div class="clear"></div>
				<!-- Pagination -->
				<div class="paginations">
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
	<!-- Footer -->
		<div class="inner">
			<!-- Top button Section -->
			<div class="topbutonsec">
				<a href="#">Footer</a>
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
