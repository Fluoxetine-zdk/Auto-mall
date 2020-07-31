<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>register</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<style>
		.background{
		        position: absolute;
		        top: 0;
		        left: 0;
		        width: 100%;
		        height: 100%;
		        z-index: -1;
		    }
		    body{
		        text-align: center;
		}
		    .body-content{
		        padding-left: 33.33333%;
		        padding-right: 33.33333%;
		    }
			.panel-header{
				font-size: 20px;
			}
		    .panel-body{
		        padding: 10px 40px 40px 40px;
		        background: #eee;
		        border-top-left-radius: 1rem;
		        border-top-right-radius: 1rem;
		    }
		    .has-text-centered {
		        text-align: center;
		    }
		    .register-button{
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
	<body>
        <nav class="navbar navbar-inverse">
			<div class="container-fluid header">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp">首页</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.jsp">登录</a></li>
					</ul>
			    </div>
			</div>
		</nav>
		 	<div class="container-fluid body-content" style="padding-top: 90px">
		 	    <div class="panel panel-default" >
					<div class="panel-header">
					          <a> 已有帐户？<a href="#" tabindex="5">登录</a></a>
					</div>
		 	        <div class="panel-body">
		 	            <div class="has-text-centered">
							<div class="panel-heading" >
							    <h2 class="section-title "style="text-align: center">创建用户</h2>
							</div>
		 	                <div class="control name">
		 	                    <input class="input" type="text" name="name" placeholder="姓名">
		 	                </div>
		 	                <div class="control phone">
		 	                    <input class="input" type="text" name="phone" placeholder="电话">
		 	                </div>
							<div class="control email">
							    <input class="input" type="text" name="email" placeholder="电子邮件地址">
							</div>
							<div class="control password">
							    <input class="input" type="text" name="password" placeholder="密码">
							</div>
		 	                <div class="control password">
		 	                    <input class="input" type="text" name="password" placeholder="请再次输入您的密码">
		 	                </div>
		 	                <div class="has-text-centered sign">
		 	                    <button type="button" class="button register-button" tabindex="4">创建帐户</button>
		 	                </div>
		 	            </div>
		 	        </div>
		 	<div class="background">
		 	    <img src="resource/img/register-background.jpg" width="100%" height="100%"/>
		 	</div>
	</body>
</html>
