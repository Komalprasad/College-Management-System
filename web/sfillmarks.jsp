<%-- 
    Document   : sfillmarks
    Created on : 11 Sep, 2014, 8:42:36 AM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="sess.jsp">
            <input type="submit" value="Change Class" style="font-family: cursive;background: white;border: white;font-size: x-large"/>
        </form>
        <form action="Sessionl" method="Post">
        <center>
            <b style="color: #ff0000">MAX MARKS</b>
            <input type="text" name="max" value="20" style="color: #00cc00;font-size: x-large;width: 5em"/>
            <br><br>
            <table style="background: whitesmoke;color: white;font-weight: 900" cellspacing="5" cellpadding="5">   
        <%
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String sess=null,classname=null,batchname=null,rollno=null;
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from "+branch+" where semester='"+semester+"'");
                while(rs.next())
                {
                     classname=rs.getString(1);
                     batchname=rs.getString(3);
                }
                rs=st.executeQuery("select rollno,studentname from "+batchname+"");
                while(rs.next())
                {
                    rollno=rs.getString("rollno");
                    %>
                    <td style="background-color: #0000FF"><%=rollno%></td>  
                    <td style="color: #0000FF"><%=rs.getString("studentname")%></td>
                    <td style="color: #ff0000"><input type="text" name="<%=rollno%>" value="0" size="2" style="color: #00cc00"/></td>
                    <tr></tr>
                    <%
                }
                %>
                    
        </table>
                <select name="subject" style="color: #00cc00">
                    <%
                rs=st.executeQuery("select * from "+classname+"");
                while(rs.next())
                {
                    %>        
            <option><%=rs.getString("subject")%></option>
                    <%
                }
            }
            catch(Exception e)
            {
                
            }
        %>
        </select> 
        <b style="color: tomato">DAY</b>
        <input type="text" name="day"/>
        <b>MONTH</b>
        <input type="text" name="month"/>
        <b>YEAR</b>
        <input type="text" name="year"/>
        <br><br>
        <input type="hidden" name="branch" value="<%=branch%>"/>
        <input type="hidden" name="semester" value="<%=semester%>"/>
        <input type="submit" value="Submit" style="font-family: cursive;background: white;border: white;font-size: xx-large"/>
        </center>
        </form>
    </body>
</html>
