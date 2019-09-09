/**
 * 
 */
			$(function(){
				
				//发送ajax 查询所有分类
				$.post("${pageContext.request.contextPath}/Manager_find1.action?page2=1",{"method":"find1"},function(obj){
					$(obj).each(function(){
						
$('#vedio').prepend('<li>'+this.vedioTitle+'<a href="#"></a><p>'+this.vedioDate+'</p></li>');});
},"json");
});  