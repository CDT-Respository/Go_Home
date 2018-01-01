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
</head>
<body>
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