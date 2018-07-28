<%-- 
    Document   : continue
    Created on : 8 Jul, 2014, 7:10:55 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komalprasad</title>
    </head>
    <body>
        <form action="asl.jsp" >
            <input type='submit' value="HOMEPAGE" style="color:#000000;background-color: white;border: white;font-size: larger"/>            
        </form>
    <center>
        <form action="chooseap.jsp" >
            <input type='submit' value="CHANGE CLASS" style="color:#000000;background-color: white;border: white;font-size: x-large"/>            
        </form>
    </center>
    <br><br>
    <center>
        <form action="atten.jsp">
            <input type="text" name="branch" value="<%=request.getAttribute("branch")%>" readonly="readonly" style="color:#33cc00;background-color: #ffffff;width: 5em;size: 5em;height: 2em"/>
            <input type="text" name="semester" value="<%=request.getAttribute("semester")%>" readonly="readonly" style="color:#33cc00;background-color:#ffffff;width: 5em;size: 5em;height: 2em"/>
            <br><br><br><br>
            <input type='submit' value="ABSENT" name="komal" style="color:#000000;background-color: white;border: white;
                   font-size: x-large;font-family: cursive;size: 15em"/>
            <input type='submit' value="PRESENT" name="komal" style="color:#000000;background-color: white;border: white;
                   font-size: x-large;font-family: cursive"/>
        </form>
    </center>
    </body>
</html>
