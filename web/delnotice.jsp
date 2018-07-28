<%-- 
    Document   : delnotice
    Created on : 27 Sep, 2014, 2:10:59 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="Delnotice" method="Post">
        <table style="color: #000000">
            <td>SRNO</td>
            <td style="color: #000000">DATE</td>
            <td style="color: #000000">NOTIFICATION</td>
            <td style="color: #000000">DELETE</td>
            <tr></tr>
        <%
            try
            {
                int i=1;
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs=null;
                rs=st.executeQuery("select * from notification");
                while(rs.next())
                {
                    String srno=rs.getString("srno");
                    %>
                    <td><%=srno%></td>
                    <td><%=rs.getString("don")%></td>
                    <td><input type="text" readonly="readonly"/><%=rs.getString("notify")%></td>
                    <td><input type="checkbox" name="<%=srno%>" value="<%=srno%>"/></td>
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
        </form>
    </body>
</html>
