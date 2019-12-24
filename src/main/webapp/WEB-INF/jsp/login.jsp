<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head >
    <title>BBS论坛-后台管理系统</title>
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
  <body onload="isLogin_Error()">
  	<!-- 使用自定义css样式 div-signin 完成元素居中-->
    <div class="container div-signin">
      <div class="panel panel-success div-shadow">
      	<!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
	    <div class="panel-heading">
	    	<h3>BBS论坛后台管理系统</h3>
	    	<span>BBS Manager System</span>
	    </div>
	    <div class="panel-body">
	      <!-- login form start -->
	      <form action="http://localhost:8080/login/admincheck" class="form-horizontal" method="post">
		     <div class="form-group">
		       <label class="col-sm-3 control-label">用户名：</label>
		       <div class="col-sm-9">
                   <label>
                       <input class="form-control" type="text" name="user" placeholder="请输入用户名">
                   </label>
               </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="password" name="password" placeholder="请输入密码">
		       </div>
		    </div>
              <div class="form-group">
                  <label class="col-sm-3 control-label">验证码：</label>
                  <div class="col-sm-4">
                      <input class="form-control" type="text" placeholder="验证码" name="key">
                  </div>
                  <div class="col-lg-5">
                      <img id="imgObj" alt="验证码" src="http://localhost:8080/code/getCode">
                      <a onclick="changeImg()">换一张</a>
                  </div>
              </div>

              <div class="form-group">
		       <div class="col-sm-3">
		       </div>
		       <div class="col-sm-9 padding-left-0">

		       	 <div class="col-sm-4">
			         <button type="submit" class="btn btn-success btn-block">登&nbsp;&nbsp;陆</button>
		       	 </div>
		       	 <div class="col-sm-4">
			         <button type="reset" class="btn btn-success btn-block">重&nbsp;&nbsp;置</button>
		       	 </div>
		       	 <div class="col-sm-4">
			         <button type="button" class="btn btn-link btn-block">忘记密码？</button>
		       	 </div>
		       </div>
		    </div>
	      </form>
	      <!-- login form end -->
	    </div>
	  </div>
    </div>
    <%--登录错误提示的模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            登录失败
                        </h4>
                </div>
                <div class="modal-body" >
                    <h3 id="login_fault_message"></h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭
                        </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
<script>
    function isLogin_Error() {
        var mess="${message}";
        if (mess!=""){
            $(function () { $('#myModal').on('show.bs.modal', function () {
                var modal = $(this);
                //此处即为修改modal的内容
                modal.find('.modal-body').text(mess)
            }) });
            $("#myModal").modal("show");
        }
    }


    function changeImg() {
        $("#code").val("");
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 34);//34是src的长度
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>