<%-- 

    Document   : Printbook
    Created on : 29 Jun, 2014, 8:26:52 AM
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
        <form action="Bookentry.jsp">
            <input type="submit" value="ENTER BOOK" style="color: whitesmoke;background-color: #0000FF;width: 15em;size: 5em;height: 3em"/>
        </form>
        <form action="Lib.jsp">
            <input type="submit" value="HOMEPAGE" style="color: whitesmoke;background-color: #0000FF;width: 15em;size: 5em;height: 3em"/>
        </form>
    <center>
        <table style="background-color: whitesmoke" cellpadding="5" cellspacing="5">
            
            <td><b  style="color:#0000ff;width: 15em;size: 10em;height: 3em;"> BOOK ID</b></td>
            <td><b style="color:tomato;width: 15em;size: 10em;height: 3em;"><%=(String)request.getAttribute("bookid")%></b></td>
            <tr></tr>
            <td><b  style="color:#0000ff;width: 15em;size: 10em;height: 3em;">RANGE FROM</b></td>            
            <td><b style="color:tomato;width: 25em;size: 10em;height: 3em;"><%=(String)request.getAttribute("to")%> </b></td>
            <tr></tr>
            <td><b  style="color:#0000ff;width: 15em;size: 10em;height: 3em;">RANGE To</b></td>
            <td><b style="color:tomato;width: 25em;size: 10em;height: 3em;"><%=(String)request.getAttribute("fom")%> </b></td>
            <tr></tr>
            <td><b  style="color:#0000ff;width: 15em;size: 10em;height: 3em;">TOTAL BOOKS</b></td>
            <td><b style="color:tomato;width: 25em;size: 10em;height: 3em;"> <%=(String)request.getAttribute("totalbooks")%></b></td>
            <tr></tr>
            <td><b  style="color:#0000ff;width: 15em;size: 10em;height: 3em;">BOOK NAME</b></td>
            <td><b style="color:tomato;width: 25em;size: 10em;height: 3em;"><%=(String)request.getAttribute("bookname")%></b></td>
        </table>
    </center>
        </body>
</html>
