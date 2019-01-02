<%-- 
    Document   : leclogin
    Created on : 12 Feb, 2015, 3:28:29 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <form action="lecture.jsp">
            <input type="submit" value="HOMEPAGE" style="border: white;background-color: white;font-family: cursive;
                   font-size: x-large"/>
        </form>
    <center>
        <form action="Leclogin" method="POST">
            <br>
    <br>
      <%
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
                %>
    <center>
        <b style="color: #ff0033"><%=error%></b>
    </center>
                <%
            }
        %>
        <br><br>   
        <input type="password" name="pass" style="border: #0000FF;border-style: inset;width: 15em;size: 10em;height: 3em;" />
        <br><br>     
        <input type="submit" value="Login Id"  style="color: #000000;font-family: cursive;font-size: xx-large;
               background-color: white;border: white;"/>
        </form>
        </center> 
    </body>
</html>
