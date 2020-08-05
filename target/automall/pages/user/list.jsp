<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        汽车列表
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
        body {
            min-width: 1190px;
            width: 100%;
        }
        html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            vertical-align: baseline;
            background: transparent;
        }
        .wrapper_1{
            margin-left: 164px;
            margin-right: 164px;
        }
        div.wrapper {
            width: 100%;
            margin: 0 auto;
            margin-bottom: 10px;
        }
        div.filter-area {
            border: 1px solid #dfdfdf;
            font-size: 12px;
            overflow: hidden;
            padding: 0 30px;
            margin-top: 10px;
        }
        div.filter-area .filter-title, div.filter-area .filter-title-brand {
            width: 75px;
            max-width: 75px;
            color: #666;
            text-align: left;
            float: left;
        }
        div.filter-area .filter-brand {
            position: relative;
            line-height: 28px;
            margin: 8px 0;
        }
        div.filter-area .filter-block {
            padding: 14px 0;
            overflow: hidden;
            border-top: 1px dashed #dedede;
        }
        div.filter-area .filter-block-brand dd {
            overflow: hidden;
        }
        div.filter-area .filter-block-brand dd {
            overflow: hidden;
        }
        div.filter-area .filter-sub {
            padding: 5px 30px 5px 75px;
            line-height: 28px;
            margin-bottom: 8px;
            background: #f8f8f8;
        }
        div.filter-area .filter-item {
            float: left;
            margin-right: 25px;
            color: #333;
            position: relative;
        }
        div.filter-area .filter-list, div.filter-area .filter-input {
            float: left;
        }
        div.filter-area .filter-input input {
            width: 39px;
            height: 19px;
            border: 1px solid #ccc;
            margin: 0 3px;
        }
        div.filter-area .filter-block {
            padding: 14px 0;
            overflow: hidden;
            border-top: 1px dashed #dedede;
        }
        dl {
            margin-top: 0;
            margin-bottom: 0px;
        }
        div.filter-area .filter-input .filter-btn {
            padding: 4px 8px;
            font-size: 12px;
            color: #fff;
            background-color: #c71445;
        }
        div.filter-area .filter-input .unit {
            color: #000;
            padding-left: 6px;
            padding-right: 9px;
            font-size: 12px;
        }
        .filter-showmore {
            background: #fff;
            width: 220px;
            height: 36px;
            margin: 0 auto;
            border: 1px solid #dfdfdf;
            border-top: 0;
            text-align: center;
            position: relative;
            top: -1px;
            cursor: pointer;
        }
        div.filter-area .filter-block .cur {
            color: #c71445;
            font-weight: bold;
        }
        div.filter-area .filter-block-brand .cur {
            color: #c71445;
            font-weight: bold;
        }
        .listcont {
            padding-top: 13px;
        }
        .clearfix {
            zoom: 1;
        }
        .list-filter .totle-num {
            line-height: 32px;
        }
        .list-filter .totle-num {
            line-height: 32px;
        }
        .list-filter li.sort p.cur {
            border: #c71445 1px solid;
            color: #c71445;
        }
        .list-filter li.sort p {
            border: #ccc 1px solid;
            width: 98px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            margin-right: 10px;
            display: inline-block;
            float: left;
        }
        .list-filter li.sort p .price-sort i {
            background: url("/resource/img/arrow-dwon.png") no-repeat center;
            width: 10px;
            height: 17px;
            display: inline-block;
            margin: -2px 0 0 10px;
            vertical-align: middle;
        }
        .series-list-item {
            float: left;
            width: 260px;
            height: 380px;
            background: #f9f9f9;
            margin-bottom: 10px;
            margin-top: 15px;
            margin-left: 15px;
            margin-right: 15px;
            padding-bottom: 10px;
        }
        .series-list-item .car-model-list {
            float: right;
            width: 666px;
            margin-right: 60px;
            margin-top: 50px;
        }
        .series-list-item .car-model-list .model-list-item {
            position: relative;
            font-size: 12px;
        }
        .series-list-item .car-info {
            padding-bottom: 6px;
            float: left;
            width: 260px;
        }
        .series-list-item .cont-info {
            float: left;
            padding-top: 30px;
            /*margin-left: 20px;*/
            width: 282px;
            text-align: center;
        }
        .series-list-item .cont-info .car-name {
            font-size: 24px;
            color: #000;
        }
        .model-list-item-link {
            display: block;
            padding: 30px 30px 0 20px;
            /*border-bottom: 1px solid #dedede;*/
            cursor: pointer;
        }
        .series-list-item .cont-info img {
            width: 210px;
            height: 140px;
            margin: 0 auto;
        }
        fieldset, img {
            border: 0;
        }
        .series-list-item .cont-info .car-tag span {
            display: inline-block;
            padding: 0 12px;
            margin-right: 8px;
            margin-bottom: 8px;
            background: #eaeaea;
            line-height: 26px;
            color: #666;
            border-radius: 12px;
        }
        .series-list-item .car-info .car-model-name  {
            width: 270px;
        }
        .series-list-item .car-info .car-model-name .name {
            float: left;
            font-weight: normal;
            font-size: 16px;
            color: black;
            margin-left: 26px;
        }
        .series-list-item .car-promotion {
            margin-top: 8px;
        }
        .series-list-item .car-promotion dd {
            font-size: 13px;
            overflow: hidden;
            height: 20px;
            line-height: 24px;
            color: #333;
        }
        .series-list-item .car-info .car-model-name .tag span {
            display: inline-block;
            margin-left: 12px;
            padding: 0 6px;
            border-radius: 2px;
            font-size: 12px;
            line-height: 18px;
            vertical-align: middle;
        }
        .tag{
            margin-top: 10px;
        }
        /*.series-list-item .car-info .car-model-name */
        .icon-other {
            margin-left: 26px;

            font-size: 14px;
            color: #a1804d;
            border: 1px solid #a1804d;
        }
        .support-self {
            margin-left: 12px;
            margin-top: 6px;
            color: #666;
            font-size: 10px;
        }
        .series-list-item .car-promotion .icon-cata {
            font-size: 13px;
            position: relative;
            z-index: 7;
            float: left;
            margin-right: 8px;
            margin-left: 5px;
            padding: 2px 8px 0;
            height: 18px;
            /*background: url() repeat-x 0 0;*/
            color: #c71445;
            line-height: 18px;
        }
        .icon-self {
            font-size: 10px;
            display: inline-block;
            margin-right: 8px;
            padding: 2px 8px 0;
            background: #c71445;
            border-radius: 2px;
            font-style: normal;
            line-height: 18px;
            color: #fff;
        }
        .series-list-item .car-box .price {
            margin-left: 12px;
            color: #000;
            font-size: 12px;
        }
        .series-list-item .car-box .price span {
            margin-left: 6px;
            color: #c71445;
            font-size: 20px;
        }
        .series-list-item .car-info .car-model-name .tag {
            overflow: hidden;
            font-size: 0;
        }
        .series-list-item .pk-op {
            position: absolute;
            right: 90px;
            bottom: 30px;
            font-size: 14px;
            line-height: 16px;
            color: #333;
            cursor: pointer;
            text-decoration: underline;
        }
        .series-list-item .calc-op {
            position: absolute;
            right: 30px;
            bottom: 30px;
            color: #333;
            font-size: 14px;
            line-height: 16px;
            text-decoration: underline;
        }
        ul, ol {
            list-style: none;
        }
        .series-list-item .car-promotion .icon-cata:before {
            position: absolute;
            top: 0;
            left: 0;
            content: "";
            background-repeat: no-repeat;
            /*background-image: url("/img/2.png");*/
            width: 6px;
            height: 20px;
            background-position: 0 -54px;
            font-size: 0;
        }
        .car-tag{
            font-size: 12px;
        }
        .addcart{
            height: 25px;
            line-height: 30px;
            border: 1px solid #DDD;
            position: relative;
            background: #fff;
            color: #e4393c;
            font-size: 14px;
            margin-left: 10px;
            padding: 4px 2px 2px 4px;
        }

    </style>
    <script>
        function addCheckToShoppingcart(){
            if (confirm("您确定要添加到购物车吗？")){
                return true;
            }
        }
    </script>
