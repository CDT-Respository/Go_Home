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

</body>
</html>
