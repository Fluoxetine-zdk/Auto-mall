<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>新车网后台管理系统</title>


<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">


	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>



	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/dist/css/AdminLTE.css">

	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/dist/css/skins/_all-skins.min.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
			<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<img src="${pageContext.request.contextPath}/resource/img/center1.jpg"
				width="100%" height="100%" />

		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2020 CTGU<a
					href="#">java ssm 07</a>.
			</strong> All rights reserved.
		</footer>
		<!-- 底部导航 /-->

	</div>

	<!-- jQuery 2.2.3 -->
	<script src="/webjars/adminlte/2.3.11/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/webjars/adminlte/2.3.11/bootstrap/js/bootstrap.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="/webjars/adminlte/2.3.11/plugins/chartjs/Chart.min.js"></script>
	<!-- FastClick -->
	<script src="/webjars/adminlte/2.3.11/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/webjars/adminlte/2.3.11/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/webjars/adminlte/2.3.11/dist/js/demo.js"></script>
	<script  type="text/javascript">
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-index");
		});
	</script>
</body>

</html>
