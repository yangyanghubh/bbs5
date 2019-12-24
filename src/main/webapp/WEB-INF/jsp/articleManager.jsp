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
<body onload="initAJAX();showArticle()">
<div class="panel panel-default" id="userInfo" id="homeSet">
    <div class="panel-heading">
        <h3 class="panel-title">文章管理</h3>
    </div>
    <div class="panel-body">
        <div class="showusersearch">
            <form class="form-inline" method="post">
                <div class="form-group">
                    <label for="article_title">标题:</label>
                    <input type="text" class="form-control"id="article_title" name="name" placeholder="请输入标题" size="15px">
                </div>
                <input type="button" value="查询" class="btn btn-primary" id="doSearch">
            </form>
        </div>

        <div class="show-list" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">序号</th>
                    <th class="text-center">标题</th>
                    <th class="text-center">摘要</th>
                    <th class="text-center">是否加精</th>
                    <th class="text-center">是否置顶</th>

                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${articles}" var="article" >
                    <tr>
                        <td>${article.id}</td>
                        <td>${article.title}</td>
                        <td>${article.summary}</td>
                        <td>${article.isTop}</td>
                        <td><c:if test="${article.time_isTop>0}">
                            1
                        </c:if >
                            <c:if test="${article.time_isTop==0}">
                                0
                            </c:if >
                        </td>

                        <td class="text-center">
                            <input type="button" class="btn btn-warning btn-sm " onclick="showbox(${article.id});return false;" value="修改">
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 修改文章信息 start -->
<div class="modal fade" tabindex="-1" id="myModalArticle">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改文章</h4>
            </div>
            <div class="modal-body text-center">
                <form action="" method="post" id="ajaxform">
                    <div class="row text-right">
                        <label for="id" class="col-sm-4 control-label">文章编号</label>
                        <div class="col-sm-4">
                            <input name="id" type="text" class="form-control" id="id" disabled="disabled">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="title" class="col-sm-4 control-label">标题</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="istop" class="col-sm-4 control-label">是否置顶：</label>
                        <div class="col-sm-4">
                            <select name="is_top" class="form-control" id="istop">
                                <option value="0">不置顶</option>
                                <option value="1">置顶</option>
                            </select>
                        </div>
                    </div>

                    <br>
                    <div class="row text-right">
                        <label for="jinghua1" class="col-sm-4 control-label">是否加精：</label>
                        <div class="col-sm-4">
                            <select name="jinghua" class="form-control" id="jinghua1">
                                <option value="0">不加精华</option>
                                <option value="1">加精华</option>
                            </select>
                        </div>
                    </div>
                    <br>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary updateArtucle" onclick="submitfrom();return false;">修改</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改文章信息 end -->
</body>
<script type="application/javascript">
    function showbox(id) {
        $("#id").val(id);
        var formData = new FormData();
        formData.append("id", id);

        $.ajax({
            url: "${pageContext.request.contextPath}/article/getContent",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,

            success: function(res) {
                if (res.code == 1) {
                    console.log(res);
                    res = res.data;
                    $("#title").val(res.title);
                    if(res.jinghua==1){
                        $("#jinghua1").find("option[value=1]").attr("selected",true);
                    }else{
                        $("#jinghua1").find("option[value=1]").attr("selected",false);
                    }
                    if(res.isTop==1){
                        $("#istop").find("option[value=1]").attr("selected",true);
                    }else{
                        $("#istop").find("option[value=1]").attr("selected",false);
                    }
                    $("#myModalArticle").modal("show");

                } else {
                    alert("获取信息列表失败请刷新页面");
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("获取信息列表失败请刷新页面");
            }

        })


    };
    function submitfrom(){
        var formData = new FormData();
        formData.append("id", $("#id").val());
        formData.append("title", $("#title").val());
        formData.append("is_top", $("#istop").val());
        formData.append("jinghua", $("#jinghua1").val());
        // 发送请求
        $.ajax({
            url:"http://localhost:8080/article/editArticle",
            type:'post',
            data:formData,
            processData:false,
            contentType:false,
            success: function(res) {
                if (res.code == 1) {
                    alert("修改成功");

                    window.location.reload();


                } else {
                    alert(res.msg);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("连接错误");
            }

        })


    }

</script>
</html>
