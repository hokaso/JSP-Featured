<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>Pet管理中心</title>
    <link rel="stylesheet" href="../CSS/pintuer.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <script src="../JS/jQuery.js"></script>
</head>

<body style="background-color:#f2f9fd;">

<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="../images/Pethead.jpeg" class="radius-circle rotate-hover" height="50"/>Pet管理中心</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="../Manager/index.jsp">
            <span class="icon-home"></span> 系统首页
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-blue" href="http://blog.csdn.net/plain_maple" target="_blank">
            <span class="icon-coffee"></span> CSDN
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-yellow" href="https://github.com/iamguofeng" target="_blank">
            <span class="icon-github"></span> GitHub
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="login.jsp">
            <span class="icon-power-off"></span> 退出登录
        </a>
    </div>
</div>

<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-pencil-square-o"></span>新闻管理</h2>
    <ul style="display:block">
        <!--<li><a href="headnews_findHeadNews.action" target="right"><span class="icon-caret-right"></span>设置宠物头条</a></li>-->
        <li><a href="addnews.jsp" target="right"><span class="icon-caret-right"></span>发布新闻</a></li>
        <li><a href="news_findNewsByCondition.action" target="right"><span class="icon-caret-right"></span>已发新闻</a></li>
        <li><a href="comment_findComment.action" target="right"><span class="icon-caret-right"></span>评论管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>视频管理</h2>
    <ul style="display:block">
        <!--<li><a href="headvedio_findHeadVedio.action" target="right"><span class="icon-caret-right"></span>设置视频头条</a></li>-->
        <li><a href="addvedio.jsp" target="right"><span class="icon-caret-right"></span>发布视频</a></li>
        <li><a href="vedio_findVedioByCondition.action" target="right"><span class="icon-caret-right"></span>已发视频</a></li>
        <li><a href="comment2_findComment.action" target="right"><span class="icon-caret-right"></span>评论管理</a></li>
    </ul>
    <h2><span class="icon-user"></span>基本设置</h2>
    <ul>
        <li><a href="siteinfo_findInfo.action" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
        <li><a href="adminpass.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="countinfo_countInfo.action"  target="right"><span class="icon-caret-right"></span>站长统计</a></li>
    </ul>
</div>

<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>

<ul class="bread">
    <li><span class="icon-home"> 当前页面</span></li>
    <li><span id="a_leader_txt"> 站长统计</span></li>
</ul>

<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="countinfo_countInfo.action" name="right" width="100%"
            height="100%">
    </iframe>
</div>

</body>
</html>