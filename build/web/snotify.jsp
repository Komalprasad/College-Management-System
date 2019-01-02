<%-- 
    Document   : snotify
    Created on : 27 Sep, 2014, 10:18:25 AM
    Author     : sony
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <%
            String sid=request.getParameter("sid");
            String batch=request.getParameter("batch");
            String branch=request.getParameter("branch");
        %>
        <form action="komal.jsp">
            <input type="submit" value="BACK" style="font-size: larger;background-color: white;border: white"/>
            <input type="hidden" name="pass" value="<%=sid%>" />
             </form>
    <center>
        <table style="color: white" cellpadding="5" cellspacing="5">
            <td style="background: #000000">DATE</td>
            <td style="background: #000000">NOTIFICATION</td>
            <tr></tr>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from notification");
                while(rs.next())
                {
                    %>
                    <td style=" background: #0000FF"><%=rs.getString("don")%></td>
                    <td style=" color: #0000FF"><%=rs.getString("notify")%></td>
                    <tr></tr>
                    <%
                }
                rs=st.executeQuery("select don,notify from notification"+branch+" where branch='"+batch+"'");
                while(rs.next())
                {
                    %>
                    <td style=" background: #0000FF"><%=rs.getString("don")%></td>
                    <td style=" color: #0000FF"><%=rs.getString("notify")%></td>
                    <tr></tr>
                    <%
                }
                komal.close();
            }
            catch(Exception e)
            {
                
            }
        %>
        </table>
    </center>
    </body>
</html>
