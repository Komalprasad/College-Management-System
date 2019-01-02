<%-- 
    Document   : lc
    Created on : 6 Sep, 2014, 8:14:54 AM
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
        <form action="asl.jsp" >
            <input type='submit' value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
        <form action="lcs.jsp" method="Post">
            <br><br><br>
            <center>
                <select name="branch" style="width: 5em;color:  #00cc33;size: 10em;">
                    <option>CS</option>
                    <option>ME</option>
                    <option>CE</option>
                    <option>EEE</option>
                    <option>ECE</option>
                    <option>IT</option>
                </select>
                <select name="semester" style="width: 5em;color: #00cc33;size: 10em;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                </select>
                <br>
                <br><br>
                    <input type='submit' value="ABSENT" name="komal" style="color: #000000;background-color:white;border: white;
                           ;font-size: x-large;font-family: cursive"/>                    
                     <input type='submit' value="PRESENT" name="komal" style="color: #000000;background-color:white;border: white;
                            font-size: x-large;font-family: cursive"/>
            </center>         
        </form>
    </body>
</html>
