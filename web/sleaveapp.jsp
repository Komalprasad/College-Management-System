<%-- 
    Document   : sleaveapp
    Created on : 25 Sep, 2014, 7:18:15 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <%
            String branch=request.getParameter("branch");
            String sid=request.getParameter("sid");
            %>
        <form action="komal.jsp">
            <input type="hidden" value="<%=sid%>" name="pass"/>
            <input type="submit" value="HOMEPAGE" style="background: white;border: white;font-size: larger"/>
        </form>
    <center>
        <br><br><br>
        <table style="font-size: large" cellpadding="5" cellspacing="5" >
            <td style="background: #000000;color: white">SERIAL NO.</td>
            <td style="background: #000000;color: white">STATUS</td>
            <td style="background: #000000;color: white">SUBJECT</td>
            <td style="background: #000000;color: white">REASON</td>
            <tr></tr>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system" ,"2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from reception"+branch+" where studentid='"+sid+"'");
                while(rs.next())
                {
                    %>
                    <td style="color: #0000FF"><%=rs.getInt("srno")%></td>
                    <%
                   String s=rs.getString("status");
                   if(s.equals("APPROVED"))
                   {
                    %>
                    <td style="background: #00cc00;color: white"><%=s%></td>
                    <%
                     }
                   else
                   {
                      %>
                    <td style="background: #ff0000;color: white"><%=s%></td>
                    <% 
                   }
                   %>
                    <td style="color: #ff0000"><%=rs.getString("subject")%></td>          
                    <td style="color: #0000FF;width: 20em"><%=rs.getString("reason")%></td>
                    <tr></tr>
                    <%
            }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
        </table>
    </center>
    </body>
</html>
