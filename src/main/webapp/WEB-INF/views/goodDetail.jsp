<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2016/12/27
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品详情</title>
</head>
<body>
<div class="container">
    <h1>商品详情</h1>
    <hr/>
    <ul align="center"><img src="/static/picture/${good.id}.jpg" /></ul>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${good.id}</td>
        </tr>
        <tr>
            <th>商品名称</th>
            <td>${good.name}</td>
        </tr>
        <tr>
            <th>租赁价格(元/天)</th>
            <td>${good.price}</td>
        </tr>
        <tr>
            <th>押金</th>
            <td>${good.foregift}</td>
        </tr>
        <tr>
            <th>库存</th>
            <td>${good.amount}</td>
        </tr>

    </table>

</div>
</body>
</html>
