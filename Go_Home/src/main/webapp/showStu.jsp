<%--
  Created by IntelliJ IDEA.
  User: SChen
  Date: 2017/11/1
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <tr>
            <td>编号</td>
            <td>姓名</td>
        </tr>
    </table>
</body>
</html>
<script type="text/javascript">
    function oload(){
        $.post("stuAction/findStuList","",function (data) {
            alert(data.sname+","+data.sno);
        });
    }
    window.onload=oload();
</script>