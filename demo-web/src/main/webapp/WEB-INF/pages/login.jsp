<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>resources/adminlte/">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta property="wb:webmaster" content="25ae4f63da6882ff" />
  <title>杂类管理系统--登录</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page"  style="background: url('../js/bg_login.jpg') no-repeat;background-size: cover;">
<div class="login-box">
  <div class="login-logo">
    <a href="javascript:void(0);"><b style="font-size: 18px;">管理系统</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">登录以启动会话</p>

	<form action="<%=basePath%>user/login.do" method="post">
      <div class="form-group has-feedback">
        <input  name="username"  class="form-control" placeholder="电子邮件" required="required">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="密码" required="required">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row" style="text-align: center"><font color="red" size="1px">${requestScope.msg }</font></div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 记住我
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-qq"></i>QQ登录</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-weibo"></i>微博登录</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">忘记密码</a><br>
    <a href="<%=basePath%>page/register" class="text-center">注册成为会员</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
  
<%--   function doLogin(){
		var username=$("input[name='username']").val();
		var password=$("input[name='password']").val();
		var msg=$("#msg");
		if (username==""||password=="") {
			msg.text("用户名与密码不能为空！");
			return false;
		}
		$.ajax({
			url:'<%=basePath%>user/ajax/login.do',
			type:'post',
			dataType:'text',
			data:{
				'username':username,
				'password':password,
			},
			success:function(data){
				//console.info(JSON.stringify(data));
				msg.css("font-size","12px");
			    if(data=="true"){
					location.href="<%=basePath%>page/index";
				}else{
					msg.text("*用户名与密码不匹配").css("color","red");
				}
			},
			error:function(data){
				alert("error"+data);	
			}
		});
	} --%>
</script>
</body>
</html>
