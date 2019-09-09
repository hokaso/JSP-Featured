$(function(){
		var video=document.getElementById('video');
		var exit2=document.getElementById('exit2');
		exit2.style.display='none'

			
			window.onload=function(){
			
			var progress=document.getElementById("progress");
			var probar=document.getElementById("probar");
			probar.addEventListener('click',progress_click)
			video.addEventListener('timeupdate',Progress)
			var box = document.getElementById('scroll-img')
			var videovol=document.getElementById('video')
			videovol.volume=0.5;
			box.style.top=(videovol.volume*72)+'px';
			videovol.oncanplay=function(){
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
		}
			$(".changeBlue1").hover(function(){
				if ((video.paused)) {
					$(".changeBlue1").attr("src","../img/小播放2.png");
				}else{
					$(".changeBlue1").attr("src","../img/暂停2.png");
				}
			   	
			},function(){
			   if ((video.paused)) {
					$(".changeBlue1").attr("src","../img/小播放.png");
				}else{
					$(".changeBlue1").attr("src","../img/暂停.png");
				}
			   	
			});
			$('#voice').hover(function(){
				$('.bar-bottom-right .voice ').css('display','block');
			},function(){
				$('.bar-bottom-right .voice ').css('display','none');
			})
			$('.changeBlue2').hover(function(){
				$('.changeBlue2').attr('src','../img/声音2.png')
				
			},function(){
				$('.changeBlue2').attr('src','../img/声音.png')
				
			})
			$('.changeBlue3').hover(function(){
				$('.changeBlue3').attr('src','../img/设置2.png')
			},function(){
				$('.changeBlue3').attr('src','../img/设置.png')
			})
			$('.changeBlue4').hover(function(){
				$('.changeBlue4').attr('src','../img/全屏2.png')
			},function(){
				$('.changeBlue4').attr('src','../img/全屏.png')
			})
			$('.changeBlue5').hover(function(){
				$('.changeBlue5').attr('src','../img/退出全屏2.png')
			},function(){
				$('.changeBlue5').attr('src','../img/退出全屏.png')
			})
			$('.bar').hover(function(){
				// alert()
				$('.bar').stop().animate({opacity:0.8},500)
			},function(){
				$('.bar').stop().animate({opacity:0},500)
			})
			$('.changeBlue5').click(function(){

				var exit=document.getElementById('exit');
				var exit2=document.getElementById('exit2');
				var probar=document.getElementById('probar');
				var v=document.getElementById('main');
				document.webkitCancelFullScreen();
				var videomain=document.getElementById('video-main');
				var content=document.getElementById('content');
				v.style.width=900+"px";
		        v.style.height=507+"px";
		        probar.style.width=900+"px"; 
		        videomain.style.width=900+"px";
		    	videomain.style.height=507+"px"
				exit2.style.display='none'
		    	exit.style.display='block'
			})
			$('#scroll-img').hover(function(){
				this.src='../img/滑块2.png';
			},function(){
				this.src='../img/滑块.png';
			})
			$('#qq-img').hover(function(){
				$('#qq-img').attr('src',"../img/QQ2.png")
			},function(){
				$('#qq-img').attr('src',"../img/QQ.png")
			})
			$('#weixin-img').hover(function(){
				$('#weixin-img').attr('src',"../img/微信2.png")
			},function(){
				$('#weixin-img').attr('src',"../img/微信.png")
			})
			$('#shouchang').hover(function(){
				$('#shouchang').attr('src',"../img/收藏2.png")
			},function(){
				$('#shouchang').attr('src',"../img/收藏.png")
			})
			$('#download').hover(function(){
				$('#download').attr('src',"../img/下载2.png")
			},function(){
				$('#download').attr('src',"../img/下载.png")
			})
			
			$('.float-left').hover(
				function(){
					$('#main').stop().animate({
						left:'100px'
					})
					$('.float-left').stop().animate({
						left:'0px'
					})
			},function(){
				$('#main').stop().animate({
						left:'0px'
					})
				$('.float-left').stop().animate({
					left:'-270px'
				})
			})
			$('#biji').hover(function(){
				$('#biji').attr('src','../img/笔记2.png')
			},function(){
				$('#biji').attr('src','../img/笔记.png')
			})
			$('#mores').hover(function(){
				$('#mores').attr('src','../img/更多2.png')
			},function(){
				$('#mores').attr('src','../img/更多.png')
			})
			$('#biji').click(function(){
				$('.float-right').stop().animate({
					right:'50px'
				})
				$('#main').stop().animate({
						left:'-175px'
				})

			})
			$('#span-close').click(function(){
				$('.float-right').stop().animate({
					right:'-330px'
				})
				$('#main').stop().animate({
						left:'0px'
				})
			})
			$('.float-right-top ul li').click(function(){
				$(this).addClass('active')
       			$(this).siblings().removeClass('active')
			})
			$('.lists-nav li').click(function(){
				var s='hidden'+$(this).index()
				var priceClass='prices'+$(this).index();
				var fnoId='fno'+$(this).index();
				var price=document.getElementById(priceClass).value;
				var fnotext=document.getElementById(fnoId).innerHTML;
				if(parseInt(price)==0){
					
					var id=document.getElementById(s);
					$("#video").attr("src",'/video/'+id.value);//更新url
					$("#video").attr("autoplay","true");//直接播放
				}else{
					
					var ajax;
					var sno=document.getElementById('sno').value;
				    if (window.XMLHttpRequest) {
				        ajax = new XMLHttpRequest();
				    } else if (window.ActiveXObject) {
				        ajax = new ActiveXObject("Msxml2.XMLHTTP");
				    }
				    ajax.open("get", "../check/checkLook?fno="+fnotext+"&sno="+sno);
				    ajax.send(null);
				    ajax.onreadystatechange = function () {
				        if (ajax.readyState == 4) {
				            if (ajax.status == 200) {
				                var result = ajax.responseText;
				                if (result == "true") {
									var id=document.getElementById(s);
									$("#video").attr("src",'/video/'+id.value);//更新url
									$("#video").attr("autoplay","true");//直接播放
				                }
				                else {
				                	 $('#mask').css('display','block')
				                     $('.spend-nav').fadeIn(500)
				                     document.getElementById('fnos').innerHTML=fnotext;
				                	 document.getElementById('pri').innerHTML=price+'v';
				                	 document.getElementById('hid').innerHTML=s;
				                }

				            } else if (ajax.status == 404) {
				            	alert("请求资源不存在")

				            } else if (ajax.status == 500) {
				                alert("服务器繁忙");
				            }
				        }

				    }
				}
			})
			$("#fabiao").click(function(){
				var sno=document.getElementById("sno").value;
				var cno=document.getElementById("cno").value;
				var commentTxt=document.getElementById("commentTxt").value;
				var ajax;
				    if (window.XMLHttpRequest) {
				        ajax = new XMLHttpRequest();
				    } else if (window.ActiveXObject) {
				        ajax = new ActiveXObject("Msxml2.XMLHTTP");
				    }
				    ajax.open("get", "../play/playComment?cno="+cno+"&sno="+sno+"&commentTxt="+commentTxt);
				    ajax.send(null);
				    ajax.onreadystatechange = function () {
				        if (ajax.readyState == 4) {
				            if (ajax.status == 200) {
				                var result = ajax.responseText;
				                if(result="true"){
				                	var cc=$('#clone').clone()
				                	$(cc).css('display','inline-block')
				                	$(cc).find(".recommend-item-right-1 span:first-child").text(sno)
				                	var date=new Date();
				                	var dateTxt=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "
				                	+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
				                	alert(dateTxt)
				                	$(cc).find(".recommend-item-right-1 span:last-child").text(dateTxt)
				                	$(cc).find(".recommend-item-right-2").text(commentTxt);
				                	$('#commentTxt').val()
				                	$('.recommends').prepend(cc)
				                }

				            } else if (ajax.status == 404) {
				            	alert("请求资源不存在")

				            } else if (ajax.status == 500) {
				                alert("服务器繁忙");
				            }
				        }

				    }
			})
			video.ontimeupdate = function() {
				var num=video.currentTime;
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
				var t=''+ss+':'+mm;
				document.getElementById('currentTime').innerHTML=t;

			};
		video.onclick=function(){
		    if(video.paused){
		    	document.getElementById('play-img-xiao').src='../img/暂停.png';
		        video.play();
		    }else{
		    	document.getElementById('play-img-xiao').src='../img/小播放.png';
		        video.pause();
		    }
		}
		function midScreen() {
			if (!checkFull()) {
				//触发esc事件，执行业务逻辑。
				var v=document.getElementById('main');
				var videomain=document.getElementById('video-main');
				v.style.width=900+"px";
		        v.style.height=507+"px";
		        
		        videomain.style.width=900+"px";
		        videomain.style.height=507+"px";  
			}
		};
		
		function exitFull(){
			var v=document.getElementById('main');
			var videomain=document.getElementById('video-main');
			if(v.exitFullscreen){
				v.exitFullscreen();
			}
			else if(v.mozCancelFullScreen){
	            //FIREFOX
	            v.mozCancelFullScreen();
	        }else if(v.webkitCancelFullScreen){
	        	alert()
	            //CHROME
	            v.style.width=900+"px";
		        v.style.height=507+"px";
		        
		        videomain.style.width=900+"px";
		        videomain.style.height=507+"px";  
	            v.webkitCancelFullScreen();
	        }
		}
		function Prev(){
			video.currentTime-=30;
		}
		function Next(){
			video.currentTime+=30;
		}
		function Muted(){
			if(video.muted){
				video.muted=false;
				event.target.innerHTML='X';
				event.target.style.background='orange';
				document.getElementById('vol').value=video.volume;
			}else{
				video.muted=true;
				event.target.innerHTML='x';
				event.target.style.background='white';
				document.getElementById('vol').value=0;
			}
		}
		function Volume(){
			video.volume=event.target.value;
		}
		function Progress(){
			
			var progress=document.getElementById('progress');
			progress.style.width=(video.currentTime/video.duration)*100+'%';
		}

		
		function progress_click(){
			var progress=document.getElementById('progress');
			var w=parseInt(document.getElementById('probar').style.width)
			if(event.offsetX){
				
				video.currentTime=video.duration*(event.offsetX/w);
				
			}
		}
		
		var canvas = document.getElementById('mycanvas'); // 得到画布
		var ctx = canvas.getContext('2d'); // 得到画布的上下文对象
		var flag = false;
		var x = 0; // 鼠标开始移动的位置X
		var y = 0; // 鼠标开始移动的位置Y
		var url = ''; // canvas图片的二进制格式转为dataURL格式
		/* 为canvas绑定mouse事件 */
		var methods='';
		var dataimg=ctx. getImageData(0,0,canvas.width,canvas.height);
		$('#jietu').click(function(){
			CatchPicture()
		})
		var sel=document.getElementById('sel')
		var selvalue=sel.options[sel.selectedIndex].value
		$("#sel").change(function(){
	     	selvalue=sel.options[sel.selectedIndex].value
	     	
	    });
		$('#mycanvas').mousedown(function(e){

		    flag = true;
		    x = e.offsetX; // 鼠标落下时的X
		    y = e.offsetY; // 鼠标落下时的Y
		    ctx.beginPath();
		    ctx.moveTo(x,y);

		}).mouseup(function(e){
		    flag = false;

		    url = $('canvas')[0].toDataURL(); // 每次 mouseup 都保存一次画布状态
		    // dataimg=ctx. getImageData(0,0,canvas.width,canvas.height) 

		}).mousemove(function(e){
			if(selvalue=='drawPencil'){
				drawPencil(e)
			}
			else if(selvalue=='drawRect'){
				
				drawRect(e)
				
			}
			else if(selvalue=='drawLine'){
			
				drawLine(e)
				
			}
		});

		function drawPencil(e){
		    if(flag){
		        ctx.lineTo(e.offsetX,e.offsetY);
		        ctx.stroke(); // 调用绘制方法 
		    }
		}
		function drawRect(e){
		    if(flag){
		        // ctx.clearRect(0,0,canvas.width,canvas.height);
		        // // ctx.putImageData(dataimg,0,0)
		        // loadImage()
		        ctx.beginPath();
		        ctx.strokeRect(x,y,e.offsetX-x,e.offsetY-y);
			    }
			}
		function drawLine(e){
		    if(flag){
		        // ctx.clearRect(0,0,canvas.width,canvas.height);
		        // // ctx.putImageData(dataimg,0,0)
		        // loadImage()
		        ctx.beginPath();
		        ctx.moveTo(x,y);
		        ctx.lineTo(e.offsetX,e.offsetY);
		        ctx.stroke();   
		    }
		}

		function CatchPicture(){
			// var canvas=document.getElementById('mycanvas');
			// var ctx=canvas.getContext('2d');
			ctx.clearRect(0,0,canvas.width,canvas.height);
			ctx.drawImage(video,0,0,canvas.width,canvas.height);
			url = $('canvas')[0].toDataURL();
//			alert(url)
			// dataimg=ctx.getImageData(0,0,canvas.width,canvas.height) 
			// alert(dataimg)
		}
		var butSave = document.getElementById("save");
		butSave.onclick=function(){
			downLoadImage(canvas,'one.png')
		}
		function downLoadImage(canvas,name) {   
			var a = document.createElement("a");   
			a.href = canvas.toDataURL();   
			a.download = name;   
			a.click(); 
		} 

		function loadImage(){
		    var img = new Image();
		    img.src = url;
		    ctx.drawImage(img,0,0,canvas.width,canvas.height);
		}
	})
