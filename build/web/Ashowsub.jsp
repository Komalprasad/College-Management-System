<%-- 
    Document   : Ashowsub
    Created on : 10 Jul, 2014, 8:18:28 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="Ashow.jsp" method="Post">
            <input type='submit' value="BACK" style="color: #000000;background-color: white;border: white;font-size: larger"/>            
        </form>
          <center>
        <%
            String semester=request.getParameter("semester");
            String branch=request.getParameter("branch"); 
            Calendar kops=Calendar.getInstance();
            int month=kops.get(Calendar.MONTH)+1;
        %>
            
        <form action="showattand.jsp" method="Post">
            <input type="hidden" name="month" value="<%=month%>" />
            <input type="hidden" name="komal" value="" />
            <input type="text" name="branch" value="<%=branch%>" readonly="readonly" size="2" style="color: white;border: white"/>
            <input type="text" name="semester" value="<%=semester%>" readonly="readonly" size="1" style="color: white;border: white"/>   
        <br><br>
        <center>
       
        </center><br><br>
        <select name="sub" style="color: #00cc00;size: 10em;">
            <%
                 
              String classname=null,print;
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
                String k1="select classname from "+branch+" where semester='"+semester+"'";
               ResultSet rs;
               rs=st.executeQuery(k1);
               while(rs.next())
               {
                   classname=rs.getString("classname");
               }
               String k2="select subject from "+classname+"";
               rs=st.executeQuery(k2);
               while(rs.next())
               {
                   print=rs.getString("subject");
                   %>
                  <option><%=print%></option>  
             <%
               }
               con.close();
            }catch(Exception e){}
            
        %>
             </select>
             <br><br>
             <input type="submit" value="SHOW ATTANDANCE" style="color: #000000;background-color: white;border: white;
                    font-size: x-large;font-family: cursive">
        </form>
          </center>
    </body>
</html>
