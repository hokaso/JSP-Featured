$(function(){
    $('.show_btn').click(function () {
        $('#mask').css('display','block')
        $('.spend-nav').fadeIn(500)
    })

    $('.close').click(function () {
        $('#mask').css('display','none')
        $('.spend-nav').fadeOut(500)
    })
    $('#cancel').click(function(){
    	$('#mask').css('display','none')
        $('.spend-nav').fadeOut(500)
    })
    $('#confirm').click(function(){
    	//学员v币
    	var coin=parseInt(document.getElementById("coin").innerHTML);
		var price=parseInt(document.getElementById('pri').innerHTML);
		//课程v币
		//课程编号
		var fnotext=document.getElementById('fnos').innerHTML;
		//课程编程地址
		var s=document.getElementById('hid').innerHTML;
		var id=document.getElementById(s);

	    if(coin>=price){
	    	var ajax;
			var sno=document.getElementById('sno').value;
		    if (window.XMLHttpRequest) {
		        ajax = new XMLHttpRequest();
		    } else if (window.ActiveXObject) {
		        ajax = new ActiveXObject("Msxml2.XMLHTTP");
		    }
		    ajax.open("get", "../check/checkCoin?fno="+fnotext+"&sno="+sno+"&scoin="+(coin-price));
		    ajax.send(null);
		    ajax.onreadystatechange = function () {
		        if (ajax.readyState == 4) {
		            if (ajax.status == 200) {
		                var result = ajax.responseText;
		                if (result == "true") {
							var id=document.getElementById(s);
							document.getElementById("coin").innerHTML=(coin-price)+'v';
							$("#video").attr("src",'/video/'+id.value);//更新url
							$("#video").attr("autoplay","true");//直接播放
		                }
		                else {
		                	alert("1")
		                }

		            } else if (ajax.status == 404) {
		            	alert("请求资源不存在")

		            } else if (ajax.status == 500) {
		                alert("服务器繁忙");
		            }
		        }

		    }
	    }
	    else{
	    	alert("v币不足，请充值！")
	    }
	    $('#mask').css('display','none')
        $('.spend-nav').fadeOut(500)
    })
})
