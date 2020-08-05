<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>新车网</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .welcome_area {
            position: relative;
            z-index: 1;
            width: 100%;
        }
        .bg-img {
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .hero-content{
            padding-top:120px;
            padding-left: 95px;
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        .hero-content h1{
            font-size: 60px;
            color: #000000;
            margin-bottom: 50px;
            line-height: 1.3;
            font-weight: 700;
        }
        .hero-content h3{
            color: #000000;
            line-height: 1.3;
            font-weight: 700;
            font-family: "Ubuntu", sans-serif;

        }
        .essence-btn{
            display: inline-block;
            min-width: 170px;
            height: 50px;
            color: #ffffff;
            border: none;
            border-radius: 0;
            padding: 0 40px;
            text-transform: uppercase;
            font-size: 16px;
            line-height: 50px;
            background-color: #0315ff;
            letter-spacing: 1.5px;
            font-weight: 600;
        }

    </style>

    <script type="text/javascript">
        function loginFirst(){
            alert("请先登录！");
            return false;
        }
    </script>
</head>


<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">首页</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a onclick="loginFirst()">购物车</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
                <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
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
<section class="welcome_area bg-img background-overlay">
    <div class="container h-100">
        <div class="row h-100 middle">
            <div class="col-12">
                <div class="hero-content">
                    <h2 style="color: white;font-weight: 600;">您好，</h2>
                    <h1 class="text-info" style="color: white">欢迎来到新车网</h1>
                    <a href="${pageContext.request.contextPath}/unLogin/findAllCarList.do?page=1&size=12" class="essence-btn" style="margin-left: 680px;margin-top: 30px">开始新车选购</a>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="background">
    <img src="resource/img/index.jpg" width="100%" height="100%">
</div>


</body>
</html>
