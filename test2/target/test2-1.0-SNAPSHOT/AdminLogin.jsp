<%@ page contentType="text/html; charset=utf-8"%>
<html>
<title>管理员登录</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-family: "宋体";
            font-size: 36px;
            color: #FF33FF;
            font-weight: bold;
        }
        body {	background-color: #339944;}
        .error-msg {
            color: #ff8c00;
            font-size: 16px;
            margin-left: 10px;
        }
        -->
    </style>
</head>
<body>
<center>
    <p class="STYLE1">管理员登录</p>
    <form id="form1" name="form1" method="post" action="AdminServlet">
        <div>
            用户名：
            <input name="username" type="text" id="username" size="18" value="张永"/>
            <span class="error-msg">${msg1}</span>
        </div>
        <div style="margin-top: 10px;">
            密码：
            <input name="password" type="password" id="password" size="18" value="111111"/>
            <span class="error-msg">${msg2}</span>
        </div>
        <div style="margin-top: 20px;">
            <input type="submit" name="Submit" value="进入人员信息界面" />
        </div>
    </form>
</center>
</body>
</html>

