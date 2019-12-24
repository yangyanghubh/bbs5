<%--
  Created by IntelliJ IDEA.
  User: a3694
  Date: 2019/12/23
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BBS论坛</title>
    <link rel="icon" href="../images/logo.ico" type="image/x-icon"/>
    <script src="../bootstrap/jquery/jquery.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../bootstrap/js/jqPaginator.js"></script>

    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px;
        }
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

        /*content部分*/
        /*右侧部分*/
        .aside
        {
            clear:both;
            position:relative;
            margin-bottom:15px;
            background-color:#fff;
            border-radius:4px;
            border:1px solid #eaeaea;
        }
        .aside h3 /*最新评论文章*/
        {
            font-size:18px;
            color:#666;
            border-bottom:1px solid #eaeaea;
            background-color:#fbfbfb;
            cursor:default;
            margin:0;
            padding:11px 15px 10px;
        }

        .aside h3:hover
        {
            cursor:pointer;
            color:#337ab7;
        }

        .aside-tabs
        {
            height:200px;
        }

        .nav-tabs
        {
            background-color:#fbfbfb;
            line-height:42px;
            height:42px;
            border-bottom:1px solid #EAEAEA;
        }

        .nav-tabs>li>a
        {
            outline:medium none;
            color:#777;
            margin-right:0;
            border:1px solid transparent;
            border-radius:0;
            border-right:1px solid #DDD!important;
        }

        .nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
        {
            color:#39C!important;
        }

        .aside-tabs .tab-content
        {
            padding:15px;
        }

        .aside-tabs .tab-content li
        {
            margin-bottom:12px;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
            font-size:12px;
        }

        .aside-tabs .tab-content li time
        {
            float:right;
            color:#BBB;
            margin-left:10px;
        }

        .aside-tabs .tab-content li a
        {
            max-width:280px;
            display:block;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
            color:#999;
        }

        .aside-tabs .tab-content .centre h4
        {
            text-align:center;
            font-size:20px;
            line-height:20px;
            margin:25px 0;
        }

        .aside-tabs .tab-content .centre p
        {
            text-align:center;
        }

        .aside-tabs .tab-content .contact h2
        {
            text-align:center;
            font-size:20px;
            line-height:40px;
            font-family:TaurusNormal;
            margin:20px 0;
        }

        .aside-tabs .tab-content .contact a
        {
            color:#444;
        }

        .aside-sentence-content
        {
            cursor:pointer;
            padding:15px;
        }

        .aside-sentence-content h4
        {
            color:#39C;
            font-size:20px;
            margin:0 0 10px;
        }

        .aside-sentence-content h4:hover
        {
            color:#31B2F3;
        }

        .aside-sentence-content p
        {
            font-size:12px;
            color:#AAA;
        }

        .aside_hot li a
        {
            color:#888;
            border-bottom:solid 1px #eee;
            overflow:hidden;
            position:relative;
            display:block;
            font-size:14px;
            padding:10px 15px 10px 150px;
        }

        .aside_hot li a:hover
        {
            background-color:#FBFDFF;
            -webkit-transform:scale(1.05);
            transform:scale(1.05);
            -webkit-transition-timing-function:cubic-bezier(0.47,2.02,0.31,-0.36);
            transition-timing-function:cubic-bezier(0.47,2.02,0.31,-0.36);
        }

        .aside_hot .thumbnail
        {
            float:left;
            margin-left:-135px;
            border:none;
            margin-bottom:0;
        }

        .aside_hot .thumbnail img
        {
            width:122px;
            height:86px;
        }

        .aside_hot .muted
        {
            margin-right:15px;
            font-size:12px;
            color:#BBB;
        }
        /*左侧文章部分*/
        .article-header
        {
            margin-bottom:20px;
            border-bottom:1px solid #EEE;
            text-align:center;
            padding:25px 0;
        }
        .article-title
        {
            margin-top:0;
            font-size:26px;
            line-height:36px;
        }

        .article-meta
        {
            margin-top:10px;
            font-size:12px;
            color:#999;
        }

        .article-meta .item
        {
            margin-right:20px;
            cursor:pointer;
        }

        .article-meta .item a
        {
            color:#666;
        }

        .article-content
        {
            font-size:15px;
            line-height:25px;
            word-wrap:break-word;
            cursor:default;
        }


        .article-content p
        {
            text-indent:30px;
            margin-bottom:18px;
            word-wrap:break-word;
        }

        .article-copyright
        {
            background-color:#EEE;
            font-size:12px;
            border-radius:3px;
            color:#aaa;
            text-align:center;
            cursor:default;
            padding:3px 0;
        }

        .article-content .article-copyright a,.article-copyright a:hover
        {
            color:#AAA;
            text-decoration:none;
        }

        .article-content .article-copyright:hover
        {
            background:#39C;
            color:#FFF;
        }

        .article-content .article-copyright:hover a
        {
            color:#FFF;
        }

        .article-tags
        {
            text-align:center;
            cursor:default;
            margin:30px 0;
        }

        .article-tags a
        {
            display:inline-block;
            color:#FFF;
            font-size:12px;
            background-color:#39C;
            opacity:0.85;
            filter:alpha(opacity=85);
            margin:0 4px 4px 0;
            padding:4px 7px 3px;
        }

        .article-tags a:hover
        {
            opacity:1;
            filter:alpha(opacity=100);
            -webkit-transform:scale(1.05);
            transform:scale(1.05);
            -webkit-transition-timing-function:cubic-bezier(0.47,2.02,0.31,-0.36);
            transition-timing-function:cubic-bezier(0.47,2.02,0.31,-0.36);
        }

        #comment
        {
            margin-bottom:15px;
            font-size:16px;
        }

        #respond
        {
            padding-bottom:25px;
        }

        .comment-signarea
        {
            background-color:#F6F6F6;
            border-radius:7px;
            text-align:center;
            margin-bottom:20px;
            padding:30px 20px;
        }

        .comment-signarea h3
        {
            font-weight:400;
            font-size:18px;
            cursor:pointer;
            margin:0 0 15px;
            padding:0;
        }

        .comment-title
        {
            font-size:12px;
            color:#999;
            float:left;
            margin-left:-46px;
            width:36px;
            text-align:center;
        }

        .comment-box
        {
            border:2px solid #CCD4D9;
            border-radius:2px;
            background-color:#FFF;
            position:relative;
            z-index:10;
            padding:4px 4px 0;
        }

        #comment-textarea
        {
            width:100%;
            resize:none;
            overflow-x:hidden;
            overflow-y:auto;
            border:none;
            line-height:22px;
            font-size:14px;
            outline:0;
            color:#666;
            height:68px;
        }

        #comment-textarea::-webkit-scrollbar
        {
            width:3px;
            height:3px;
            background:#CCC;
            border-radius:5px;
        }

        #comment-textarea::-webkit-scrollbar-thumb
        {
            background:#999;
            border-radius:5px;
        }

        .comment-ctrl
        {
            background-color:#FBFBFB;
            height:36px;
            margin-left:-4px;
            border-top:solid 1px #F2F2F2;
            z-index:5;
        }


        #comment-submit
        {
            position:absolute;
            right:-2px;
            bottom:-2px;
            background:#39C;
            border:2px solid;
            border-left:none;
            border-top:none;
            width:100px;
            height:38px;
            color:#FFF;
            outline:0;
            border-radius:0 0 2px 0;
            font-size:16px;
            z-index:6;
            border-color:#39C;
            padding:0;
        }

        #comment-submit:hover
        {
            background:#FBFBFB;
            color:#39C;
            border-top:solid 1px #F2F2F2;
            border-color:#CCD4D9;
        }

        #postcomments
        {
            padding-bottom:20px;
        }

        .comment-list
        {
            list-style:none;
            cursor:pointer;
            margin:0 0 10px;
            padding:0;
        }

        .comment-content
        {
            border-bottom:#EEE 1px solid;
        }

        .comment-content:hover
        {
            opacity:.7;
            filter:alpha(opacity=70);
        }

        .comment-avatar
        {
            width:36px;
            height:36px;
            background-color:#FFF;
            float:left;
            display:inline;
            position:relative;
            margin-top:19px;
        }

        .comment-avatar .avatar
        {
            display:block;
            border-radius:50%;
            width:36px;
            height:36px;
        }

        .comment-main
        {
            margin-left:5px;
            margin-right:30px;
            color:#888;
            line-height:22px;
            position:relative;
            font-size:14px;
            word-wrap:break-word;
            max-height:300px;
            overflow:hidden;
            padding:0 0 15px;
        }

        .comment-main p
        {
            margin-top:15px;
            margin-bottom:0;
        }

        .comment-main span.time
        {
            font-size:12px;
            color:#BBB;
            margin:0 5px;
        }

        .comment-main span.comment-user
        {
            color:#39C;
            margin:0 5px;
        }
        .jinghua-flex {
            display: flex;
            flex-direction: row-reverse;
        }
        img.jinghua {
            position: absolute;
            display: none;
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
                        <li >
                            <a href="#">精帖</a>
                        </li>
                        <li>
                            <a href="#">关于我们</a>
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

<!--  content部分-->
<div class=" container content">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header" style="margin-bottom: 0px; margin-top: -10px;">
                    <h3>文章详情</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <!-- 左侧文章列表 -->
        <div class="col-md-8 column">
            <div class="content-article">
                <div class="content-wrap">
                    <div class="content">
                        <div class="jinghua-flex">
                            <img id="jinghua" class="jinghua" src="${pageContext.request.contextPath}/images/001.gif">
                        </div>
                        <header class="article-header">
                            <h1 class="article-title" id="title">

                            </h1>
                            <div class="article-meta">
                                    <span class="item article-meta-time">
                                        <time class="time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="发表时间：2016-10-14">
                                            <i class="glyphicon glyphicon-time"></i>
                                            <span id="time"></span>
                                        </time>
                                    </span>
                                <span class="item article-meta-category" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="类别">
                                        <i class="glyphicon glyphicon-list"></i>

                                        <span id="cate"></span>
                                    </span>
                                <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="评论量">
                                        <i class="glyphicon glyphicon-comment"></i>
                                         <span id="comment1"></span>
                                    </span>
                            </div>
                        </header>
                        <article class="article-content">
                            <p id="nickname"></p>
                            <div class="content jumbotron">
                                <p id="content">

                                </p>
                            </div>
                        </article>
                        <div class="title" id="comment">
                            <h3>评论</h3>
                        </div>
                        <div id="respond">
                            <form id="comment-form" name="comment-form" action="" method="POST">
                                <div class="comment">
                                    <div class="comment-box">
                                        <textarea placeholder="您的评论或留言（必填）" name="context" id="comment-textarea" cols="100%" rows="3" tabindex="3"></textarea>
                                        <div class="comment-ctrl">
                                            <div class="comment-prompt" style="display: none;"> <i class="fa fa-spin fa-circle-o-notch"></i> <span class="comment-prompt-text">评论正在提交中...请稍后</span> </div>
                                            <div class="comment-success" style="display: none;"> <i class="fa fa-check"></i> <span class="comment-prompt-text">评论提交成功...</span> </div>
                                            <button type="button" name="comment-submit" id="comment-submit" tabindex="4" onclick="submitfrom();return false;">评论</button>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div id="postcomments">
                            <ol id="comment-list" class="comment-list">

                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右侧最新热点和关于本站 -->
        <div class="col-md-4 column">
            <div class="aside aside-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">统计信息</a></li>
                    <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane contact active" id="notice">
                        <h2>
                            帖子总数:
                            888篇
                        </h2>
                        <h2>
                            网站运行:
                            <span id="sitetime">20天 </span>
                        </h2>
                    </div>
                    <div role="tabpanel" class="tab-pane contact" id="contact">
                        <h2>
                            QQ:
                            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2248736974&amp;site=qq&amp;menu=yes" target="_blank" rel="nofollow" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="QQ:2248736974">2248736974</a>
                        </h2>
                        <h2>
                            Email:
                            <a href="mailto:admin@muzhuangnet.com" target="_blank" data-toggle="tooltip" rel="nofollow" data-placement="bottom" title="" data-original-title="Email:2248736974@qq.com">2248736974@qq.com</a>
                        </h2>
                    </div>
                </div>
            </div>
            <div class="aside aside_hot">
                <h3>最新评论文章</h3>
                <ul style="list-style: none;">
                    <li>
                        <a title="用DTcms做一个独立博客网站（响应式模板）" href="http://www.muzhuangnet.com/show/269.html" draggable="false">
                                <span class="thumbnail">
                                    <img class="thumb" data-original="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" src="../images/薛之谦.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" draggable="false" style="display: inline; float: left;">
                                </span>
                            <span class="text">用DTcms做一个独立博客网站（响应式模板）</span><br>
                            <span class="muted">
                                    <i class="glyphicon glyphicon-time"></i>
                                    2016-10-14
                                </span>
                            <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>11422</span>
                        </a>
                    </li>
                    <li>
                        <a title="博客下一版本更新意见征集" href="http://www.muzhuangnet.com/show/662.html" draggable="false">
                                <span class="thumbnail">
                                    <img class="thumb" data-original="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" src="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" alt="博客下一版本更新意见征集" draggable="false">
                                </span>
                            <span class="text">博客下一版本更新意见征集</span><br>
                            <span class="muted">
                                    <i class="glyphicon glyphicon-time"></i>
                                        2018-11-02
                                </span>
                            <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>997</span>
                        </a>
                    </li>
                    <li>
                        <a title="博客下一版本更新意见征集" href="http://www.muzhuangnet.com/show/662.html" draggable="false">
                                <span class="thumbnail">
                                    <img class="thumb" data-original="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" src="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" alt="博客下一版本更新意见征集" draggable="false">
                                </span>
                            <span class="text">博客下一版本更新意见征集</span><br>
                            <span class="muted">
                                    <i class="glyphicon glyphicon-time"></i>
                                        2018-11-02
                                </span>
                            <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>997</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<footer class="footer" >
    <div class="container">
        <p class="text-center">本站[<a href="http://www.muzhuangnet.com/">BBS论坛</a>
            ]的部分内容来源于网络，若侵犯到您的利益，请联系站长,本站将在第一时间内进行处理！谢谢！
        </p>
    </div>
</footer>

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

        getArticle();
        getComment();
    })
    /*获取get参数*/
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return (false);
    }
    function getArticle() {
        // 发送请求
        var formData = new FormData();
        if(getQueryVariable("id")!=null && getQueryVariable("id")) {
            formData.append("id", getQueryVariable("id"));
        }
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
                    $("#title").html(res.title);
                    $("#content").html(res.content);
                    $("#comment1").html(res.comment);
                    $("#time").html(res.time);
                    $("#nickname").html(res.summary);
                    if(res.jinghua==1){
                        $("#jinghua").show();
                    }


                    $("#cate").html(`<a href="${pageContext.request.contextPath}/user_main?cateId=`+res.cateId+`">`+res.name+`</a>`);
                    // $.each(res.data, function(index, obj) {
                    //     List.add(obj.title, obj.id, obj.name, obj.time, obj.summary,obj.comment,obj.cateId);
                    // })


                } else {
                    alert("获取信息列表失败请刷新页面");
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("获取信息列表失败请刷新页面");
            }

        })
    }
    function getComment() {
        var formData = new FormData();
        formData.append("id", getQueryVariable("id"));
        $.ajax({
            url: "${pageContext.request.contextPath}/article/getcomment",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,

            success: function(res) {
                $("#comment-list").html("");
                if (res.code == 1) {
                    console.log(res);
                    $.each(res.data, function(index, obj) {
                        List.add(obj.nickName,  obj.time_comment,obj.context);
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
    function submitfrom() {
        // 发送请求
        var formData = new FormData($("#comment-form")[0]);
        formData.append("id", getQueryVariable("id"));
        // 发送请求
        $.ajax({
            url:"${pageContext.request.contextPath}/article/addComment",
            type:'post',
            data:formData,
            processData:false,
            contentType:false,
            success: function(res) {
                if (res.code == 1) {
                    alert("评论成功");
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
    var List = {
        add: function(nickName, time, context) {
            context = context == null ? '' : context;
            $('#comment-list').append(`<li class="comment-content">
        <div class="comment-main">
        <p>
        <a class="comment-user">
        `+nickName+`
        </a>
        <span class="time">评论时间：`+time+`</span><br>
    <span> 评论内容：`+context+`</span>
    </p>
    </div>
    </li>`);

        },



    }
</script>
</html>


