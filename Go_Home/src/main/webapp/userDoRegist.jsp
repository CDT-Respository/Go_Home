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
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src='${pageContext.request.contextPath}/js/prefixfree.min.js'></script>
    <style class="cp-pen-styles">body {
        background: radial-gradient(200% 100% at bottom center, #0070aa, #0b2570, #000035, #000);
        background: radial-gradient(220% 105% at top center, #000 10%, #000035 40%, #0b2570 65%, #0070aa);
        background-attachment: fixed;
        overflow: hidden;
    }

    @keyframes rotate {
        0% {
            transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(0);
        }
        100% {
            transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(-360deg);
        }
    }
    .stars {
        transform: perspective(500px);
        transform-style: preserve-3d;
        position: absolute;
        bottom: 0;
        perspective-origin: 50% 100%;
        left: 50%;
        animation: rotate 90s infinite linear;
    }

    .star {
        width: 2px;
        height: 2px;
        background: #F7F7B6;
        position: absolute;
        top: 0;
        left: 0;
        transform-origin: 0 0 -300px;
        transform: translate3d(0, 0, -300px);
        backface-visibility: hidden;
    }
    </style>
</head>
<body>
    <div class="stars">

    </div>

    <div style="background-color:rgba(255, 255, 255, 0.5);background-size:100% 100%;
        width:300px;height: 300px;position: relative;left: 40%;top:30%;text-align: center;
        color:darkorange">
        <c:if test="${param.status==2}">
            <span style="color: red;">注册失败</span>
        </c:if>
        <div>
            <h2>用户注册</h2>
            <form action="${pageContext.request.contextPath}/userAction/doRegist" method="post">
                用&nbsp; 户&nbsp; 名:<input name="user_loginname" value="${backUser.user_loginname}"><form:errors path="user.user_loginname" cssStyle="color:red;"/> <br/><br/>
                密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码:<input type="password" name="user_loginpwd" value="${backUser.user_loginpwd}"><form:errors path="user.user_loginpwd" cssStyle="color: red"/><br/><br/>
                重复密码:<input type="password" onchange="registPwd(this)"><br/><br/>
                <input class="btn btn-Info" type="submit" value="注册"/>
            </form>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp">主页</a>
    </div>

    <script src='${pageContext.request.contextPath}/js/stopExecutionOnTimeout.js'></script>
    <script>

        $(document).ready(function () {
            var stars = 800;
            var $stars = $('.stars');
            var r = 800;
            for (var i = 0; i < stars; i++) {
                if (window.CP.shouldStopExecution(1)) {
                    break;
                }
                var $star = $('<div/>').addClass('star');
                $stars.append($star);
            }
            window.CP.exitedLoop(1);
            $('.star').each(function () {
                var cur = $(this);
                var s = 0.2 + Math.random() * 1;
                var curR = r + Math.random() * 300;
                cur.css({
                    transformOrigin: '0 0 ' + curR + 'px',
                    transform: ' translate3d(0,0,-' + curR + 'px) rotateY(' + Math.random() * 360 + 'deg) rotateX(' + Math.random() * -50 + 'deg) scale(' + s + ',' + s + ')'
                });
            });
        });

    </script>
</body>
</html>
