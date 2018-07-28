<%-- 
    Document   : atten
    Created on : 2 Jul, 2014, 4:53:47 PM
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
         <form action="chooseap.jsp">
         <input type="submit" value="CHANGE CLASS" style="color: #009900;background-color: white;border: white;font-size: large">
        </form>
        <%
            
            String semester=request.getParameter("semester");
            String branch=request.getParameter("branch"); 
            String check=request.getParameter("komal");
             
        %>
        <center>
            <big>
            <b style="color: #00cc00;height: 3em">
                FILL THE <b style="color: #ff3366"><%=check%></b> STUDENT  
            </b>
            </big>
        </center>
                       <br>       
        <form action="Calattendance" method="Post">
             <center>
                 <input type="hidden" name="branch" value="<%=branch%>" />
                 <input type="hidden" name="sem" value="<%=semester%>"/>
                 <table style="background-color: whitesmoke;color: whitesmoke;"  cellspacing="5" cellpadding="10"  >
        <%
            int rollno=0;
             String sname,put=null;
             String sub=null;
                 ResultSet rs;       
             { 
                 if(check.equals("ABSENT"))
                 {
                     put="A";
                 }
                 if(check.equals("PRESENT"))
                 {
                     put="P";
                 }  
             }
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
			Statement st=con.createStatement();
                         rs=st.executeQuery("select batchname from "+branch+" where semester='"+semester+"'");
                        while(rs.next())
                        {
                         sub=rs.getString("batchname");
                        }
			 rs=st.executeQuery("select * from "+sub+"");
			while(rs.next())
			{
				rollno=rs.getInt("rollno");
                                sname=rs.getString("studentname");                      
        %>
            <tr></tr>
            <td style="background-color: #0000FF;font-weight: bold"><%=rollno%></td>
            <td style="color: #0000FF"><%=sname%></td>
            <td style="color: #0000FF"><input type="checkbox" name="r<%=rollno%>" value="<%=put%>" /></td>
        <%                         }          
        %>
        </table>
        <br><br>
        <select name="sub" style="color: #00cc33;">
           
        <%
            String classname=null,print;
            {
               rs=st.executeQuery("select classname from "+branch+" where semester='"+semester+"'");
               while(rs.next())
               {
                   classname=rs.getString("classname");
               }
               rs=st.executeQuery("select subject from "+classname+"");
               while(rs.next())
               {
                   print=rs.getString("subject");
                   %>
                  <option><%=print%></option>  
             <%
               }
            }
            con.close();
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
        </select>
        <b style="color: #ff3366">DAY</b>
        <input type="text" name="day" style="color: #000000">
        <b style="color: #000000">MONTH</b>
        <input type="text" name="month" style="color: #000000">
        <b style="color: #000000">YEAR</b>
        <input type="text" name="year" style="color: #000000">
        <br><br><br>
        <input type="submit" name="attendance" value="<%=check%>" style="background-color: white;border: white;color: #000000;width: 10em;height: 3em
               ;font-size: x-large;font-family: sans-serif"/>
        </center>
         </form>
    </body>
</html>
