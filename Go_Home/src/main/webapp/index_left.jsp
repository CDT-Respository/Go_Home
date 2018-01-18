<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/8
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div id="menu">
    <input  class="btn btn-Info" onclick="location.href='userDoLogin.jsp'" style="width:273px;" value="登录" type="button"/><br/>
    <input class="btn btn-Info" onclick="location.href='userDoRegist.jsp'" style="width:273px;" value="注册" type="button"/><br/>
    <input class="btn btn-Info" onclick="location.href='userAction/seeMyInfo?user_no=${sessionScope.LoginUser.user_no}'" style="width:273px;" value="我的信息" type="button"/><br/>
    <input class="btn btn-Info" style="width:273px;" value="宝贝寻家" type="button"/><br/>
    <input class="btn btn-Info" style="width:273px;" value="家寻宝贝" type="button"/><br/>
    <input class="btn btn-Info" style="width:273px;"  value="发布信息" type="button"/><br/>
    <input class="btn btn-Info" style="width:273px;" value="退出登录" type="button"/><br/>
</div>
<script>
    //登录状态控制菜单
    var isLogin="${sessionScope.LoginUser.user_no}";
    if(isLogin!=null&&isLogin!=""){
        var m="<input class='btn btn-Info' style='width:273px;' value='宝贝寻家' type='button'/><br/>";
        m+="<input class='btn btn-Info' style='width:273px;' value='家寻宝贝' type='button'/><br/>";
        m+="<input class='btn btn-Info' style='width:273px;' onclick=\"location.href='DoGoHomeInfo.jsp'\" value='发布信息' type='button'/><br/>";
        m+="<input class='btn btn-Info' onclick=\"location.href='userAction/seeMyInfo?user_no=${sessionScope.LoginUser.user_no}'\" style='width:273px;' value='我的信息' type='button'/><br/>";
        m+="<input class='btn btn-Info' style='width:273px;' onclick=\"location.href='${pageContext.request.contextPath}/userAction/cancellationUser'\" value='退出登录' type='button'/><br/>";
        $("#menu").html(m);
    }else{
        var m="<input  class='btn btn-Info' onclick=\"location.href='userDoLogin.jsp'\" style='width:273px;' value='登录' type='button'/><br/>";
        m+="<input class='btn btn-Info' onclick=\"location.href='userDoRegist.jsp'\" style='width:273px;' value='注册' type='button'/><br/>";
        m+="<input class='btn btn-Info' style='width:273px;' onclick='babyfindhome()' value='宝贝寻家' type='button'/><br/>";
        m+="<input class='btn btn-Info' style='width:273px;' onclick='homefindbaby()' value='家寻宝贝' type='button'/><br/>";
        $("#menu").html(m);
    }



    <%--function babyfindhome(){--%>
        <%--infotype=1;--%>
        <%--findData();--%>
    <%--}--%>

    <%--function homefindbaby(){--%>
        <%--infotype=2;--%>
        <%--findData();--%>
    <%--}--%>

    <%--//查询数据的方法--%>
    <%--function findData(){--%>
        <%--var sheng=$("#province option:checked").val();--%>
        <%--var shi=$("#city option:checked").val();--%>
        <%--var qu=$("#district option:checked").val();--%>
        <%--var param="mysheng="+sheng+"&myshi="+shi+"&myqu="+qu+"&thistype="+infotype;--%>
        <%--//查询总条数与计算总页数--%>
        <%--$.post("${pageContext.request.contextPath}/goHomeInfoAction/findGoHomeInfoCount",param,function(data){--%>
            <%--allcount=data;--%>
            <%--if(allcount%6==0){--%>
                <%--allpages=allcount/6;--%>
            <%--}else{--%>
                <%--allpages=Math.floor(allcount/6)+1;--%>
            <%--}--%>
            <%--$("#showpage").text(thispage+"/"+allpages);--%>
            <%--if(allpages==0){--%>
                <%--$("#showdiv").text("没有搜索到信息").css({"font-size":"50px","text-align":"center"});--%>
            <%--}else{--%>
                <%--$("#showdiv").text("").css({"font-size":"20px","text-align":"center"});--%>
            <%--}--%>
        <%--});--%>
        <%--//查询出所有数据--%>
        <%--$("#showdiv div").remove();--%>
        <%--param+="&thispage="+thispage;--%>
        <%--$.post("${pageContext.request.contextPath}/goHomeInfoAction/findGoHomeInfo",param,function(data){--%>
            <%--$.each(data,function(i,v){--%>
                <%--var mydiv="<div class='myshowdiv'>";--%>
                <%--mydiv+="<div class='gohomeinfo_img'><img class='myshowimg' src='${pageContext.request.contextPath}/"+v[0]+"'></div>";--%>
                <%--mydiv+="<div class='gohomeinfo_name'>"+v[1]+"</div>";--%>
                <%--mydiv+="<div class='gohomeinfo_age'>"+v[2]+"</div>";--%>
                <%--mydiv+="<div class='gohomeinfo_address'>"+v[3]+"</div>";--%>
                <%--mydiv+="<div class='gohomeinfo_info'><a href='${pageContext.request.contextPath}/goHomeInfoAction/toShowAllInfo?info_user_no="+v[4]+"&gohomeinfo_no="+v[5]+"'>详情</a></div>";--%>
                <%--mydiv+="</div>";--%>
                <%--$("#showdiv").append(mydiv);--%>
            <%--});--%>
        <%--},"json");--%>
    <%--}--%>
    function babyfindhome(){
        infotype=1;
        thispage=1;
        findData();
    }

    function homefindbaby(){
        infotype=2;
        thispage=1;
        findData();
    }
</script>
