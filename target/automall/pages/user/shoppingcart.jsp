<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>购物车</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/shoppingcartstyle.css" />

	<script type="text/javascript">
		function deleteShoppingCartById(id) {
			//安全提示
			if (confirm("您确定要删除该产品吗吗？")){
				location.href = "${pageContext.request.contextPath}/deleteShoppingCartById.do?shoppingcartid="+id+"&username="+"${sessionScope.username}";
			}
		}
	</script>
</head>


<body>
	<!--导航开始-->
	  <nav class="navbar navbar-inverse">
	      <div class="container-fluid">
	          <div class="navbar-header">
	              <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/user/index.jsp">首页</a>
	          </div>
	          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	              <ul class="nav navbar-nav navbar-right">
					  <li><a href="#">${sessionScope.username}</a></li>
					  <li><a href="${pageContext.request.contextPath}/findUserMessage.do?username=${sessionScope.username}">个人中心</a></li>
					  <li><a href="${pageContext.request.contextPath}/findShoppingCartByUsername.do?username=${sessionScope.username}">购物车</a></li>
					  <li><a href="${pageContext.request.contextPath}/userLogout.do">注销</a></li>
	              </ul>
	              <form class="navbar-form navbar-right" action="#" method="post">
	                  <div class="form-group">
	                      <input type="text" class="form-control" placeholder="Search" name="keyword">
	                      <input type="hidden" name="page" value="1">
	                      <input type="hidden" name="size" value="5">
	                  </div>
	                  <button type="submit" class="btn btn-default" style="height: 34px">
	                      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	                  </button>
	              </form>
	          </div>
	      </div>
	  </nav>


	<!--导航结束-->
	<h3 style="font-weight: bold;margin-left: 40px;padding-top: 15px;">我的购物车</h3>
	<color-line></color-line>
<div class="shopping-car-container">
	<div class="car-headers-menu">
		<div class="row">
			<div class="col-md-1 car-menu">
<%--				<label><input type="checkbox" id="check-goods-all" /><span id="checkAll">全选</span></label>--%>
			</div>
			<div class="col-md-2 car-menu">商品信息</div>
			<div class="col-md-2 car-menu">商品参数</div>
			<div class="col-md-2 car-menu">单价</div>
			<div class="col-md-2 car-menu">数量</div>
			<div class="col-md-2 car-menu">小计</div>
			<div class="col-md-1 car-menu">操作</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/insertOrder.do" method="post" id="orderForm">
		<input type="hidden" value="${sessionScope.username}" name="username">
	<div class="goods-content">
		<div class="goods-item">
			<div class="panel panel-default">
				<c:forEach items="${shoppingcartList}" var="shoppingcart" varStatus="status">
					<input type="hidden" value="${shoppingcart.shoppingcartid}" name="shoppingcartid">
					<div class="panel-body">
						<div class="col-md-1 car-goods-info">
							<label>
<%--								<input type="checkbox" class="goods-list-item" name="">--%>
							</label>
						</div>
<%--						商品图片--%>
						<div class="col-md-2 car-goods-info goods-image-column">
							<img class="goods-image" src="
							<c:forEach items="${carInfoList}" var="carInfo">
								<c:if test="${carInfo.carid == shoppingcart.carid}">
									<c:if test="${not empty carInfo.imgurl && fn:contains(carInfo.imgurl, 'http') == false}">
										${pageContext.request.contextPath}/resource/upload/${carInfo.imgurl}
									</c:if>
									<c:if test="${empty carInfo.imgurl}">
										${pageContext.request.contextPath}/resource/img/failed.png
									</c:if>
									<c:if test="${fn:contains(carInfo.imgurl, 'http')==true}">
										${carInfo.imgurl}
									</c:if>
								</c:if>
							</c:forEach>
						" style="width: 200px; height: 150px;">
						</div>

<%--						商品描述--%>
						<div class="col-md-2 car-goods-info goods-params">
							<c:forEach items="${carInfoList}" var="carInfo">
								<c:if test="${carInfo.carid == shoppingcart.carid}">
									${carInfo.carname}&nbsp;&nbsp;&nbsp;${carInfo.description}
								</c:if>
							</c:forEach>
						</div>

<%--						商品价格--%>
						<div class="col-md-2 car-goods-info goods-price">
							<span>￥</span><span class="single-price">
								${shoppingcart.price}
								<input type="hidden" name="price" value="${shoppingcart.price}">
							</span>
						</div>

