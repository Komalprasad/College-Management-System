<%-- 
    Document   : Bookentry
    Created on : 22 Jun, 2014, 6:45:51 PM
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
        <form action="Lib.jsp" >
            <input type="submit" value="HOMEPAGE" style="color: #333333;background-color: white;border: white;font-size: larger"/>
           </form>
        <br><br>
         <%
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
                %>
    <center>
                <b style="color: #ff3f0c"><%=error%></b>
    </center>
                <%
            }
        %>
    <form action="Bookentry">
            <center><h1 style="color:#000000;width: 10em;size: 5em;height: 1em;">BOOK ENTRY</h1></br>
            </center>
                <center>
                    <b style="color: #666666;">BOOK NAME</b>
            <input type="text" name="bookname" style="color: #333333;width: 15em;size: 10em;height: 2em;"/>
            <b style="color: #666666;">AUTHOR</b>
            <input type="text" name="author" style="color: #333333;width: 15em;size: 10em;height: 2em;"/><br><br>
            <b style="color: #666666;">TOTAL BOOK</b>
            <input type="text" name="totalbooks" style="color: #333333;width: 15em;size: 10em;height: 2em;"/>
            <b style="color: #666666;">SUBJECT</b>
            <input type="text" name="subject" style="color: #333333;width: 15em;size: 10em;height: 2em;"/><br><br>
            <b style="color: #666666;">BRANCH</b>
            <select name="type" style="color: #009900; width: 5em;">
                <option >CS</option>
                <option >ME</option>
                <option >CE</option>
                <option >EE</option>
                <option >EC</option>
                <option >COM</option>
                <option >REF</option>
                <option >IT</option>
            </select> 
            <b style="color: #666666;">YEAR</b>
             <select name="year" style="color: #009900; width: 5em;">
                 <option >0</option>
                 <option >4</option>
                 <option >3</option>
                 <option >2</option>
                 <option >1</option>
             </select><br> <br><br>
             <input type="submit" value="ENTER BOOK" style="color: #333333;background-color: white;border: white;font-size: larger"/>
            <br><br>
                </center>
            </form>
       
    </body>
</html>
