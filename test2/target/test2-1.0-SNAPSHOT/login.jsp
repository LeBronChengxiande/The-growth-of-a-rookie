<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=utf-8" %>
<HTML>
<title>考试界面</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        <!--
        body {
            background-color: #339944;
        }
        -->
    </style>
</head>
<BODY>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<center><font color="#FFFFFF" face="楷体_GB2312" size="+4">在线考试系统</font></center>
<center>
    <HR>
    <FORM ACTION="LoginServlet" METHOD="GET">
        <P>考试科目:<SELECT NAME="Lesson" SIZE="1">
            <OPTION VALUE="JSP">JSP</OPTION>
            <OPTION VALUE="XML">XML</OPTION>
            <OPTION VALUE="ASP">ASP</OPTION>
        </SELECT></P>
        <P>姓名:<INPUT TYPE="TEXT" NAME="Name" VALUE=""></p>
        <P>学号:<INPUT TYPE="TEXT" NAME="No"  VALUE=""></P>
        <p><INPUT TYPE="SUBMIT" NAME="SEND" VALUE="开始考试"></p>
    </FORM>
</center>
<HR>
<!-- 显示错误信息 -->
<center><font color="red" size="+2">
    ${msg}
</font></center>
</BODY>
</HTML>