<%--						商品数量--%>
						<div class="col-md-2 car-goods-info goods-counts">
							<div class="input-group"><div class="input-group-btn">
								<input type="button" class="btn btn-default car-decrease" value="-"  onclick="minus(${status.index});"/>
							</div>
								<input type="text" class="form-control goods-count" name="number"  value="${shoppingcart.number}">
								<div class="input-group-btn">
									<input type="button" class="btn btn-default car-add" value="+"  onclick="plus(${status.index});"/>
								</div>
							</div>
						</div>

<%--						价格小计--%>
						<div class="col-md-2 car-goods-info goods-money-count">
							<span>￥</span><span class="single-total">
							<li style="list-style: none" id="price${status.index}"  class="prione">${shoppingcart.price*shoppingcart.number}</li>
							</span>
						</div>

						<div class="col-md-1 car-goods-info goods-operate">
							<a href="javascript:deleteShoppingCartById(${shoppingcart.shoppingcartid})" style="border-radius: 3px;box-shadow: none;border: 1px solid transparent;background-color: #d9534f;color: #fff;;">删除</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
	<div class="panel panel-default">
		<div class="panel-body bottom-menu-include">
			<div class="col-md-1 check-all-bottom bottom-menu">
<%--				<label>--%>
<%--						<input type="checkbox" id="checked-all-bottom" />--%>
<%--						<span id="checkAllBottom">全选</span>--%>
<%--					</label>--%>
			</div>
			<div class="col-md-1 bottom-menu">
			</div>
			<div class="col-md-3 bottom-menu">
			</div>
			<div class="col-md-2 bottom-menu">
				<span >合计：￥<span id="totalprice" style="color: orangered;font-size: 16px;font-weight: bolder;"></span></span>
			</div>
			<a  onclick="document:orderForm.submit()">
				<div class="col-md-2 bottom-menu submitData">
					结算
				</div>
			</a>

		</div>
	</div>
	</form>

</div>

	<script src="${pageContext.request.contextPath}/resource/js/jquery_2.1.4_baidu_min.js"></script>
<script type="text/javascript">
	function minus(num){

		//1.根据name属性找到表示数量的标签( name='number')
		var numbers=document.getElementsByName('number');
		var pids=document.getElementsByName('shoppingcartid');

		// //当参数num为0 时表示是第一个商品的数量需要更改
		// //数量不能为负数
		var count=numbers[num].value;
		if(count==1){
			numbers[num].value=1;
		}else{
			numbers[num].value-=1;
		}
		//计算单个总价
		oneCount(num);
		//计算所有总价
		computeAll();
		//更新购物车.
		ajaxUpdateCar(pids[num].value,numbers[num].value)

	}
	//加
	function plus(num){
		//1.根据name属性找到表示数量的标签( name='amount')
		var numbers=document.getElementsByName("number");
		var pids=document.getElementsByName("shoppingcartid");
		//当参数num为0 时表示是第一个商品的数量需要更改
		var count=numbers[num].value;
		//转换的作用是防止+号进行字符串拼接
		numbers[num].value=parseInt(count)+1;
		//计算单个总价
		 oneCount(num);
		//计算所有总价
		 computeAll();
		//更新购物车.
		ajaxUpdateCar(pids[num].value,numbers[num].value)
	}

	//编写计算单个商品总价的方法
	function  oneCount(num){
		//根据name获取商品的单价
		var prices=document.getElementsByName("price");
		var price=prices[num].value;
		//获取单个商品的数量
		var amountes=document.getElementsByName("number");
		//当参数num为0 时表示是第一个商品的数量需要更改
		var count=amountes[num].value;
		//计算单个商品的总价
		var sum=price*count;
		//总价格小数点很长
		sum=sum.toFixed(2);
		//根据id 获取单个总价的元素
		var id="price"+num;
		document.getElementById(id).innerHTML=sum;
	}

	//编写计算所有商品的总价格的方法
	function  computeAll(){
		var pris = document.getElementsByClassName("prione");
		var sum=0;
		for (var i =0;i<pris.length;i++){
			sum+=parseFloat(pris[i].innerHTML);
		}
		document.getElementById("totalprice").innerHTML=sum;
	}
	function ajaxUpdateCar(shoppingcartid,number){
		$.ajax({
			url: "${pageContext.request.contextPath}/CarInfoNumUpdate.do",
			type: "post",
			dataType:"json",
			data: {
				shoppingcartid: shoppingcartid,
				number:number
			},
			success:function (data) {
			}
		});
	}
	computeAll();
</script>
</body>
</html>
