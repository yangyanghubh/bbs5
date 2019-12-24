<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
    <title>BBS论坛-后台管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/jquery/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/userSetting.js"></script>
    <style type="text/css">
        /*初始化*/
        * {
            margin:0px;
            padding:0px;
        }
        ul,li{
            list-style:none;
        }
        img {
            border:0px;
        }
        body {
            font-size:14px;
            color:#333;
        }
        a:link,a:visited {
            color:#0a764d;
            text-decoration:none;
        }
        a:hover {
            color:blue;
        }
        /*header部分*/
        .head {
            width: 100%;
            height: 50px;
            background: #337ab7;
            line-height: 50px;
            color: #fff;
        }
        .welcome{
            width: 150px;
            position: absolute;
            top: 0;
            right: 100px;
            display: flex;
            justify-content: space-between;
        }
        .welcome .right{
            margin-left: -40px;
        }
        .head p {
            font-size: 20px;
            font-weight: 900;
            letter-spacing: 2px;
        }

        .head p span {
            font-size: 16px;
            margin-left: 10px;
            font-weight: 400;
        }
        /*content部分*/
        .content{
            height: 500px;
        }
        .list{
            padding-right: 0px;
        }
        .list-group li {
            padding-left: 40px;
        }
        .list-group .active {
            color: #fff;
            border: none;
            background: #28b9c0;
        }

        .list-group .active:hover {
            background: #28b9c0;
        }
        #userPanel {
            padding-left: 0;
            height: 95%;
        }

        .panel-heading {
            height: 70px;
        }

        .panel-heading h3 {
            height: 70px;
            line-height: 54px;
            font-size: 22px;
            font-weight: 600;
            color: #0f92d4;
        }

        .panel-default {
            height: 100%;
        }

        .panel-body {
            height: 90%;
            overflow: auto;
        }
        .footer {
            position: relative;
            margin-top: -40px;
            /* footer高度的负值 */
            height: 40px;
            line-height: 40px;
            text-align: center;
            clear: both;
            color: #fff;
            background: #337ab7;
        }
    </style>
<body>
<header>
    <!-- header start -->
    <div class="clear-bottom head">
        <div class="container ">
            <p>BBS论坛<span>后台管理系统</span></p>
            <div class="welcome"> 欢迎你！<%=request.getParameter("user")%>
                <div class="exit"><a href="http://localhost:8080/login" >退出</a></div>
            </div>
        </div>

</header>
<!-- header end -->
<content class="content">
    <div class="row user-setting">
        <div class="col-xs-2 list">
            <ul class="list-group">
                <li class="list-group-item active" name="userPic" id="user-set">
                    <i class="glyphicon glyphicon-user"></i> &nbsp;用户管理
                </li>
                <li class="list-group-item" name="userInfo" id="article-set">
                    <i class="glyphicon glyphicon-file"></i> &nbsp;文章管理
                </li>
                <li class="list-group-item" name="userSet" id="category-set">
                    <i class="glyphicon glyphicon-user"></i> &nbsp;类型管理
                </li>
                <li class="list-group-item" name="adminSet" id="comment-set">
                    <i class="glyphicon glyphicon-list-alt"></i> &nbsp;评论管理
                </li>
                <li class="list-group-item" name="adminSet" id="manager-set">
                    <i class="glyphicon glyphicon-globe"></i> &nbsp;系统用户管理
                </li>
            </ul>
        </div>
        <div class="col-xs-10" id="userPanel">
            <iframe id="frame-id" src="http://localhost:8080/user/findAll" width="100%" height="600px" frameborder="0" scrolling="no">
            </iframe>
        </div>
    </div>
</content>
<div class="footer">
    <footer class="footer">版权所有：南昌大学</footer>

</div>


<script type="text/javascript">
    $(function(){
        // 点击切换页面

        $("#user-set").click(function() {
            $("#frame-id").attr("src", "http://localhost:8080/user/findAll");
        });
        $("#article-set").click(function() {
            $("#frame-id").attr("src", "http://localhost:8080/article/findAll");
        });
        $("#category-set").click(function() {
            $("#frame-id").attr("src", "http://localhost:8080/category/findAll");
        });
        $("#comment-set").click(function() {
            $("#frame-id").attr("src", "http://localhost:8080/comment/findAll");
        });
        $("#manager-set").click(function() {
            $("#frame-id").attr("src", "http://localhost:8080/admin/findAll");
        });
    });
</script>

</body>
</html>