<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.test1.test2.Bean.StudentBean" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>人员信息</title>
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
<div align="center"><span class="STYLE1">人员信息界面</span></div>
<p><center>学号&nbsp;&nbsp;&nbsp;姓名</center></p>
<br>
<c:choose>
    <c:when test="${not empty students}">
        <c:forEach var="student" items="${students}">
            <center>&nbsp;${student.no}&nbsp;&nbsp;&nbsp;&nbsp;${student.name}</center>
            <br>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <center>没有找到任何人员信息。</center>
    </c:otherwise>
</c:choose>

<form action="/CURD_StuServlet" id="form1" name="form1" method="post">
<center>
    <br>
    <a href="/ryxinxi/rytianjia.jsp" title="人员添加">进入人员添加界面</a>
    <a href="/ryxinxi/ryxiugai.jsp" title="人员修改">进入人员修改界面</a>
    <a href="/ryxinxi/ryshanchu.jsp" title="人员删除">进入人员删除界面</a>
</center>
</form>
</body>
</html>
