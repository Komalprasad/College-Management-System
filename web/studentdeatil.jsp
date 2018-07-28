<%-- 
    Document   : studentdeatil
    Created on : 16 Aug, 2014, 8:40:04 AM
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
       <form action="admin.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #333333;background-color: white;font-size: larger;border: white"/>
            </form>
    <center>
        <h1 style="font-family: cursive"> STUDENT DETAIL</h1>
    
        <form action="transhostel.jsp">
            <b> STUDENT ID</b><br><br>
            <input type="text" name="sid"/><br>
            <%
                String error=(String)request.getAttribute("error");
                if(error!=null)
                {
                    %>
                    <br><b style="color: #00cc00"><%=error%></b><br>
            <%
                }
            %>
            <br>
            <input type="submit" value="TRANSPORT" style="color: #ff0033;background-color: white;
                  font-size: xx-large;font-family: monospace;border: whitesmoke;"/>                      
            <input type="submit" value="HOSTEL" style="color: #ff0033;background-color: white;
                   font-size: xx-large;font-family: monospace;border: whitesmoke;"/>        
        </form>
        </center>
    </body>
</html>
