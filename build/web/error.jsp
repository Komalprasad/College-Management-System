<%-- 
    Document   : error
    Created on : 30 Jun, 2014, 11:04:50 AM
    Author     : sony
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komalprasad</title>
    </head>
    <body>
 
        <h1 style="font-family: cursive;font-size: xx-large;color: #000000;" > WORK DONE BY KOMAL PRASAD</h1>
        <br><br>
    <center>
        <form action="<%=(String)request.getAttribute("errorc")%>">
            <b style="color: #ff0033;"><%=(String)request.getAttribute("error")%></b>
            <br><br>
        <input type="submit" value="BACK" style="color:#000000;background-color: white;border: white;width: 10em;size: 5em;height: 3em"/>      
        </form>
    </center>
        </body>
</html>
