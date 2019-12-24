<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>BBS论坛</title>
	<script src="../../bootstrap/jquery/jquery.min.js"></script>
	<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<script src="../bootstrap/js/jqPaginator.js"></script>
	<style type="text/css">



		/*content部分*/
		.article {
			clear: both;
			border: 1px solid #EAEAEA;
			padding: 20px 20px 20px 255px;
			overflow: hidden;
			background-color: #fff;
			margin-bottom: -1px;
			height: 180px;
		}

		.article:hover {
			background-color: #FBFDFF;
			border-color: #42B5EF;
			position: relative;
			z-index: 20;
		}
		.article .focus {
			float: left;
			margin-left: -235px;
			width: 220px;
		}
		.article .thumb {
			border-radius: 5px;
			width: 220px;
			height: 150px;
			overflow: hidden;
		}
		.article img {
			display: inline;
		}

		.article .focus:hover {
			transform: scale(1.05);
			transition-timing-function: cubic-bezier(0.47,2.02,0.31,-0.36);
		}

		.article header {
			margin-bottom: 10px;
		}

		.article .badges {
			color: #FFF;
			background-color: #3399CC;
			padding: 3px 6px;
			font-size: 12px;
			display: inline-block;
			position: relative;
			top: -2px;
			margin-right: 6px;
		}

		.article .badges:hover {
			opacity: .8;
		}

		.article .badges i {
			position: absolute;
			top: 50%;
			margin-top: -4px;
			right: -4px;
			display: inline-block;
			width: 0;
			height: 0;
			vertical-align: middle;
			border-left: 4px solid #3399CC;
			border-top: 4px solid transparent;
			border-bottom: 4px solid transparent;
		}

		.article h2 {
			display: inline;
			font-size: 18px;
			line-height: 24px;
			margin-top: 0;
			font-weight: bold;
		}

		.article h2 a {
			color: #555;
		}

		.article h2 a:hover {
			color: #3399CC;
		}

		.article .meta {
			color: #999;
			font-size: 12px;
			margin-bottom: 10px;
		}

		.comment input {
			margin-bottom: 5px;
			border: 2px solid #ccd4d9;
		}

		.article .time:hover,.article .comment:hover,.article .views:hover {
			color: #3399CC;
		}

		.article .meta a {
			color: #999;
		}

		.meta .time,.meta .comment,.meta .views {
			cursor: pointer;
			margin-right: 20px;
		}
		.article .summary{
			font-size: 10px;
			color: #999;
			word-wrap: break-word;
			line-height: 15px;
			cursor: default;
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
					 <a class="navbar-brand" href="#">BBS论坛</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
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
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="http://localhost:8080/user_login">登录</a>
						</li>
						<li>
							 <a href="http://localhost:8080/user_register">注册</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>
<!--  content部分-->
<div class=" container content">		
	<div class="row clearfix">
		<div class="col-md-8 column">
			<div class="content-article">
				<article class="thumbnail article">
                    <a class="focus" href="#" title="线程安全测试123 " target="_blank" draggable="false">
                    	<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt="线程安全测试 " draggable="false" style="display: inline; float: left;">
                    </a>
                    <header>
                        <a class="badges" href="#" title="Java" draggable="false">Java<i></i></a>
                        <h2>
                            <a href="http://www.muzhuangnet.com/show/711.html" title="线程安全测试" target="_blank" draggable="false">
                            线程安全测试 ArrayList Collections.synchronizedList CopyOnWriteArrayList
                        </a>
                        </h2>
                    </header>
                    <p class="meta">
                        <time class="time" >
                        	<i class="glyphicon glyphicon-time"></i>
                        	 2019-11-30
                        </time>
                        <span class="views">
                        	<i class="glyphicon glyphicon-eye-open"></i> 
                        	8
                    	</span> 
                        <a class="comment" href="http://www.muzhuangnet.com/show/711.html#comment" title="评论" target="_blank" draggable="false" >
                        	<i class="glyphicon glyphicon-comment"></i>
                        	 0
                        </a>
                    </p>
                    <p class="summary">
                    	本文摘自classinstance.cn。ckage t…
                	</p>
                </article>
                <article class="thumbnail article">
                    <a class="focus" href="#" title="线程安全测试123 " target="_blank" draggable="false">
                    	<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt="线程安全测试 " draggable="false" style="display: inline; float: left;">
                    </a>
                    <header>
                        <a class="badges" href="#" title="Java" draggable="false">Java<i></i></a>
                        <h2>
                            <a href="http://www.muzhuangnet.com/show/711.html" title="线程安全测试" target="_blank" draggable="false">
                            线程安全测试 ArrayList Collections.synchronizedList CopyOnWriteArrayList
                        </a>
                        </h2>
                    </header>
                    <p class="meta">
                        <time class="time" >
                        	<i class="glyphicon glyphicon-time"></i>
                        	 2019-11-30
                        </time>
                        <span class="views">
                        	<i class="glyphicon glyphicon-eye-open"></i> 
                        	8
                    	</span> 
                        <a class="comment" href="http://www.muzhuangnet.com/show/711.html#comment" title="评论" target="_blank" draggable="false" >
                        	<i class="glyphicon glyphicon-comment"></i>
                        	 0
                        </a>
                    </p>
                    <p class="summary">
                    	本文摘自classinstance.cn。ArrayList是线程不安全的，因此在并发编程时，经常会使用Collections.synchronizedList与CopyOnWriteArrayList来替代ArrayList，接下来对这3种list进行线程安全测试，以免自己忘记主要测试的是add,get,遍历并发时的情况，代码与结论如下：package t…
                	</p>
                </article>
                <article class="thumbnail article">
                    <a class="focus" href="#" title="线程安全测试123 " target="_blank" draggable="false">
                    	<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt="线程安全测试 " draggable="false" style="display: inline; float: left;">
                    </a>
                    <header>
                        <a class="badges" href="#" title="Java" draggable="false">Java<i></i></a>
                        <h2>
                            <a href="http://www.muzhuangnet.com/show/711.html" title="线程安全测试" target="_blank" draggable="false">
                            线程安全测试 ArrayList Collections.synchronizedList CopyOnWriteArrayList
                        </a>
                        </h2>
                    </header>
                    <p class="meta">
                        <time class="time" >
                        	<i class="glyphicon glyphicon-time"></i>
                        	 2019-11-30
                        </time>
                        <span class="views">
                        	<i class="glyphicon glyphicon-eye-open"></i> 
                        	8
                    	</span> 
                        <a class="comment" href="http://www.muzhuangnet.com/show/711.html#comment" title="评论" target="_blank" draggable="false" >
                        	<i class="glyphicon glyphicon-comment"></i>
                        	 0
                        </a>
                    </p>
                    <p class="summary">
                    	本文摘自classinstance.cn。ArrayList是线程不安全的，因此在并发编程时，经常会使用Collections.synchronizedList与CopyOnWriteArrayList来替代ArrayList，接下来对这3种list进行线程安全测试，以免自己忘记主要测试的是add,get,遍历并发时的情况，代码与结论如下：package t…
                	</p>
                </article><article class="thumbnail article">
                    <a class="focus" href="#" title="线程安全测试123 " target="_blank" draggable="false">
                    	<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt="线程安全测试 " draggable="false" style="display: inline; float: left;">
                    </a>
                    <header>
                        <a class="badges" href="#" title="Java" draggable="false">Java<i></i></a>
                        <h2>
                            <a href="http://www.muzhuangnet.com/show/711.html" title="线程安全测试" target="_blank" draggable="false">
                            线程安全测试 ArrayList Collections.synchronizedList CopyOnWriteArrayList
                        </a>
                        </h2>
                    </header>
                    <p class="meta">
                        <time class="time" >
                        	<i class="glyphicon glyphicon-time"></i>
                        	 2019-11-30
                        </time>
                        <span class="views">
                        	<i class="glyphicon glyphicon-eye-open"></i> 
                        	8
                    	</span> 
                        <a class="comment" href="http://www.muzhuangnet.com/show/711.html#comment" title="评论" target="_blank" draggable="false" >
                        	<i class="glyphicon glyphicon-comment"></i>
                        	 0
                        </a>
                    </p>
                    <p class="summary">
                    	本文摘自classinstance.cn。ArrayList是线程不安全的，因此在并发编程时，经常会使用Collections.synchronizedList与CopyOnWriteArrayList来替代ArrayList，接下来对这3种list进行线程安全测试，以免自己忘记主要测试的是add,get,遍历并发时的情况，代码与结论如下：package t…
                	</p>
                </article><article class="thumbnail article">
                    <a class="focus" href="#" title="线程安全测试123 " target="_blank" draggable="false">
                    	<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt="线程安全测试 " draggable="false" style="display: inline; float: left;">
                    </a>
                    <header>
                        <a class="badges" href="#" title="Java" draggable="false">Java<i></i></a>
                        <h2>
                            <a href="http://www.muzhuangnet.com/show/711.html" title="线程安全测试" target="_blank" draggable="false">
                            线程安全测试 ArrayList Collections.synchronizedList CopyOnWriteArrayList
                        </a>
                        </h2>
                    </header>
                    <p class="meta">
                        <time class="time" >
                        	<i class="glyphicon glyphicon-time"></i>
                        	 2019-11-30
                        </time>
                        <span class="views">
                        	<i class="glyphicon glyphicon-eye-open"></i> 
                        	8
                    	</span> 
                        <a class="comment" href="http://www.muzhuangnet.com/show/711.html#comment" title="评论" target="_blank" draggable="false" >
                        	<i class="glyphicon glyphicon-comment"></i>
                        	 0
                        </a>
                    </p>
                    <p class="summary">
                    	本文摘自classinstance.cn。ArrayList是线程不安全的，因此在并发编程时，经常会使用Collections.synchronizedList与CopyOnWriteArrayList来替代ArrayList，接下来对这3种list进行线程安全测试，以免自己忘记主要测试的是add,get,遍历并发时的情况，代码与结论如下：package t…
                	</p>
                </article>
			</div>
		</div>
		<div class="col-md-4 column">
			<div class="jumbotron">
				<h3>
					关于论坛（公告）
				</h3>
				<ul class="list-unstyled">
					<li>
						Facilisis in pretium nisl aliquet
					</li>
					<li>
						Nulla volutpat aliquam velit
					</li>
					<li>
						Faucibus porta lacus fringilla vel
					</li>
					<li>
						Aenean sit amet erat nunc
					</li>
					<li>
						Eget porttitor lorem
					</li>
				</ul>
			</div>
			<div class="jumbotron">
				<h3>
					最新热点
				</h3>
				<ul class="list-unstyled">
					<li>
						帖子一
					</li>
					<li>
						帖子二
					</li>
					<li>
						帖子三
					</li>
					<li>
						帖子四
					</li>
					<li>
						帖子五
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
			<div class="row" style="min-height:500px;padding:2em 0;">
				
			    	<p id="p1"></p>
			    	<ul class="pagination" id="pagination1"></ul>
			</div>
		</div>

</div>

<!--footer-->
<footer class="footer">
        <div class="container">
            <p>本站[<a href="http://www.muzhuangnet.com/">BBS论坛</a>
			]的部分内容来源于网络，若侵犯到您的利益，请联系站长删除！谢谢！Powered By [
			<a href="http://www.dtcms.net/" target="_blank" rel="nofollow">DTcms</a>] 
			Version 4.0 &nbsp;<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">闽ICP备00000000号-1</a>
			&nbsp; <a href="http://www.muzhuangnet.com/sitemap.xml" target="_blank" class="sitemap">网站地图</a></p>
        </div>
        <div id="gotop"><a class="gotop"></a></div>
    </footer>
    <script type="text/javascript">
	    
	    $.jqPaginator('#pagination1', {
	        totalPages: 100,
	        visiblePages: 10,
	        currentPage: 1,
	        first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
	        prev: '<li class="prev"><a href="javascript:;">前一页</a></li>',
	        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
    		last: '<li class="last"><a href="javascript:void(0);">尾页</a></li>',
	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
	       
	    });
	</script>

</body>
</html>

