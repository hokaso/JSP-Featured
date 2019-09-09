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
<form method="post" action="" id="listform">
    <input type="hidden" name="id" id="Id" value="">
    <div class="panel admin-panel">

        <div class="panel-head">
            <strong class="icon-reorder">视频列表</strong>
            <a href="" style="float:right; display:none;">添加字段</a>
        </div>

        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li>
                    <button type="button" class="button border-green icon-check" id="checkall">
                        全选
                    </button>
                </li>
                <li>
                    <button class="button border-red icon-trash-o" onclick="DelSelect()">
                        批量删除
                    </button>
                </li>
                <li><h4>搜索条件：</h4></li>
                <li>
                    <input type="text" placeholder="请输入视频introduce" name="vedio" class="input keyText"
                           style="width:250px; line-height:17px;display:inline-block"/>
                    <a href="javascript:void(0)" class="button border-main icon-search"
                       onclick="changesearch()"> 搜索</a>
                    <s:if test="#session.find_key.trim()!=null && #session.find_key.trim()!=''">
                        <script type="text/javascript">
                            var key = '<s:property value="#session.find_key.trim()"/>'
                            $(".keyText").val(key);
                        </script>
                    </s:if>
                    <s:if test="#session.find_type!=0">
                        <script type="text/javascript">
                            var type = '<s:property value="#session.find_type"/>'
                            $(".typeSelect").val(type);
                        </script>
                    </s:if>
                </li>
            </ul>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <th width="80" style="text-align:left; padding-left:20px;">ID</th>
                <th width="">简介</th>
                <th width="80">上传者</th>
                <th width="100">发布时间</th>
                <th width="250">操作</th>
            </tr>

            <s:iterator value="list" var="s">
                <volist name="list" id="vo">
                    <tr>
                        <td style="text-align:left; padding-left:20px;">
                            <input type="checkbox" name="checkVedio1" value="<s:property value="#s.id"/>"/>
                            <s:property value="#s.id"/>
                        </td>
                        <td><s:property value="#s.introduce"/></td>
                        <td><s:property value="#s.member.id"/></td>
                        <td>
                            <s:property value="#s.time"/>
                            <%--<s:date name="#s.vedioDate" format="yyyy-MM-dd"/></td>--%>
                        <td>
                            <div class="button-group">
                                <a class="button border-red" href="javascript:void(0)"
                                   onclick="return del(<s:property value="#s.id"/>)">
                                    <span class="icon-trash-o"></span> 删除<s:property value="#s.id"/>
                                </a>
                            </div>
                        </td>
                    </tr>
                </volist>
            </s:iterator>

            <tr>
                <td colspan="7">
                    <div class="pagelist">

                        <s:if test="currentPage!= 1">
                            <a href="vedio1_findVedio1ByCondition.action?currentPage=<s:property value="1"/>">首页</a>
                            <a href="vedio1_findVedio1ByCondition.action?currentPage=<s:property value="currentPage-1"/>">
                                <s:property value="currentPage-1"/>
                            </a>
                        </s:if>
                        <span class="current"><s:property value="currentPage"/></span>
                        <s:if test="currentPage != pageSize">
                            <a href="vedio1_findVedio1ByCondition.action?currentPage=<s:property value="currentPage+1"/>">
                                <s:property value="currentPage+1"/>
                            </a>
                            <a href="vedio1_findVedio1ByCondition.action?currentPage=<s:property value="pageSize"/>">尾页</a>
                        </s:if>
                        &nbsp;共<s:property value="pageSize"/>页，<s:property value="totalSize"/>条视频
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>

<script type="text/javascript">

    //搜索
    function changesearch() {
        document.getElementById("listform").action = "vedio1_findVedio1ByCondition.action";
        document.getElementById("listform").submit();
    }

    //单个删除
    function del(id) {
        if (confirm("您确定要删除这条视频吗?")) {
        	alert(id);
            document.getElementById("Id").value = id;
            document.getElementById("listform").action = "vedio1_deleteVedio1.action";
            document.getElementById("listform").submit();
        }
    }

    //全选
    $("#checkall").click(function () {
        $("input[name='checkVedio1']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect() {
        var Checkbox = false;
        $("input[name='checkVedio1']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var isOK = confirm("您确认要删除选中的视频吗？");
            if (isOK == false)return false;
            document.getElementById("listform").action = "vedio1_deleteMoreVedio1.action";
            document.getElementById("listform").submit();
            $("#listform").submit();
        }
        else {
            alert("请选择您要删除的视频!");
            return false;
        }
    }
</script>
</body>
</html>