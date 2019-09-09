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
    <input type="hidden" name="commentPO2.cmtId" id="cmtId">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 评论管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button" class="button border-green" id="checkall">
                        <span class="icon-check"></span> 全选
                    </button>
                    <button class="button border-red icon-trash-o" onclick="DelSelect()">
                        批量删除
                    </button>
                </li>
            </ul>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <th width="120">评论ID</th>
                <th width="120">视频ID</th>
                <th>姓名</th>
                <th width="25%">内容</th>
                <th width="120">评论时间</th>
                <th>操作</th>
            </tr>

            <s:iterator value="list" var="s">
                <tr>
                    <td>
                        <input type="checkbox" name="checkComment" value="<s:property value="#s.cmtId"/>"/>
                        <s:property value="#s.cmtId"/>
                    </td>
                    <td><s:property value="#s.vedio.id"/></td>
                    <td><s:property value="#s.member.account"/></td>
                    <td><s:property value="#s.cmtContent"/></td>

                    <td><%--<td><s:property value="#s.cmtDate"/></td>--%>
                        <s:date name="#s.cmtDate" format="yyyy-MM-dd"/>
                    </td>
                    <td>
                        <div class="button-group">
                            <a class="button border-red" href="javascript:void(0)"
                               onclick="return del(<s:property value="#s.cmtId"/>)">
                                <span class="icon-trash-o"></span> 删除
                            </a>
                        </div>
                    </td>
                </tr>
            </s:iterator>

           <tr>
                <td colspan="6">
                    <div class="pagelist">
                        <s:if test="currentPage != 1&&pageSize!=0">
                            <a href="comment2_findComment.action?currentPage=<s:property value="1"/>">首页</a>
                            <a href="comment2_findComment.action?currentPage=<s:property value="currentPage-1"/>">
                                <s:property value="currentPage-1"/>
                            </a>
                        </s:if>
                        <span class="current"><s:property value="currentPage"/></span>
                        <s:if test="currentPage != pageSize&&pageSize!=0">
                            <a href="comment2_findComment.action?currentPage=<s:property value="currentPage+1"/>">
                                <s:property value="currentPage+1"/>
                            </a>
                            <a href="comment2_findComment.action?currentPage=<s:property value="pageSize"/>">尾页</a>
                        </s:if>
                        &nbsp;共<s:property value="pageSize"/>页，<s:property value="totalSize"/>条评论
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    //删除
    function del(cmtId) {
        if (confirm("您确定要删除此评论吗?")) {
            document.getElementById("cmtId").value = cmtId;
            document.getElementById("listform").action = "comment2_deleteComment.action";
            document.getElementById("listform").submit();
        }
    }
    //全选
    $("#checkall").click(function () {
        $("input[name='checkComment']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect() {
        var Checkbox = false;
        $("input[name='checkComment']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var isOK = confirm("您确认要删除选中的评论吗？");
            if (isOK == false)return false;
            document.getElementById("listform").action = "comment2_deleteMoreComment.action";
            document.getElementById("listform").submit();
        }
        else {
            alert("请选择您要删除的评论!");
            return false;
        }
    }

</script>
</body>
</html>