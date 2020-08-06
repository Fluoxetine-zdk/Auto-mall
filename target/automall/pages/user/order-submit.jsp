<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome = 1">
    <title>提交订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/hugepay.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/order_hf.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/dealer-map.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .mod-tit1 {
        margin-bottom: 10px;
        height: 25px;
        background: #f3f3f3;
        font-size: 16px;
        font-weight: normal;
        color: #666;
        line-height: 25px;
    }
</style>
<body>
<!--导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/user/index.jsp">首页</a>
        </div>


        <!-- Collect the nav links, forms, and other content for toggling -->
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

<div class="pro-header">
    <div class="wrapper clearfix">
        <div class="pro-header-logo">
            <strong>提交订单</strong>
        </div>
    </div>
</div>
<div class="wrapper">
    <!-- path -->
    <div class="path">
        <a href="${pageContext.request.contextPath}/pages/user/index.jsp">首页</a>
        <i class="crumbs-arrow">&gt;</i>
        <span>提交订单</span>
    </div>
    <!-- 商品信息 -->
    <div class="mod">
        <h3 class="mod-tit1">商品信息</h3>
        <div class="product">
<%--            <div class="img-box">--%>
<%--                <img src="//i1.cximg.com/img2/180x120/9c730a0484bd33606b889b25fcc43fa1/20200416/f2586b598d78458cb0be87930add3db5.png">--%>
<%--            </div>--%>
            <div class="data-render">
                <table>
                    <colgroup>
                        <col class="car-name">
                        <col class="car-money">
                        <col class="car-money">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="cell-left">商品</th>
                        <th class="car-money">价格</th>
                        <th class="car-money">数量</th>
                        <th class="car-money">小计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderDetails}" var="orderDetail">
                        <tr>
                            <td>
                                <p class="fix-txt">
                                    <c:forEach items="${carInfoList}" var="caInfo">
                                        <c:if test="${caInfo.carid == orderDetail.carid}">${caInfo.carname}&nbsp;&nbsp;&nbsp;${caInfo.description}</c:if>
                                    </c:forEach>
                                </p>
                            </td>
                            <td class="cell-center money">${orderDetail.price}</td>
                            <td class="cell-center money">${orderDetail.number}</td>
                            <td class="cell-center money">${orderDetail.price*orderDetail.number}</td>
                        </tr>
                    </c:forEach>

                    </tbody></table>
            </div>
        </div>

    </div>

    <form id="saicShoppingForm" method="post" accept-charset="UTF-8" name="preOrder">

        <!-- 购车人信息 -->
        <div class="mod">
            <h3 class="mod-tit1">付款码</h3>
            <img src="${pageContext.request.contextPath}/resource/img/pay.png" style="margin-left: 430px">
        </div>
        <!-- 定金 -->
        <div class="total-price">
            <p class="pay-money"><span class="name">订单总金额：</span><strong class="last-money fred">¥<b>${order.totalprice}</b></strong></p>
        </div>
        <div class="confirm-box" style="margin-bottom: 30px">
            <button type="button" id="submitOrder" class="common-btn" onclick="orderStatusUpdate();">完成</button>
        </div>
    </form>
</div>
<script>
    function orderStatusUpdate() {
        window.location.href="${pageContext.request.contextPath}/orderStatusUpate.do?orderid="+${order.orderid};
    }
</script>
</body>
</html>



