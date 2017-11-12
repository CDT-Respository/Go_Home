<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/9
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>userLogin</title>
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
</head>
<body>
    <div>
        <h2>登录</h2>
        <form action="${pageContext.request.contextPath}/userAction/doLogin" method="post">
            用户名:<input name="user_loginname"/><br/>
            密码:<input type="password" name="user_loginpwd"/><br/>
            <input class="btn btn-Info" type="submit" value="登录"/>&nbsp;&nbsp;
            <input class="btn btn-Info" type="button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'" value="游客登录"/>
        </form>
        <a href="${pageContext.request.contextPath}userDoRegist.jsp">用户注册</a>
    </div>
</body>
</html>
