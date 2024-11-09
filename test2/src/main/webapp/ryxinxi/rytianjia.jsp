<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>人员添加</title>
    <style type="text/css">
        .STYLE1 {
            font-family: "宋体";
            font-size: 36px;
            color: #ff3377;
            font-weight: bold;
        }
        body { background-color: #339944; }
    </style>
</head>
<body>
<center>
    <p class="STYLE1">人员添加</p>
    <form action="/CURD_StuServlet" id="form1" name="form1" method="post">
        <input type="hidden" name="action" value="add">
        用户名：<input name="Name" type="text" id="Name" size="18" value="">
        <p>
            学号： <input name="No" type="text" id="No" size="18" value="">
        </p>
        <p>
            <input type="submit" name="Submit" value="添加">
        </p>
    </form>
</center>
</body>
</html>


