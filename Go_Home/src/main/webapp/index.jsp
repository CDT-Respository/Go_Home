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
    <title>indexpage</title>
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <%--<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
<div id="all_div">
    <input type="hidden" value="${sessionScope.LoginUser.user_no}"/>
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
<%--分页按钮--%>
<script>
    //总条数
    var allcount=0;
    //当前页
    var thispage=1;
    //总页数
    var allpages=0;
    //寻找范围：1（16岁以下）2（16岁以上）
    var infotype=1;
    //上下页
    function selectTo(what){
        if(what==1){//如果是上一页，判断当前页减一
            if((thispage-1)>0){
                thispage-=1;
            }
            findData();
        }else if(what==2){
            if((thispage+1)<=allpages) {
                thispage += 1;
            }
            findData();
        }else{//第一页点击上一页或最后一页点击下一页  不做操作

        }
    }

    //根据地址查询
    function selectbycity(){
        findData();
    }
    //根据页数查询
    function loaddata(){
        findData();
    }

    //查询数据的方法
    function findData(){
        var sheng=$("#province option:checked").val();
        var shi=$("#city option:checked").val();
        var qu=$("#district option:checked").val();
        var param="mysheng="+sheng+"&myshi="+shi+"&myqu="+qu+"&thistype="+infotype;
        //查询总条数与计算总页数
        $.post("${pageContext.request.contextPath}/goHomeInfoAction/findGoHomeInfoCount",param,function(data){
            allcount=data;
            if(allcount%6==0){
                allpages=allcount/6;
            }else{
                allpages=Math.floor(allcount/6)+1;
            }
            $("#showpage").text(thispage+"/"+allpages);
            if(allpages==0){
                $("#showdiv").text("没有搜索到信息").css({"font-size":"50px","text-align":"center"});
            }else{
                $("#showdiv").text("").css({"font-size":"16px","text-align":"center"});
            }
        });
        //查询出所有数据
        $("#showdiv div").remove();
        param+="&thispage="+thispage;
        $.post("${pageContext.request.contextPath}/goHomeInfoAction/findGoHomeInfo",param,function(data){
            $.each(data,function(i,v){
                var mydiv="<div class='myshowdiv'>";
                mydiv+="<div class='gohomeinfo_img'><img class='myshowimg' src='${pageContext.request.contextPath}/"+v[0]+"'></div>";
                mydiv+="<div class='gohomeinfo_name'>姓名:"+v[1]+"</div>";
                mydiv+="<div class='gohomeinfo_age'>年龄:"+v[2]+"</div>";
                mydiv+="<div class='gohomeinfo_address'>失踪地点:"+v[3]+"</div>";
                mydiv+="<div class='gohomeinfo_info'><a href='${pageContext.request.contextPath}/goHomeInfoAction/toShowAllInfo?info_user_no="+v[4]+"&gohomeinfo_no="+v[5]+"'>详情</a></div>";
                mydiv+="</div>";
                $("#showdiv").append(mydiv);
            });
        },"json");
    }
//    function babyfindhome(){
//        infotype=1;
//        findData();
//    }
//
//    function homefindbaby(){
//        infotype=2;
//        findData();
//    }

    window.onload=loaddata();
</script>
