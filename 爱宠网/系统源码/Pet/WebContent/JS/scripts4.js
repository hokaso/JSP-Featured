/**
 * 
 */
			$(function(){
				
				//发送ajax 查询所有分类
				$.post("${pageContext.request.contextPath}/Manager_find.action?page2=1",{"method":"find"},function(obj){
					$(obj).each(function(){
						
$('#news').prepend('<li>'+this.newsTitle+'<a href="#"></a><p>'+this.newsDate+'</p></li>');});
},"json");
});  