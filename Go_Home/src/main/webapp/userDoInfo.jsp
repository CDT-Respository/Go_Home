<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/9
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>userdoinfopage</title>
</head>
<body>
    <div>
        <h2>请完善个人信息</h2>
        <form action="${pageContext.request.contextPath}/userAction/doInfo" method="post" enctype="multipart/form-data">
                <input type="hidden" name="user_no" value="${doinfouser.user_no}"/>
            姓名:<input name="userinfo_name"/><br/>
            年龄:<input name="userinfo_age"/><br/>
            性别:<input type="radio" name="userinfo_sex" value="男" checked/>男
                 <input type="radio" name="userinfo_sex" value="女"/>女<br/>
            电话:<input name="userinfo_tel"/><br/>
            身份证号码:<input name="userinfo_code" /><br/>
            选择图片:<input type="file" name="imgfile"/><br/>
            详细住址:<input name="userinfo_address"/><br/>
            <input type="submit" value="保存信息"/>
            &nbsp;&nbsp;
            <input type="button" value="取消" onclick="location.href='${pageContext.request.contextPath}/userDoLogin.jsp'"/>
        </form>
    </div>
</body>
</html>
