<%-- 
    Document   : transport
    Created on : 21 Jul, 2014, 8:42:33 AM
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
            <input type="submit" value="HOMEPAGE" style="color: #000000;border: white;background-color: white;font-size: larger "/>
            </form><br>
        <%
            String fi=null,tf,f,tb,b,sname,sid=null;
            fi=(String)request.getAttribute("facility");
            tf=(String)request.getAttribute("totalfine");
            f=(String)request.getAttribute("fine");
            tb=(String)request.getAttribute("totalbalance");
            b=(String)request.getAttribute("balance");
            sname=(String)request.getAttribute("studentname");
            sid=(String)request.getAttribute("studentid");
            
            if(fi!=null && sid!=null)
            {
                %>
    <center style="background-color: #ffff33">
        <big >
        <b style="color: #00ff00;size: 5em"><%=fi%></b>
        </big><br><br>
        <b style="color: #0000FF">STUDENT NAME </b>
        <b style="color: #f33120"><%=sname    %>  </b>
        <b style="color: #0000FF">STUDENT ID</b>
        <b style="color: #f33120"><%=sid%></b><br><br>
        <b style="color: #33cc00">TOTAL FINE</b>
        <b style="color: #f33120"><%=tf%> </b>
        <b style="color: #33cc00"> FINE </b>
        <b style="color: #f33120"><%=f%></b>
        <b style="color: #33cc00">TOTAL BALANCE</b>
        <b style="color: #f33120"><%=tb%></b>
        <b style="color: #33cc00">BALANCE</b>
        <b style="color: #f33120"><%=b%></b>
       
    </center>
                <%         
            }
            String error=(String)request.getAttribute("error");
            if(error!=null)
            {
                %>
    <center>   <b style="color: #f33120 "><%=error%></b>
    </center>
                <%
            }
        %>
        <br><br>
    <center>
        <form action="Transport">
            <b style="color: #333333" >STUDENT ID</b>
            <input type="text" name="studentid" style="color: #333333;background-color: white;height: 2em;width: 10em"/>
            <b style="color: #333333">AMOUNT</b>
            <input type="text" name="money" style="color: #333333;background-color: white;height: 2em;width: 10em"/>
            <br><br><br>
            <b style="color: #333333;">MONTH OF FEE</b>
            <select name="paidmonth" style="color: #33cc00">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
            </select>
            <b style="color: #333333; ">YEAR</b>
            <select name="paidyear" style="color: #33cc00">
                <option>2014</option>
                <option>2015</option>
                <option>2016</option>
            </select>
            <br><br><br>
            <input type="submit" value="TRANSPORT" name="komal" style="color: #ff0033;border: white;background-color: white;
                   font-size: xx-large;font-family: monospace"/>          
            <input type="submit" value="HOSTEL" name="komal" style="color: #ff0033;border: white;background-color: white;
                   font-size: xx-large;font-family: monospace"/>          
            <br><br><br>
        </form>
    </center>
    </body>
</html>

