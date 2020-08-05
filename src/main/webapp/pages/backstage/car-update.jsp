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

	<script type="text/javascript">
		function beforeSubmit(form){
			if(form.carname.value===''){
				alert('产品名称不能为空！');
				form.carname.focus();
				return false;
			}
			if(form.price.value===''){
				alert('价格不能为空！');
				form.price.focus();
				return false;
			}
			alert("修改成功！");
			return true;
		}
	</script>

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
				产品管理 <small>产品更新</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/pages/backstage/backstage-main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
						href="${pageContext.request.contextPath}/findCarListByBackstage.do">产品管理</a></li>
				<li class="active">产品更新</li>
			</ol>
		</section>
		<!-- 内容头部 /-->

		<form action="${pageContext.request.contextPath}/updateCarInfoByBackstage.do" method="post" name="form" onSubmit="return beforeSubmit(this);">
			<!-- 正文区域 -->
			<section class="content"> <!--产品信息-->

				<div class="panel panel-default">
					<div class="panel-heading">产品信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">产品编号</div>
						<div class="col-md-4 data">
							<input type="text" disabled class="form-control" value="${carInfo.carid}">
							<input type="hidden" class="form-control" name="carid" value="${carInfo.carid}">
						</div>
						<div class="col-md-2 title">产品名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="carname" value="${carInfo.carname}">
						</div>
						<div class="col-md-2 title">价格￥</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="price" value="${carInfo.price}">
						</div>
						<div class="col-md-2 title">产品描述</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="description" value="${carInfo.description}">
						</div>
						<div class="col-md-2 title">车型</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="carmodelid">
								<c:forEach items="${carmodelList}" var="carmodel">
									<option value="${carmodel.modelid}"<c:if test="${carInfo.modelid == carmodel.modelid}">selected</c:if>>${carmodel.modelname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2 title">品牌</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="brandid">
								<c:forEach items="${brandList}" var="brand">
										<option value="${brand.brandid}" <c:if test="${carInfo.brandid == brand.brandid}">selected</c:if>>${brand.brandname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2 title">产品图片</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="imgurl" value="${carInfo.imgurl}">
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
