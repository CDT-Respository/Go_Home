<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/8
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .code {
            font-family: Arial;
            font-style: italic;
            font-weight: bold;
            border: 0;
            letter-spacing: 3px;
            color: blue;
        }
    </style>
    <script type="text/javascript" src="js/checkCode.js">
    </script>
</head>
<body>
    <div>
        <input type="text" id="input" />
        <input type="button" id="checkCode" class="code" onclick="createCode()" />
        <a href="#" onclick="createCode()">看不清楚</a><br>
        <input type="button" value="验证" onclick="validate()" />
    </div>
</body>
</html>
