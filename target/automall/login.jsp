<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .background{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            filter: blur(2px);
        }
        .main-body{
            padding-top: 100px;
            text-align: center;
        }
        .body-content{
            padding-left: 33.33333%;
            padding-right: 33.33333%;
        }
        .panel-body{
            padding: 10px 40px 40px 40px;
            background: #eee;

        }
        .has-text-centered {
            text-align: center;
        }
        .login-button{
            border-radius: 2rem;
            color: #fff;
            background-color: rgb(62, 107, 226);
            border: 3px solid rgb(62, 107, 226);
            padding: 0 40px 0 40px;
            font-size: 0.9em;
            font-weight: 500;
            width: 100%;
            height: 40px;
            line-height: 36px;
            display: inline-block;
        }
        .sign{
            margin:20px 0 0 0;
        }
        .control:not(:last-child){
            margin-bottom: .75rem;
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
        .has-text-left{
            text-align: left;
        }
    </style>

    <script type="text/javascript">
        function beforeSubmit(form){
            if(form.username.value===''){
                alert('请输入用户名');
                form.username.focus();
                return false;
            }
            if(form.password.value===''){
                alert('请输入密码');
                form.password.focus();
                return false;
            }
            return true;
        }
    </script>

</head>


<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">首页</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.jsp">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="main-body">
<div class="container-fluid body-content">
    <div class="panel panel-default">
        <div class="panel-heading" >
            <h2 class="section-title "style="text-align: center">登录</h2>
        </div>
        <form action="${pageContext.request.contextPath}/login.do" method="post" name="form" onSubmit="return beforeSubmit(this);" style="margin-bottom: 0px">
            <div class="panel-body">
                <div class="has-text-centered">
                    <div class="control username">
                        <input class="input" type="text" name="username" placeholder="UserName">
                    </div>
                    <div class="control password">
                        <input class="input" type="password" name="password" placeholder="Password">
                    </div>
                    <div class="has-text-left">
                        <a href="#">忘记密码？</a>
                    </div>
                    <span style="color: red"><%=(request.getAttribute("login-msg")!=null)?request.getAttribute("login-msg"):""%></span>
                    <div class="has-text-centered sign">
                        <button type="submit" class="button login-button" tabindex="4">登录</button>
                    </div>
                </div>

            </div>
        </form>

        <div class="panel-footer">
            <a href="#" tabindex="5">创建一个账户</a>
        </div>
    </div>

</div>
<div class="background">
    <img src="resource/img/login-background.jpg" width="100%" height="100%"/>
</div>
</div>
</body>

