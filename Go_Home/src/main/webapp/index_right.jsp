<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/8
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
    <script src="http://www.jq22.com/jquery/vue.min.js"></script>

    <style>
        #showdiv{
            width:900px;
            height:400px;
            background-color: #2B99EA;
            position: absolute;
            left:350px;
            top:190px;
            border-radius:5px;
        }
        #distpicker5{
            position: absolute;
            left:350px;
            top:140px;
        }
        .myshowdiv{
            width:270px;
            height: 170px;
            margin-top:18px;
            margin-left: 23px;
            background-color: #00FFFF;
            float: left;
            border-radius:10px;
        }
        .gohomeinfo_img{
            width:120px;
            height:170px;
            background-color: #0e0e0e;
            border-right:1px;
            float: left;
            border-radius:10px 0 0 10px;
        }
        .gohomeinfo_name{
            width:150px;
            height:23px;
            margin-top:15px;
            border-bottom: 1px;
            float: left;
        }
        .gohomeinfo_info{
            width:150px;
            height:23px;
            border-bottom: 1px;
            float: left;
        }
        .gohomeinfo_age{
            width:150px;
            height:22px;
            margin-top:15px;
            border-bottom: 1px;
            float: left;
        }
        .gohomeinfo_address{
            width:150px;
            height:52px;
            margin-top:20px;
            float: left;
        }
        .myshowimg{
            width:120px;
            height:170px;
            border-radius:10px 0 0 10px;
        }
    </style>

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
    <div style="position: absolute;left:350px;top:600px;">
        <button class="btn btn-Info" onclick="selectTo(1)">上一页</button>
        <span id="showpage"></span>
        <button class="btn btn-Info" onclick="selectTo(2)">下一页</button>
    </div>
