<%-- 
    Document   : asl
    Created on : 12 Feb, 2015, 3:49:37 PM
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
        <input type='submit' value="BACK"  style="color: #000000;background-color: white;border: white;font-size: larger"/><br>            
        </form><br><br>
    <center>
        <form action="chooseap.jsp">        
            <input type='submit' value="ATTENDANCE"  style="color: #000000;background-color: white;border: white;font-size: larger"/><br>
        </form><br><br>
        <form action="lc.jsp">
            <input type="submit" value="LEAVE ATTENDANCE" style="color: #000000;background-color: white;border: white;font-size: larger"/>         
        </form><br><br>
        <form action="sess.jsp">        
            <input type='submit' value="SESSIONAL"  style="color: #000000;background-color: white;border: white;font-size: larger"/><br>
        </form><br><br>
        
        <form action="changepassword.jsp">
            <input  type="submit" value="CHANGE PASSWORD" name="CAHNGEPASSWORD" style="background-color: white;border: white;font-size: larger"/>
        </form>
    </center>
    </body>
</html>
