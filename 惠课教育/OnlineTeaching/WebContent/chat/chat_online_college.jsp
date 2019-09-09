<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% 
String junior_id=(String)request.getAttribute("junior_id");
%>

<title>正在与中小学生<%=junior_id %>聊天中</title>
<link type="text/css" rel="stylesheet"
	href="/OnlineTeaching/css/chat.css">
</head>

<script type="text/javascript">
var ws=new WebSocket("ws://localhost:8080/OnlineTeaching/chat");

ws.onopen=function(){
	ws.send("college&open&"+"<%=session.getAttribute("college")%>"+"&"+"<%=junior_id%>");
	//junior & open & junior_id & college_id
}


ws.onmessage=function(msg){
	
	var str = "<div class='atalk'><span>" + msg.data +"</span></div>";
	 write(str);
	
	if(msg.data=="用户已退出聊天"){
		var btn=document.getElementById("talksub");
		btn.disabled=true;
	}
	
	
}

ws.onclose=function(){
	
	ws.send("college&close&"+"<%=session.getAttribute("college")%>");
}



function send(){

	var Words = document.getElementById("words");//聊天记录
	
    var TalkSub = document.getElementById("talksub");//发送按钮

	var content=document.getElementById("talkwords");//要说的话
    
    if(content=="")
    	{
    	alert("消息不能为空");
    	}
    else
    	{
    	ws.send("college&content&"+"<%=session.getAttribute("college")%>"+"&"+"<%=junior_id %>"+"&"+content.value);/* 把这个内容发过去 */
    		//college & content & college_id & junior_id & content	
    	var str = "<div class='btalk'><span>" + content.value +"</span></div>"; //右侧
    	write(str);
        content.value=""; 
    		}
	
}


function write(aa)
{
	var Words = document.getElementById("words");
	Words.innerHTML = Words.innerHTML + aa;
	
	 var scrollDiv = document.getElementById('words');
     scrollDiv.scrollTop = scrollDiv.scrollHeight;
	}
	
	
function quit(){
	ws.send("college&quit&"+"<%=session.getAttribute("college")%>"+"&"+"<%=junior_id%>");
	window.close();
}

</script>



<body>
	<input type="text" id="junior_id" value="<%=junior_id %>"
		style="display: none">


	<div class="talk_con">
		<div class="talk_show" id="words"></div>

		<div class="talk_input">
			<input type="text" class="talk_word" id="talkwords"> <input
				type="button" value="发送" class="talk_sub" id="talksub"
				onclick="send()"> <input type="button" value="退出"
				class="talk_sub" id="talkquit" onclick="quit()">
		</div>
	</div>



</body>
</html>