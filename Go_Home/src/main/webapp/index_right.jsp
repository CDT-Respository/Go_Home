<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/8
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://www.jq22.com/jquery/vue.min.js"></script>
    <style>
        #showdiv{
            width:900px;
            height:400px;
            background-color: red;
            position: absolute;
            left:350px;
            top:190px;
        }
        #distpicker5{
            position: absolute;
            left:350px;
            top:140px;
        }
    </style>
</head>
<body>
    <%--省市区三级联动查询信息--%>
    <form id="selectfrm" class="form-inline">
        <div id="distpicker5">
            <div class="form-group">
                <label class="sr-only" for="province">Province</label>
                <select class="form-control" id="province"></select>
            </div>
            <div class="form-group">
                <label class="sr-only" for="city">City</label>
                <select class="form-control" id="city"></select>
            </div>
            <div class="form-group">
                <label class="sr-only" for="district">District</label>
                <select class="form-control" id="district"></select>
            </div>
            <div class="form-group">
                <input type="button" class="btn btn-Info" value="查询" onclick="selectbycity()"/>
            </div>
        </div>
    </form>

    <%--显示信息--%>
    <div id="showdiv">

    </div>


    <%--分页按钮--%>
</body>
</html>
