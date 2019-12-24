<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="zh">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>个人中心</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/jquery/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .logo {
            line-height: 35px;
        }

        .navbar-default .navbar-nav > .active > a,
        .navbar-default .navbar-nav > .active > a:hover,
        .navbar-default .navbar-nav > .active > a:focus {
            background-color: #337ab7;
            color: #fff !important;
            text-decoration: none;
            border-bottom: 2px solid #337ab7;
        }

        .navbar-default .navbar-nav > li > a {
            color: black;
            border-bottom: 2px solid white;
        }

        .navbar-default .navbar-nav > li > a:hover {
            color: #337ab7;
            border-bottom: 2px solid #337ab7;
        }

        .navbar-nav > li > a {
            line-height: 34px;
        }

        .user-active:hover {
            border-bottom: none !important;
        }

        .user-active:hover > img, .user-active:focus > img {
            border: 2px solid #337ab7;
        }

        .nav .open > a,
        .nav .open > a:hover,
        .nav .open > a:focus {
            border: none !important;
        }

        .userName {
            height: 66px;
            padding: 15px;
            line-height: 34px;
            color: black;

        }

        .dropdown-menu > li > a {
            padding: 10px 24px;
        }

        .dropdown-menu > li > a > i {
            padding-right: 10px;
        }

        .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            color: #337ab7;
            text-decoration: none;
            background-color: rgba(204, 204, 204, 0.5);
        }

    </style>
</head>

<body>
<!-- header部分-->
<div class="header container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">导航条</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand logo" href="#">BBS论坛</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="http://localhost:8080/user_main">首页</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">文学</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">体育</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">财经</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">政治</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">旅游</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">关于我们</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索帖子或者用户"/>
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="userName">
                            您好：${sessionScope.username}
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle user-active" data-toggle="dropdown" role="button">
                                <img class="img-circle" src="../images/${sessionScope.username}.jpg" height="30"/>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="http://localhost:8080/user_information">
                                        <i class="glyphicon glyphicon-user"></i>我的资料
                                    </a>
                                </li>
<%--                                <li>--%>
<%--                                    <a href="http://localhost:8080/myArticle">--%>
<%--                                        <i class="glyphicon glyphicon-envelope"></i>我的帖子--%>
<%--                                    </a>--%>
<%--                                </li>--%>
                                <li>
                                    <a href="http://localhost:8080/user_posting">
                                        <i class="glyphicon glyphicon-file"></i> 发帖
                                    </a>
                                </li>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modifyPasswordModal">
                                        <i class="glyphicon glyphicon-cog"></i>修改密码
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="http://localhost:8080/user_login">退出</a>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- content start -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>基本资料</h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <form class="form-horizontal">
        <div class="form-group">
            <label for="username" class="col-md-2  col-sm-2 control-label">用户名:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="username" placeholder="用户名" readonly="readonly"
                       value="${sessionScope.username}">
            </div>
        </div>
        <div class="form-group">
            <label for="nickname" class="col-md-2  col-sm-2 control-label">昵称:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="nickname" placeholder="昵称" value="">
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-md-2  col-sm-2 control-label">联系电话:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="phone" placeholder="联系电话" value="${sessionScope.user.tel}">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-2   col-sm-2  control-label">Email:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="email" placeholder="邮箱" value="${sessionScope.user.email}">
            </div>
        </div>
        <div class="form-group">
            <label for="intergral" class="col-md-2  col-sm-2 control-label">积分数:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="intergral" placeholder="积分数" readonly="readonly" value="0">
            </div>
        </div>
        <div class="form-group">
            <label for="nature" class="col-md-2  col-sm-2 control-label">工作性质:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="nature" placeholder="工作性质" value="学生">
            </div>
        </div>
        <div class="form-group">
            <label for="position" class="col-md-2   col-sm-2  control-label">工作地点:</label>
            <div class="col-md-8 col-sm-10">
                <input type="text" class="form-control" id="position" placeholder="工作地点" value="南昌大学">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" onclick="submitfrom();return false;" class="btn btn-primary">确认修改</button>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>修改头像</h3>
            </div>
        </div>
    </div>
    <form method="POST" action="http://localhost:8080/file/images"
          enctype="multipart/form-data" accept-charset="UTF-8">
        <div class="form-group">
            <label for="address" class="col-md-2   col-sm-2  control-label">选择头像:</label>
            <div class="col-md-10 col-sm-10">
                <img src="../../images/add.png" id="showImg" class="togeImg" onclick="openFile()" alt="" width="100"
                     height="100">
                <input id="file" type="file" style="display: none;" name="imgName"/>
                <script>
                    function openFile() {
                        $("#file").click();
                    }

                    $('#file').change(function () {
                        $("#showImg").attr("src", window.URL.createObjectURL(this.files[0]));
                    });
                </script>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">确认修改</button>
            </div>
        </div>
    </form>
</div>
<!-- content end-->
<!-- footers start -->
<div class="footers">
    版权所有：南京网博
</div>
<!-- footers end -->
<!-- 修改密码模态框 -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <form action="" class="form-horizontal" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">原密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">新密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">重复密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">
                        关&nbsp;&nbsp;闭
                    </button>
                    <button type="reset" class="btn btn-primary">重&nbsp;&nbsp;置</button>
                    <button type="submit" class="btn btn-primary">修&nbsp;&nbsp;改</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    $(function () {
        init()
    });

    function init() {
        var formData = new FormData();
        $.ajax({
            url: "${pageContext.request.contextPath}/user/getMyself",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function (res) {
                if (res.code == 1) {
                    $("#nickname").val(res.data.nickname);
                    $("#phone").val(res.data.tel);
                    $("#email").val(res.data.email);
                    $("#nature").val(res.data.nature);
                    $("#position").val(res.data.position);
                    $("#username").val(res.data.username);
                    $("#intergral").val(res.data.integral);

                } else {
                    alert(res.msg);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("连接错误");
            }

        })
    }

    function submitfrom() {
        // 发送请求
        var formData = new FormData();
        formData.append("nickname", $("#nickname").val());
        formData.append("tel", $("#phone").val());
        formData.append("email", $("#email").val());
        formData.append("nature", $("#nature").val());
        formData.append("position", $("#position").val());

        // 发送请求
        $.ajax({
            url: "${pageContext.request.contextPath}/user/editInfo",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function (res) {
                if (res.code == 1) {
                    alert("修改成功");
                    window.location.reload();


                } else {
                    alert(res.msg);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("连接错误");
            }

        })
    }


</script>
</html>