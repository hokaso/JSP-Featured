findfooter();
			function findfooter() {
				(function($) {
					$.ajax({
						type : "post",
						url : "${base}/footer_findFooter.action",
						data : {
						//提交的数据
						},
						dataType : "json",
						cache : false,
						success : function(data) {
							var mydata = eval(data);
							$('.wsTitle').html(mydata[0].wsTitle);
							$('.wsSite').html(mydata[0].wsSite);
							$('.wsDes').html(mydata[0].wsDes);
							$('.wsAdmin').html(mydata[0].wsAdmin);
							$('.wsPhone').html(mydata[0].wsPhone);
							$('.wsQq').html(mydata[0].wsQq);
							$('.wsEmail').html(mydata[0].wsEmail);
							$('.wsAddress').html(mydata[0].wsAddress);
							$('.wsFootor').html(mydata[0].wsFootor);
							var keyarr = mydata[0].wsKey.split('，');
							for ( var i in keyarr) {
								$(".sitekeyul").append(
										"<li><a href='' target='_parent'>"
												+ keyarr[i] + "</a></li>");
							}
						}
					});
				})(jQuery);
			}