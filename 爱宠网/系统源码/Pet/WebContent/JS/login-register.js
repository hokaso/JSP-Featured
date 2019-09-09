function showRegisterForm() {
    (function ($) {
        $('.loginBox').fadeOut('fast', function () {
            $('.registerBox').fadeIn('fast');
            $('.login-footer').fadeOut('fast', function () {
                $('.register-footer').fadeIn('fast');
            });
        });
        $('.error').removeClass('alert alert-danger').html('');
    })(jQuery);

}

function showLoginForm() {
    (function ($) {
        $('.registerBox').fadeOut('fast', function () {
            $('.loginBox').fadeIn('fast');
            $('.register-footer').fadeOut('fast', function () {
                $('.login-footer').fadeIn('fast');
            });
        });
        $('.error').removeClass('alert alert-danger').html('');
    })(jQuery);
}

function openLoginModal() {
    showLoginForm();
    setTimeout(function () {
        (function ($) {
            $('#loginModal').modal('show');
        })(jQuery);
    }, 230);
}

function openRegisterModal() {
    showRegisterForm();
    setTimeout(function () {
        $('#loginModal').modal('show');
    }, 230);

}

function loginAjax() {
    (function ($) {
        var userId = $("#loginid").val();
        var password = $("#loginpwd").val();
        $.ajax({
            type: "post",
            url: "loginReg_login.action?",
            data: "userId=" + userId + "&password=" + password,
            dataType: "json",
            cache: false,
            success: function (data) {
                var mydata = eval(data);
                if (mydata[0] === 0) {
                    shakeModal("请检查账户或密码是否正确呐~~(>_<)~~");
                } else {
                    $('#loginModal').fadeOut('fast');
                    $('#loginModal').modal('hide');
                    (function ($) {
                        setinfo(mydata[0].userName);
                        var userStr = JSON.stringify(data);
                        $.cookie('news_user', userStr);
                    })(jQuery);
                }
            },
            error: function (data) {
                shakeModal("连接服务器失败，请稍后重试！");
            }
        });
    })(jQuery);
}

function setinfo(username) {
    (function ($) {
        $('.userName').html(username + "，您好！");
        $('.userName2').html(username);
        $('#comment').attr('placeholder', '您已经登录，请发布评论!');
    })(jQuery);
}

function regAjax() {
    (function ($) {
        var userId = $("#regid").val();
        var password = $("#regpwd").val();
        var userName = $("#regname").val();
        $.ajax({
            type: "post",
            url: "loginReg_register.action?",
            data: "userId=" + userId + "&password=" + password + "&userName=" + userName,
            dataType: "json",
            cache: false,
            success: function (data) {
                var mydata = eval(data);
                if (mydata[0] === 0) {
                    shakeModal("换个ID注册吧~~(>_<)~~");
                } else {
                    showLoginForm();
                }
            },
            error: function (data) {
                shakeModal("连接服务器失败，请稍后重试！");
            }
        });
    })(jQuery);
}

function shakeModal(str) {
    (function ($) {
        $('.modal-dialog').addClass('shake');
        $('.error').addClass('alert alert-danger').html(str);
        $('input[type="password"]').val('');
        setTimeout(function () {
            $('.modal-dialog').removeClass('shake');
        }, 1000);
    })(jQuery);
}

function getCookie() {
    (function ($) {
        
    	var arrStr = document.cookie.split(";");
	    for(var i = 0;i < arrStr.length;i ++){
	        var temp = arrStr[i].split("=");
	        if(temp[0] =='user') {
	        	var userstr= unescape(temp[1]);
	        	break;
	        }
	        	
	   } 
        var userobject;
        if (userstr !== null) {
            userobject = eval(userstr);
            setinfo(userobject[0].userName);
        }
    })(jQuery);
}


