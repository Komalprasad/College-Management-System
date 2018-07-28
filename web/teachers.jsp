<%-- 
    Document   : teachers
    Created on : 9 Jul, 2014, 9:14:48 AM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body >
        <form action="Lib.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>
        </form>
            <br>
            <form action="lecdetail.jsp">
                <center>
                    <input type="submit" value="SEE DETAIL" style="color: #009900;background-color: white;
                           border: white;font-size: larger;font-family: cursive"/>
                </center>
            </form>
            <br>
            <form action="Lissue">
                <b style="color: #000000">ISSUE BOOK</b><br><br>
            <b style="color: #000000">BOOK ID</b>
            <input type="text" name="bookid" style="color: #000000;width:15em;size:10em;height:2em"/>
             <b style="color: #000000">LECTURER NAME</b>
            <input type="text" name="lecname" style="color: #000000;width:15em;size:10em;height:2em"/>
            <input type="submit" value="ISSUE BOOK" style="color: #000000;background-color: white;border: white;font-size: larger"/>          
            <br><br>
            </form> 
             <br><br><br>
             <form action="Lreturn">
                 <b style="color:#eb0945">RETURN BOOK</b><br><br>
                 <b style="color: #000000">BOOK ID</b>
            <input type="text" name="bookid" style="color: #000000;width: 15em;size: 10em;height: 2em"/>
            <input type="submit" value="RETURN BOOK" style="color: #000000;background-color: white;border: white;font-size: larger"/>
            <br><br>
             </form> 
    </body>
</html>
