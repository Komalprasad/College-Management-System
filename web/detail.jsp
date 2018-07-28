<%-- 
    Document   : detail
    Created on : 7 Jul, 2014, 8:03:13 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komalprasad</title>
    </head>
    <body>
         <form action="Lib.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger">
         </form><br><br>
    <center>
        <form action="printfine.jsp" >
            <input type="submit" value="FINE LIST" style="color: #000000;background-color: white;border: white;font-size: larger;"/>
        </form><br><br>
        <form action="alldetail.jsp" >
            <%
                Calendar c=Calendar.getInstance();
                int k=c.get(Calendar.MONTH)+1;
            %>
            <input type="hidden" value="<%=k%>" name="month"/>
         <input type="submit" value="COMMON LIST" style="color: #000000;background-color: white;border: white;font-size: larger;"/>
        </form>
        <br><br>
        <form action="selectiveprint.jsp">
            <b style="">SEE STUDENT DETAIL</b><br><br>
            <b style="">STUDENT ID</b><br><br>
            <input type="text" name="studentid" style="color: #333333;width: 15em;size: 10em;height: 2em"/><br><br>
            <input type="submit" value="SEE DETAIL" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
    </center>
    </body>
</html>
