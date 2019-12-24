<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>BBS论坛--我要发帖</title>
    <script src="../bootstrap/jquery/jquery.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .logo{
            line-height: 35px;
        }
        .navbar-default .navbar-nav > .active > a,
        .navbar-default .navbar-nav > .active > a:hover,
        .navbar-default .navbar-nav > .active > a:focus{
            background-color: #337ab7;
            color: #fff!important;
            text-decoration: none;
            border-bottom: 2px solid #337ab7;
        }
        .navbar-default .navbar-nav > li > a{
            color: black;
            border-bottom: 2px solid white;
        }
        .navbar-default .navbar-nav > li > a:hover{
            color: #337ab7;
            border-bottom: 2px solid #337ab7;
        }
        .navbar-nav > li > a{
            line-height: 34px;
        }
        .user-active:hover{
            border-bottom:none!important;
        }
        .user-active:hover>img,.user-active:focus>img{
            border: 2px solid #337ab7;
        }
        .nav .open > a,
        .nav .open > a:hover,
        .nav .open > a:focus{
            border: none!important;
        }
        .userName{
            height: 66px;
            padding: 15px;
            line-height: 34px;
            color: black;

        }
        .dropdown-menu > li > a {
            padding: 10px 24px;
        }
        .dropdown-menu > li > a > i{
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">导航条</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand logo" href="#">BBS论坛</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="http://localhost:8080/user_main">首页</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<strong class="caret"></strong></a>
                            <ul class="dropdown-menu" id="cateList1">
                            </ul>
                        </li>
                        <li >
                            <a href="http://localhost:8080/user_main?jinghua=1">精帖</a>
                        </li>

                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索帖子或者用户"/>
                        </div> <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="userName">
                            您好：${sessionScope.username}
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle user-active" data-toggle="dropdown" role="button">
                                <img class="img-circle" src="../images/${sessionScope.username}.jpg" height="30" />
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="http://localhost:8080/user_information" >
                                        <i class="glyphicon glyphicon-user"></i>我的资料
                                    </a>
                                </li>
<%--                                <li>--%>
<%--                                    <a href="http://localhost:8080/myArticle" >--%>
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
                            <a href="http://localhost:8080/user_login" >退出</a>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!--content 部分-->
<div class="content container">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header" style="margin-bottom: 0px;">
                    <h3>发帖</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <form class="form-horizontal"action="/PostArticle/MyPost"method="post">
            <div class="form-group">
                <label for="title" class="col-md-2  col-sm-2 control-label">标题:</label>
                <div class="col-md-8 col-sm-10">
                    <input type="text" class="form-control" id="title" placeholder="标题"name="title" >
                </div>
            </div>
            <div class="form-group">
                <label for="keyword" class="col-md-2  col-sm-2 control-label">关键字:</label>
                <div class="col-md-8 col-sm-10">
                    <input type="text" class="form-control" id="keyword" placeholder="关键字"name="keyword" >
                </div>
            </div>
            <div class="form-group">
                <label for="category" class="col-md-2  col-sm-2 control-label">文章类型:</label>
                <div class="col-md-8 col-sm-10">
                    <select  class="form-control" name="type" id="category">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="summary" class="col-md-2  col-sm-2 control-label">摘要：</label>
                <div class="col-md-8 col-sm-10">
                    <input type="text" class="form-control" id="summary" placeholder="摘要" name="summary">
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-md-2   col-sm-2  control-label">内容：</label>
                <div class="col-md-8 col-sm-10">
                    <textarea id="content" class="form-control" rows="5"name="content"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">确认发布</button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- 修改密码模态框 -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <form action="#" class="form-horizontal" method="post">
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
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                    <button type="reset" class="btn btn-primary">重&nbsp;&nbsp;置</button>
                    <button type="submit" class="btn btn-primary">修&nbsp;&nbsp;改</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        getCateList();
        getCateListq();
    })
    function getCateList() {

        $.ajax({
            url: "${pageContext.request.contextPath}/article/getCate",
            type: 'post',
            data: {},
            processData: false,
            contentType: false,

            success: function(res) {
                $("#cateList").html("");
                var flag = 0;
                if (res.code == 1) {
                    console.log(res);
                    $.each(res.data, function(index, obj) {
                        List.cateAdd(obj.id,  obj.name);
                    })


                } else {
                    alert("获取信息列表失败请刷新页面1");
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("获取信息列表失败请刷新页面1");
            }

        })
    }

    var List = {
        cateAdd: function(id, name) {
            $('#category').append(`<option value="`+id+`">`+name+`</option>`);

        },cateAdd1: function(id, name) {
            $('#cateList1').append(`<li>
				<a href="${pageContext.request.contextPath}/user_main?cateId=`+id+`">`+name+`</a>
		</li>
		<li class="divider">
		</li>`);

        }



    }
    function getCateListq() {

        $.ajax({
            url: "${pageContext.request.contextPath}/article/getCate",
            type: 'post',
            data: {},
            processData: false,
            contentType: false,

            success: function(res) {
                $("#cateList1").html("");
                var flag = 0;
                if (res.code == 1) {
                    console.log(res);
                    $.each(res.data, function(index, obj) {
                        List.cateAdd1(obj.id,  obj.name);
                    })


                } else {
                    alert("获取信息列表失败请刷新页面1");
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("获取信息列表失败请刷新页面1");
            }

        })
    }

</script>
</html>