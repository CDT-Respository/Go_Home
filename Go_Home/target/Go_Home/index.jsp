<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/1
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>添加学生</h2>
    <c:if test="${param.rtype==1}">
        <span style="color:green;">添加成功</span>
    </c:if>
    <c:if test="${param.rtype==-1}">
        <span style="color:red;">添加失败</span>
    </c:if>
    <form method="post" action="stuAction/addStu">
        姓名：<input name="sname"/><br/>
        <input type="submit" value="添加"/>
    </form>
</body>
</html>
