<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="../CSS/pintuer.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <script src="../JS/jQuery.js"></script>
    <script src="../JS/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改管理账号的密码</strong></div>
    <div class="body-content">

        <!--修改密码表单-->
        <form method="post" class="form-x" action="Member_updatePassword.action">
            <div class="form-group">
                <div class="label">
                    <label for="sitename">帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                       <!--<s:property value="#session.currentMember.id"/>-->
                        (<s:property value="#session.currentMember.account"/>)
                    </label>
                </div>
            </div>

            <input type="hidden" name="member.id" value="<s:property value="#session.currentMember.id" default="0"/>">

            <div class="form-group">
                <div class="label">
                    <label for="sitename">原始密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="mpass" name="oldPassword" size="50" placeholder="请输入原始密码"
                           data-validate="required:请输入原始密码"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label for="sitename">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="member.pwd" size="50" placeholder="请输入新密码"
                           data-validate="required:请输入新密码,length#>=5:新密码不能小于5位"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label for="sitename">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码"
                           data-validate="required:请再次输入新密码,repeat#member.pwd:两次输入的密码不一致"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>