<%-- 
    Document   : Acsub
    Created on : 10 Jul, 2014, 8:59:09 AM
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
        <title>komalprasad</title>
    </head>
    <body>
        <form action="Afine.jsp" >
            <input type='submit' value="BACK" style="color: #000000;background-color:white;border: white;font-size: larger"/>            
        </form>
        <center>
        <%
            String semester=request.getParameter("semester");
            String branch=request.getParameter("branch"); 
            
        %>
            
        <form action="Cafine">
             <input type="text" name="branch" value="<%=branch%>" readonly="readonly" size="3" style="color: white;border: #000000"/>
             <input type="text" name="semester" value="<%=semester%>" readonly="readonly" size="2" style="color: white;border: #000000" />   
        <br><br>
        <b style="color: #000000;font-family: cursive;font-size: x-large"> SELECT SUBJECT</b><br><br><br>
             <select name="sub" style="color: #3fea4b;">
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
             <br><br><br><br>
             <input type="submit" value="CALCULATE FINE" style="color: #000000;background-color: white;border: white;
                    font-size: larger">
        </form>
        </center>
        </body>
</html>