</head>
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
<div class="wrapper_1">
    <div >
        <h1 align="center" style="font-size: 35px">新车网</h1>
    </div>
    <!--筛选项-->
    <div class="wrapper ">
        <div class="filter-area">

            <dl class="filter-block-brand">
                <dt class="filter-title-brand">品牌</dt>
                <dd class="filter-brand">
                    <a href="${pageContext.request.contextPath}/user/findAllCarList.do"  class="filter-item js-filter-item cur" >不限</a>
                    <c:forEach items="${brandList}" var="brand">
                        <a href="${pageContext.request.contextPath}/loginFindCarListByBrand.do?brandid=${brand.brandid}"  class="filter-item js-filter-item" >${brand.brandname}</a>
                    </c:forEach>

                </dd>

            </dl>
            <dl class="filter-block">
                <dt class="filter-title">价格</dt>
                <dd>
                    <div class="filter-list">
                        <a class="filter-item cur">不限</a>
                        <a class="filter-item">10万以下</a>
                        <a class="filter-item">10万-15万</a>
                        <a class="filter-item">15万-20万</a>
                        <a class="filter-item">20万-25万</a>
                        <a class="filter-item">25万-35万</a>
                        <a class="filter-item">35万以上</a>
                    </div>
                    <div class="filter-input">
                        <input type="text" id="js_from_price"  maxlength="4" />-<input type="text" id="js_to_Price"   maxlength="4"/><span class="unit">万元</span><a href="javascript:void(0);" class="filter-btn js_range_submit" CA="v170727_cm-list_pc_filter-price_r2$确定$">确定</a>
                    </div>
                </dd>
            </dl>


            <dl class="filter-block">
                <dt class="filter-title">级别</dt>
                <dd>
                    <a href="#"  class="filter-item cur" >不限</a>
                    <c:forEach items="${carmodelList}" var="carmodel">
                        <a href="#"  class="filter-item" >${carmodel.modelname}</a>
                    </c:forEach>

                </dd>
            </dl>
        </div>

        <div class="filter-showmore js-filter-showmore">
            <span CA="v170727_cm-list_pc_filter-more_r1c0$更多筛选$">更多筛选</span>
            <i class="down-icon"></i>
        </div>

    </div>
