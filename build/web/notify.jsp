<%-- 
    Document   : notify
    Created on : 27 Sep, 2014, 9:54:55 AM
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
        <form action="lecture.jsp">
            <input type="submit" value="HOMEPAGE" style="background: white;border: white;font-size: large"/>
        </form>
        <br><br>
        <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
                %>
                 <b style="color: #00cc00">
            <%=msg%>
                 </b>
                <%
            }
        %>
        <form action="delnotice.jsp">
            <input type="submit" value="DELETE" style="background: white;border: white;font-size: large"/>
        </form>
        <br><br>
        <form action="Notify" method="Post">
            <center>
                <b style="color: #000000;font-size: x-large">NOTIFICATION</b>
                <br><br>
                <select name="branch" style=" color: #00cc00">
                    <option>ALL</option>
                    <option>CS</option>
                    <option>CE</option>
                    <option>EE</option>
                    <option>EC</option>
                    <option>ME</option>
                    <option>IT</option>
                </select>
                <select name="semester" style="color: #00cc00">
                    <option></option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                </select>
                <br><br>
                <b style="color: #00cc00">WRITE....</b><br>
                <textarea name="notify" rows="10" cols="50">
                </textarea>
                <br><br>
                 <input type="submit" value="NOTIFY" style="background: white;border: white;font-size: large"/>
            </center>
        </form>
    </body>
</html>
