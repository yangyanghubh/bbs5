<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>BBS论坛</title>
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

		.article .summary{
			font-size: 10px;
			color: #999;
			word-wrap: break-word;
			line-height: 15px;
			cursor: default;
		}

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
							<a href="${pageContext.request.contextPath}/user_main">首页</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<strong class="caret"></strong></a>
							<ul class="dropdown-menu" id="cateList">
							</ul>
						</li>
						<li >
							<a href="${pageContext.request.contextPath}/user_main?jinghua=1">精帖</a>
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
<%--								<li>--%>
<%--									<a href="http://localhost:8080/myArticle" >--%>
<%--										<i class="glyphicon glyphicon-envelope"></i>我的帖子--%>
<%--									</a>--%>
<%--								</li>--%>
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
	<div class="row clearfix">
		<!-- 左侧文章列表 -->
<%--		<input type="button"value="获取文章列表"id="btn">--%>
<%--		<table>--%>
<%--		<script>--%>
<%--			$(function(){--%>
<%--				$("btn").onclick(function () {--%>
<%--					$.post("${pageContext.request.contextPath}/getArticle/getArticles",function (data) {--%>
<%--						console.log(data);--%>
<%--						var html="";--%>
<%--						for(var i=0;i<data.lengt;i++){--%>
<%--							html+="<tr>"+--%>
<%--									"<td>"+data[i].title+"</td>"+--%>
<%--									"<td"+data[i].content+"</td>"+--%>
<%--									"</tr>"--%>
<%--						}--%>
<%--					})--%>
<%--				})--%>
<%--			})--%>
<%--		</script>--%>
<%--		</table>--%>
		<div class="col-md-8 column">
			<div class="content-article" id="list">


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
						<a title="博客下一版本更新意见征集" href="http://www.muzhuangnet.com/show/662.html" draggable="false">
		                        <span class="thumbnail">
		                            <img class="thumb" data-original="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg" src="http://www.muzhuangnet.com/upload/201610/18/201610181739277776.jpg"  alt="博客下一版本更新意见征集" draggable="false">
		                        </span>
							<span class="text">博客下一版本更新意见征集</span><br>
							<span class="muted">
		                            <i class="glyphicon glyphicon-time"></i>
		                                2018-11-02
		                        </span>
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
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container pagination-list">
		<div class="row" style="min-height:150px;padding:2em 0; margin-left: 40px;">
			<p id="p1"></p>
			<ul class="pagination" id="pagination1"></ul>
		</div>
	</div>
</div>

<!--footer-->
<footer class="footer" style="margin-top: 50px;">
	<div class="container">
		<p class="text-center">本站[<a href="http://www.muzhuangnet.com/">BBS论坛</a>
			]的部分内容来源于网络，若侵犯到您的利益，请联系站长,本站将在第一时间内进行处理！谢谢！
		</p>
	</div>
</footer>
<!-- 分页 -->
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

<!-- 修改密码模态框 -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">修改密码</h4>
			</div>
			<form action="/resetPassword/reset" class="form-horizontal" method="post">
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
							<input class="form-control"name="newPassword" type="password">
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
<script type="application/javascript">
	$(function () {
		if(getQueryVariable("jinghua")!=null && getQueryVariable("jinghua")==1) {
			getJinghuaList();
		}else{
			getArticleList();
		}

		getCateList();
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
	function getJinghuaList() {
		// 发送请求
		var formData = new FormData();
		$.ajax({
			url: "${pageContext.request.contextPath}/article/getListTop",
			type: 'post',
			data: formData,
			processData: false,
			contentType: false,

			success: function(res) {
				$("#list").html("");
				var flag = 0;
				if (res.code == 1) {
					console.log(res);
					$.each(res.data, function(index, obj) {
						List.add(obj.title, obj.id, obj.name, obj.time, obj.summary,obj.comment,obj.cateId,obj.isTop);
					})


				} else {
					alert("获取信息列表失败请刷新页面");
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("获取信息列表失败请刷新页面");
			}

		})
	}

	function getArticleList() {
		// 发送请求
		var formData = new FormData();
		if(getQueryVariable("cateId")!=null && getQueryVariable("cateId")) {
			//window.history.pushState(null, '', "${pageContext.request.contextPath}/user_main")

			formData.append("cateId", getQueryVariable("cateId"));
		}

		$.ajax({
			url: "${pageContext.request.contextPath}/article/getList",
			type: 'post',
			data: formData,
			processData: false,
			contentType: false,

			success: function(res) {
				$("#list").html("");
				var flag = 0;
				if (res.code == 1) {
					console.log(res);
					$.each(res.data, function(index, obj) {
						List.add(obj.title, obj.id, obj.name, obj.time, obj.summary,obj.comment,obj.cateId,obj.isTop);
					})


				} else {
					alert("获取信息列表失败请刷新页面");
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("获取信息列表失败请刷新页面");
			}

		})
	}

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
				add: function(title, id, name, time, summary,comment,cateId,isTop) {
					summary = summary == null ? '' : summary;
					$('#list').append(`<article class="thumbnail article" `+(isTop==1?`style="background-color:#b4c8ff"`:``)+`>
			<a class="focus" href="#" title="`+ title+` " target="_blank" draggable="false">
			<img class="thumb" src="http://www.muzhuangnet.com/upload/201706/26/201706261417213246.jpg" alt=" " draggable="false">
			</a>
			<header>
			<a class="badges" href="${pageContext.request.contextPath}/user_main?cateId=`+cateId+`" title="`+name+`" draggable="false">`+name+`<i></i></a>
	<h2>
	<a href="${pageContext.request.contextPath}/article?id=`+id+`" title="`+title+`" target="_blank" draggable="false">
			`+title+`
	</a>
	</h2>
	</header>
	<p class="meta">
			<time class="time" >
			<i class="glyphicon glyphicon-time"></i>
	`+time+`
	</time>
	<span class="comment">
			<i class="glyphicon glyphicon-comment"></i>
	`+comment+`
	</span>
	</p>
	<p class="summary">
			`+summary+`
	</p>
	</article>`);

				},
		cateAdd: function(id, name) {
			$('#cateList').append(`<li>
				<a href="${pageContext.request.contextPath}/user_main?cateId=`+id+`">`+name+`</a>
		</li>
		<li class="divider">
		</li>`);

		}


			}


</script>
</html>


