<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
  <head>
    <title>BBS论坛-登录页面</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
	<script src="../../bootstrap/jquery/jquery.min.js"></script>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
	 		background: #fff url(../../images/background-image.jpg) 50% 0 no-repeat;}
			.margin-top-10{
				margin-top: 10px;
			}
			.div-signin {
			  width: 450px;
			  padding: 15px;
			  margin: 0 auto;
			}
			.div-shadow{
				box-shadow:0 -10px 30px #ccc;
				margin-top: 15%;
			}
			.div-signin h3{
				text-align: center;
				margin-top: 5px;
				margin-bottom: 5px;
			}
			.div-signin span{
				display:block;
				text-align: center;
				font-style: italic;
			}
			.foot-css{
				height: 20%;
			}
			.foot-css p{
				text-align: center;
				line-height: 50px;
				font-size: 18px;
				color: white;
			}
	</style>
  </head>
  <body>
  	<!-- 使用自定义css样式 div-signin 完成元素居中-->
    <div class="container div-signin">
      <div class="panel panel-success div-shadow">
      	<!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
	    <div class="panel-heading">
	    	<h3>请注册您的账号</h3>
	    	<span>Welcome to BBS</span>
	    </div>
	    <div class="panel-body">
	      <!-- register form start -->
			${sessionScope.msg2}
	      <form action="http://localhost:8080/userRegister/saveUser" class="form-horizontal" method="post">
		    <div class="form-group">
		       <label class="col-sm-3 control-label">用户名：</label>
		       <div class="col-sm-9">
		         <input class="form-control" name="username" type="text" placeholder="请输入用户名" id="name">
		       </div>
		    </div>
		    <div class="form-group">
		       <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		       <div class="col-sm-9">
		         <input class="form-control" name="password"type="password" placeholder="请输入密码" id="password">
		       </div>
		    </div>
		    <div class="form-group">
		       <label class="col-sm-3 control-label">重复密码：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="password" placeholder="请输入密码" id="repassword">
		       </div>
		    </div>
		    <div class="form-group">
		       <label class="col-sm-3 control-label">联系电话：</label>
		       <div class="col-sm-9">
		         <input class="form-control" name="tel"type="text" id="tel" placeholder="请输入联系电话">
		       </div>
		    </div><div class="form-group">
		       <label class="col-sm-3 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
		       <div class="col-sm-9">
		         <input class="form-control" name="email"type="text" id="email" placeholder="请输入邮箱">
		       </div>
		    </div>
		    <div class="form-group">
		       <label class="col-sm-3 control-label">工作性质：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="text" id="nature" placeholder="请输入工作性质">
		       </div>
		    </div>
		    <div class="form-group">
		       <label class="col-sm-3 control-label">工作地点：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="text" id="position" placeholder="请输入工作地点">
		       </div>
		    </div>
		    <div class="form-group">
		       <div class="col-sm-3">
		       </div>
		       <div class="col-sm-9 padding-left-0">
		       	 <div class="col-sm-6">
			         <button type="submit" class="btn btn-success btn-block">注&nbsp;&nbsp;册</button>
		       	 </div>
		       	 <div class="col-sm-6">
			         <button type="reset" class="btn btn-success btn-block">重&nbsp;&nbsp;置</button>
		       	 </div>
		       </div>
		    </div>
	      </form>
	      <!-- register form end -->
	    </div>
	  </div>
    </div>
    <!-- 页尾 版权声明 -->
    <div class="container">
		<div class="col-sm-12 foot-css">
		        <p class="text-muted credit">
		            公安部备案号：赣公网安备110号
		        </p>
	    </div>
    </div>
  
  </body>
</html>