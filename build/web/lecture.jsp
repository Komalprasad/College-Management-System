<%-- 
    Document   : lecture
    Created on : 6 Jul, 2014, 7:32:33 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body style="background-color: white">
        <br><br>
    <center>
       
        <b style="color: #333333;font-family: cursive;font-size: 3em">ATTENDANCE SYSTEM</b>
        <br><br><br>
         <%
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
                %>
                <b style="color: #00e231;font-style: oblique;font-size: x-large;background-color: activeborder"><%=error%></b>
        <%
            }
        %>
        <form action="leclogin.jsp">        
        <input type='submit' value="LOGIN"  style="color: #000000;background-color: white;border: white;font-size: larger"/></br>
        </form><br><br>
        <form action="Afine.jsp">        
        <input type='submit' value="CALFINE"  style="color: #000000;background-color: white;border: white;font-size: larger"/></br>
        </form><br><br>
        <form action="flist.jsp">
        <input type="submit" value="FINE LIST" style="color: #000000;background-color: white;border: white;font-size: larger"/>         
        </form><br><br>
        <form action="notify.jsp">
        <input type="submit" value="NOTIFICATION" style="color: #000000;background-color: white;border: white;font-size: larger"/>         
        </form><br><br>
        <form action="Ashow.jsp">
        <input type="submit" value="SHOW ATTANDANCE" style="color: #000000;background-color: white;border: white;font-size: larger"/>
        </form><br><br>
        
        
    </center>
    <form action="login.jsp">
               <input type='submit' value="EXIT"  style="color: #000000;background-color: white;border: white;font-size: larger"/></br> 
    </form>
    </body>    
</html>
