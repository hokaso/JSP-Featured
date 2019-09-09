<%@page import="bean.Comment"%>
<%@page import="bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="bean.Fileone"%>
<%@page import="bean.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/play.css">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript" src="../js/play2.js"></script>
</head>
<body>
<%
	Course course = (Course)session.getAttribute("course");
	List<Fileone> fileones=(List<Fileone>)request.getAttribute("fileones");
	String teacherName=(String)session.getAttribute("teacherName");
	Student student=(Student)session.getAttribute("student");
	List<Comment> comments = (List<Comment>)request.getAttribute("comments");
%>
<header class="header clear_fix">
		<div class="header-nav clear_fix">
			<div class="logo">
				<img src="../img/嗨嗖logo2.png" alt="">
				<a href="../PayCoin.jsp" style="margin-top:5px;margin-left:20px;font-size:14px">充值</a>
			</div>
			<div class="header-right clear_fix">
				<span>我的v币：<span id="coin"><%=student.getScoin() %>v</span></span>
				<span>我的课程</span>
				<span>欢迎来到嗨嗖教育</span>
				<span><%=student.getSname() %></span>
			</div>
		</div>
		<div class="header-text clear-fix">
			<div class="header-text-left">
				<span>
					<a href="#">嗨嗖教育></a> <a href="#"><%=course.getCtype() %></a> | <a href="#"><%=course.getCname() %></a>
				</span>
			</div>
			<div class="header-text-right clear-fix">
				<div class="biji"><img src="../img/更多.png" alt="" id="mores"><span>更多</span></div>
				<div class="biji"><img src="../img/笔记.png" alt="" id='biji'><span>笔记</span></div>
			</div>
		</div>
	</header>
	<div class="content" id="content">
		<div id="main" >
			<div id="video-main"   >
				<video  id="video" type="video/webm"  poster="../img/猴子-1.jpg" onclick="PlayOrPause()" width= 100%; height=100%; style="object-fit: fill"></video>
			</div>
			<div class="bar">
				<div class="play-img">
							<img src="../img/播放1.png" alt="" id="play-img-1"  class="play-img-1" onclick="Play()">
							<img src="../img/播放2.png" alt="" id="play-img-2" class="play-img-2" onclick="Play()">
				</div>
				<div id="probar" style="width: 900px;"><div id="progress"></div></div>
					
					<div class="bar-bottom clear_fix">
					
						<div class="bar-bottom-left .clear_fix">
							<img src="../img/小播放.png" alt="" id="play-img-xiao" class="play-img-xiao changeBlue1" onclick="PlayOrPause()">
							<span id="duration">00:00</span><span id="currentTime">00:00</span>

						</div>
						<div class="bar-bottom-right clear_fix">
							<span>高清</span>
							<span id="voice">
								<div class="voice" id='vo'>
									<div class="voice-scroll" id="scroll"></div>
									<img src="../img/滑块.png" alt="" class="img" id="scroll-img">
								</div>
								<img src="../img/声音.png " alt="" class="changeBlue2">
							</span>
							<span><img src="../img/设置.png" alt="" class="changeBlue3"></span>
							
							<span class="existImg"><img src="../img/全屏.png" alt="" id="exit" class="changeBlue4" onclick="allScreen(this)"></span>
							<span class="existImg2" id="ssss" ><img src="../img/退出全屏.png" alt="" id="exit2" class="changeBlue5" ></span>
						</div>
						
					</div>
			</div>
			<link rel="stylesheet" type="text/css" href="../css/main-bottom.css" >
			<div class="main-bottom clear-fix">
				<div class="main-bottom-left clear-fix">
					<span class="main-bottom-left-txt">分享给朋友:</span>
					<span><img src="../img/QQ.png" alt="" class="qq-img" id="qq-img"></span>
					<span><img src="../img/微信.png" alt="" id="weixin-img"></span>
					
					
				</div>
				<div class="main-bottom-right clear-fix">
					<div class="main-bottom-right-load">
						<span><img src="../img/收藏.png" alt="" id="shouchang"></span>
						<span>收藏课时</span>
					</div>
					<div class="main-bottom-right-load" >
						<span><img src="../img/下载.png" alt="" id="download"></span>
						<span>下载</span>
					</div>
				</div>
			</div>
		</div>
		<link rel="stylesheet" type="text/css" href="../css/float-left.css"> 
		<div class="float-left">
			
			<span class="video-list">视频列表</span>
			<div class="float-left-header">平面设计</div>
			<div class="float-left-lists">
				<ul class="lists-nav">
					
					<%
						if(!fileones.isEmpty()){
						for(int i=0;i<fileones.size();i++){
					%>
					<li>
					<input type="hidden" value="<%=fileones.get(i).getFupload() %>" id="hidden<%=i%>">
					<input type="hidden" value="<%=fileones.get(i).getFprice()%>" id="prices<%=i%>">
					<span style="display: none;" id="fno<%=i%>"><%=fileones.get(i).getFno() %></span>
					<%
						if(fileones.get(i).getFprice()==0){
					%>
					<img src="../img/play.png" alt="" id='lists-play-img'>
					<%}else{ %>
					<img src="../img/paycoin.png" alt="" id='lists-play-img'>
					<%} %>
					<span>p<%=i %></span><span><%=fileones.get(i).getFname() %></span>
					</li>
					<!-- <li><img src="" alt="" class='lists-play-img'><span>p2</span><a href="#">第一章 2新建文档</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p3</span><a href="#">第一章 3初识界面</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p4</span><a href="#">第一章 4移动工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p5</span><a href="#">第一章 5选区工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p6</span><a href="#">第一章 6套索工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p7</span><a href="#">第一章 7魔棒工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p8</span><a href="#">第一章 8截取工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p8</span><a href="#">第一章 8截取工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p8</span><a href="#">第一章 8截取工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p8</span><a href="#">第一章 8截取工具</a></li>
					<li><img src="" alt="" class='lists-play-img'><span>p8</span><a href="#">第一章 8截取工具</a></li>
					 -->
					<%}} %>
					<input type="hidden" value="<%=student.getSno()%>" id="sno">
					<input type="hidden" value="<%=course.getCno()%>" id="cno">
					<span style="display:none;" id="Sno"><%=student.getSno()%></span>
					<span id="fnos" style="display:none;"></span>
					<span id="pri" style="display:none;"></span>
					<span id="hid" style="display:none;"></span>
				</ul>
			</div>
		</div>
		<link rel="stylesheet" type="text/css" href="../css/float-right.css">
		<div class="float-right clear-fix"> 
			<span id="span-close"><img src="../img/close.png" alt="" class="close"></span>
			<div class="float-right-top clear-fix">
				<ul>
					<li class=" "><button id="jietu">截图</button><span></span></li>
					<li class="">
						<select name="fun" id="sel" onchange="changeSel()">
							<option value="drawPencil">笔画</option>
							<option value="drawRect">矩形</option>
							<option value="drawLine">直线</option>

						</select>
					</li>
					
				</ul>
				<a href="" download="canvas_love.png" id="save_href">
				<img src="" id="save_img"/></a>
			</div>
			<div class="float-right-mid">
				<canvas id="mycanvas" width="700" height="368" ></canvas>
			</div>
			<div class="float-right-bottom">
				<label for="" class="label-txt">输入文字:</label>
				<input type="text" class="input-txt" placeholder="输入文字之后点击画布即可添加">
				<br>
				<button class="save" id="save">保存</button>
			</div>
		</div>
		
			
	</div>
	<link rel="stylesheet" type="text/css" href="../css/content-bottom.css">
	<div class="content-nav">
		<div class="content-bottoms clear_fix" >
			<div class="content-bottom-left">
			 	<div class="left-bottom-nav">
					<div class="left-bottom-header">
						<div class="gentie clear-fix">
							<img src="../img/微信.png" alt="">
							<span class="gentie-txt">跟贴</span>
						</div>
						<div class="recommend">
							<span class="person"><span>1000 </span>人评论</span>
						</div>
					</div>
					<div class="left-bottom-main">
						<ul class="recommends">
						<%
									if(!comments.isEmpty()){
									for(int i=comments.size()-1;i>=0;i--){
								%>
							<li class="recommend-item clear_fix">
								
								<div class="recommend-item-left">
									<img src="../img/猴子-1.jpg" alt="">
								</div>
								
								<div class="recommend-item-right clear-fix">
									<div class="recommend-item-right-1">
										<span><%=comments.get(i).getSno() %></span>
										<span><%=comments.get(i).getTime() %></span>
									</div>
									<div class="recommend-item-right-2">
										<%=comments.get(i).getCom() %>
									</div>
									<div class="recommend-item-right-3">
										回复
									</div>
								</div>
							</li>
							<%} }else{%>
							<li class="recommend-item clear_fix">
								空空如也
							</li>
							<%} %>
							<li class="recommend-item clear_fix" style="display:none;" id="clone">
								
								<div class="recommend-item-left">
									<img src="../img/猴子-1.jpg" alt="">
								</div>
								
								<div class="recommend-item-right clear-fix">
									<div class="recommend-item-right-1">
										<span></span>
										<span></span>
									</div>
									<div class="recommend-item-right-2">
										
									</div>
									<div class="recommend-item-right-3">
										回复
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="content-bottom-rights">
			
				<img src="/img/<%=course.getCphoto() %>" alt="" class="course-img">
				<div id="teach">
					<span class="teacher">教师：<%=teacherName %></span>
					<span class="discurse"><a href="#">[向老师提问]</a></span>
				</div>
				<div id="creatTime">
					<span class="creatTime">创课时间：<%=course.getCtime() %></span>
				</div>
				<span class="course-introduce">
					<span class="course-jianjie">[课程简介]</span>
				<%=course.getCdescribe() %></span>
				<input type="button" value="购买此课程" onclick="javascrtpt:window.location.href='../PayCourse.jsp'">
			</div> 
			<div class="comment">
					<div class="comment-nav">
						<div class="comment-header">
							<img src="../img/笔记2.png" alt="">
							<span>发表评论</span>
						</div>
						<div class="comment-main">
							<textarea name="" id="commentTxt" cols="47" rows="10" placeholder="发表你的精彩评论"></textarea>
						</div>
						<div class="comment-bottom">
							<input type="button" value="发表" id="fabiao">
						</div>
					</div>
					
				</div>
		</div>
		</div>
	<!-- <canvas id="canvas" width="300" height="200"></canvas> -->
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
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
                <a href="#"><img src="../img/wanan.png" alt="">京公安网备100101200</a>
            </div>
        </div>
        <div class="cert">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
	</footer>
	<link rel="stylesheet" type="text/css" href="../css/spend.css">
	<script type="text/javascript" src="../js/spend.js"></script>
	<div id="mask"></div>
	<div class="spend-price">
		<div class="spend-nav">
			<div class="close">
	                <img src="../img/close.png" alt="">
	        </div>
	        <div class="spend-txt">
	        	<span>此节课需要<% if(!fileones.isEmpty()){out.print(fileones.get(fileones.size()-1).getFprice());} %>v币才能继续看</span>
	        </div>
	        <div class="but">
	        	<input type="button" value="确认观看" id="confirm">
	        	<input type="button" value="取消" id="cancel">
	        </div>
	        
        </div>
	</div>
	<script>
		var box = document.getElementById('scroll-img')
		var bar = document.getElementById('scroll')
		var cha = 72;
		/*
		var videovol2=document.getElementById('video')
		videovol2.oncanplay=function(){
			var num=document.getElementById('video').duration;
			var s=parseInt(parseInt(num)/60);
				var ss;
				var mm;
				if(s<10){
					ss='0'+s
				}else{
					ss=s+'';
				}
				var m=parseInt(parseInt(num)%60)
				if(m<10){
					mm='0'+m;
				}else{
					mm=m+'';
				}
				var t='/ '+ss+':'+mm;
			document.getElementById('duration').innerHTML=t;
			    
			}
		*/
		box.onmousedown = function (ev) {

		var videovol=document.getElementById('video')

		var boxL = box.offsetTop;
		var e = ev || window.event //兼容性
		var mouseY = e.clientY //鼠标按下的位置
		window.onmousemove = function (ev) {

		var e = ev || window.event
		var moveL = e.clientY - mouseY //鼠标移动的距离
		var newL = boxL +moveL //bottom值
		// 判断最大值和最小值

		if (newL < 3) {
		newL = 3
		}
		if (newL >= cha) {
		newL = 72
		}
		// 改变left值
		box.style.top = newL + 'px'
		videovol.volume=1-newL/72;
		return false //取消默认事件
		}
		window.onmouseup = function () {
		window.onmousemove = false //解绑移动事件
		return false
		}
		return false
		};
		// bar.onclick = function (ev) {

		// 	var vo=document.getElementById('vo')
		// 	alert(vo.offsetTop)
		// let left = ev.clientY - all.offsetLeft - box.offsetWidth / 2
		// if (left < 0) {
		// left = 0
		// }
		// if (left >= cha) {
		// left = cha
		// }
		// box.style.top = left + 'px'
		// videovol.volume=1-newL/72;
		// return false
		// }

		function Play(){
			var video=document.getElementById('video');
			if(video.paused){
				video.play();
				event.target.style.display='none'
				//alert(event.target.parentNode.childNodes.length)
				document.getElementById('play-img-1').style.display='none'
				document.getElementById('play-img-xiao').src='../img/暂停.png'
			}
		}
		function PlayOrPause(){
			var video=document.getElementById('video');
			if(video.paused){
				video.play();

				document.getElementById('play-img-1').style.display='none'
				document.getElementById('play-img-2').style.display='none'
				event.target.src='../img/暂停.png'
				event.target.class='changeBlue1'
			}
			else{
				video.pause();
				document.getElementById('play-img-1').style.display='block'
				document.getElementById('play-img-2').style.display='block'
				event.target.src='../img/小播放.png'
				event.target.class='changeBlue5'
			}
		}
		window.onresize = function() {

			if (!checkFull()) {

				var probar=document.getElementById('probar');
				var exit=document.getElementById('exit');
				var exit2=document.getElementById('exit2');
				exit2.style.display='none'
		    	 exit.style.display='block'
				//触发esc事件，执行业务逻辑。
				var v=document.getElementById('main');
				var videomain=document.getElementById('video-main');
				v.style.width=900+"px";
		        v.style.height=505+"px";
		        probar.style.width=900+"px"; 
		        videomain.style.width=900+"px";
		        videomain.style.height=505+"px";  
			}
		};
		function allScreen2(){
			var v=document.getElementById('main');
			var videomain=document.getElementById('video-main');
			var exit=document.getElementById('exit');
			var exit2=document.getElementById('exit2');
			var probar=document.getElementById('probar');
			
			if(v.requestFullScreen) {
				alert('1')
		        // v.requestFullScreen(); 

		        // video.width='1000px';
		    } else if(v.mozRequestFullScreen) {
		    	alert('2')
		    	v.style.width=900+"px";
		        v.style.height=900+"px";
		        
		        videomain.style.width=900+"px";
		        videomain.style.height=900+"px";
		      
		        // v.mozRequestFullScreen(); 
		        // video.style.width='900px';
		    } else if(v.webkitRequestFullScreen) {
				// alert(exit2.style.display)
		    	exit2.style.display='block'
		    	
		    	 exit.style.display='none'
		    	 
		    	 v.style.width=window.screen.width+"px";
		        v.style.height=window.screen.height+"px";
		        
		        videomain.style.width=window.screen.width+"px";
		        videomain.style.height=window.screen.height+"px"; 
		        probar.style.width=window.screen.width+"px"; 
		        
		         v.webkitRequestFullScreen();

		    }
		    
		}
		function allScreen(th){

			allScreen2();
			
		}

		function checkFull() {

			var isFull = document.fullscreenEnabled|| window.fullScreen
					|| document.webkitIsFullScreen
					|| document.msFullscreenEnabled;

			if (isFull === undefined)
				isFull = false;

			return isFull;
		}

	</script>
</body>
</html>