<%-- 
    Document   : schangepassword
    Created on : 17 Feb, 2015, 2:15:09 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="asl.jsp">
        <input type='submit' value="BACK"  style="color: #000000;background-color: white;border: white;font-size: larger"/><br>            
        </form><br><br>
    <center>
        <h1>CHANGE PASSWORD</h1>
    
        <form action="Changepassword" method="Post">
        <b style="font-family: cursive;color: #000000">OLD PASSWORD</b><br><br>
        <input type="password" name="opass" style="border-bottom-color: #00ff00;font-size: x-large"/><br>
            
        <b style="font-family: cursive;color: #000000">NEW PASSWORD</b><br><br>
        <input type="password" name="pass" style="border-bottom-color: #00ff00;font-size: x-large"/><br>
        <input type="submit" value="change password" style="font-size: x-large;border: white;background-color: white"/>
    </form>
        </center>
    </body>
</html>
