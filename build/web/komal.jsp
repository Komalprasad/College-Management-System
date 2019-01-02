<%-- 
    Document   : komal
    Created on : 17 Aug, 2014, 10:37:11 PM
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
        <form action="sender">
          <%
              String sid=request.getParameter("pass");
              if(sid.equals(""))
              {
                  request.setAttribute("error", "STUDENT ID IS BLANK ");
                  RequestDispatcher rd=request.getRequestDispatcher("slogin.jsp");
                  rd.forward(request, response);
              }
              sid=sid.toUpperCase();
              String sclass,branch,sname=null,trans=null,hos=null;
              try
              {
              char n[]= new char[4 - 0];
              sid.getChars(0, 4, n, 0);
              sclass=new String(n);
              char ne[]=new char[2 - 0];
              sid.getChars(0, 2, ne,0);
              branch=new String(ne);
              
               Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
              ResultSet rs;
              rs=st.executeQuery("select studentid from transport where studentid='"+sid+"'");
              while(rs.next())
              {
                  trans=rs.getString("studentid");
              }
              rs=st.executeQuery("select studentid from hostel where studentid='"+sid+"'");
              while(rs.next())
              {
                  hos=rs.getString("studentid");
              }
              rs=st.executeQuery("select studentname from "+sclass+" where studentid='"+sid+"'");
              while(rs.next())
              {
                  sname=rs.getString("studentname");
              }
              if(!sname.equals(null))
              {
                  %>
    <center><br><br><br>
        <b style="color: #0000FF">BRANCH</b>
        <input type="text" name="branch" value="<%=branch%>" readonly="readonly" style="border: white"/>
        <b style="color: #0000FF">BATCH</b>
        <input type="text" name="batch" value="<%=sclass%>" readonly="readonly" style="border: white"/>
        <b style="color: #0000FF">STUDENT ID</b>
        <input type="text" name="sid" value="<%=sid%>" readonly="readonly" style="border: white"/>
        
        <br><br>
        <b style="color: #00cc33"><%=sname%></b>
        <br><br>
            <input type="submit" value="FINE" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <input type="submit" value="BOOK" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <input type="submit" value="SESSIONAL" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <input type="submit" value="ATTENDANCE" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <input type="submit" value="NOTIFICATION" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <input type="submit" value="LEAVEAPPLICATION" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <%if(trans!=null)
            {
            %>
            <input type="submit" value="TRANSPORT" name="komal" style="background-color: white;border: white;font-size: larger"/>
            <br><br>
            <%      
            }
            %>
            <%if(hos!=null)
            {
            %>
            <input type="submit" value="HOSTEL" name="komal" style="background-color: white;border: white;font-size: larger"/>
             <%      }
            %>
    </center>
        <br><br>        
                <%
              }
              rs.close();con.close();
              }
              catch(Exception e)
              {
                  request.setAttribute("error", "ENTER THE CORRECT STUDENT ID");
                  RequestDispatcher rd=request.getRequestDispatcher("slogin.jsp");
                  rd.forward(request, response);
              }
          %>
          </form>
          <form action="index.jsp">
              <input type="submit" value="EXIT" style="font-size: larger;background-color: white;border: white"/>
          </form>
    </body>
</html>

