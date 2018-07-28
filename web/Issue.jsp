<%-- 
    Document   : Issue
    Created on : 26 Jun, 2014, 9:47:53 AM
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
            <input type="submit" value="HOMEPAGE" style="background-color: white;border: white;font-size: larger;font-size: 1em "/>
            </form><br>
    <center>
            <%
                String extra=(String)request.getAttribute("bi");
                String studentid=(String)request.getAttribute("studentid");
                String studentname=(String)request.getAttribute("studentname");
                String fine=(String)request.getAttribute("fine");
                String error=(String)request.getAttribute("error");
                String errorc=(String)request.getAttribute("errorc");
                if(studentid!=null && studentname!=null)
                {
                   
                    %>
                    
                    <b style="color: #ff00ff"> <%=extra%> </b>
                    <b style="color: #009900"><%=studentname%></b>
                    <b style="color: #ff00ff">STUDENT ID</b>
                    <b style="color: #009900"><%=studentid%></b><br><br>
                    <b style="color: #ff00ff">BOOK ID</b>
                    <b style="color: #009900"><%=(String)request.getAttribute("bookid")%></b>
                    <b style="color: #ff00ff">BOOK NAME</b>
                    <b style="color: #009900"><%=(String)request.getAttribute("bookname")%></b>
                    <b style="color: #ff00ff">AUTHOR</b>
                    <b style="color: #009900"><%=(String)request.getAttribute("author")%></b>
                    <%
                    if(fine!=null)
                    {
                        String cfine=(String)request.getAttribute("ca");
                        %>
                    <b style="color:#ff00ff">FINE</b>
                    <b style="color: #009900"><%=fine%></b>
                    <b style="color:#ff00ff">CURRENT FINE</b>
                    <b style="color: #009900"><%=cfine%></b>
                        <%
                    }
                }
                %><br><br>
    </center>
    <br>
        <form action="Issue" style="background-color: white">          
            <b style="color:#eb0945">ISSUE BOOK</b>
             <%          
            if(error!=null && errorc=="Issue")
            {
                %>
    <center>
        <b style="color: #ff0000"><%=error%></b>
    </center>
                <%
            }
        %>
        <br>
             <b style="color:#333333">BOOK ID</b>
             <input type="text" name="bookid" style="width:15em;size:10em;height:2em"/>
             <b style="color:#333333">STUDENTS ID</b>
             <input type="text" name="studentid" style="width:15em;size:10em;height:2em"/>            
             <input type="submit" value="ISSUE BOOK" style="border: white;background-color: white;font-size: larger"/>       
             <br><br>
        </form>
    <br><br>
        <form action="Return" style="background-color: white">
            <b style="color:#eb0945;">RETURN BOOK</b>
            <%          
            if(error!=null && errorc=="return")
            {
                %>
    <center>
        <b  style="color: #ff0000"><%=error%></b>
    </center>
                <%
            }
        %>
        <br>
             <b style="color: #333333">BOOK ID</b>
             <input type="text" name="bookid" style="width: 15em;size: 10em;height: 2em;"/>
             <input type="submit" value="RETURN BOOK" style="background-color: white;border: white;font-size: larger"/>       
             <br><br>
        </form>
        <br><br>
            <form action="Reissue" style="background-color: white">
                <b style="color:#eb0945;">REISSUE BOOK</b>
                 <%          
            if(error!=null && errorc=="reissue")
            {
                %>
    <center>
        <b style="color: #ff0000;"><%=error%></b>
    </center>
                <%
            }
        %>
        <br>
                <b style="color:#333333">BOOK ID</b>
            <input type="text" name="bookid" style="width: 15em;size: 10em;height: 2em;"/>
             <input type="submit" value="REISSUE BOOK" style="background-color: white;border: white;font-size: larger"/>       
             <br><br>
            </form>
        </body>
</html>
