<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/10/21
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.println("<h2>内置对象request</h2>");
  String param1=(String) request.getAttribute("param1");
  out.print("param1=>"+param1+"<br>");

  out.println("<h2>内置对象session</h2>");
  String param2=(String) session.getAttribute("param2");
  out.print("param2=>"+param2+"<br>");

  out.println("<h2>内置对象application</h2>");
  String param3=(String) application.getAttribute("param3");
  out.println("param3=>"+param3+"<br>");
%>
</body>
</html>
