<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/10
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <c:if test="${param.status==2}">
        <span>添加失败</span>
    </c:if>
    <div>
        <h2>用户注册</h2>
        <form action="${pageContext.request.contextPath}/userAction/doRegist" method="post">
            用户名:<input name="user_loginname" value="${backUser.user_loginname}"><form:errors path="user.user_loginname" cssStyle="color:red;"/> <br/>
            密码:<input type="password" name="user_loginpwd" value="${backUser.user_loginpwd}"><form:errors path="user.user_loginpwd" cssStyle="color: red"/><br/>
            重复密码:<input type="password" onblur="registPwd(this)"><br/>
            <input type="submit" value="注册"/>
        </form>
    </div>
    <a href="${pageContext.request.contextPath}/index.jsp">主页</a>
</body>
</html>
<script>
    window.onload=function(){
        $("input[type='submit']").prop("disabled",true);
    }
    function registPwd(opt){
        if(opt.value==$("input[name='user_loginpwd']").val()){
            $("input[type='submit']").prop("disabled",false);
        }else{
            $("input[type='submit']").prop("disabled",true);
        }
    }
</script>
