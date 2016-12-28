<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2016/12/27
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>更新商品</title>
</head>
<body>
<div class="container">
    <h1>修改商品信息</h1>
    <hr/>

    <form action="/updateG" method="post">
        <div class="form-group">
            <label for="name">商品名称:</label>
            <input type="text" class="form-control" id="name" name="name"
                   value="${good.name}"/>
        </div>
        <div class="form-group">
            <label for="price">租赁价格(元/天):</label>
            <input type="text" class="form-control" id="price" name="price"
                   value="${good.price}"/>
        </div>
        <div class="form-group">
            <label for="foregift">押金:</label>
            <input type="text" class="form-control" id="foregift" name="foregift"
                   value="${good.foregift}"/>
        </div>
        <div class="form-group">
            <label for="amount">库存:</label>
            <input type="text" class="form-control" id="amount" name="amount"
                   value="${good.amount}"/>
        </div>

        <input type="hidden" id="id" name="id" value="${good.id}"/>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form>
</div>

</body>
</html>
