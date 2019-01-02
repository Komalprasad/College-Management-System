<%-- 
    Document   : Lentry
    Created on : 24 Feb, 2015, 1:48:07 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            window.history.forward();
        </script> 
                
    </head>
    <body>
        <h1>LECTURER ENTRY</h1>
    <center>
        <%
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
            %>
            <b style="font-size: medium;color: red"><%=error%></b>
        <%
            }
        %>
        
        <form action="Lentry" method="Post">
        <b style="font-size: large">ENTER NAME</b>
        <b style="color: red">*</b>
        <input type="text" name="lname"/>
        
        <br><br>
        <b style="color: #0000cc;background: #00ff00">TICK THE CLASS TO TEACH BY LECTURER</b>
        <br><br>
        <b style="font-size: large">CS  </b>
        <input type="checkbox" name="l1" value="CS" /><br>
        <b style="font-size: large">EEE</b>
        <input type="checkbox" name="l2" value="EEE" /><br>
        <b style="font-size: large">CE  </b>
        <input type="checkbox" name="l3" value="CE" /><br>
        <b style="font-size: large">ME  </b>
        <input type="checkbox" name="l4" value="ME" /><br>
        <b style="font-size: large">ECE</b>
        <input type="checkbox" name="l5" value="ECE" /><br>
        <b style="font-size: large">IT  </b>
        <input type="checkbox" name="l6" value="IT" /><br>
        <br><br>
        <input type="submit" style="border: white;background: white;font-size: x-large" value="ENTRY"/>
        </form>
    </center>
    </body>
</html>
