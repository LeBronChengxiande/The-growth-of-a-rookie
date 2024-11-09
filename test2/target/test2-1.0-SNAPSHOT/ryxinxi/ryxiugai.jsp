<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>人员修改</title>
    <style type="text/css">
        <!--
        .STYLE1 {	font-family: "宋体";
            font-size: 36px;
            color: #FF3377;
            font-weight: bold;
        }
        body {	background-color: #339944;}
        -->
    </style>
</head>
<body>
<center>
    <p class="STYLE1">人员修改</p>
    <form id="form1" name="form1" method="post" action="/CURD_StuServlet">
        <input type="hidden" name="action" value="update">
        学号：  <input name="No" type="text" id="No" size="18" value="" >
        <p>
            用户名： <input name="Name" type="text" id="Name" size="18" value="">
        <p>
            <input type="submit" name="Submit" value="修改" >
    </form>
</center>
</body>
</html>

