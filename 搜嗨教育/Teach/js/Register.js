$(function(){
	$('.phone').focus(function(){
		$('.phone-img').attr('src',"../img/phone2.png")
		$('.phone').parent().css('border-bottom',"1px solid rgba(0, 130, 255, .8)")
	})
	$('.phone').blur(function(){
		$('.phone-img').attr('src',"../img/phone.png")
		$('.phone').parent().css('border-bottom',"1px solid #aaa")
		//验证手机
		var v=$('.phone').val();
		var reg1= /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(v==''){
			$('#num1 .config-img').css('display','none')
			$('.config-text1').css('display','none')
		}else
		if(!reg1.test(v)){
			$('#num1 .config-img').css('display','inline-block')
			$('.config-text1').css('display','inline-block')
			$('.config-text1').html('手机号码格式错误');
		}else{
			$('#num1 .config-img').css('display','none')
			$('.config-text1').css('display','none')
		}
	})

	$('.name').focus(function(){
		$('.name-img').attr('src',"../img/name2.png")
		$('.name').parent().css('border-bottom',"1px solid rgba(0, 130, 255, .8)")
	})
	$('.name').blur(function(){

		$('.name-img').attr('src',"../img/name.png")
		$('.name').parent().css('border-bottom',"1px solid #aaa")
		var v2=$('.name').val();
		var reg2=/^$|^\w{1,20}$/;
		if(!reg2.test(v2)){
			
			$('.name').next().css('display','inline-block')
			$('.config-text2').css('display','inline-block')
		}else{
			
			$('.name').next().css('display','none')
			$('.config-text2').css('display','none')
		}
		$('.config-text2').css('display','none')
		$('.name').next().css('display','none')
	})

	$('.password').focus(function(){
		$('.password-img').attr('src',"../img/password2.png")
		$('.password').parent().css('border-bottom',"1px solid rgba(0, 130, 255, .8)")
		
	})
	$('.password').blur(function(){
		$('.password-img').attr('src',"../img/password.png")
		$('.password').parent().css('border-bottom',"1px solid #aaa")
		
			$('.config-text3').css('display','none')
			$('.password').next().css('display','none')
	
	})
	$('.repassword').focus(function(){
		$('.repassword-img').attr('src',"../img/password2.png")
		$('.repassword').parent().css('border-bottom',"1px solid rgba(0, 130, 255, .8)")
		
	})
	//判断密码和确认密码是否一致
	$('.repassword').blur(function(){
		$('.repassword-img').attr('src',"../img/password3.png")
		$('.repassword').parent().css('border-bottom',"1px solid #aaa")
		var password=$('.password').val();
		var repassword=$('.repassword').val();
		if(repassword==""){
			$('.repassword').next().css('display','none')
			$('.config-text4').css('display','none')
		}else
		if(password!=repassword){
			$('.repassword').next().css('display','inline-block')
			$('.config-text4').css('display','inline-block')
		}else{
			$('.repassword').next().css('display','none')
			$('.config-text4').css('display','none')
		}
	})
	$('input:radio[name="student.ssex"]').click(function(){
		$('.config-text5').css('display','none')
		$('#mistake-img').css('display','none')
	});
	$('.email').focus(function(){
		$('.email-img').attr('src',"../img/email2.png")
		$('.email').parent().css('border-bottom',"1px solid rgba(0, 130, 255, .8)")
	})
	$('.email').blur(function(){
		$('.email-img').attr('src',"../img/email.png")
		$('.email').parent().css('border-bottom',"1px solid #aaa")
		//验证邮箱
		var reg3=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var v3=$('.email').val();
		if(reg3.test(v3)){
			$('.email').next().css('display','none')
			$('.config-text6').css('display','none')
		}else{
			
			$('.email').next().css('display','inline-block')
			$('.config-text6').css('display','inline-block')
			$('.config-text6').html('邮箱格式不正确')
		}
		if(v3==''){
			$('.email').next().css('display','none')
			$('.config-text6').css('display','none')
		}
	})
	$('.register-submit').click(function(){

		var sex=ExaSex()
		var phone=ExaPhone();
		var password=ExaPassword();
		var name=ExaName();
		var repassword=ExaRepassword();
		var email=ExaEmail();

		if(sex&&phone&&password&&repassword&&email&&name){
			//全部验证成功提交表单
			var form1=document.getElementById('form1');
			form1.submit();
		}
	})
	//检查性别
	function ExaSex(){
		var s = $('input:radio[name="student.ssex"]:checked').val();
		if(s==null){
			$('.config-text5').css('display','inline-block')
			$('#mistake-img').css('display','inline-block')
			return false;
		}
		else{
			$('.config-text5').css('display','none')
			$('#mistake-img').css('display','none')
			return true;
		}
	}
	//检查手机号
	function ExaPhone(){
		//验证手机
		var v=$('.phone').val();
		var reg1= /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(v==''){
			$('#num1 .config-img').css('display','inline-block')
			$('.config-text1').css('display','inline-block')
			$('.config-text1').html('手机号码不能为空')
			return false;
		}else
		if(reg1.test(v)){
			$('#num1 .config-img').css('display','none')
			$('.config-text1').css('display','none')
			return true;
		}
		else{
			$('#num1 .config-img').css('display','inline-block')
			$('.config-text1').css('display','inline-block')
			$('.config-text1').html('手机号码格式错误')
		}
	}
	//检查密码
	function ExaPassword(){
		var password=$('.password').val();
		if(password==''){
			$('.password').next().css('display','inline-block')
			$('.config-text3').css('display',"inline-block")
			$('.config-text3').html('密码不能为空！')
			return false;
		}else{
			$('.password').next().css('display','none')
			$('.config-text3').css('display',"none")
			
			return true;
		}
	}
	//检查昵称
	function ExaName(){
	
		var name = $('.name').val();
		if(name==''){

			$('.name').next().css('display','inline-block')
			$('.config-text2').css('display',"inline-block")
			$('.config-text2').html('密码不能为空！')
			return false
		}
		else{
			$('.name').next().css('display','none')
			$('.config-text2').css('display',"none")
			return true;
		}
	}
	function ExaRepassword(){
		var password=$('.password').val();
		var repassword=$('.repassword').val();
		if(password!=repassword){
			$('.repassword').next().css("display",'inline-block')
			$('.config-text4').css('display','inline-block')
			return false;
		}else{
			$('.repassword').next().css("display",'none')
			$('.config-text4').css('display','none')
			return true;
		}
	}
	function ExaEmail(){
		var email=$('.email').val();
		var reg=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(email==''){
			$('.email').next().css('display','inline-block')
			$('.config-text6').css('display','inline-block')
			$('.config-text6').html('邮箱不能为空');
			return false;
		}else
		if(reg.test(email)){
			$('.email').next().css('display','none')
			$('.config-text6').css('display','none')
			return true;
		}else{
			$('.email').next().css('display','inline-block')
			$('.config-text6').css('display','inline-block')
			return false;
		}
	}
})