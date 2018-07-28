<%-- 
    Document   : Nofine
    Created on : 30 Jun, 2014, 6:51:38 PM
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
    <center>
        <h1 style="color: #333333;width: 15em;size: 10em;height: 4em;font-family: cursive"> NO FINE </h1>
    </center>
    <form action="Nofine">
        <center>
            <%
                String error=(String)request.getAttribute("error");
                if(error!=null)
                {
                  %>
                    <b style="color: tomato"><%=error%></b><br><br>
                    <%  }
            %>
            <b style="color: #333333">ENTER BOOK ID</b><br><br>
            <input type="text" name="bookid" style="color: #333333;width: 15em;size: 10em;height: 2em"/><br><br>
            <input type="submit" value="RETURN BOOK" style="color: #333333;background-color: white;border: white;font-size: larger"/>
            <br><br>
        </center>
    </form>
    </body>
</html>
