
var i=0;
var time;
$(function(){
	$('.text-left').click(function(){
		
		$('.text-left span').addClass('lunbo')
		$('.text-right span').removeClass('lunbo')
		$('.right-list-hide1').css('display','block')
		$('.right-list-hide2').css('display','none')
	})
	$('.text-right').click(function(){
		$('.text-right span').addClass('lunbo')
		$('.text-left span').removeClass('lunbo')
		$('.right-list-hide2').css('display','block')
		$('.right-list-hide1').css('display','none')
	})
	 $('.ig').eq(0).show().siblings().hide()
    timer()
    $('#LSlid-btn').click(function () {
        clearInterval(time)
        if(i==0){
            i=5
        }
        i--;
        shows()
        timer()
    })
    $('#RSlid-btn').click(function () {
        clearInterval(time)
        if(i==4){
            i=-1
        }
        i++;
        shows()
        timer()
    })
   $('#teaching').click(function(){
	    var ajax;
	    var account=document.getElementById("sno").innerHTML;
	    var password=document.getElementById("pwd").innerHTML;
	    if (window.XMLHttpRequest) {
	        ajax = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        ajax = new ActiveXObject("Msxml2.XMLHTTP");
	    }

	    ajax.onreadystatechange = function () {
	        if (ajax.readyState == 4) {
	            if (ajax.status == 200) {

	                var result = ajax.responseText;
//	                var showdiv = document.getElementById("result");
	                if (result == "true") {
	                    window.location.href="../page/TeacherRegister.jsp";
	                }
	                else {
	                    alert("您已经申请过了！")
	                }

	            } else if (ajax.status == 404) {
	                
	                alert("请求资源不存在")

	            } else if (ajax.status == 500) {
	               
	                alert( "服务器繁忙")
	            }
	        }

	    }
	    ajax.open("get", "../login/checkTeacher?account="+account+"&password="+password);
	    ajax.send(null);

   })
   $('#teached').click(function(){
	   var ajax;
	    var account=document.getElementById("sno").innerHTML;
	    var password=document.getElementById("pwd").innerHTML;
	    if (window.XMLHttpRequest) {
	        ajax = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        ajax = new ActiveXObject("Msxml2.XMLHTTP");
	    }

	    ajax.onreadystatechange = function () {
	        if (ajax.readyState == 4) {
	            if (ajax.status == 200) {

	                var result = ajax.responseText;
	                if (result == "0") {
	                	alert("请等待审核！")
	                    
	                }
	                else if(result=="1"){
	                	window.location.href="../homepage/authorshowAction?teacherno="+account;
	                }else{
	                	alert("还没申请老师")
	                }

	            } else if (ajax.status == 404) {
	                
	                alert("请求资源不存在")

	            } else if (ajax.status == 500) {
	               
	                alert( "服务器繁忙")
	            }
	        }

	    }
	    ajax.open("get", "../login/checkTeacherSuccess?account="+account+"&password="+password);
	    ajax.send(null);

   })
});
function timer(){
    time=setInterval(function () {
        shows()
        i++;
        if(i==5){
            i=0;
        }
    },2000)
}
function shows() {
    $('.ig').eq(i).fadeIn(700).siblings().fadeOut(700)
}