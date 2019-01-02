<%-- 
    Document   : balance
    Created on : 25 Jul, 2014, 7:20:53 PM
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
          <form action="admin.jsp">
            <input type="submit" value="HOMEPAGE" style="background-color: white;border: white;color: #000000;font-size: larger"/>
        </form>
    <center>
        <br><br><br>
        <%
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
                %>
                <b style="color: #ff0000"><%=error%></b>
                <%
            }
        %>
        <form action="sbalance.jsp">
            <b style="color: #000000;font-family: inherit"> STUDENT ID</b><br><br>
            <input type="text" name="studentid" style="color: #000000;background-color: white;size: 10em;height: 2em;width: 10em"/><br><br>
            <input type="submit" value="TRANSPORT" style="color: #ff0033;background-color: white;border: white;font-size: xx-large;font-family: monospace"/>
            <input type="submit" value="HOSTEL" name="hostel" style="color: #ff0033;background-color: white;border: white;font-size: xx-large;font-family: monospace"/>
        </form>
    </center>
    </body>
</html>
