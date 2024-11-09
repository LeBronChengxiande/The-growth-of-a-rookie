<%--
  Created by IntelliJ IDEA.
  User: cxd
  Date: 2024/9/30
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%
    String Lesson = request.getParameter("Lesson");
    String Name = request.getParameter("Name");
    String No =  request.getParameter("No");
    String SQL = "Select * From " + Lesson + " Order By th";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver ");
    }
    catch(ClassNotFoundException ce){
        System.out.println(ce.getMessage());
    }
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1?serverTimezone=Asia/Shanghai","root","123456");
        stmt=conn.createStatement();
        rs=stmt.executeQuery(SQL);
    }
    catch(SQLException e){
        System.out.println(e.getMessage());
    }
%>
<HTML>
<title>考试界面</title>
<BODY BGCOLOR=BEIGE>
<CENTER>
    <H1><FONT COLOR=#6699DD>在线考试系统</FONT></H1>
</CENTER>
<H2>考试科目 -- <%=Lesson%><HR></H2>
<FORM Action="score.jsp" Method="GET">
    <INPUT Type="Hidden" Name="Lesson" Value=<%=Lesson%>>
    <INPUT Type="Hidden" Name="No" Value=<%=No%>>
    <INPUT Type="Hidden" Name="Name" Value=<%=Name%>>
    <%
        String TestType = "";
        String leixing = "";
        String tihao = "";
        while (rs.next())    //while循环,显示所有该科目的题目
        {
            leixing = rs.getString("lx");
            tihao = rs.getString("th");
            out.print("<B>" + tihao + "." + rs.getString("tm") + leixing + ":" + rs.getString("fs") + "分</B>");
            out.print("<div>");
            for (int i=1; i<5; i++)          //for循环，显示所有该题的选项
            {
                if (leixing.equals("单选"))
                {
                    TestType = "Radio";
                }
                else
                {
                    TestType = "CheckBox";
                }
                out.print("<INPUT Type=" + TestType + " Name=No" + tihao + " Value=" + i +">" + rs.getString("xx" + String.valueOf(i)) + "<BR>");
            }
            out.print("</div>");
        }
    %>
    <INPUT Type=Submit Value=" 交卷">
</FORM>
<HR>
</BODY>
</HTML>

