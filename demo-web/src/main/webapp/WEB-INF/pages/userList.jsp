<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<title>用户列表</title>
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
<!-- DataTables -->
<link rel="stylesheet"
	href="plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<script type="text/javascript"></script>
<c:if test="${not empty addBookMsg }">
	<script type="text/javascript">alert("${addBookMsg}");</script>
	<%request.removeAttribute("addBookMsg"); %>
</c:if>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="<%=basePath%>user/index" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>后</b>台</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>管理</b>后台</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">切换导航</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-envelope-o"></i> <span class="label label-success">2</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">2条未读消息</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<img src="dist/img/userzx.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													Support Team <small><i class="fa fa-clock-o"></i> 5
														分钟</small>
												</h4>
												<p>第一条未读消息</p>
										</a>
										</li>
										<!-- end message -->
										<li><a href="#">
												<div class="pull-left">
													<img src="dist/img/user3-128x128.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													AdminLTE Design Team <small><i
														class="fa fa-clock-o"></i> 2 小时</small>
												</h4>
												<p>第二条未读消息</p>
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">查看所有消息</a></li>
							</ul></li>
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-bell-o"></i> <span class="label label-warning">3</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你有3条通知</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												5名新会员加入
										</a></li>
										<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
												很长一段的说明在这里可能不适合 第页，然后可能会导致设计问题
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>你修改了用户名
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">查看所有</a></li>
							</ul></li>
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你有9个任务</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													设计一些按钮 <small class="pull-right">20%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													新增一些好的主题 <small class="pull-right">40%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-green"
														style="width: 40%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">40% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													一些任务我需要去做 <small class="pull-right">60%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-red"
														style="width: 60%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">60% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													让界面切换更加平滑 <small class="pull-right">80%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-yellow"
														style="width: 80%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">80% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">查看所有任务</a></li>
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="dist/img/userzx.jpg" class="user-image" alt="User Image">
								<span class="hidden-xs">${loginUser.nickname}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="dist/img/userzx.jpg"
									class="img-circle" alt="User Image">

									<p>
										${loginUser.nickname} - 系统管理员 <small>注册日期 ${loginUser.createDateStr}</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="row">
										<div class="col-xs-4 text-center">
											<a href="#">粉丝</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">销售额</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">好友</a>
										</div>
									</div> <!-- /.row -->
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">简介</a>
									</div>
									<div class="pull-right">
										<a href="<%=basePath%>user/logout.do"
											class="btn btn-default btn-flat">注销</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/userzx.jpg" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${loginUser.nickname}</p>
						<a href="javascript:void(0);"><i class="fa fa-circle text-success"></i> 在线</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">导航栏</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>仪表盘</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="<%=basePath%>page/index"><i class="fa fa-circle-o"></i>
									信息中心 v1</a></li>
							<li><a href="<%=basePath%>page/index2"><i
									class="fa fa-circle-o"></i> 信息中心 v2</a></li>
						</ul></li>
					<!-- 用户信息管理 -->
					<li class="active treeview"><a href="#"> <i class="fa  fa-users"></i>
							<span>用户管理</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a href="<%=basePath%>page/userList"><i
									class="fa fa-user"></i> 用户列表</a></li>
						</ul></li>
					<!-- 用户信息管理 -->
					<li class="treeview"><a href="#"> <i
							class="fa  fa-book"></i> <span>图书管理</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li class=""><a href="<%=basePath%>page/bookList"><i
									class="fa  fa-book"></i>图书列表</a></li>
						</ul></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					数据表格 <small>用户列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>page/index"><i class="fa fa-dashboard"></i> 主页</a></li>
					<li><a href="<%=basePath%>page/userList">用户管理</a></li>
					<li class="active">用户列表</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">用户列表</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="userTable" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>序号</th>
											<th>用户编号</th>
											<th>用户名</th>
											<th>密码</th>
											<th>昵称</th>
											<th>注册时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<td><a href="javascript:add();">新增用户</a></td>
										</tr>
									</tfoot>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.8
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="http://almsaeedstudio.com">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- 模态框（Modal） -->
		<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<form action="<%=basePath%>user/addUser.do" id="formUser" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="titleUser">新增用户</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="recipient-name" class="control-label">用户名：</label>
								<input type="text" class="form-control" name="username"  id="username"  required="required">
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label" >密码:</label>
								<input class="form-control" name="password" id="password"  required="required"></input>
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label" >昵称:</label>
								<input class="form-control" name="nickname" id="nickname"  required="required"></input>
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label" >状态:</label>
								<select class="form-control" name="status" id="status"  required="required">
									<option value="1">正常</option>
									<option value="-1">禁用</option>
									<option value="-2">异常</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label" id="msg"></label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" disabled="disabled" id="btnUser" class="btn btn-primary">新增</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- page script -->
	<script>
		function del(id){
	    	console.log("删除的ID:"+id);
	    	var result=confirm("确认删除该用户?该操作无法撤销！");
	    	if(result){
	    		var url="<%=basePath%>user/ajax/delUser/"+id;
		    	$.get(url,function(data){
		    		console.info(JSON.stringify(data));
		    		if(data.success==true){
		    			window.location.reload();
		    		}else{
		    			alert("删除失败！");
		    		}
		    	});
	    		console.log("删除");
	    	}else{
	    		console.log("撤销");
	    	}
	    }
	    
		/* 更改既有用户信息  */
	    function update(id,name,password,nickname,status){
	    	console.log("更新的ID:"+id);
	    	var url="<%=basePath%>user/"+id+"/updateUser.do";
	    	$('#formUser').attr("action",url);
	    	$("#titleUser").text("修改用户");
	    	$("#btnUser").val("修改");
	    	$("#msg").text("");
	    	$("#username").val(name).attr("readonly","readonly");
	    	$("#password").val(password);
	    	$("#nickname").val(nickname);
			$("#status").val(status);
	    	$('#addUserModal').modal('show');
	    }
	    
	   <%--  /*检验用户名是否可以被注册*/
		function checkUsername() {
			var username=$("#username").val();
			var eg=/^\w{6,15}$/;
			var msg=$("#msg");
			if(!eg.test(username)){
				$("#btnUser").attr("disabled","disabled");
				msg.text("请输入正确的用户名！").css("color","red").css("font-size","12px");
				return false;
			}
			$.ajax({
				url:'<%=basePath%>user/ajax/checkUsername',
					type : 'get',
					dataType : 'json',
					data : {
						'username' : username
					},
					success : function(data) {
						msg.text(data.msg).css("font-size", "12px");
						if (data.isExsit == true) {
							msg.css("color", "red");
							$("#btnUser").attr("disabled");
						} else {
							msg.css("color", "blue");
							$("#btnUser").removeAttr("disabled");
						}
					},
					error : function(data) {
						alert("error" + data);
					}
				});
			} --%>
	    
	    //新增用户
	    function add() {
	    	var url="<%=basePath%>user/addUser.do";
	    	$('#formUser').attr("action",url);
	    	$("#titleUser").text("新增用户");
	    	$("#btnUser").val("新增");
	    	$("#username").val("").removeAttr("disabled");
	    	$("#password").val("");
	    	$("#nickname").val("");
	    	$('#addUserModal').modal('show');
		}
	$(function() {
	    $.get("<%=basePath%>user/ajax/getUsers", function(data) {
				console.info(JSON.stringify(data));
				var t = $("#userTable").DataTable({
					"language" : { //表格国际化
						"processing" : "处理中...",
						"lengthMenu" : "显示 _MENU_ 项结果",
						"zeroRecords" : "没有匹配结果",
						"info" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
						"infoEmpty" : "显示第 0 至 0 项结果，共 0 项",
						"infoFiltered" : "(由 _MAX_ 项结果过滤)",
						"infoPostFix" : "",
						"search" : "搜索:",
						"searchPlaceholder" : "搜索...",
						"url" : "",
						"emptyTable" : "表中数据为空",
						"loadingRecords" : "载入中...",
						"infoThousands" : ",",
						"paginate" : {
							"first" : "首页",
							"previous" : "上页",
							"next" : "下页",
							"last" : "末页"
						},
						"aria" : {
							paginate : {
								first : '首页',
								previous : '上页',
								next : '下页',
								last : '末页'
							},
							"sortAscending" : ": 以升序排列此列",
							"sortDescending" : ": 以降序排列此列"
						},
						"decimal" : "-",
						"thousands" : "."
					},
					"data" : data,
					"columns" : [ {
						"data" : null
					}, {
						"data" : "userId"
					}, {
						"data" : "username"
					}, {
						"data" : "password"
					}, {
						"data" : "nickname"
					}, {
						"data" : "createDateStr"
					}, {
						"data" : "statusStr"
					}, {
						"data" : null
					} ],
					"columnDefs" : [ {
						"searchable" : false,
						"orderable" : false,
						"targets" : 0
					} ,{
						 //   指定第最后一列
				        "targets": 7,
				        "render": function(data, type, row, meta) {
				        	var result="<a title='删除' class='delete glyphicon glyphicon-remove-sign' href='javascript:del("+data.userId+");' ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        		"&nbsp;&nbsp;&nbsp;<a title='编辑该项' class='edit glyphicon glyphicon-edit' href='javascript:update("+data.userId+",\""+data.username+"\",\""+data.password+"\",\""+data.nickname+"\","+data.status+")' ></a>";
				            return result;
				           /*   */
				        }
					}],
					"order" : [ [ 1, 'asc' ] ]
				});

				//给表格多加一列索引
				t.on('order.dt search.dt', function() {
					t.column(0, {
						search : 'applied',
						order : 'applied'
					}).nodes().each(function(cell, i) {
						cell.innerHTML = i + 1;
					});
				}).draw();
				;
			});
		});
	

	</script>
</body>
</html>