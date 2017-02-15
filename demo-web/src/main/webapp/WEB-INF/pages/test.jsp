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
	<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="plugins/datatables/jquery.dataTables.css">
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>图书列表</title>
  <!-- DataTables -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>


</head>
<body>
	<p><a href="javascript:showTable();">加载表格数据</a></p>
	<table id="dt"></table>
<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
	function showTable() {
		var url="<%=basePath%>book/ajax/getBooks";
		console.log(url);
		$.get(url,function(data){
			  console.info(JSON.stringify(data));
			$("#dt").DataTable({
				"ajax": data,
				"columns": [
		            { "data": "bookId" },
		            { "data": "name" },
		            { "data": "number" }
		        ]
			});
		  
		}); 
		
	}
</script>
</body>
</html>