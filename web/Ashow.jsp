<%-- 
    Document   : Ashow
    Created on : 10 Jul, 2014, 8:16:45 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komalPrasad</title>
    </head>
    <body>
        <form action="lecture.jsp" >
            <input type='submit' value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
        <form action="Ashowsub.jsp" method="Post">
            <br>
            <center>
            <b style="color: #000000;font-family: cursive;font-size: x-large">SHOW ATTENDANCE</b>
            </center><br><br><br>
            <center>
                <select name="branch" style="width: 5em;color: #00cc00;size: 5em;">
                    <option style="color:#00cc00 ">CS</option>
                    <option style="color:#00cc00">ME</option>
                    <option style="color:#00cc00">CE</option>
                    <option style="color:#00cc00">EEE</option>
                    <option style="color:#00cc00">ECE</option>
                    <option style="color:#00cc00">IT</option>
                </select>
                <select name="semester" style="width: 5em;color: #00cc00;size: 5em;">
                    <option style="color:#00cc00">1</option>
                    <option style="color:#00cc00">2</option>
                    <option style="color:#00cc00">3</option>
                    <option style="color:#00cc00">4</option>
                    <option style="color:#00cc00">5</option>
                    <option style="color:#00cc00">6</option>
                    <option style="color:#00cc00">7</option>
                </select>
                <br><br>
                <input type="submit" value="next"  style="color: #000000;background-color: white;border: white;
                        font-size: x-large;font-family: cursive"/></br>
            </center>
        </form>
    </body>
</html>
