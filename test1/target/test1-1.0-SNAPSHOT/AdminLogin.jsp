<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
    String username="";
    String passwd="";
    String msg1="";
    String msg2="";
    if (request.getParameter("name")==null)
    { msg1="姓名不能为空";}
    if (request.getParameter("pass")==null)
    { msg2="密码不能为空";}
    if (request.getParameter("name")!=null && request.getParameter("pass")!=null)
    { username=request.getParameter("name");
        passwd=request.getParameter("pass");
        String SQL="SELECT * From admin";
        SQL=SQL+" Where user="+"'"+username+"'"+" And password='"+passwd+"'";

        Connection conn=null;
        Statement stmt=null;
        ResultSet  rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("连接成功");
        }
        catch(ClassNotFoundException ce){
            out.println("失败");
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

        if(!rs.next())
        { response.sendRedirect("error.html"); }
        else
        {response.sendRedirect("ryxinxi.jsp");}
        rs.close();

    }
%>
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
        -->
    </style>
</head>
<body>
<center>
    <p class="STYLE1">管理员登录</p>
    <form id="form1" name="form1" method="post" action="AdminLogin.jsp">
        用户名：<input name="name" type="text" id="name" size="18" value="张永"/>
        <font color="#99FF00"><%=msg1%></font>
        <p>
            密码： <input name="pass" type="password" id="pass" size="18" value="111111"/>
            <font color="#99FF00"><%=msg2%></font>
        <p>
            <input type="submit" name="Submit" value="进入人员信息界面" /></p>
    </form>
</center>
</body>
</html>

