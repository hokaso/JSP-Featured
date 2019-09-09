$(function(){
	$('.register-submit').click(function(){
		var fileInput = $('#files').get(0).files[0];
		if(fileInput){
			$("#form1").submit();
		}else{
			alert("还没上传doc文件！");
		}
	})
})