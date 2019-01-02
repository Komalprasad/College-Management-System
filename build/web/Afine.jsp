<%-- 
    Document   : Afine
    Created on : 10 Jul, 2014, 8:39:14 AM
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
        <form action="lecture.jsp" >
            <input type='submit' value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
        <form action="Acsub.jsp">
            <br><br>
            <center>
                <b style="color: #000000;font-family: cursive;font-size: x-large">CALCULATE FINE</b><br><br><br><br>
            </center>
            <center>
                <select name="branch" style="width: 5em;color: #00cc00;size: 5em;">
                    <option>CS</option>
                    <option>ME</option>
                    <option>CE</option>
                    <option>EEE</option>
                    <option>ECE</option>
                    <option>IT</option>
                </select>
                <select name="semester" style="width: 5em;color:#00cc00;size: 5em;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                </select>
                <br><br>
                 <input type='submit' value="next"  style="color: #000000;background-color: white;border: white;
                        font-size: x-large;font-family: cursive"/></br>
            </center>
        </form>
    </body>
</html>
