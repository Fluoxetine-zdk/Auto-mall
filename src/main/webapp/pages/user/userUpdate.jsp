<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome = 1">
    <title>用户信息修改</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/adminlte/2.3.11/bootstrap/css/bootstrap.min.css">
</head>
<style>
    .area{
        height: 80px;
    }
    .area h2{
        font-size: 30px;
        text-transform: uppercase;
        font-weight: 700;
        font-family: "Ubuntu", sans-serif;
        letter-spacing: 1px;
        margin-bottom: 0;
    }
    .textStyle{
        border-radius: 50px;
        background: #dfdfdf;
        box-shadow:  20px 20px 60px #bebebe,
        -20px -20px 60px #ffffff;
        height: 400px;
    }
    .img-group {
         position: relative;
         display: inline-block;
        border-radius: 50px;
    }
    .input{
        height: 40px;
        font-size: 16px;
        border-radius: 2rem;
        align-items: center;
        display: inline-flex;
        justify-content: flex-start;
        line-height: 1.5;
        padding-left: .75em;
        padding-right: .75em;
        background-color: #fff;
        border: 1px solid #dbdbdb;
        color: #363636;
        box-shadow: inset 0 1px 2px rgba(10,10,10,.1);
        width: 100%;
    }
</style>
<body>
<!--导航栏-->
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

<div class="area">
    <div class="text-center">
        <h2>个人信息修改</h2>
    </div>
</div>

<div class="container">
    <div class="row textStyle" style="margin-left: 150px;padding-top: 20px;margin-right: 20px;width: 800px;">
        <div class="col-md-3" style="margin-left: 15px">
            <div class="img-group textStyle" style="background-color: white;padding-top: 30px;height: 320px;width: 180px">  
                <img src="${pageContext.request.contextPath}/resource/img/user.jpg" width="160px" height="160px">
                <div class="img-tip" style="padding-left: 20px;margin-top: 20px;">
                    <p style="font-size: 16px">xxxx</p>
                    <p style="font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xxxxxxxxx</p>
                    <p style="font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xxxxxxxxxxxxx</p>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="text" style="padding-top: 20px; padding-bottom: 20px;padding-left: 40px">
                <form method="post" action="${pageContext.request.contextPath}/userMessageUpdateByUser.do">
                <div class="row" style="padding-top: 10px; padding-bottom: 10px">
                    <div class="col-lg-4">姓名：</div>
                    <div class="col-lg-6">
                        <input type="text" disabled class="input" value="${user.username}" >
                        <input type="hidden" class="input" name="username" value="${user.username}" >
                    </div>
                </div>
                <div class="row" style="padding-top: 10px; padding-bottom: 10px">
                    <div class="col-lg-4">密码：</div>
                    <div class="col-lg-6">
                        <input type="text" class="input" name="password" placeholder="密码" value="${user.password}" >
                    </div>
                </div>
                <div class="row" style="padding-top: 10px; padding-bottom: 10px">
                    <div class="col-lg-4">性别：</div>
                    <div class="col-lg-6">
                        <label><input type="radio" name="sex" value="男" <c:if test="${user.sex.equals('男')}">checked</c:if> >男</label>
                        <label><input type="radio" name="sex" value="女" <c:if test="${user.sex.equals('女')}">checked</c:if> >女</label>
                    </div>
                </div>
                <div class="row" style="padding-top: 10px; padding-bottom: 10px">
                    <div class="col-lg-4">电话：</div>
                    <div class="col-lg-6">
                        <input type="text" class="input" name="phone" placeholder="电话" value="${user.phone}">
                    </div>
                </div>

                <div class="row" style="padding-top: 10px; padding-bottom: 10px">
                    <div class="col-lg-4">邮箱：</div>
                    <div class="col-lg-6">
                        <input type="text" class="input" id="email" name="email" placeholder="邮箱" value="${user.email}">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 80px">
                    <div class="container" style="margin-top: 15px">
                        <button type="submit" >修改</button>
                        <button type="button" onclick="history.back(-1);">返回</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>


