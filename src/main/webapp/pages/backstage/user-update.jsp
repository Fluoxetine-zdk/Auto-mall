<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>新车网后台管理 | 用户修改</title>


<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">


	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/dist/css/AdminLTE.css">

	<link rel="stylesheet" href="/webjars/adminlte/2.3.11/dist/css/skins/_all-skins.min.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

	<link rel="stylesheet" href="../../resource/css/style.css">

	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>用户更新</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/pages/backstage/backstage-main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/findUserList.do">用户管理</a></li>
				<li class="active">用户更新</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form action="${pageContext.request.contextPath}/backstageUpdateUser.do" method="post">
				<!-- 正文区域 -->
				<section class="content"> <!--产品信息-->

				<div class="panel panel-default">
					<div class="panel-heading">用户信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">用户账号</div>
						<div class="col-md-4 data">
							<input type="text" disabled class="form-control" value="${user.username}">
							<input type="hidden" class="form-control" name="username" value="${user.username}">
						</div>
						<div class="col-md-2 title">密码</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="password" value="${user.password}">
						</div>
						<div class="col-md-2 title">性别</div>
						<div class="col-md-4 data">
								<label><input type="radio" name="sex" value="男" <c:if test="${user.sex.equals('男')}">checked</c:if>>男</label>
								<label><input type="radio" name="sex" value="女" <c:if test="${user.sex.equals('女')}">checked</c:if>>女</label>
						</div>
						<div class="col-md-2 title">联系电话</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="phone"
								placeholder="联系电话" value="${user.phone}">
						</div>
						<div class="col-md-2 title">邮箱</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="email" value="${user.email}">
						</div>
						<div class="col-md-2 title">用户状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="status">
								<c:if test="${user.status == 0}">
									<option value="0" >禁用</option>
									<option value="1">可用</option>
								</c:if>
								<c:if test="${user.status == 1}">
									<option value="1">可用</option>
									<option value="0" >禁用</option>
								</c:if>
							</select>
						</div>

						<div class="col-md-2 title">权限</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="classno">
								<c:if test="${user.classno == 0}">
									<option value="0">普通用户</option>
									<option value="1">VIP用户</option>
								</c:if>
								<c:if test="${user.classno == 1}">
									<option value="1">管理员</option>
									<option value="0">VIP用户</option>
								</c:if>
							</select>
						</div>

					</div>
				</div>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
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

	<script>
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
	</script>


</body>

</html>
