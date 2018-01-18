<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/12/26
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>详细信息</title>
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
    <style>
        #alldiv{
            width:350px;
        }
        #imagediv{
            width:200px;
            height:240px;
            float: left;
        }
        #infodiv{
            width:150px;
            height:240px;
            background-color: grey;
            line-height:22px;
            text-align:center;
            float: left;
        }
        #infodiv_two{
            width:350px;
            height:200px;
            background-color: grey;
            float: left;
        }
    </style>
</head>
<body>
    <div class="stars">

    </div>

    <div style="background-color:rgba(255, 255, 255, 0.5);background-size:100% 100%;
        width:300px;height: 400px;position: relative;left: 40%;top:20%;text-align: center;
        color:darkorange">

        <div id="alldiv">
            <div id="imagediv">
                <img src="${pageContext.request.contextPath}/${allInfo[0][10]}" style="width: 200px;height: 240px;">
            </div>
            <div id="infodiv">
                <p>姓名:</p>
                <p>${allInfo[0][5]}</p>
                <p>年龄:</p>
                <p>${allInfo[0][1]}</p>
                <p>性别:</p>
                <p>${allInfo[0][6]}</p>
            </div>
            <div id="infodiv_two">
                <p>失踪时间：${allInfo[0][3]}</p>
                <p>失踪地点：${allInfo[0][12]}</p>
                <p>详情：${allInfo[0][2]}</p>
                <p>联系人姓名：${allInfo[0][16]}</p>
                <p>联系电话：${allInfo[0][18]}</p>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp">主页</a>
        </div>

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
