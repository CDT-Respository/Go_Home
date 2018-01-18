<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/12/21
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DoGoHomeInfo</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src='js/prefixfree.min.js'></script>
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
<div style="background-color:rgba(255, 255, 255, 0.5);background-size:100% 100%;
    width:300px;height: 300px;position: relative;left: 40%;top:30%;text-align: center;
    color:darkorange">
    <c:if test="${param.status==1}">
        <span style="color: red;">发布失败</span>
    </c:if>
    <form action="${pageContext.request.contextPath}/goHomeInfoAction/doGoHomeInfo" method="post" enctype="multipart/form-data">
            <input type="hidden" name="user_no" value="${sessionScope.LoginUser.user_no}"/>
        姓名:<input name="gohomeinfo_name"/><br/>
        性别:<input type="radio" name="gohomeinfo_sex" value="男" checked/>男
             <input type="radio" name="gohomeinfo_sex" value="女" />女<br/>
        年龄:<input name="gohomeinfo_age"/><br/>
        走失时间:<input type="date" name="losstime"/><br/>
        走失地点:<input name="gohomeinfo_lossaddress"/><br/>
        图片:<input type="file" name="gfile" />
        <br/>
        类型:<input type="radio" name="gohomeinfo_type" value="1" checked/>宝贝寻家
        <input type="radio" name="gohomeinfo_type" value="2" />家寻宝贝<br/>
        详细描述:<textarea name="gohomeinfo_detailedinfo"></textarea>
        <input type="submit" value="发布信息"/>
    </form>
    <a href="${pageContext.request.contextPath}/index.jsp">主页</a>
</div>
<div class="stars">

</div>
<script src='js/stopExecutionOnTimeout.js'></script>

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
