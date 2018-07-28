<%-- 
    Document   : sessmarks
    Created on : 11 Sep, 2014, 8:43:31 AM
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
            <input type="submit" value="BACK" style="background: white;border: white;font-size: x-large"/>
        </form>
        <form action="sessmarks.jsp" method="POST">
    <center>
        <b  style="font-family: cursive">SELECT SUBJECT </b>
        <br><br>
        <select name="subject" style="color: #00cc00">
        <%
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String batchname=null,classname=null;
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
                rs=st.executeQuery("select subject from "+classname+" ");
                while(rs.next())
                {
                    %>
                         <option><%=rs.getString("subject")%></option>
                    <%
                }
                komal.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
         </select>
         <input type="hidden" value="<%=branch%>" name="branch"/>
         <input type="hidden" value="<%=semester%>" name="semester"/>
         <input type="hidden" value="<%=classname%>" name="classname"/>
         <input type="hidden" value="<%=batchname%>" name="batchname"/>
         <br><br>
         <input type="submit" value="Marks" style="background: white;border: white;font-size: xx-large"/>
    </center>
         </form>
    </body>
</html>
