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
<body onload="initAJAX()">
<div class="panel panel-default" id="userInfo" id="homeSet">
        <div class="panel-heading">
            <h3 class="panel-title">用户管理</h3>
        </div>
        <div class="panel-body">
            <div class="showusersearch">
                <form class="form-inline" method="post">
                  <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control"id="customer_name" name="forname"
                           placeholder="请输入用户名" size="15px">
                  </div>
                  <input type="button" value="查询" class="btn btn-primary" id="doSearch" onclick="dosearch()">
                </form>
            </div>
            
            <div class="show-list" style="position: relative;top: 30px;">
                <table class="table table-bordered table-hover" style='text-align: center;'>
                    <thead>
                        <tr class="text-danger">
                            <th class="text-center">序号</th>
                            <th class="text-center">用户名</th>
                            <th class="text-center">昵称</th>
                            <th class="text-center">电话</th>
                            <th class="text-center">地址</th>
                            <th class="text-center">积分数</th>
                            <th class="text-center">工作性质</th>
                            <th class="text-center">状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                        <tbody id="tb">
                        <c:forEach items="${users}" var="user" varStatus="index">

                            <tr>
                                <td >${index.index+1}</td>
                                <td id="${user.username}username">${user.username}</td>
                                <td id="${user.username}nickname">${user.nickname}</td>
                                <td id="${user.username}tel">${user.tel}</td>
                                <td id="${user.username}position">${user.position}</td>
                                <td id="${user.username}integral">${user.integral}</td>
                                <td id="${user.username}nature">${user.nature}</td>
                                <td id="${user.username}status">${user.status}</td>
                                <td class="text-center">
                                    <input type="button" class="btn btn-warning btn-sm doModify"
                                           onclick="showInfo('${user.username}')" value="修改">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 修改用户信息 start -->
    <div class="modal fade" tabindex="-1" id="myModal">
        <!-- 窗口声明 -->
        <div class="modal-dialog">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改用户</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label for="name" class="col-sm-4 control-label">用户名：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="name" disabled="disabled" >
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="loginName" class="col-sm-4 control-label">昵称：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="loginName"  >
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="phone" class="col-sm-4 control-label">电话：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="phone" value="" >
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="address" class="col-sm-4 control-label">地址：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="address" value="">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="integral" class="col-sm-4 control-label">积分数：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="integral" value="">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="nature" class="col-sm-4 control-label">工作性质：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="nature" value="">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="status" class="col-sm-4 control-label">状态：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="status" value="">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary updateOne"  id="update" onclick="changeInfo()" >修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改用户户信息 end -->
</body>
</html>

<%--接受来自JSON数据--%>
<script language="JavaScript">
    // $('#myModal').on('show.bs.modal', function (event) {
    //     var modal = $(this);  //get modal itself
    //     modal.find('.modal-body #phone').val('your message');
    // });

    function dosearch() {
        var name =$("input[id='customer_name']").val();
        window.location.href="http://localhost:8080/user/findSome?action=Edit&name="+name;
    }

    function showInfo(name){//展示信息
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/user/getUserByName",
            data:{uname:name},
            dataType:'json',
            success: function (user) {
                $("#name").val(user.username);
                $("#loginName").val(user.nickname);
                $("#phone").val(user.tel);
                $("#address").val(user.position);
                $("#integral").val(user.integral);
                $("#nature").val(user.nature);
                $("#status").val(user.status);
            },
            error: function (message) {
                window.alert("error")
            },
        });
    }
    $("#update").click(function () {//更新数据库信息
        var user = {
            "username":$("input[id='name']").val(),
            "nickname":$("input[id='loginName']").val(),
            "tel":$("input[id='phone']").val(),
            "position":$("input[id='address']").val(),
            "integral":$("input[id='integral']").val(),
            "nature":$("input[id='nature']").val(),
            "status":$("input[id='status']").val()
        };

        $.ajax({
            url:"http://localhost:8080/user/updateUser",
            contentType:"application/json;charset=UTF-8",
            type:'POST',
            dataType:'json',//json 返回值类型
            data: JSON.stringify(user),//转化为json字符串
            success:function(data){
            },
        });

    });
    function changeInfo() {//修改一行数据，根据输入框的id=name
                var username=$("input[id='name']").val();
                document.getElementById(username+"username").innerHTML=$("input[id='name']").val();
                document.getElementById(username+"nickname").innerHTML=$("input[id='loginName']").val();
                document.getElementById(username+"tel").innerHTML=$("input[id='phone']").val();
                document.getElementById(username+"position").innerHTML=$("input[id='address']").val();
                document.getElementById(username+"integral").innerHTML=$("input[id='integral']").val();
                document.getElementById(username+"nature").innerHTML=$("input[id='nature']").val();
                document.getElementById(username+"status").innerHTML=$("input[id='status']").val();
    }
</script>
