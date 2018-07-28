<%-- 
    Document   : fee
    Created on : 28 Jul, 2014, 8:06:45 AM
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
           <input type="submit" value="HOMEPAGE" style="background-color: white;border: white;color: #000000;font-size: larger"/>
    </form>
    <center>
        <b style="color: #333333;font-family: cursive;font-size: inherit">FEE ENTRY</b><br><br>
        <jsp:scriptlet>
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
            </jsp:scriptlet>
        <b style="color: #009900">
            <jsp:scriptlet>
            out.println(error);
            </jsp:scriptlet>
</b>
                    <jsp:scriptlet>
                }
        </jsp:scriptlet>
        <br><br>
        <form action="Etf">
            <b style="color: #000000">TRANSPORT</b><br><br>
            <b style="color: #333333">ENTER FEE</b>
            <input type="text" name="amount" style="background-color: white;color: #000000;size: 15em;width: 10em;height: 2em"/>    
            <b style="color: #333333">MONTH</b>
            <input type="text" name="month" style="background-color: white;color: #000000;size: 15em;width: 10em;height: 2em"/><br><br>     
            <b style="color: #333333"> AC</b>          
            <input type="radio" name="type" value="1" />
            <b style="color: #333333"> NON-AC</b>
            <input type="radio" name="type" value="2" /><br><br>
            <input type="submit" value="TRANSPORTFEE" name="komal" style="background-color: white;border: white;color: #ff0033;font-size: xx-large;font-family: monospace"/>
        </form><br><br><br>
        <form action="Etf">
            <b style="color: #000000">HOSTEL</b><br><br>
            <b style="color: #333333">ENTER FEE</b>
            <input type="text" name="amount" style="background-color: white;color: #000000;size: 15em;width: 10em;height: 2em"/>                      
            <b style="color: #333333">MONTH</b>
            <input type="text" name="month" style="background-color: white;color: #000000;size: 15em;width: 10em;height: 2em"/><br><br>     
            <b style="color: #333333"> COLLEGE</b>
            <input type="radio" name="type" value="1" />
            <b style="color: #333333"> DELHI</b>
            <input type="radio" name="type" value="2" /><br><br>
            <input type="submit" value="HOSTELFEE" name="komal" style="background-color: white;border: white;color: #ff0033;font-size: xx-large;font-family: monospace"/>
          
        </form>
    </center>
    </body>
</html>
