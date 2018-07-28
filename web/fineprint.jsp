
<%-- 
    Document   : calfineprint
    Created on : 17 Aug, 2014, 8:30:21 AM
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
         <form action="Afine.jsp">
             <input type="submit" value="BACK" style="color: #00cc00;background-color: white;border: white;
                  font-size: x-large;font-family: cursive">
        </form>
        <table style="font-weight: bold;" cellpadding="5" cellspacing="5">
            <center>
        <%
            String subclass=null,batchname=null,atten=null,kp;
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String subject=request.getParameter("sub");
            %>
            <input type="hidden" name="" value="<%=branch%>"  style="color: #00cc00"/>
            <input type="hidden" name="" value="<%=semester%>"  style="color: #00cc00"/>
            <input type="hidden" name="" value="<%=subject%>"  style="color: #00cc00"/>
            <br>
              </center>
            <%
            
            try 
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select classname,batchname from "+branch+" where semester='"+semester+"'");
                while(rs.next())
                {
                    subclass=rs.getString("classname");
                    batchname=rs.getString("batchname");
                }
                rs=st.executeQuery("select attdanceclass from "+subclass+" where subject='"+subject+"'");
                while(rs.next())
                {
                    atten=rs.getString("attdanceclass");
                }
                char h[]=new char[6 - 4];
                atten.getChars(4, 6, h, 0);
                kp=new String(h);
                
                rs=st.executeQuery("select * from "+batchname+"");
                while(rs.next())
                {
                    %>
                    <td style="background-color: #0000FF;color: whitesmoke"><%=rs.getString("rollno")%></td>
                    <td style="color: #00cc00 "><%=rs.getString("studentname")%></td>
                    <td style="color: #ff0000"><%=rs.getString(""+kp+"")%></td>
                    <tr></tr>
                    <%
                }
                rs.close();
                con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
        </table>
    </body>
</html>
