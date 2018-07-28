<%-- 
    Document   : sbdetail
    Created on : 18 Aug, 2014, 5:00:30 PM
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
            String sid=request.getParameter("sid");
        %>
        <form action="komal.jsp">
            <input type="submit" value="BACK" style="font-size: larger;background-color: white;border: white"/>
            <br><br>
            <input type="hidden" name="pass" value="<%=sid%>" />
             </form>
    <center>
             <table style="color: whitesmoke;font-size:  large;font-weight: 800;background-color: whitesmoke" cellspacing="5" cellpadding="5">
                 <td style="font-size: large;background-color: #000000">BOOK ID</td>
                 <td style="font-size: large;background-color: #000000;width: 8em">ISSUE DATE</td>
                 <td style="font-size: large;background-color: #000000;width: 8em">RETURN DATE</td>
                 <td style="font-size: large;background-color: #000000">FINE</td>
                 <tr></tr>
             <%
             try
             {
                 Class.forName("oracle.jdbc.driver.OracleDriver");
                 Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                 Statement st=c.createStatement();
                 ResultSet rs;
                 rs=st.executeQuery("select * from cfine where studentid='"+sid+"'");
                 while(rs.next())
                 {
                     %>
                     <td style="color: #3300ff"><%=rs.getString("bookid")%></td>
                     <td style="color: #33cc00"><%=rs.getString("issuedate")%></td>
                     <td style="color: #33cc00"><%=rs.getString("returndate")%></td>
                     <td style="color: #33cc00"><%=rs.getString("fine")%></td>
                     <tr></tr>
                 <%
                 }
                 c.close();
             }
             catch(Exception e)
             {
                 
             }
             %>
             </table>
    </center>
    </body>
</html>
