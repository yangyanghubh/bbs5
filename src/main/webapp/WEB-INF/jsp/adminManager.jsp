<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
     <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/jquery/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/userSetting.js"></script>
    <link rel="stylesheet"  href="../css/index.css" />
</head>

<body>
    <!-- 系统用户管理 -->
    <div class="panel panel-default" id="adminSet">
        <div class="panel-heading">
            <h3 class="panel-title">系统用户管理</h3>
        </div>
        <div class="panel-body">
            <!-- 搜索框 start -->
            <div class="showadminsearch">
                <form class="form-inline">
				  <div class="form-group">
				    <label for="SearchUserName">姓名:</label>
				    <input type="text" class="form-control" id="SearchUserName" placeholder="请输入姓名">
				  </div>
				  <input type="button" value="查询" class="btn btn-primary" id="doSearch" onclick="dosearchadmin()">
				</form>
            </div>
            <br>
            <!-- 搜索框 end -->
            <input type="button" value="添加系统用户" class="btn btn-primary" id="doAddManger">
            <!-- 表格 -->
            <div class="show-list" style="position: relative; top: 10px;">
                <table class="table table-bordered table-hover" style='text-align: center;'>
                    <thead>
                        <tr class="text-danger">
                            <th class="text-center">序号</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">电话</th>
                            <th class="text-center">邮箱</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="tb">
                    <c:forEach items="${admins}" var="admin" varStatus="index">
                        <tr>
                            <td>${index.index+1}</td>
                            <td>${admin.username}</td>
                            <td id="${admin.username}tel">${admin.tel}</td>
                            <td id="${admin.username}email">${admin.email}</td>
                            <td class="text-center">
                                <input type="button" class="btn btn-warning btn-sm doMangerModify"
                                       onclick="showInfo('${admin.username}')" value="修改">
                                <input type="button" class="btn btn-danger btn-sm doMangerDisable"
                                       onclick="deleteAdmin('${admin.username}')" value="删除">
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 添加系统用户 start -->
    <div class="modal fade" tabindex="-1" id="addAdmin">
        <!-- 窗口声明 -->
        <div class="modal-dialog">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加系统用户</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">用户名：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="admin-username">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">登录密码：</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="admin-password">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label class="col-sm-4 control-label">联系电话：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="admin-phone">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">联系邮箱：</label>
                        <div class="col-sm-4">
                            <input type="email" class="form-control" id="admin-email">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary add-Manger" type="button" onclick="addAdmin()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal" type="button">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 添加系统用户 end -->

    <!-- 修改系统用户 start -->
    <div class="modal fade" tabindex="-1" id="modifyAdmin">
        <!-- 窗口声明 -->
        <div class="modal-dialog">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">系统用户修改</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">用户姓名：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="adminStaffname" disabled="disabled">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">联系电话：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="adminPhone">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label  class="col-sm-4 control-label">联系邮箱：</label>
                        <div class="col-sm-4">
                            <input type="email" class="form-control" id="adminAdrees">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary doadminModal" id="update" onclick="changeInfo()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改系统用户 end -->
</body>
</html>
<script>
    function dosearchadmin() {
        var name =$("input[id='SearchUserName']").val();
        window.location.href="http://localhost:8080/admin/findSome?action=Edit&name="+name;
    }
    function deleteAdmin(name) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/admin/deleteAdmin",
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
    function addAdmin(){
        var admin = {
            "username":$("input[id='admin-username']").val(),
            "password":$("input[id='admin-password']").val(),
            "tel":$("input[id='admin-phone']").val(),
            "email":$("input[id='admin-email']").val()
        };
        $.ajax({
            url:"http://localhost:8080/admin/addAdmin",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(admin),//转化为json字符串
            success:function(data){

            },
        });
        // window.location.href="http://localhost:8080/category/findAllagain";

        window.location.reload();
    }
    function dosearch() {
        var name =$("input[id='userName']").val();
        window.location.href="http://localhost:8080/article/findSome?action=Edit&name="+name;
    }
    function showInfo(name) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/admin/getAdminByName",
            data:{uname:name},
            dataType:'json',
            success: function (admin) {
                $("#adminStaffname").val(admin.username);
                $("#adminPhone").val(admin.tel);
                $("#adminAdrees").val(admin.email);
            },
            error: function (message) {
                window.alert("error")
            },
        });

    }
    $("#update").click(function (){
        var admin = {
            "username":$("input[id='adminStaffname']").val(),
            "tel":$("input[id='adminPhone']").val(),
            "email":$("input[id='adminAdrees']").val()
        };
        $.ajax({
            url:"http://localhost:8080/admin/updateAdmin",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(admin),//转化为json字符串
            success:function(data){
            },
        });
    });

    function changeInfo() {//修改一行数据，根据输入框的id=name
        const title = $("input[id='adminStaffname']").val();
        document.getElementById(title+"tel").innerHTML=$("input[id='adminPhone']").val();
        document.getElementById(title+"email").innerHTML=$("input[id='adminAdrees']").val();

    }
</script>
