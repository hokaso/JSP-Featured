 function trim(str){
            str=str.replace(/^\s*/,"");
            str=str.replace(/\s*$/,"");
            return str;
        }
// 创建ajax对象
function createAjax() {
	var ajax = null;
	try {
		ajax = new ActiveXObject("microsoft.xmlhttp");
	} catch (e) {
		try {
			ajax = new XMLHttpRequest();
		} catch (e1) {
			alert("请更换浏览器");
		}
	}
	return ajax;
}
function change() {
	var pic = document.getElementById("imgID");
	var i = Math.random();// 目的是使页面不一样
	pic.src = "image.jsp?id=" + i;
}
