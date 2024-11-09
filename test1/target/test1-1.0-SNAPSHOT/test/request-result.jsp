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
  String param2=(String) request.getAttribute("param2");
  out.print("param1=>"+param1+"<br>");
  out.print("param2=>"+param2+"<br>");

  out.println("<h2>内置对象session</h2>");
  String sesionValue=(String) session.getAttribute("session1");
  out.print("session1=>"+sesionValue+"<br>");

  out.println("<h2>内置对象application</h2>");
  String appValue=(String) application.getAttribute("application");
  out.println("application=>"+appValue+"<br>");
%>
</body>
</html>
