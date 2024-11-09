<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%
    String Name="";
    String No="";
    if(request.getParameter("Name")!=null && request.getParameter("No")!=null)
    {
        No=request.getParameter("No");
        Name=request.getParameter("Name");
        String SQL="delete from chjb where xh='"+No+"'";
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        try
        {  Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(ClassNotFoundException ce)
        {    out.println(ce.getMessage());
        }
        try{
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
            stmt=conn.createStatement();

        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        stmt.executeUpdate(SQL);
        response.sendRedirect("ryxinxi.jsp");
    }
%>
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
    <form id="form1" name="form1" method="post" action="ryshanchu.jsp">
        学号： <input name="No" type="text" id="No" size="18" >
        <p>
            用户名：<input name="Name" type="text" id="Name" size="18" >
        <p>
            <input type="submit" name="Submit" value="删除" >
    </form>
</center>
</body>
</html>

