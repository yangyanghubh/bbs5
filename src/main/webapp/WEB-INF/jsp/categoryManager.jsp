<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="zh">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>backend</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
	<script src="../../bootstrap/jquery/jquery.min.js"></script>
    <script src="../../bootstrap/js/commons.js"></script>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/userSetting.js"></script>
    <link rel="stylesheet"  href="../css/index.css" />
</head>

<body onload="initAJAX();showCategory()">
    <div class="panel panel-default" id="userSet">
        <div class="panel-heading">
            <h3 class="panel-title">文章类型管理</h3>
        </div>
        <div class="panel-body">
            <input type="button" value="添加文章类别" class="btn btn-primary" id="doAddCategory">
            <br>
            <br>
            <div class="show-list">
                <table class="table table-bordered table-hover" style='text-align: center;'>
                    <thead>
                        <tr class="text-danger">
                            <th class="text-center">编号</th>
                            <th class="text-center">类型名称</th>
                            <th class="text-center">描述</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="tb">
                    <c:forEach items="${categories}" var="category" varStatus="index">
                        <tr>
                            <td>${index.index+1}</td>
                            <td>${category.name}</td>
                            <td id="${category.name}description">${category.description}</td>
                            <td class="text-center">
                                <input type="button" class="btn btn-warning btn-sm doCategoryModify" onclick="showInfo('${category.name}')"  value="修改">
                                <input type="button" class="btn btn-warning btn-sm doProTypeDelete"  onclick="deleteCategory('${category.name}')" value="删除">
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <!-- 添加文章类型 start -->     
    <div class="modal fade" tabindex="-1" id="category">
        <!-- 窗口声明 -->
        <div class="modal-dialog modal-lg">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加文章类型</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label for="addcategoryname" class="col-sm-4 control-label">类型名称：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="addcategoryname">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="categorydesc" class="col-sm-4 control-label">类型描述：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="categorydesc">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary doAddCategory" onclick="addCategory()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 添加文章类型 end -->
    
    <!-- 修改文章类型 start -->
    <div class="modal fade" tabindex="-1" id="myCategory">
        <!-- 窗口声明 -->
        <div class="modal-dialog modal-lg">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改文章类型</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label for="categoryname" class="col-sm-4 control-label">类型名称</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="categoryname" disabled="disabled">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="categorydescription" class="col-sm-4 control-label">类型描述：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="categorydescription">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning updateCategory" id="updateCategory" onclick="changeInfo()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改文章类型 end -->
</body>
</html>
<script>
    function deleteCategory(name) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/category/deleteCategoryByName",
            data:{uname:name},
            dataType:'json',
            success: function (category) {
            },
            error: function (message) {
            },
        });
        window.location.reload();
        window.location.reload();

    }
    function showInfo(name) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/category/getCategoryByName",
            data:{uname:name},
            dataType:'json',
            success: function (category) {
                $("#categoryname").val(category.name);
                $("#categorydescription").val(category.description);
            },
            error: function (message) {
                window.alert("error")
            },
        });

    }
    function addCategory(){
        var category = {
            "name":$("input[id='addcategoryname']").val(),
            "description":$("input[id='categorydesc']").val()
        };
        $.ajax({
            url:"http://localhost:8080/category/addCategory",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(category),//转化为json字符串
            success:function(data){

            },
        });
        // window.location.href="http://localhost:8080/category/findAllagain";

        window.location.reload();
    }
    $("#updateCategory").click(function (){
        var category = {
            "name":$("input[id='categoryname']").val(),
            "description":$("input[id='categorydescription']").val()
        };
        $.ajax({
            url:"http://localhost:8080/category/updateCategory",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(category),//转化为json字符串
            success:function(data){
            },
        });
    });

    function changeInfo() {//修改一行数据，根据输入框的id=name
        const title = $("input[id='categoryname']").val();
        document.getElementById(title+"description").innerHTML=$("input[id='categorydescription']").val();

    }
</script>

