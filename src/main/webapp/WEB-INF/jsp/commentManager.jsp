<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
	<script src="../../bootstrap/jquery/jquery.min.js"></script>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../bootstrap/js/commons.js"></script>
	<script type="text/javascript" src="../../js/userSetting.js"></script>
</head>
<body onload="initAJAX();showComment()">
    <div class="panel panel-default" id="userInfo" id="homeSet">
        <div class="panel-heading">
            <h3 class="panel-title">评论管理</h3>
        </div>
        <div class="panel-body">
            <div class="showusersearch">
                <form class="form-inline" method="post">
                  <div class="form-group">
                    <label for="comment_aritcleID">评论文章:</label>
                    <input type="text" class="form-control" id="comment_aritcleID" name="loginName" placeholder="评论文章" size="15px">
                  </div>

                  <input type="button" value="查询" class="btn btn-primary" id="doSearch" onclick="searchComment()">
                </form>               
            </div>
            
            <div class="show-list" style="position: relative;top: 30px;">
                <table class="table table-bordered table-hover" style='text-align: center;'>
                    <thead>
                        <tr class="text-danger">
                            <th class="text-center">序号</th>
                            <th class="text-center">评论文章</th>
                            <th class="text-center">评论内容</th>
                            <th class="text-center">评论状态</th>
                             <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="tb">
                    <c:forEach items="${comments}" var="comment" varStatus="index">
                        <tr>
                            <td>${index.index+1}</td>
                            <td>${comment.article_id}</td>
                            <td id="${comment.context}context">${comment.context}</td>
                            <td id="${comment.context}status">${comment.status}</td>
                            <td class="text-center">
                                <input type="button" class="btn btn-warning btn-sm doModifyComment" onclick="showInfo('${comment.context}')" value="修改">
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 修改评论信息 start -->
    <div class="modal fade" tabindex="-1" id="myModalComment">
        <!-- 窗口声明 -->
        <div class="modal-dialog">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改评论</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label for="context" class="col-sm-4 control-label">评论内容：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="context" disabled="disabled">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="status" class="col-sm-4 control-label">评论状态：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="status">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary updateComment" id="updateComment" onclick="changeInfo()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改评论信息 end -->
</body>
</html>
<script>
    function searchComment() {
        var name =$("input[id='comment_aritcleID']").val();
        window.location.href="http://localhost:8080/comment/findSome?action=Edit&name="+name;
    }
    function showInfo(context) {

        $.ajax({
            type: "GET",
            url: "http://localhost:8080/comment/getcommentByContext",
            data:{context:context},
            dataType:'json',
            success: function (comment) {
                $("#context").val(comment.context);
                $("#status").val(comment.status);
            },
            error: function (message) {
                window.alert("error")
            },
        });

    }
    $("#updateComment").click(function (){
        var comment = {
            "context":$("input[id='context']").val(),
            "status":$("input[id='status']").val()
        };
        $.ajax({
            url:"http://localhost:8080/comment/updateStatus",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(comment),//转化为json字符串
            success:function(data){
            },
        });
    });

    function changeInfo() {//修改一行数据，根据输入框的id=name
        const title = $("input[id='context']").val();
        document.getElementById(title+"status").innerHTML=$("input[id='status']").val();

    }
</script>