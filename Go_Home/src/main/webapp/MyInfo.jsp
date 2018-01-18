<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/26
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
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
    width:300px;height: 400px;position: relative;left: 40%;top:30%;text-align: center;
    color:darkorange">
    <h2>个人信息</h2>
    <span id="showstatus"></span>
    <form id="myfrm" action="${pageContext.request.contextPath}/userAction/doUpdateInfo?a=${pageContext.request.contextPath}/${MySelfInfo.userinfo_image}" method="POST" enctype="multipart/form-data">
        <input type="hidden" value="${sessionScope.LoginUser.user_no}" name="user_no"/>
        <input type="hidden" value="${MySelfInfo.userinfo_no}" name="userinfo_no"/>
        姓名:<input name="userinfo_name" value="${MySelfInfo.userinfo_name}" /><br/>
        年龄:<input name="userinfo_age" value="${MySelfInfo.userinfo_age}" /><br/>
        学生性别:<input type="radio" value="男" name="userinfo_sex"/>男<input type="radio" value="女" name="userinfo_sex"/>女<br/>
        电话号码:<input value="${MySelfInfo.userinfo_tel}" name="userinfo_tel" /><br/>
        身份证:<input value="${MySelfInfo.userinfo_code}" name="userinfo_code" /><br/>
        图片:<input type="file" name="imgfile" />
        <br/>
            <img src="${pageContext.request.contextPath}/${MySelfInfo.userinfo_image}" style="width:80px;height: 80px" />
        <br/>
        地址:<input name="userinfo_address" value="${MySelfInfo.userinfo_address}" /><br/>
        <input type="button" onclick="toUpdate()" value="修改信息" />|<input type="submit" value="确认修改" />
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
<script>

    //查看修改状态参数
    var updatetype="${param.doupdatestatus}";
    if(updatetype==1){
        $("#showstatus").text("修改用户信息成功").css("color","green");
    }else if(updatetype==2){
        $("#showstatus").text("修改用户信息失败").css("color","red");
    }else if(updatetype==3){
        $("#showstatus").text("修改用户信息失败").css("color","red");
    }

    //禁用修改
    function pageload(){
        $("input").prop("readonly",true);
        //绑定性别
        var usex="${MySelfInfo.userinfo_sex}";
        if(usex=="男"){
            $("input[name='userinfo_sex'][value='男']").prop("checked",true);
        }else{
            $("input[name='userinfo_sex'][value='女']").prop("checked",true);
        }
    }

    //使可修改
    function toUpdate(){
        $("input").prop("readonly",false);
    }


    window.onload=pageload();
</script>