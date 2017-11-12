<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/10
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <c:if test="${parameters.status[0]==2}">
        <span style="color:red;">注册失败</span>
    </c:if>
    <div>
        <h2>用户注册</h2>
        <form action="" method="post">
            用户名:<input name="user_loginname"/><br/>
            密码:<input type="password" name="user_loginpwd"/><br/>
            重复密码:<input type="password" id="registPwd"/><br/>
            <input type="submit" value="注册"/>
        </form>
    </div>
    <a href="">主页</a>
</body>
</html>
<script>

</script>
