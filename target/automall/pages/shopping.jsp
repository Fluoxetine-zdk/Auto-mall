<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--使用标签库--%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>操作当当购物车页面</title>
    <link type="text/css" rel="stylesheet" href="css/cartStyle.css" />
</head>
<body>

<div class="content">
    <div class="logo">
    </div>
    <div class="cartList" id="cartList">
        <ul>
            <li>商品图片</li>
            <li>商品信息</li>
            <li>单价</li>
            <li>数量</li>
            <li>总价</li>
            <li>操作</li>
        </ul>
        <c:forEach items="${cars}" var="car" varStatus="sta">
            <input type="hidden" value="${car.pid}" name="pid">
            <ul>
                <li><img src="${car.imgurl}"></li>
                <li>${car.pname}</li>
                <li>¥<input type="text" name="price" value="${car.price}"></li>
                <li><input type="button" name="minus" value="-" onclick="minus(${sta.index});">
                    <input type="text" name="amount" value="${car.count}">
                    <input type="button" name="plus" value="+" onclick="plus(${sta.index});"></li>
                <li id="price${sta.index}" class="prione">${(car.price)*(car.count)}</li>
                <li><p  onclick="collection();">移入收藏</p><p>删除</p></li>
            </ul>
        </c:forEach>
        <textarea cols="20" rows="3"></textarea>

        <ol>
            <li id="totalPrice">商品总计：<span id="ttprice"></span></li>
            <li><span>结 算</span></li>
        </ol>
    </div>
</div>
<%--<button onclick="show()" >触发点击事件</button>--%>
<script src="${pageContext.request.contextPath}/resource/js/jquery_2.1.4_baidu_min.js"></script>
<script>
    //根据素材 编写minus()函数
    //减
    function minus(num){
        //1.根据name属性找到表示数量的标签( name='amount')
        var amountes=document.getElementsByName("amount");
        var pids=document.getElementsByName("pid");

        //当参数num为0 时表示是第一个商品的数量需要更改
        //数量不能为负数
        var count=amountes[num].value;
        if(count<1){
            amountes[num].value=0;
        }else{
            amountes[num].value-=1;
        }
        //计算单个总价
        oneCount(num);
        //计算所有总价
        computeAll();
        //更新购物车.
        ajaxUpdateCar(amountes[num].value,pids[num].value)

    }
    //加
    function plus(num){
        //1.根据name属性找到表示数量的标签( name='amount')
        var amountes=document.getElementsByName("amount");
        var pids=document.getElementsByName("pid");
        //当参数num为0 时表示是第一个商品的数量需要更改
        var count=amountes[num].value;
        //转换的作用是防止+号进行字符串拼接
        amountes[num].value=parseInt(count)+1;
        //计算单个总价
        oneCount(num);
        //计算所有总价
        computeAll();
        //更新购物车.
        ajaxUpdateCar(amountes[num].value,pids[num].value)
    }

    //编写计算单个商品总价的方法
    function  oneCount(num){
        //根据name获取商品的单价
        var prices=document.getElementsByName("price");
        var price=prices[num].value;
        //获取单个商品的数量
        var amountes=document.getElementsByName("amount");
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

    //编写计算所有商品的总及格的方法
    function  computeAll(){
        var pris = document.getElementsByClassName("prione");
        var sum=0;
        for (var i =0;i<pris.length;i++){
            sum+=parseFloat(pris[i].innerHTML);
        }
        document.getElementById("ttprice").innerHTML=sum;
    }
    function ajaxUpdateCar(count,pid){
        $.ajax({
            url: "car.do",
            type: "post",
            dataType:"json",
            data: {
                key:2,
                count: count,
                pid:pid
            },
            success:function (data) {
            }
        });
    }
    computeAll();
</script>
</body>
</html>
