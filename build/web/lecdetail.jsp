<%-- 
    Document   : lecdetail
    Created on : 31 Aug, 2014, 7:14:27 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="teachers.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>
        </form>
    <center>
        <table style="color: white " cellspacing="5" cellpadding="5">
            <td style="background-color: #000000">BOOK ID</td>
            <td style="background-color: #000000">LECTURER NAME</td>
            <td style="background-color: #000000">ISSUE DATE</td>
            <td style="background-color: #000000">RETURN DATE</td>
            <tr></tr>
            <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=c.createStatement();
                ResultSet rs=null;
                rs=st.executeQuery("select * from lecbooks");
                while(rs.next())
                {
                   %>
                   <td style="background-color: #0000FF"><%=rs.getString("bookid")%></td>
                   <td style="background-color: #00cc00"><%=rs.getString("lecturername")%></td>
                   <td style="background-color: deeppink"><%=rs.getString("issuedate")%></td>
                   <td style="background-color: springgreen"><%=rs.getString("returndate")%></td>
                   <tr></tr>
            <% 
                }
            }
            catch(Exception e)
            {}
                    
        %>
        </table>
    </center>
    </body>
</html>
