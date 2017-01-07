<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2016/12/27
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@include file="base.jsp" %>
<html>
<head>
    <title>商品管理</title>
</head>
<body>
<a  style="cursor: hand;" href="/sysLogin">返回首页</a><br/>
<div class="container">
    <h1>商品详情</h1>
    <hr/>

    <%--<h3>所有用户 <a href="/addUser" type="button" class="btn btn-default btn-sm">添加</a></h3>--%>

    <!-- 如果用户列表为空 -->
    <c:if test="${sessionScope.baseUser.role==1}">
        <c:if test="${empty goodsList}">
            <p class="bg-warning">
                <br/>
                    <%--User表为空，请<a href="/addUser" type="button" class="btn btn-default btn-sm">添加</a>--%>
                没有商品
                <br/>
                <br/>
            </p>
        </c:if>

        <!-- 如果用户列表非空 -->
        <c:if test="${!empty goodsList}">
            <p>
             <a href="/addGood" type="button" class="btn btn-default btn-sm">添加商品</a>
            </p>
            <table class="table table-bordered table-striped">
                <tr>
                    <th>ID</th>
                    <th>商品名称</th>
                    <th>租赁价格(元/天)</th>
                    <th>押金</th>
                    <th>库存</th>
                </tr>

                <c:forEach items="${goodsList}" var="goods">
                    <tr>
                        <td>${goods.id}</td>
                        <td>${goods.name}</td>
                        <td>${goods.price}</td>
                        <td>${goods.foregift}</td>
                        <td>${goods.amount}</td>
                        <td>
                            <a href="/show/${goods.id}" type="button" class="btn btn-sm btn-success">详情</a>
                            <a href="/update/${goods.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                            <a href="/delete/${goods.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </c:if>

    </c:if>

</div>
</body>
</html>
