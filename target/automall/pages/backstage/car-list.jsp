<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>新车网后台管理 | 产品信息</title>


<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script>
		function deleteCarInfo(id) {
			//安全提示
			if (confirm("您确定要删除该条信息吗？")){
				location.href = "${pageContext.request.contextPath}/deleteCarInfoByCarId.do?carid="+id;
			}
		}
	</script>


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
		<!-- @@master = admin-layout.html-->
		<!-- @@block = content -->

		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					产品管理 <small>数据列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/pages/backstage/backstage-main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a >产品管理</a></li>
					<li class="active">数据列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建"
											onclick="location.href='${pageContext.request.contextPath}/toAddCarInfoPage.do'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										<button type="button" class="btn btn-default" title="删除">
											<i class="fa fa-trash-o"></i> 删除
										</button>
										<button type="button" class="btn btn-default" title="刷新"
												onclick="location.href='${pageContext.request.contextPath}/findCarListByBackstage.do'">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right form-group form-inline">
								<form action="${pageContext.request.contextPath}/searchMessInBackstage.do" method="post">
									<div class="has-feedback">
										<input type="text" class="form-control input-sm" placeholder="搜索" name="keyword">
										<input type="hidden" name="page" value="1">
										<input type="hidden" name="size" value="5">
										<button type="submit" class="btn btn-default">提交</button>
									</div>
								</form>

							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px;"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">产品名称</th>
<%--										<th class="sorting_asc sorting_asc_disabled">信息描述</th>--%>
										<th class="sorting_desc">价格</th>
<%--										<th class="sorting_desc sorting_desc_disabled">发布日期</th>--%>
										<th class="sorting">车型</th>
										<th class="text-center sorting">品牌</th>
<%--										<th class="text-center sorting">状态</th>--%>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>


									<c:forEach items="${pageInfo.list}" var="car">

										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>${car.carid}</td>
											<td>${car.carname}</td>
											<td>￥${car.price}</td>

											<c:forEach items="${carmodelList}" var="carmodel">
												<c:if test="${car.modelid == carmodel.modelid}">
													<td>${carmodel.modelname}</td>
												</c:if>
											</c:forEach>

											<c:forEach items="${brandList}" var="brand">
												<c:if test="${car.brandid == brand.brandid}">
													<td>${brand.brandname}</td>
												</c:if>
											</c:forEach>



											<td class="text-center">
												<a href="${pageContext.request.contextPath}/backstageFindCarById.do?carid=${car.carid}" class="btn bg-olive btn-xs">编辑</a>
												<a href="javascript:deleteCarInfo(${car.carid})" class="btn bg-olive btn-xs">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页
								<select class="form-control" id="changePageSize" onchange="changePageSize()">
									<c:forEach begin="1" end="8" var="i">
										<option <c:if test="${pageInfo.pageSize == i}">selected</c:if>>${i}</option>
									</c:forEach>
								</select> 条，当前第${pageInfo.pageNum}页。
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul class="pagination">
								<li><a href="${pageContext.request.contextPath}/findCarListByBackstage.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/findCarListByBackstage.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/findCarListByBackstage.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/findCarListByBackstage.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/findCarListByBackstage.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>

			</section>
			<!-- 正文区域 /-->

		</div>
		<!-- @@close -->
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
		function changePageSize(){
			var pageSize = $("#changePageSize").val();
			location.href = "${pageContext.request.contextPath}/findCarListByBackstage.do?page=1&size="+pageSize;

		}

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
			setSidebarActive("admin-datalist");

			// 列表按钮
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>

</html>
