<%-- 
    Document   : rebook
    Created on : 20 Jul, 2014, 7:25:20 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="Lib.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>
        </form>
        <br>
        <br>
    <center>
         <b style="color: #000000;font-family: cursive">REMOVE BOOK</b>
    </center>
       
        <%
            String bookid=(String)request.getAttribute("error");
            if(bookid!=null)
            {
        %>
    <center> <b style="color: #333333;background-color: whitesmoke"><%=bookid%> BOOK IS REMOVED </b>
    </center>
        <%
            }
        %>
        <br><br>
    <center>
        <form action="Removebook" style="background-color: white">
            <b style="color: #000000">BOOK ID</b><br><br>
            <input type="text" name="bookid" style="color: #333333;width: 15em;size: 10em;height: 2em;"/><br><br>
          <input type="submit" value="REMOVE BOOK" style="color: #000000;background-color: white;border: white;font-size: larger"/>
        </form>
    </center>
    </body>
</html>
