function login_check() {
    var ajax;
    var account=document.getElementById("account").value;
    var password=document.getElementById("password").value;
   
    if (window.XMLHttpRequest) {
        ajax = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        ajax = new ActiveXObject("Msxml2.XMLHTTP");
    }

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {

                var result = ajax.responseText;
                var showdiv = document.getElementById("result");
                if(result=="manager"){
                	window.location.href="../admin/adminAction";
                }else
                if (result == "登录成功") {
                    result = result + "(3秒后跳转页面)";
                    showdiv.innerHTML = result;
                    window.location.href="../homepage/homepage.action";
                }
                else {
                    showdiv.innerHTML = result;
                }

            } else if (ajax.status == 404) {
                var showdiv = document.getElementById("result");
                showdiv.innerHTML = "请求资源不存在";

            } else if (ajax.status == 500) {
                var showdiv = document.getElementById("result");
                showdiv.innerHTML = "服务器繁忙";
            }
        }

    }

    ajax.open("get", "../login/login?account="+account+"&password="+password);
    ajax.send(null);

}
