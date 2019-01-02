<%-- 
    Document   : appentry
    Created on : 24 Sep, 2014, 4:26:31 PM
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
        <br><br>
    <center>
        <%
            String msg=(String)request.getAttribute("msg");
            String srno=(String)request.getAttribute("srno");
            if(msg!=null)
            {
                %>
                <b style="color: #00cc00;font-size: larger"><%=msg%></b>
                <br><br>
        <%
            if(srno!=null)
            {
                %>
                <b style="color: #0000FF">SERIAL NO.</b>
                <b style="color: #ff0033;font-size: larger"><%=srno%></b>
                <br><br>
                <%
            }
            }
        %>
        <form action="Appentry">
        <b style="color: #000000">STUDENT ID</b>
        <input type="text" name="sid"/>
        <br><br>
        <b>SUBJECT :</b>
        <br>
        <textarea name="subject" rows="5" cols="50">
        </textarea>
        <br><br>
        <input type="submit" value="Submit" style="background: white;border: white;font-size: x-large"/>
        </form>
    </center>
    </body>
</html>
