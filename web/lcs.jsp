<%-- 
    Document   : lcs
    Created on : 6 Sep, 2014, 8:18:07 AM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
    
    
        <%
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String kp=request.getParameter("komal");            
            String classname=null;
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select classname from "+branch+" where semester='"+semester+"'");
                while(rs.next())
                {
                    classname=rs.getString("classname");
                }
                %>
       
         <form action="lc.jsp" >
            <input type='submit' value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
    <center>
        <%
        String error=(String)request.getAttribute("error");
        if(error!=null)
        {
            %>
            <b style="color: #f33120">
                <%=error%>
            </b>
    <%
        }
    %>
        <form action="Leaveapp">
            <input type="hidden" name="branch" value="<%=branch%>" />
            <input type="hidden" name="semester" value="<%=semester%>" />
            <b style="color: #333333">ROLL NUMBER</b><br><br>
            <input type="text" name="rollno" style="color: #009900"/><br>
            <br>
            <b >ENTER DATE </b><br>
            <br>
            <b>FROM</b>
            <br><br>
            <b>DAY</b>
            <input type="text" name="fday" style="width: 3em;color: #009900" />
            <b>MONTH</b>
            <select name="fmon" style="color: #00cc00;border: white">
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
            <br><br><br>
            <b>TO</b>
            <br><br>
            <b>DAY</b>
            <input type="text" name="tday" style="width: 3em;color: #009900" />
            <b>MONTH</b>
            <select name="tmon" style="color: #00cc00;border: white;color: #009900">
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
            <br><br><br>
            <b>SUBJECT</b> 
            <br><br>
            <select name="subject" style="color: #00cc00">
             <%
                rs=st.executeQuery("select subject from "+classname+"");
                while(rs.next())
                {
                    %>
                    <option><%=rs.getString("subject")%></option>
                <%
                }
                komal.close();
            }
            catch(Exception e)
            {}
        %>
        </select>
        <br><br>
        <input type="submit" value="<%=kp%>" name="***" style="background-color: white;border: white;font-size: xx-large" />
        </form>
    </center>
    </body>
</html>
