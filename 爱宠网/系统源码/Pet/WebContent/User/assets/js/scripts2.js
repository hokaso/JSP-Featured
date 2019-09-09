function onerror(){
	alert("您的操作有误！");
}
//生成并显示验证码
function getCheckCodeFun(showCheckCode,checkCode){
	showCheckCode.style.display='';
	if(document.getElementById("resultMessage").innerHTML=="温馨提示：单击验证码输入框，获取验证码！验证码区分大小写"){
		getCheckCode1(showCheckCode,checkCode);	//生成验证码
	}
	checkCode.focus();
}
//生成验证码

function getCheckCode1(showCheckCode,checkCode){
	var loader1=new net.AjaxRequest("getCheckCode.jsp?nocache="+new Date().getTime(),deal_getCheckCode,onerror,"GET");
	showCheckCode.style.display='';
	checkCode.focus();
}

function deal_getCheckCode(){
	document.getElementById("showCheckCode").innerHTML=this.req.responseText;
}
//隐藏验证码显示框
function showCheckCodeClear(){
	showCheckCode.style.display='none';
}
/***********验证验证码是否正确*******************************/
function checkCheckCode(inCheckCode){
	if(inCheckCode!=""){
		var loader=new net.AjaxRequest("checkCheckCode.jsp?inCheckCode="+inCheckCode+"&nocache="+new Date().getTime(),deal_checkCheckCode,onerror,"GET");
	}
}
function deal_checkCheckCode(){
	var h=this.req.responseText;
	h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白符
	if(h==1){
		document.getElementById("resultMessage").removeChild(document.getElementById("resultMessage").childNodes[0]);
		document.getElementById("resultMessage").appendChild(document.createTextNode(" "));
		document.getElementById("messageImg").src="images/dui2.gif";
		document.getElementById("resultMessage").removeChild(document.getElementById("resultMessage").childNodes[0]);
		document.getElementById("resultMessage").appendChild(document.createTextNode("恭喜您，验证码正确！"));
		document.getElementById("btn_Submit").disabled=false;
	}else{
		document.getElementById("messageImg").src="images/cuo2.gif";
		document.getElementById("resultMessage").removeChild(document.getElementById("resultMessage").childNodes[0]);
		document.getElementById("resultMessage").appendChild(document.createTextNode("您输入的验证码不正确！"));
	}
}
function showCodeClear(){
	document.getElementById("messageImg").src="../images/tishi2.gif";
		document.getElementById("resultMessage").removeChild(document.getElementById("resultMessage").childNodes[0]);
		document.getElementById("resultMessage").appendChild(document.createTextNode("温馨提示：单击验证码输入框，获取验证码！验证码区分大小写"));
		document.getElementById("btn_Submit").disabled=false;
}