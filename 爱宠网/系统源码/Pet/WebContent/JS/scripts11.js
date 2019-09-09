				var thisVedioId;
				(function($) {
					var url = location.search; // 获取url中"?"符后的字串
					if (url.indexOf("?") !== -1) { // 判断是否有参数
						var str = url.substr(1); // 获取所有除问号的所有符串
						strs = str.split("="); // 用等号进行分隔
						thisVedioId = strs[1];// 取出第一个参数
						//alert(thisVedioId);
						$
								.ajax({
									type : "post",
									url : "${base}/index_findThisVedio.action?time=new Date()",
									data : "&thisVedioId=" + thisVedioId,
									dataType : "json",
									cache : false,
									success : function(data) {
										var mydata = eval(data);
										$('.vedioTitle').html(
												mydata[0].vedioTitle);
										$('.vedioContent').html(
												mydata[0].vedioContent);
										$('.vedioKey').html(mydata[0].vedioKey);
										$('.vedioAuthor').html(
												mydata[0].vedioAuthor);
										
										$(".upload").prepend('<a  href=download.action?fileName=' +mydata[0].address +'&vedio1id='+mydata[0].id+'&vedioAuthor='+mydata[0].vedioAuthor+'>下载</a>'	);
										
										//.html(
														//"../vedio/"
																//+ mydata[0].address);
										$('.vedioDate')
												.html(
														formatdate(mydata[0].vedioDate));
										var ADDRESS = "../upload/"+mydata[0].address;
										var id1 = mydata[0].id;
										//alert(id1+"&&");
										vedio(ADDRESS,id1);
									},
									error : function(data) {
										alert("Ajax请求崩了1");
									}
								});
					}
				})(jQuery);
				
				function formatdate(value) {
					var JsonDateValue = new Date(value.time);
					return JsonDateValue.toLocaleDateString();
				}
			function vedio(ADDRESS,id1) {
				var arrStr = document.cookie.split(";");
			    for(var i = 0;i < arrStr.length;i ++){
			        var temp = arrStr[i].split("=");
			        if(temp[0] =='user') {
			        	var userstr= unescape(temp[1]);
			        	break;
			        }
			        	
			   }
				(function($) {
				userobject = eval(userstr);
				//alert(userobject);
				 if(userobject==undefined){
	            
	            	alert("请登录哦，才能享受更好的功能");
	            	$("#danmup").danmuplayer({
						src : ADDRESS,//视频源
						width : 950,//视频宽度
						height : 445//视频高度
					});
	            }else{
	            	var id = userobject[0].id;
	            $("#danmup").danmuplayer({
	            	
									src : ADDRESS,//视频源
									width : 950,//视频宽度
									height : 445,//视频高度
									url_to_get_danmu : "${base}/Manager_findDanmu.action?id="+id1, //用来接收弹幕信息的url  (稍后介绍)
									url_to_post_danmu : "${base}/Manager_addDanmu.action?id1="+id+"&id2="+id1,//id1 ->member_id id2->vedio_id
									id: id,
									id1:id1
								});}
								})(jQuery);
			
				}