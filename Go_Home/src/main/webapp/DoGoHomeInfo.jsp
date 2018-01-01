<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/12/21
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>DoGoHomeInfo</title>
</head>
<body>
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
</body>
</html>
