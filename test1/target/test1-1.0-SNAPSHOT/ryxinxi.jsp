<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html><title>人员信息</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <style type="text/css">
        <!--
        .STYLE1 {
            font-family: "宋体";
            font-size: 36px;
            color: #ff3377;
            font-weight: bold;
        }
        -->
        body {	background-color: #339944;}
    </style>
</head>
<body>
<div align="center"><span class="STYLE1">人员信息界面</span></div>
<p> <center>学号&nbsp;&nbsp;&nbsp;姓名</center> </p>
<%
    String SQL ="SELECT * From chjb ";
    Connection conn=null;
    Statement stmt=null;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
    }
    catch(ClassNotFoundException ce){
        out.println(ce.getMessage());
    }
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
        stmt=conn.createStatement();
        rs=stmt.executeQuery(SQL);
    }
    catch(SQLException e){
        System.out.println(e.getMessage());
    }
    while(rs.next())
    {  out.print("<Br>"+"<center>"+"&nbsp;"+rs.getString("xh")+"&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;"+rs.getString("xm")+"</center>"+"</Br>");

    }
%>
<center>
    <a href="rytianjia.jsp" title="人员添加" target="_blank">进入人员添加界面</a>
    <a href="ryxiugai.jsp" title="人员修改" target="_blank">进入人员修改界面</a>
    <a href="ryshanchu.jsp" title="人员删除" target="_blank">进入人员删除界面</a>
</center>
</body>
</html>

