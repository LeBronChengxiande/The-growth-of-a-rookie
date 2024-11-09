<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String No="";
    String Name="";
    String Lesson="";
    String Msg="";
    if(request.getParameter("Name")!=null)
    {
        No=request.getParameter("No");
        Name=request.getParameter("Name");
        Lesson=request.getParameter("Lesson");
        String SQL="SELECT * FROM chjb";
        SQL=SQL+" Where xh="+"'"+No+"'"+ " And xm='"+Name+"'";
        Connection conn=null;
        Statement stmt=null;
        ResultSet rsScore=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch (ClassNotFoundException e){
            System.out.println(e.getMessage());
        }
        try{
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
            stmt=conn.createStatement();
            rsScore=stmt.executeQuery(SQL);
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        if(!rsScore.next())
        {
            Msg="您不是合法考生！";
        }
        else
        {
            if(rsScore.getInt(Lesson)!=-1)
            {
                Msg="您已经考过本科目了！";
            }
            else
            {
                response.sendRedirect("test.jsp?Lesson="+Lesson+"&Name="+ URLEncoder.encode(Name)+ "&No="+No+"");
            }
        }
    }
%>
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
    <FORM ACTION="login.jsp" METHOD="GET">
        <P>考试科目:<SELECT NAME="Lesson" SIZE="1">
            <OPTION VALUE="JSP">JSP</OPTION>
            <OPTION VALUE="XML">XML</OPTION>
            <OPTION VALUE="ASP">ASP</OPTION>
        </SELECT></P>
        <P>姓名:<INPUT TYPE="TEXT" NAME="Name"   VALUE="<%=Name%>"></p>
        <P>学号:<INPUT TYPE="TEXT" NAME="No"   VALUE="<%=No%>"></P>
        <p><INPUT TYPE="SUBMIT" NAME="SEND" VALUE="开始考试"></p>
    </FORM>
</center>
<HR>
<center><FONT Color="red" size="+2"><%=Msg%></FONT></center>
</BODY>
</HTML>

<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: CHANG XIAO--%>
<%--  Date: 2024/10/11--%>
<%--  Time: 上午10:20--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.sql.*" %>--%>
<%--<%--%>
<%--    String No="";--%>
<%--    String Name="";--%>
<%--    String Lesson="";--%>
<%--    String Msg="";--%>
<%--    if(request.getParameter("Name")!=null)--%>
<%--    {--%>
<%--        No=request.getParameter("No");--%>
<%--        Name=request.getParameter("Name");--%>
<%--        Lesson=request.getParameter("Lesson");--%>
<%--        String SQL ="SELECT * From chjb ";--%>
<%--        SQL=SQL+" Where xh="+"'"+No+"'"+" And xm='"+Name+"'";--%>
<%--        Connection conn=null;--%>
<%--        Statement stmt=null;--%>
<%--        ResultSet rsScore=null;--%>
<%--        try{--%>
<%--            Class.forName("com.mysql.cj.jdbc.Driver");--%>
<%--        }--%>
<%--        catch(ClassNotFoundException ce){--%>
<%--            System.out.println(ce.getMessage());--%>
<%--        }--%>
<%--        try{--%>
<%--            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");--%>
<%--            stmt=conn.createStatement();--%>
<%--            rsScore=stmt.executeQuery(SQL);--%>
<%--        }--%>
<%--        catch(SQLException e){--%>
<%--            System.out.println(e.getMessage());--%>
<%--        }--%>
<%--        if(!rsScore.next())--%>
<%--        {--%>
<%--            Msg="您不是合法考生！";--%>
<%--        }--%>
<%--        else--%>
<%--        {--%>
<%--            if(rsScore.getInt(Lesson)!=-1)--%>
<%--            {--%>
<%--                Msg="您已经考过本科目了！";--%>
<%--            }--%>
<%--            else--%>
<%--            {--%>
<%--                response.sendRedirect("test.jsp?Lesson="+Lesson+"&Name="+Name+"&No="+No+"");--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>
<%--<HTML>--%>
<%--<title>考试界面</title>--%>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--    <style type="text/css">--%>
<%--        <!----%>
<%--        body {--%>
<%--            background-color: #339944;--%>
<%--        }--%>
<%--        -->--%>
<%--    </style>--%>
<%--</head>--%>
<%--<BODY>--%>
<%--<p align="center">&nbsp;</p>--%>
<%--<p align="center">&nbsp;</p>--%>
<%--<p align="center">&nbsp;</p>--%>
<%--<center><font color="#FFFFFF" face="楷体_GB2312" size="+4">在线考试系统</font></center>--%>
<%--<center>--%>
<%--    <HR>--%>
<%--    <FORM ACTION="login.jsp" METHOD="GET">--%>
<%--        <P>考试科目:<SELECT NAME="Lesson" SIZE="1">--%>
<%--            <OPTION VALUE="JSP">JSP</OPTION>--%>
<%--            <OPTION VALUE="XML">XML</OPTION>--%>
<%--            <OPTION VALUE="ASP">ASP</OPTION>--%>
<%--        </SELECT></P>--%>
<%--        <P>姓名:<INPUT TYPE="TEXT" NAME="Name"   VALUE="<%=Name%>"></p>--%>
<%--        <p>学号:<INPUT TYPE="Text" NAME="No"   VALUE="<%=No%>">--%>
<%--        </p>--%>
<%--        <p><INPUT TYPE="SUBMIT" NAME="SEND" VALUE="开始考试"></p>--%>
<%--    </FORM>--%>
<%--</center>--%>
<%--<HR>--%>
<%--<center><FONT Color="red" size="+2"><%=Msg%></FONT></center>--%>
<%--</BODY>--%>
<%--</HTML>--%>

