<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="java.sql.*"%>
<%
    String Lesson = request.getParameter("Lesson");
    String No = request.getParameter("No");
    String Name = request.getParameter("Name");
    String SQL = "";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ResultSet rsScore = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
    }
    catch(ClassNotFoundException ce){
        out.println(ce.getMessage());
        out.println("失败1");
    }
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
        stmt=conn.createStatement();
        rs=stmt.executeQuery("Select * from " + Lesson);
    }
    catch(SQLException e){
        out.println(e.getMessage());
        out.println("失败2");
    }
%>
<HTML><title>成绩单</title>
<BODY BGCOLOR="BEIGE">
<H2><CENTER>成绩单</CENTER><HR></H2>
<%
    int Score = 0;
    while (rs.next())
    {
        String tihao = rs.getString("th");
        if (request.getParameter("No" + tihao)!=null)
        {
            String Sel = request.getParameter("No"+tihao);
            String Ans = rs.getString("jd");
            System.out.println(Ans);
            if (Ans.equals(Sel))
            {
                Score = Score + rs.getInt("fs");
            }
        }
    }
    stmt.close();
    conn.close();
    SQL = "Select * From chjb ";
    SQL = SQL + "Where xh=" + "'" + No + "'" + " And xm='" + Name + "'";
    int iJSP = -1;
    int iXML = -1;
    int iASP = -1;
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
        stmt=conn.createStatement();
        rsScore=stmt.executeQuery(SQL);
        rsScore.next();
        if (!Lesson.equals("JSP"))
            iJSP = rsScore.getInt("JSP");
        else
            iJSP = Score;
        if (!Lesson.equals("XML"))
            iXML = rsScore.getInt("XML");
        else
            iXML = Score;
        if (!Lesson.equals("ASP"))
            iASP = rsScore.getInt("ASP");
        else
            iASP = Score;
        SQL = "update chjb set " + Lesson + " = "  + Score +
                " where xh=" + "'" + No + "'" +
                " And xm='" + Name + "'";
        stmt.executeUpdate(SQL);
    }
    catch(SQLException e){
        System.out.println(e.getMessage());
    }
%>
<%=Name%>同志您好，您的考试成绩统计为：<BR>
<CENTER>
    <TABLE BORDER=2 BGCOLOR="#F1F1F1" WIDTH=80%>
        <TR BGCOLOR="#DDDDDD"><TD>您参加的科目</TD><TD>您的分数</TD></TR>
        <TR><TD>JSP</TD><TD Align=Right><%=iJSP%></TD></TR>
        <TR><TD>XML</TD><TD Align=Right><%=iXML%></TD></TR>
        <TR><TD>ASP</TD><TD Align=Right><%=iASP%></TD></TR>
    </TABLE></center>
<HR>
<A HREF="login.jsp?No=<%=No%>+Name=<%=Name%>">参加其他科目考试</A>
</BODY>
</HTML>


