<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String college_id=(String)request.getAttribute("college_id");
%>
<title>正在与大学生<%=college_id %>聊天中</title>
  <link type="text/css" rel="stylesheet" href="/OnlineTeaching/css/chat.css">
</head>

<script type="text/javascript">
var ws=new WebSocket("ws://localhost:8080/OnlineTeaching/chat");

ws.onopen=function(){
	var junior_id="<%=session.getAttribute("junior")%>";
	var college_id="<%=college_id%>";
	ws.send("junior&open&"+junior_id+"&"+college_id);
	//junior & open & junior_id & college_id
}


ws.onmessage=function(msg){
	
	 var str = '<div class="atalk"><span>' + msg.data +'</span></div>';
	 write(str);
	
	if(msg.data=="等待对方连接中"||msg.data=="用户已退出聊天"){
		var btn=document.getElementById("talksub");
		btn.disabled=true;
	}
	else if(msg.data=="已上线"){
		var btn=document.getElementById("talksub");
		btn.disabled=false;
	}
	
}

ws.onclose=function(){
	
	ws.send("junior&close&"+"<%=session.getAttribute("junior")%>");
}

function quit(){
	ws.send("junior&quit&"+"<%=session.getAttribute("junior")%>"+"&"+"<%=college_id%>");
	window.close();
}

function send(){
  
	var Words = document.getElementById("words");//聊天记录
	
    var TalkSub = document.getElementById("talksub");//发送按钮

	var content=document.getElementById("talkwords");//要说的话

    if(content.value=="")
    	{
    	alert("消息不能为空");
    	}
    else
        {
    	ws.send("junior&content&"+"<%=session.getAttribute("junior")%>"+"&"+"<%=college_id %>"+"&"+content.value);/* 把这个内容发过去 */
    	//junior & content & junior_id & college_id & content
    	 var str = '<div class="btalk"><span> ' + content.value +'</span></div>' ;  //右侧
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

</script>



<body>

<input type="text" value="<%=college_id %>" style="display: none" id="college_id"><!-- 用来隐藏要联系的大学生 -->


<div class="talk_con">
        <div class="talk_show" id="words">
        </div>
        
        <div class="talk_input">
            <input type="text" class="talk_word" id="talkwords">
            <input type="button" value="发送" class="talk_sub" id="talksub" onclick="send()" >
            <input type="button" value="退出" class="talk_sub" id="talkquit" onclick="quit()">
        </div>
    </div>


</body>
</html>