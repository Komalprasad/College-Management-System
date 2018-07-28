<%-- 
    Document   : appupdate
    Created on : 24 Sep, 2014, 5:15:09 PM
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
        <form action="reception.jsp">
            <input type="submit" value="HOMEPAGE" style="background: white;border: white;font-size: x-large"/>
        </form>
    <center> 
         <%
            String msg=(String)request.getAttribute("msg");
            if(msg!=null)
            {
                %>
                <b style="color: #00cc00;font-size: larger"><%=msg%></b>
                <br><br>
        <%
            }
        %>
        <br><br>
        <form action="Appupdate" method="Post">
            <b style="color: #000000">UPDATE STATUS</b>
            <br><br>
            <b style="color: #000000">SERIAL NO.</b>
            <input type="text" name="srno"/>
            <br><br>
            <b style="color: #000000">STUDENT ID</b>
            <input type="text" name="sid"/>
            <br><br>
            <b style="color: #000000">REASON</b>
            <br>
            <textarea name="reason" rows="5" cols="50">
            </textarea>
            <br><br>
            <b style="color: #000000">STATUS</b>
            <select name="status" style="color: #00cc00">
                <option>APPROVED</option>
                <option>REJECT</option>
            </select><br><br>
            <input type="submit" value="UPDATE" style="color: #000000;font-family: cursive;font-size: x-large;background: white;border: white"/>
        </form>
    </center>
    </body>
</html>
