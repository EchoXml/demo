<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>resources/adminlte/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户注册</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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
<body class="hold-transition register-page"
	style="background: url('../js/bg_login.jpg') no-repeat; background-size: cover;">
	<div class="register-box">
		<div class="register-logo">
			<a href="javascript:void(0);"><b style="font-size: 18px;">图书管理系统</b></a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">会员注册</p>

			<form action="<%=basePath%>user/register.do" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="nickname" class="form-control"
						placeholder="昵称"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="username" class="form-control"
						placeholder="用户名" onblur="checkUsername();"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control"
						placeholder="密码"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="repassword" class="form-control" onblur="checkPassword();"
						placeholder="确认密码" > <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="row" id="msg" style="text-align: center"><font size="1" color="red">${requestScope.msg }</font></div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck" >
							<label> <input type="checkbox" id="agree" /> 我同意 <a href="javascript:void(0);">《用户注册条款》</a>
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button id="btnRegister" type="submit" onclick="doRegister();" disabled=false
							class="btn btn-primary btn-block btn-flat">注册</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<div class="social-auth-links text-center">
				<p>- OR -</p>
				<a href="javascript:rgByQQ();" class="btn btn-block btn-social btn-facebook btn-flat"><i
					class="fa fa-qq"></i>使用QQ注册</a> <a href="javascript:rgByWeibo();"
					class="btn btn-block btn-social btn-google btn-flat"><i
					class="fa fa-weibo"></i>使用微博注册</a>
			</div>

			<a href="<%=basePath%>page/login" class="text-center">我已有账号 </a>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

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
    
    $("#agree").on('ifToggled', function(event){
    	enAbleBtn();
    });
  });
  
  /*检验数据格式是否正确  */
	function doRegister(){
		if(!enAbleBtn()){
			return false;
		}
		$("form").submit();
		
	} 
  	//激活注册按钮
  	function  enAbleBtn() {
  		var username=$("input[name='username']").val();
		var password=$("input[name='password']").val();
		var nickname=$("input[name='nickname']").val();
		var isAgree=document.getElementById("agree").checked;
		var eg=/^\w{6,15}$/;
		var msg=$("#msg");
		var btn=$("#btnRegister");
		if(!eg.test(username)){
			msg.text("请输入正确格式的用户名！").css("color","red").css("font-size","12px");
			btn.attr("disabled");
			return false;
		}
		if(password.length<6){
			msg.text("请输入长度不小于6位的密码！").css("color","red").css("font-size","12px");
			btn.attr("disabled");
			return false;
		}
		if(!checkPassword()){
			btn.attr("disabled");
			return false;
		}
		
		if(undefined==btn.attr("disabled")){
			btn.attr("disabled","disabled");
			return false;
		}else{
			if(isAgree==true){
				btn.removeAttr("disabled");
				return true;
			}else{
				btn.attr("disabled","disabled");
				return false;
			}
		}
		
	
		
	}
  
  	//检验两次输入密码是否一致
	function checkPassword() {
		var password=$("input[name='password']").val();
		var repassword=$("input[name='repassword']").val();
		if (password==repassword) {
			$("#msg").text("");
			return true;
		}
		$("#msg").text("两次密码输入不一致！").css("color","red").css("font-size","12px");
		return false;
	}
	
	/*检验用户名是否可以被注册*/
	function checkUsername() {
		var username=$("input[name='username']").val();
		var eg=/^\w{6,15}$/;
		var msg=$("#msg");
		if(!eg.test(username)){
			msg.text("请输入正确的用户名！").css("color","red").css("font-size","12px");
			return false;
		}
		$.ajax({
			url:'<%=basePath%>user/ajax/checkUsername',
				type : 'get',
				dataType : 'json',
				async: false ,
				data : {
					'username' : username
				},
				success : function(data) {
					//var jsonObj=$.parseJSON(data);
					msg.text(data.msg).css("font-size", "12px");
					console.info(JSON.stringify(data));
					console.info("isExsit:" + data.isExsit);
					if (data.isExsit == true) {
						msg.css("color", "red");
						return false;
					} else {
						msg.css("color", "blue");
						return true;
					}
				},
				error : function(data) {
					msg.text("服务器异常！").css("font-size", "12px");
					return false;
				}
			});
		}
	</script>
</body>
</html>
