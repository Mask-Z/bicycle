<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2016/12/7
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<a style="cursor: hand;" href="sysLogin">返回首页</a><br/>
<div class="container">
<h1>用户详情</h1>
<hr/>

<%--<h3>所有用户 <a href="/addUser" type="button" class="btn btn-default btn-sm">添加</a></h3>--%>

<!-- 如果用户列表为空 -->
<c:if test="${empty baseUser}">
    <p class="bg-warning">
        <br/>
        <%--User表为空，请<a href="/addUser" type="button" class="btn btn-default btn-sm">添加</a>--%>
        没有用户,或者你没有查看权限
        <br/>
        <br/>
    </p>
</c:if>

<!-- 如果用户列表非空 -->
<c:if test="${!empty baseUser}">
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>密码</th>
            <th>操作</th>
        </tr>
    <c:if test="${sessionScope.baseUser.role==1}">
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>
                    <a href="/users/show/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
                    <a href="/users/update/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                    <a href="/users/delete/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    <a href="/indent/indents/showIndent/${user.id}" type="button" class="btn btn-sm btn-danger">订单详情</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <c:if test="${currentPage!=1}">
            <td align="left"> <a href="userLists?page=${currentPage-1}" type="button" class="btn btn-sm btn-success">上一页</a></td>
            </c:if>
            <td align="center" colspan="8">${bar}</td>
            <c:if test="${currentPage!=endPage}">
            <td align="left"> <a href="userLists?page=${currentPage+1}" type="button" class="btn btn-sm btn-success">下一页</a></td>
            </c:if>
        </tr>
    </c:if>
    <c:if test="${sessionScope.baseUser.role==0}">
        <tr>
            <td>${baseUser.id}</td>
            <td>${baseUser.name}</td>
            <td>${baseUser.password}</td>
            <td>
                <a href="/users/show/${baseUser.id}" type="button" class="btn btn-sm btn-success">详情</a>
                <a href="/users/update/${baseUser.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                <a href="/indent/indents/showIndent/${baseUser.id}" type="button" class="btn btn-sm btn-danger">我的订单</a>
            </td>
        </tr>
    </c:if>
    </table>
</c:if>



</div>
</body>
</html>