</div>
<div class="wrapper_1">
    <div class="clearfix listcont">
        <!-- 列表区域 -->

        <!-- 车系聚合列表页-->
        <section class="zlist-cont">
            <div class="list-filter clearfix">
                <ul>
                    <li class="sort">
                        <a rel="nofollow" href="#" >
                            <p  class="cur"  ><span>综合排序</span>&nbsp;</p>
                        </a>
                        <a rel="nofollow" href="#">
                            <p ><span style="color: #333;">价格排序<i class=""></i></span></p>
                        </a>
                    </li>


                    <div class="totle-num" align="right">
                        <span>共${pageInfo.total}条</span>
                    </div>

                </ul>
            </div>


            <ul class="car-series-list">

                <c:forEach items="${pageInfo.list}" var="car" >
                    <li class="series-list-item  clearfix">

                        <div class="cont-info row">
                            <p class="car-name">${car.carname}</p>
                            <a href="${pageContext.request.contextPath}/userFindCarInfoByCarId.do?carid=${car.carid}">

                                    <img class="lazy" src="
                                        <c:if test="${not empty car.imgurl && fn:contains(car.imgurl, 'http') == false}">
                                            ${pageContext.request.contextPath}/resource/upload/${car.imgurl}
                                        </c:if>
                                        <c:if test="${empty car.imgurl}">
                                            ${pageContext.request.contextPath}/resource/img/failed.png
                                        </c:if>
                                        <c:if test="${fn:contains(car.imgurl, 'http')==true}">
                                            ${car.imgurl}
                                        </c:if>
                                    " alt="${car.carname}" />


                            </a>

                            <p class="car-tag">
                                <span>热销爆款</span>
                                    <%--                                <span>低油耗</span>--%>
                                    <%--                                <span>大空间</span>--%>
                            </p>
                        </div>
                        <div class="car-info ">
                            <div class="car-model-name row">
                                <a class="name" href="${pageContext.request.contextPath}/userFindCarInfoByCarId.do?carid=${car.carid}">
                                        ${car.description}
                                </a>

                            </div>
                            <div class="row">
                                <p class="tag">
                                    <span class="icon-other">分期购车</span>
                                </p>
                            </div>
                            <dl class="car-promotion">
                                <dt class="icon-cata">领券</dt>
                                <dd>76期自营特价车购车券</dd>
                            </dl>
                            <p class="support-self">
                                <i class="icon-self">自营</i>
                                车享新车自营商品
                            </p>
                        </div>
                        <div class="car-box" style="float: left">
                            <p class="price">裸车价:
                                <span>&yen;${car.price}</span>
                            </p>
                        </div>
                        <div style="">
                            <a class="addcart" onclick="addCheckToShoppingcart()" href="${pageContext.request.contextPath}/addShoppingCartInList.do?carid=${car.carid}&username=${sessionScope.username}" style="font-size: 13px">
                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                加入购物车
                            </a>
                        </div>
                    </li>
                </c:forEach>



            </ul>


        </section>
    </div>
</div>
<div class="wrapper_1">
    <nav aria-label="Page navigation" style="margin-left:900px">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <li><a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a></li>
            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                <li><a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
            </c:forEach>

            <li><a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">
                    <span aria-hidden="true">尾页</span>
                </a>
            </li>
        </ul>
    </nav>
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>



</body>
</html>
