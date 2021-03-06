<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>resources/adminlte/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>预约记录列表</title>
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
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="<%=basePath%>page/index" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
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
								class="fa fa-envelope-o"></i> <span class="label label-success">1</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">1条未读消息</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<img src="../${sessionScope.currUser.headPath}" class="img-circle"
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
									</ul>
								</li>
								<li class="footer"><a href="#">查看所有消息</a></li>
							</ul></li>
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-bell-o"></i> <span class="label label-warning">2</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你有2条通知</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												5名新会员加入
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
								class="fa fa-flag-o"></i> <span class="label label-danger">3</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你有3个任务</li>
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
									</ul>
								</li>
								<li class="footer"><a href="#">查看所有任务</a></li>
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="../${sessionScope.currUser.headPath}" class="user-image" alt="User Image">
								<span class="hidden-xs"><shiro:principal /> </span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="../${sessionScope.currUser.headPath}"
									class="img-circle" alt="User Image">

									<p>
										<shiro:principal />
										- 系统管理员 <small>注册日期 ${sessionScope.currUser.createDateStr }</small>
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
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="../${sessionScope.currUser.headPath}" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
							<shiro:principal />
						</p>
						<a href="javascript:void(0);"><i
							class="fa fa-circle text-success"></i> 在线</a>
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
							<li><a href="<%=basePath%>page/index"><i
									class="fa fa-circle-o"></i> 信息中心 v1</a></li>
							<li><a href="<%=basePath%>page/index2"><i
									class="fa fa-circle-o"></i> 信息中心 v2</a></li>
						</ul></li>
					<!-- 用户信息管理 -->
					<shiro:hasPermission name="user:select">
					<li class="treeview"><a href="#"> <i
							class="fa  fa-users"></i> <span>用户管理</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li class=""><a href="<%=basePath%>page/userlist"><i
									class="fa fa-user"></i> 用户列表</a></li>
						</ul></li>
						</shiro:hasPermission>
						 <!-- 系统管理 -->
						<shiro:hasAnyRoles name="admin,superadmin">
					        <li class=" treeview">
					          <a href="#">
					            <i class="fa   fa-send"></i> <span>系统管理</span>
					            <span class="pull-right-container">
					              <i class="fa fa-angle-left pull-right"></i>
					            </span>
					          </a>
					          <ul class="treeview-menu">
					            <li class=""><a href="<%=basePath%>page/sqllist"><i class="fa  fa-database"></i> SQL监控</a></li>
					          </ul>
								<ul class="treeview-menu">
									<li class=""><a href="<%=basePath%>page/visitlist"><i class="fa  fa-user-secret"></i> 访客信息</a></li>
								</ul>
					          </li>
						</shiro:hasAnyRoles>
					<!-- 图书信息管理 -->
					<shiro:hasPermission name="book:select">
						<li class="active treeview">
						<a href="#">
						 		<i class="fa  fa-book"></i>
								<span>图书管理</span> 
								<span class="pull-right-container"> 
									<i class="fa fa-angle-left pull-right"></i>
								</span>
						</a>
							<ul class="treeview-menu">
								<li class="">
									<a href="<%=basePath%>page/booklist">
										<i	class="fa  fa-book"></i>
										图书列表
									</a>
								</li>
							</ul>
							<ul class="treeview-menu">
					            <li class="active">
					            	<a href="<%=basePath%>page/appointmentlist">
					            		<i class="fa   fa-hand-grab-o"></i>
					            		预约记录
					            	</a>
					            </li>
					         </ul>
						</li>
						  
					</shiro:hasPermission>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					数据表格 <small>预约记录</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>page/index"><i
							class="fa fa-dashboard"></i> 主页</a></li>
					<li><a href="<%=basePath%>page/appointlist">预约管理</a></li>
					<li class="active">预约列表</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">预约列表 <button onclick="exportExcel();" class="btn-sm info">导出Excel</button></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="userTable" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>预约编号</th>
											<th>书号</th>
											<th>书名</th>
											<th>预约用户</th>
											<th>昵称</th>
											<th>预约时间</th>
											<th>状态</th>
											<th>归还时间</th>
											<th>操作</th>
										</tr>
									</thead>
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
		var dataInfo="";
		function del(appointmentId){
	    		var url="<%=basePath%>appointment/ajax/del";
		    	$.post(url, {
		    	    'appointmentId':appointmentId
		    	  },function(data){
		    		console.info(JSON.stringify(data));
		    		if(data.success==true){
		    			window.location.reload();
		    		}else{
		    			alert("删除失败！");
		    		}
		    	});
	    }
		
		//归还图书
		function returnBook(appointmentId,appointTime){
    		var url="<%=basePath%>appointment/ajax/returnBook";
	    	$.post(url, {
	    	    'appointmentId':appointmentId,
	    	    'appointTime':appointTime
	    	  },function(data){
	    		console.info(JSON.stringify(data));
	    		if(data.success==true){
	    			window.location.reload();
	    		}else{
	    			alert("还书失败！");
	    		}
	    	});
	   }
	    
	    
	$(function() {
	    $.get("<%=basePath%>book/ajax/getAppointments", function(data) {
				console.info(JSON.stringify(data));
				dataInfo=JSON.stringify(data);
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
						"emptyTable" : "您未曾预约过任何图书，赶紧预约吧。",
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
						"data" : "appointmentId"
					}, {
						"data" : "bookId"
					}, {
						"data" : "book.name"
					}, {
						"data" : "userInfo.username"
					}, {
						"data" : "userInfo.nickname"
					}, {
						"data" : null
					}, {
						"data" : null
					} , {
						"data" : null
					} , {
						"data" : null
					} ],
					"columnDefs" : [ {
						"searchable" : false,
						"orderable" : false,
						"targets" : 0
					} ,{
						"searchable" : false,
						"orderable" : false,
						"targets" : 8
					} ,{
						 //   指定第最后一列
						"search" : 'applied',
						"order" : 'applied',
				        "targets": 8,
				        "render": function(data, type, row, meta) {
				        	var rtn=(data.state==1?"<a title='归还' class='glyphicon glyphicon-hand-left' href='javascript:returnBook("+data.appointmentId+","+data.appointTime+");'></a>":"");
				        	//console.log(rtn);
				        	var result="<shiro:hasPermission name='appoint:del'><a title='删除' class='delete glyphicon glyphicon-remove-sign' href='javascript:del("+data.appointmentId+");' ></a></shiro:hasPermission>"
				        			+"<shiro:hasPermission name='book:appoint'>"+rtn+"</shiro:hasPermission>";
				            return result;
				           /*   */
				        }
					},
			        	{
						 //   指定第预约时间列
				        "targets": 5,
				        "render": function(data, type, row, meta) {
				        	var result=getMyDate(data.appointTime);
				            return result;
				           /*   */
				        }
					},{
						 //   指定状态列
				        "targets": 6,
				        "render": function(data, type, row, meta) {
				        	
				        	var result=data.state==1?"未归还":"已归还";
				            return result;
				           /*   */
				        }
					},{
						 //   指定归还时间列
				        "targets": 7,
				        "render": function(data, type, row, meta) {
				        	var result=getMyDate(data.returnTime);
				            return result;
				           /*   */
				        }
					}],
					"order" : [ [ 1, 'asc' ] ]
				});

			});
		});
	
	//获得年月日      得到日期oTime  
    function getMyDate(str){  
		if(str==null) return null;
        var oDate = new Date(str),  
        oYear = oDate.getFullYear(),  
        oMonth = oDate.getMonth()+1,  
        oDay = oDate.getDate(),  
        oHour = oDate.getHours(),  
        oMin = oDate.getMinutes(),  
        oSen = oDate.getSeconds(),  
        oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
        return oTime;  
    };  
    //补0操作  
    function getzf(num){  
        if(parseInt(num) < 10){  
            num = '0'+num;  
        }  
        return num;  
    }

    function  exportExcel() {
		var url="<%=basePath%>appointment/export";
        location.href=url;
	}
	</script>
</body>
</html>
