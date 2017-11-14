<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/8
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
<div id="all_div">
        <div id="up_div">
            <jsp:include page="index_top.jsp"></jsp:include>
        </div>
        <div id="down_div">


        <div id="down_left_div">
            <jsp:include page="index_left.jsp"></jsp:include>
        </div>

        <div id="down_right_div">
            <jsp:include page="index_right.jsp"></jsp:include>
        </div>


    </div>
</div>
</body>
</html>

