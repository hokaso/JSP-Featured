<%@page import="bean.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HomePage</title>
<link href="../css/HomePage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/HomePage-slider-show.js" type="text/javascript"></script>
</head>
<body>
<%
Student student = (Student)session.getAttribute("student");
%>
<span style="display:none;" id="sno"><%=student.getSno()%></span>
<span style="display:none;" id="pwd"><%=student.getSpassword()%></span>
	<div class="header-nav">
			<div class="teach">
			    <span id="teached">已是讲师，请点击此</span>
				<span id="teaching">申请为讲师</span>
			</div>
		</div>
	<div class="top-divfu">
		<div class="top-divzi">
			<div class="top-divzi-1">
				<h2>HeyShow教育</h2>
			</div>
			<div class="top-divzi-2">
				<input type="text" class="searchInput" placeholder="输入课程名称" />
				<a href="#"><input type="button" class="search" value="搜索"/></a>
			</div>
			<div class="top-divzi-3">
				<ul id="menu">
				<%
					
					if(student==null){
				%>
					<li><a href="#">登录</a>/<a href="#">注册</a></li>
					<%} else{%>
					<li id="sname"><a href="#"><%=student.getSname() %></a></li>
					<%} %>
					<li style="width: 50px;"><a href="../PayCoin.jsp">充值</a></li>
					<li id="spri">v币：<%=student.getScoin() %>v</li>
					<li><a href="#">个人中心</a></li>			
				</ul>
			</div>
		</div>
	</div>
<%
List<List<Object[]>> all=(List<List<Object[]>>)request.getAttribute("all");

