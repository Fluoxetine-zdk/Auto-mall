<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            vertical-align: baseline;
            background: transparent;
        }
        .cxcar-header{
            position: relative;
            z-index: 19;
            background-color: #fff;
            padding: 20px 0 18px 0;
        }
        .cxcar-header-bd{
            font-size:14px;
            color:#999;
            width:1190px;
            margin:0 auto;
        }
        .cxcar-header-bd.logo{
            float: left;
            margin-top: 20px;
            position: relative;
            letter-spacing: 3px;
            width: 190px;
            color: #013ca6;
            font-size: 14px;
            text-decoration: none;
        }
        .btn-submit{
            width: 214px;
            height: 44px;
            line-height: 44px;
            margin-right:10px;
            cursor: pointer;
            background: #c71445;
            font-size: 16px;
            color:#fff;
            text-align: center;
            border:0;
        }
        .top-menu-right{
            margin-left: 270px;
        }
        .crumbs-con .title-blue a {
            color: #333;
        }
        .clearfix{
            zoom: 1;
        }
        .nav-list{
            float: left;
            line-height: 27px;
            height: 27px;
            margin-top: 26px;
        }
        .nav-list li{
            font-size: 18px;
            float: left;
            margin-right: 40px;
        }
        .icon-tip-box{
            position: relative;
        }
        .cxcar-header-nav .nav-list li a {
            text-decoration: none;
            color: #333;
        }
        .car-photos {
            border: 1px solid #ddd;
        }
        .car-photos .cur {
            visibility: visible;
        }
        .car-photos, .car-photos li {
            width: 468px;
        }
        .car-tabs li.cur {
            border-color: #c71445;
        }
        .car-details {
            width: 690px;
            border-left: none;
            position: relative;
            float: right;
            min-height: 470px;
        }
        .car-details .car-info-title h1 {
            width: 70%;
            padding-bottom: 12px;
            font-size: 18px;
            line-height: 22px;
            color: #333;
            font-weight: normal;
            overflow: hidden;
        }
        .wrapper {
            width: 1190px;
            margin: 0 auto;
        }
        .car-main {
            margin-top: 22px;
            font-size: 14px;
            border: 1px solid #f2f2f2;
            border: 0;
            position: relative;
        }
        .car-photos .photo-wrap {
            display: table-cell;
            vertical-align: middle;
        }
        .car-photos, .car-photos li {
            width: 468px;
            height: 352px;
        }
        .car-preview {
            float: left;
            width: 470px;
            min-height: 470px;
        }
        .car-photos .cur img {
            opacity: 1;
        }
        .car-photos li img {
            max-width: 100%;
            height: auto;
        }
        fieldset, img {
            border: 0;
        }
        .car-photos li {
            position: absolute;
            left: 0;
            top: 0;
            visibility: hidden;
            display: table;
        }
        .car-details .car-info-title h1 {
            width: 70%;
            padding-bottom: 12px;
            font-size: 18px;
            line-height: 22px;
            color: #333;
            font-weight: normal;
            overflow: hidden;
        }
        .car-ad {
            font-size: 14px;
            padding: 5px 0 5px 0;
            color: #c71445;
            /*overflow: hidden;*/
            text-overflow: ellipsis;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            display: -webkit-box;
            width: 70%;
            /*height: 34px;*/
        }
        .car-price {
            border-top: 1px solid #f2f2f2;
            border-bottom: 1px solid #f2f2f2;
            padding: 19px 0 14px 32px;
            font-size: 14px;
        }
        .car-price {
            background: #f5f5f5  no-repeat 0 0;
        }
        .car-details .car-info-title {
            padding: 4px 20px 14px 32px;
            line-height: 150%;
            position: relative;
        }
        .naked-car-price .summary-price strong {
            font-size: 24px;
            color: #c71445;
            padding: 0 5px;
            font-weight: 100;
            display: inline-block;
            vertical-align: middle;
            line-height: 100%;
            height: 29px;
        }
        .naked-car-price .summary-price .summary-price-name {
            min-width: 56px;
            margin-right: 6px;
            font-size: 14px;
            color: #666;
            display: inline-block;
            vertical-align: middle;
            text-align: justify;
            -moz-text-align-last: justify;
            text-align-last: justify;
        }
        .naked-car-price .summary-price strong span {
            display: inline-block;
            vertical-align: bottom;
        }
        .naked-car-price .summary-price strong .yen {
            font-size: inherit;
            font-weight: normal;
            line-height: inherit;
        }
        .naked-car-price .summary-price strong .yen {
            font-size: 14px;
            padding-right: 2px;
            font-weight: bold;
            display: inline-block;
            vertical-align: bottom;
            line-height: 130%;
        }
        .naked-car-price .summary-price strong span {
            display: inline-block;
            vertical-align: bottom;
        }
        .naked-car-price .summary-price .zd-price {
            margin-right: 30px;
        }
        .naked-car-price .summary-price .zd-price, .naked-car-price .summary-price .zd-add-price {
            display: inline-block;
            vertical-align: middle;
            font-size: 12px;
            margin-right: 20px;
        }
        .naked-car-price .summary-price .payment-info {
            color: #999;
        }
        .naked-car-price .summary-price .payment-info {
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            font-size: 12px;
            vertical-align: middle;
            width: 590px;
            margin-left: 66px;
        }
        .promotion-tit {
            float: left;
            margin-right: 13px;
            min-width: 56px;
            font-size: 14px;
            color: #666;
            line-height: 20px;
            font-weight: normal;
            text-align: justify;
            -moz-text-align-last: justify;
            text-align-last: justify;
        }
        .promotion-con .con {
            zoom: 1;
            color: #666;
            line-height: 20px;
            margin-left: 0px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .car-choose dl {
            padding: 7px 0 8px 15px;
            line-height: 38px;
            margin: 0;
        }
        .car-choose dt {
            color: #666;
            margin-right: 13px;
            min-width: 56px;
            line-height: 30px;
        }
        .car-main .car-details .consult-btn {
            width: 148px;
            height: 42px;
            display: inline-block;
            float: none;
            position: relative;
            line-height: 40px;
            border: 1px solid #c71445;
            color: #c71445;
            margin-right: 7px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            vertical-align: middle;
            position: relative;
        }
        .car-order {
            padding-left: 16px;
            display: inline-block;
            float: none;
        }
        .form-safeguard {
            clear: both;
            margin-top: 15px;
            padding-top: 0;
            line-height: 28px;
            padding-bottom: 0;
            margin-left: 16px;
            color: #999;
            position: relative;
        }
        .car-choose dd {
            line-height: inherit;
            width: 500px;
            float: left;
            font-size: 14px;
            color: #c71445;
            height: 34px;
        }
        .form-safeguard img {
            margin: 0 5px 3px 20px;
            vertical-align: middle;
            border: 0;
        }
        .car-tabs li {
            width: 90px;
            height: 60px;
            border: 2px solid transparent;
        }
        .car-tabs li img {
            width: 90px;
            height: auto;
            display: block;
        }
        .car-tabs {
            margin-top: 10px;
        }


    </style>
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">首页</a>
        </div>


        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">购物车</a></li>
                <li><a href="#">登录</a></li>
                <li><a href="#">注册</a></li>
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
<div class="cxcar-header">
    <div class="cxcar-header-bd">
        <div class="logo">
            <div class="top-menu-right">
                <div class="cxcar-header-nav clearfix">
                    <ul class="nav-list">
                        <li class="  ">
                            <a href="#" title="首页" target="_blank">首页</a>

                        </li>
                        <li class="icon-tip-box  ">
                            <a href="#" title="7月促销" target="_blank">7月促销</a>
                            <i class="icon-tip"><img src="img/7.jpg"></i>
                        </li>
                        <li class="icon-tip-box  ">
                            <a href="#" title="享特价" target="_blank">享特价</a>
                            <i class="icon-tip"><img src="img/7.jpg"></i>
                        </li>
                        <li class="  ">
                            <a href="#">品牌旗舰店</a>

                        </li>
                        <li class="  ">
                            <a href="#">全国实体店</a>

                        </li>
                        <li class="  ">
                            <a href="#">贷款购车</a>

                        </li>
                        <li class="  ">
                            <a href="#">车型大全</a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper car-main clearfix">
    <div class="car-preview">

        <div class="car-preview-area" id="js_car_imageshow" >
            <ul class="car-photos">
                <li   class="cur"  bIsDetailImg="0">
                    <div class="photo-wrap">
                        <img src="img/6.png" alt="">
                    </div>
                </li>
            </ul>
            <ul class="car-tabs clearfix">
                <li  class="cur" >
                    <img src="img/7.png" alt="2020款 330TSI 商务版"><em></em>
                </li>
            </ul>
        </div>
    </div>

    <div class="car-details">
        <div class="car-info-title">
            <h1>【上汽大众旗舰店】上汽大众 Viloran威然 尊崇备至 专享礼遇</h1>

            <div class="car-ad">【燃擎一夏】购车送价值150元西铁城电动牙刷；【专享礼遇】2年0利率，8000元置换补贴，4次免费保养</div>

            <div class="pk-duibi js_pk-duibi pk-duibi-only" data-index='1'
                 data-brandname="上汽大众"
                 data-seriesname="Viloran"
                 data-modelname="2020款 330TSI 商务版"
                 data-velmodelid="1001042372">

            </div>


        </div>

        <div class="car-price clearfix" style="">
            <div class="naked-car-price clearfix">
                <div class="summary-price">
                    <span class="summary-price-name">订&nbsp;&nbsp;&nbsp;&nbsp;金</span>
                    <strong><span class="yen">¥</span><span class="js-bare-price">188</span></strong>
                    <span class="zd-price">指导价
                        	<span class="model-id-1001042372">
	                        		&yen;28.68万起
	             			</span>
                        </span>
                    <span class="payment-info" title="订金可抵扣车款，如未购车，订金随时可退" >
                        	<i class="info-icon"></i>订金可抵扣车款，如未购车，订金随时可退
                        </span>
                </div>
            </div>
            <hr></hr>
            <!-- 促销 -->
            <div class="promotion-mod js-promotion-mod">
                <div class="promotion-default clearfix">
                    <h3 class="promotion-tit">促&nbsp;&nbsp;&nbsp;&nbsp;销</h3>
                    <div class="promotion-con">
                        <div class="item-wrap">
                            <div class="item">
                                <div class="con" style="margin-left:0;">
                                    【燃擎一夏】购车送价值150元西铁城电动牙刷;<br/>【专享礼遇】2年0利率，8000元置换补贴，4次免费保养
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 25px">
            <div class="car-order">
                <input type="hidden" id="js_hidden_data" value="" />

                <button class="btn-submit submit_preorder order-btn">
                    立即抢购
                </button>

            </div>
            <!-- <a class="consult-btn js_help_service4" ca="v170727_cm-brandDetail_pc_car-main_c2r6d2$询问底价$">询问底价</a>-->
            <a class="consult-btn js-shopping-add">加入购物车</a>
        </div>


        <div class="form-safeguard clearfix">
            服务承诺
            <img src="${pageContext.request.contextPath}/resource/img/8.png" ><span class="safeguard-item">服务品质保障</span>
            <img src="${pageContext.request.contextPath}/resource/img/9.png" ><span class="safeguard-item">全国联保保障</span>
        </div>

    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
