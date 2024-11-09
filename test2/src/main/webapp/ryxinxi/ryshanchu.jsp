<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>人员删除</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-family: "宋体";
            font-size: 36px;
            color: #ff3377;
            font-weight: bold;
        }
        body {	background-color: #339944;}
        -->
    </style>
</head>
<body>
<center>
    <p class="STYLE1">人员删除</p>
    </div>
    <form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/CURD_StuServlet">
        <input type="hidden" name="action" value="delete" />
        学号： <input name="No" type="text" id="No" size="18" >
        <p>
            用户名：<input name="Name" type="text" id="Name" size="18" >
        <p>
            <input type="submit" name="Submit" value="删除" >
    </form>
</center>
</body>
</html>

