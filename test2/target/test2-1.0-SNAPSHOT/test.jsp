<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>考试界面</title>
</head>
<body bgcolor="beige">
<center>
    <h1><font color="#6699DD">在线考试系统</font></h1>
</center>
<h2>考试科目 -- ${Lesson}<hr></h2>

<form action="ScoreServlet" method="Post">
    <input type="hidden" name="Lesson" value="${Lesson}">
    <input type="hidden" name="No" value="${No}">
    <input type="hidden" name="Name" value="${Name}">
<jsp:useBean id="questions" scope="request" type="java.util.List"/>
    <c:forEach var="question" items="${questions}">
        <div>
            <b>${question.th}. ${question.tm} ${question.lx}: ${question.fs}分</b><br>
            <c:choose>
                <c:when test="${question.lx == '单选'}">
                    <c:set var="inputType" value="radio"/>
                </c:when>
                <c:otherwise>
                    <c:set var="inputType" value="checkbox"/>
                </c:otherwise>
            </c:choose>

            <input type="${inputType}" name="No${question.th}" value="1"> ${question.xx1}<br>
            <input type="${inputType}" name="No${question.th}" value="2"> ${question.xx2}<br>
            <input type="${inputType}" name="No${question.th}" value="3"> ${question.xx3}<br>
            <input type="${inputType}" name="No${question.th}" value="4"> ${question.xx4}<br>
        </div>
        <br>
    </c:forEach>

    <input type="submit" value="交卷">
</form>
<hr>
</body>
</html>
