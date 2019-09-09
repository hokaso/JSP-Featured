var thisNewsId;
(function($) {
	var url = location.search; // 获取url中"?"符后的字串
	if (url.indexOf("?") !== -1) { // 判断是否有参数
		var str = url.substr(1); // 获取所有除问号的所有符串
		strs = str.split("="); // 用等号进行分隔
		thisNewsId = strs[1];// 取出第一个参数
		// alert(thisNewsId);
		$.ajax({
			type : "post",
			url : "${base}/index_findThisNews.action?time=new Date()",
			data : "thisNewsId=" + thisNewsId,
			dataType : "json",
			cache : false,
			success : function(data) {
				var mydata = eval(data);
				$('.newsTitle').html(mydata[0].newsTitle);
				$('.newsContent').html(mydata[0].newsContent);
				$('.newsKey').html(mydata[0].newsKey);
				$('.newsAuthor').html(mydata[0].newsAuthor);
				$(".newsImg").attr("src", "../images/" + mydata[0].newsImg);
				$('.newsDate').html(formatdate(mydata[0].newsDate));
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