<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>成绩单</title>
</head>
<body bgcolor="BEIGE">
<h2><center>成绩单</center><hr></h2>
<%--<jsp:useBean id="scoreBean" scope="request" class="com.test1.test2.Servlet.ScoreServlet"/>--%>
${scoreBean.name} 同志您好，您的考试成绩统计为：<br>
<center>
    <table border="2" bgcolor="#F1F1F1" width="80%">
        <tr bgcolor="#DDDDDD">
            <td>您参加的科目</td>
            <td>您的分数</td>
        </tr>
        <tr>
            <td>JSP</td>
            <td align="right">${scoreBean.jspScore}</td>
        </tr>
        <tr>
            <td>XML</td>
            <td align="right">${scoreBean.xmlScore}</td>
        </tr>
        <tr>
            <td>ASP</td>
            <td align="right">${scoreBean.aspScore}</td>
        </tr>
    </table>
</center>
<hr>
<a href="login.jsp?No=${scoreBean.no}&Name=${scoreBean.name}">参加其他科目考试</a>
</body>
</html>

