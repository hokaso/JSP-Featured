<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>统计信息</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../CSS/bootstrap.css">
    <link rel="stylesheet" href="../CSS/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../CSS/AdminLTE.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

<section class="content">

    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3><s:property value="#session.countinfo.countNews"/></h3>
                    <p>已发新闻</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="news_findNewsByCondition.action" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green">
                <div class="inner">
                    <h3><s:property value="#session.countinfo.countComment"/></h3>
                    <p>用户评论</p>
                </div>
                <div class="icon">
                    <i class="ion ion-chatbox-working"></i>
                </div>
                <a href="comment_findComment.action" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><s:property value="#session.countinfo.countUser"/></h3>
                    <p>注册用户</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-red">
                <div class="inner">
                    <h3><s:property value="#session.countinfo.countLook"/></h3>
                    <p>访问次数</p>
                </div>
                <div class="icon">
                    <i class="ion ion-eye"></i>
                </div>
                <a href="#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </div>
</section>
</body>
</html>

