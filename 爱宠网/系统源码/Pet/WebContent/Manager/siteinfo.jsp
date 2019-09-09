<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>网站信息</title>
    <link rel="stylesheet" href="../CSS/pintuer.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <script src="../JS/jQuery.js"></script>
    <script src="../JS/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">

    <div class="panel-head">
        <strong><span class="icon-pencil-square-o"></span> 设置网站信息</strong>
    </div>
    <div class="body-content">
        <!--网站信息提交表单-->
        <form method="post" class="form-x" action="siteinfo_saveInfo.action">


            <div class="form-group">
                <div class="label">
                    <label>网站标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsTitle" value="<s:property value="#session.siteinfo.wsTitle"/> "/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>网站域名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsSite" value="<s:property value="#session.siteinfo.wsSite"/>"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>网站关键字：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="siteInfoPO.wsKey" style="height:80px"><s:property value="#session.siteinfo.wsKey"/></textarea>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>网站描述：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="siteInfoPO.wsDes"><s:property value="#session.siteinfo.wsDes"/></textarea>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>联系人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsAdmin" value="<s:property value="#session.siteinfo.wsAdmin"/>"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsPhone" value="<s:property value="#session.siteinfo.wsPhone"/>"/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>QQ：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsQq" value="<s:property value="#session.siteinfo.wsQq"/>"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>Email：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsEmail" value="<s:property value="#session.siteinfo.wsEmail"/>"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="siteInfoPO.wsAddress" value="<s:property value="#session.siteinfo.wsAddress"/>"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>底部信息：</label>
                </div>
                <div class="field">
                    <textarea name="siteInfoPO.wsFootor" class="input" style="height:120px;"><s:property value="#session.siteinfo.wsFootor"/></textarea>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交站点信息</button>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>