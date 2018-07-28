<%-- 
    Document   : finelist
    Created on : 7 Jul, 2014, 8:10:16 PM
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
        <title>komalprasad</title>
    </head>
    <body>
        <form action="detail.jsp">
            <input type="submit" value="HOMEPAGE" style="color: whitesmoke;background-color: #0000ff;width: 15em;size: 15em;height: 4em">
        </form>
    <center>
        <table style="background-color: coral">
            <tr></tr>
            <td>STUDENT ID</td>
            <td>STUDENT NAME</td>
            <td>FINE</td>
            <td>BRANCH</td>
            <tr></tr>
       <%
           try
           {
               Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from fine");
                while(rs.next())
                {   
                    %>
                    <td style="background-color: #33ffff;color: #009900;width: 5em;size: 5em;height: 4em"><%=rs.getString("studentid")%></td>
                    <td style="background-color: #33ff00;color: whitesmoke;width: 5em;size: 5em;height: 4em"><%=rs.getString("studentname")%></td>
                    <td style="background-color: #ffbd74;color: #66ff66;width: 5em;size: 5em;height: 4em"><%=rs.getString("fine")%></td>
                    <td style="background-color: #d84ad8;color: whitesmoke;width: 5em;size: 5em;height: 4em"><%=rs.getString("branch")%></td>
                    <tr></tr>
        <%
                }
                con.close();
           }
           
           catch(Exception e){}
          
       %>
        </table>
    </center>
    </body>
</html>
