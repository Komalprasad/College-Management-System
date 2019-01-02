<%-- 
    Document   : flist
    Created on : 13 Jul, 2014, 5:49:18 PM
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
         <form action="lecture.jsp" >
            <input type='submit' value="HOMEPAGE" style="color: #000000;background-color:white;border: white;font-size: larger"/>            
        </form>
        <form action="sflist.jsp">
             <br><br>
             <center>
                 <b style="color: #000000;font-family: cursive;font-size: x-large">fine list</b>
             </center><br><br><br>
            <center>
                <select name="branch" style="width: 5em;color: #00cc33;size: 10em;">
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
                <br>
                    <input type='submit' value="next" style="color: #000000;background-color: white;border: white;
                           font-size: xx-large;font-family: cursive"/>
            </center>    
        </form>
    </body>
</html>