%>
<div class="main-and-sliderShow">
	<div class="main">
		<div class="main-center">		
		<ul class="kecheng">
			<li>电脑办公
				<div class="course-type">
					<div class="link-line-1">
						<%	
							int s6=4;
							if(all.get(0).size()<s6){
								s6=all.get(0).size();
							}
							for(int i=0;i<s6;i++){
						%>
						<a href="../play/play?cno=<%=all.get(0).get(i)[0]%>" target="_blank"><%=all.get(0).get(i)[1]%></a>
						<br>&emsp;&nbsp;&nbsp;
						<%} %>
					</div>
					<div class="link-line-2">
					<%
					int k1=8;
					if(all.get(0).size()<k1){
						k1=all.get(0).size();
					}
					for(int i=4;i<k1;i++){
					%>
					<a href="../play/play?cno=<%=all.get(0).get(i)[0]%>" target="_blank"><%=all.get(0).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					<%} %>
					</div>
					<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>平面设计
				<div class="course-type">
				<div class="link-line-1">
				<%
					int s7=4;
					if(all.get(1).size()<s6){
						s7=all.get(0).size();
					}
					for(int i=0;i<s7;i++){
				%>
				<a href="../play/play?cno=<%=all.get(1).get(i)[0]%>" target="_blank"><%=all.get(1).get(i)[1]%></a>
				<br>&emsp;&nbsp;&nbsp;
				<%} %>
				</div>
				<div class="link-line-2">
				<%
				int k2=8;
				if(all.get(1).size()<k2){
					k2=all.get(1).size();
				}
					for(int i=4;i<k2;i++){
				%>
				<a href="../play/play?cno=<%=all.get(1).get(i)[0]%>" target="_blank"><%=all.get(1).get(i)[1]%></a>
				<br>&emsp;&nbsp;&nbsp;
				<%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>程序开发
				<div class="course-type">
				<div class="link-line-1">
					<%
						int s1=4;
						if(all.get(2).size()<4){
							s1=all.get(2).size();
						}
						for(int i=0;i<s1;i++){
					%>
					<a href="../play/play?cno=<%=all.get(2).get(i)[0]%>" target="_blank"><%=all.get(2).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
				<%} %>
				</div>
				<div class="link-line-2">
					<%
					int k3=8;
					if(all.get(2).size()<k3){
						k3=all.get(2).size();
					}
						for(int i=4;i<k3;i++){
					%>
					<a href="../play/play?cno=<%=all.get(2).get(i)[0]%>" target="_blank"><%=all.get(2).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
				<%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>网页设计
				<div class="course-type">
				<div class="link-line-1">
				<%
					int s2=4;
					if(all.get(3).size()<4){
						s2=all.get(3).size();
					}
					for(int i=0;i<s2;i++){
				%>
					<a href="../play/play?cno=<%=all.get(3).get(i)[0]%>" target="_blank"><%=all.get(3).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
				<%} %>
				</div>
				<div class="link-line-2">
					<%
					int k4=8;
					if(all.get(3).size()<k4){
						k4=all.get(3).size();
					}
						for(int i=4;i<k4;i++){
					%>
					<a href="../play/play?cno=<%=all.get(3).get(i)[0]%>" target="_blank"><%=all.get(3).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
				<%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>影视动画
				<div class="course-type">
					<div class="link-line-1">
					<%
						int s4=4;
						if(all.get(4).size()<4){
							s4=all.get(4).size();
						}
						for(int i=0;i<s4;i++){
					%>
					<a href="../play/play?cno=<%=all.get(4).get(i)[0] %>" target="_blank"><%=all.get(4).get(i)[1] %></a>
					<br>&emsp;&nbsp;&nbsp;
					
					<%} %>
				</div>
					<div class="link-line-2">
					<%	
					int k5=8;
					if(all.get(4).size()<k5){
						k5=all.get(4).size();
					}
						for(int i=4;i<all.get(4).size();i++){
					%>
					<a href="../play/play?cno=<%=all.get(4).get(i)[0]%>" target="_blank"><%=all.get(4).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
					 <%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>室内设计
				<div class="course-type">
				<div class="link-line-1">
					<%
						int s5=4;
						if(all.get(5).size()<4){
							s5=all.get(5).size();
						}
						for(int i=0;i<s5;i++){
					%>
					<a href="../play/play?cno=<%=all.get(5).get(i)[0] %>" target="_blank"><%=all.get(5).get(i)[1] %></a>
					<br>&emsp;&nbsp;&nbsp;
					
					<%} %>
				</div>
				<div class="link-line-2">
				<%
				int k6=8;
				if(all.get(5).size()<k6){
					k6=all.get(5).size();
				}
					for(int i=4;i<k6;i++){
				%>
					<a href="../play/play?cno=<%=all.get(5).get(i)[0]%>" target="_blank"><%=all.get(5).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
					<%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
			<li>室外设计
				<div class="course-type">
				<div class="link-line-1">
				<%
					int ss=4;
					if(all.get(6).size()<4){
						ss=all.get(6).size();
					}
					for(int i=0;i<ss;i++){
				%>
					<a href="../play/play?cno=<%=all.get(6).get(i)[0]%>" target="_blank"><%=all.get(6).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
				
					<%} %>
				</div>
				<div class="link-line-2">
				<%
					int k7=8;
					if(all.get(6).size()<k7){
						k7=all.get(6).size();
					}
					for(int i=4;i<k7;i++){
				%>
					<a href="../play/play?cno=<%=all.get(6).get(i)[0]%>" target="_blank"><%=all.get(6).get(i)[1]%></a>
					<br>&emsp;&nbsp;&nbsp;
					
					<%} %>
				</div>
				<div class="course-more"><a href="#">更多&gt;&gt;</a></div>
				</div>
			</li>
		</ul>
		</div>
	</div>
	<div class="homeshow-fu-fu">
	<div class="homeshow-fu">
		<!-- 轮播图部分 -->
		<div class="slider-show">
			<div><span id="LSlid-btn">&nbsp;&lt;</span></div>
			<div><span id="RSlid-btn">&nbsp;&gt;</span></div>
			
			
			<!-- <a href="#"><img src="../img/p1.png" id="slider-show-img"></a> -->
			<div class="banner-nav">
				<ul class="banner-img">
					<li class="ig"><img src="../img/a1.png" alt=""></li>
					<li class="ig"><img src="../img/a2.png" alt=""></li>
					<li class="ig"><img src="../img/a3.png" alt=""></li>
					<li class="ig"><img src="../img/a4.png" alt=""></li>
					<li class="ig"><img src="../img/a5.png" alt=""></li>
				</ul>
			</div>
		</div>
		<!-- 右边菜单栏 -->
		<div class="right-list">
			<div class='right-list-header'>
				<span class="text-left">超牛课程 <span class="lunbo"></span></span>
				<span class="text-right">最新课程 <span></span></span>
			</div>
			<div class="right-list-main right-list-hide1">
				
				<div class="small-nav">
					<span class="child1">01</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">02</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">03</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">04</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">05</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">06</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">07</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">08</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">09</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">10</span>
					<span class="child2">HTML从入门到精通</span>
					
				</div>
			</div>
			<div class="right-list-main right-list-hide2">
				<div class="small-nav">
					<span class="child1">01</span>
					<span class="child2">javascrip从入门到精通</span>

				</div>
				
				<div class="small-nav">
					<span class="child1">02</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">03</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">04</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">05</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">06</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">07</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">08</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">09</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
				<div class="small-nav">
					<span class="child1">10</span>
					<span class="child2">javascrip从入门到精通</span>
					
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
	<div class="interval">
			<!-- 热门课程展示 -->
		<div class="course-list-1">
			<!-- 左侧文字列表 -->
			<div class="news-course">
				<span class="news-course-txt">最新课程</span>
			</div>
			<div class="news-course-nav clear-fix">
				<div class="detail1">
					<h3>New course</h3>
					<span>电脑办公</span>
					<span>平面设计</span>
					<span>程序开发</span>
					<span>网页设计</span>
					<span>影视动画</span>
					<span>室内设计</span>
					<span>室外设计</span>
				</div>
				<div class="detail2">
					<a href="../play/play?cno=<%=all.get(0).get(0)[0]%>" target="_blank">
						<div class="detail2-img">
							<img src="../img/猴子-1.jpg" alt="">
						</div>
						<span class="detail2-txt"><%=all.get(0).get(0)[1]%></span>
					</a>
					<div class="detail2-plays clear-fix">
						<span>1002</span>
						<span>播放量：</span>
						
					</div>
				</div>
				<div class="detail3 clear-fix">
					<a href="../play/play?cno=<%=all.get(1).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(1)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(2).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(2)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(3).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(3)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(4).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(4)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(5).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(5)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(6).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(6)[1]%></span>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="course-list-1">
			<!-- 左侧文字列表 -->
			<div class="news-course">
				<span class="news-course-txt">热门课程</span>
			</div>
			<div class="news-course-nav clear-fix">
				<div class="detail1">
					<h3>Hot course</h3>
					<span>电脑办公</span>
					<span>平面设计</span>
					<span>程序开发</span>
					<span>网页设计</span>
					<span>影视动画</span>
					<span>室内设计</span>
					<span>室外设计</span>
				</div>
				<div class="detail2">
					<a href="../play/play?cno=<%=all.get(0).get(0)[0]%>" target="_blank">
						<div class="detail2-img">
							<img src="../img/猴子-1.jpg" alt="">
						</div>
						<span class="detail2-txt"><%=all.get(0).get(0)[1]%></span>
					</a>
					<div class="detail2-plays clear-fix">
						<span>1002</span>
						<span>播放量：</span>
						
					</div>
				</div>
				<div class="detail3 clear-fix">
					<a href="../play/play?cno=<%=all.get(1).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(1)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(2).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(2)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(3).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(3)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(4).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(4)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(5).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(5)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(6).get(0)[0]%>" target="_blank">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(6)[1]%></span>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="course-list-1">
			<!-- 左侧文字列表 -->
			<div class="news-course">
				<span class="news-course-txt">精品课程</span>
			</div>
			<div class="news-course-nav clear-fix">
				<div class="detail1">
					<h3>Perfect course</h3>
					<span>电脑办公</span>
					<span>平面设计</span>
					<span>程序开发</span>
					<span>网页设计</span>
					<span>影视动画</span>
					<span>室内设计</span>
					<span>室外设计</span>
				</div>
				<div class="detail2">
					<a href="../play/play?cno=<%=all.get(0).get(0)[0]%>">
						<div class="detail2-img">
							<img src="../img/猴子-1.jpg" alt="">
						</div>
						<span class="detail2-txt"><%=all.get(0).get(0)[1]%></span>
					</a>
					<div class="detail2-plays clear-fix">
						<span>1002</span>
						<span>播放量：</span>
						
					</div>
				</div>
				<div class="detail3 clear-fix">
					<a href="../play/play?cno=<%=all.get(1).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(1)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(2).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(2)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(3).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(3)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(4).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(4)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(5).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(5)[1]%></span>
						</div>
					</a>
					<a href="../play/play?cno=<%=all.get(6).get(0)[0]%>">
						<div class="detail3-1">
							<img src="../img/a1.png" alt="">
							<span><%=all.get(0).get(6)[1]%></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
		<footer class="footer">
		<div class="copyright">
            <p>
                &copyright
                <a href="#">嗨嗖教育1.0 </a>haisou.com
                <a href="#">京ICP证070791号</a>
                <a href="#">京ICP备01210001</a>
                <a href="#">京ICP备01210001教育服务规则</a>
            </p>
            <div >
                <a href="#">广播电视台许可证（京）字第02121号</a>
                <a href="#"><img src="../img/wanan.png" alt="无法显示">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
</body>
</html>