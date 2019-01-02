<%-- 
    Document   : transhostel
    Created on : 16 Aug, 2014, 8:55:38 AM
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
        <form action="admin.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #333333;background-color: white;font-size: large;border: whitesmoke"/>
            </form>
               <%
                   String  studentid=request.getParameter("sid");
          String f=request.getParameter("TRANSPORT");
          if(f==null)
              f="HOSTEL";
          if(studentid=="")
          {
              request.setAttribute("error", "STUDENT ID MAY NOT BE BLANK");
              RequestDispatcher rd=request.getRequestDispatcher("studentdeatil.jsp");
              rd.forward(request, response);
          }
          studentid=studentid.toUpperCase();
               %>
    <center>
        <h1 style="font-family: cursive;"> STUDENT DETAIL</h1>
       
        <%
          String c=null;
          try
          {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
          Statement st=con.createStatement();
          ResultSet rs;
          rs=st.executeQuery("select studentname from transhostel where studentid='"+studentid+"'");
          while(rs.next())
          {
              c=rs.getString("studentname");
          }
          if(!c.equals(null))
          {
              %>
              <b style="font-size: xx-large;color: #0000cc"><%=c.toLowerCase()%></b><br><br>
         <table cellpadding="5" cellspacing="5">
        <td style="background-color: #ccffcc">STUDENT ID</td>
        <td style="background-color: #ffcccc" >FEE</td>
        <td style="background-color: #ccffcc">DATE</td>
        <td style="background-color: #ffcccc">PAID MONTH</td>
        <td style="background-color: #ccffcc">AMOUNT</td>
        <td style="background-color: #ffcccc">FINE</td>
        <td style="background-color: #ccffcc">BALANCE</td>
        <tr></tr>
        <%
          rs=st.executeQuery("select * from transhostel where studentid='"+studentid+"'");
          while(rs.next())
                  {
                      String n=rs.getString("studentid");
                      {
                      %>
                      <td style="background-color: #ffcccc"><%=n%></td>
                      <td style="background-color: #ccffcc"><%=rs.getString("fee")%></td>
                      <td style="background-color: #ffcccc"><%=rs.getString("paydate")%></td>
                      <td style="background-color: #ccffcc"><%=rs.getString("paidmonth")%></td>
                      <td style="background-color: #ffcccc"><%=rs.getString("paidamount")%></td>
                      <td style="background-color: #ccffcc"><%=rs.getString("fine")%></td>
                      <td style="background-color: #ffcccc"><%=rs.getString("balance")%></td>
                      <tr></tr>
                      <%
                  }
                      if(n==null)
                      {
                            request.setAttribute("error","STUDENT DOESN'T SUBMITTED FEE" );
                            RequestDispatcher rd=request.getRequestDispatcher("studentdeatil.jsp");
                            rd.forward(request, response);
                      }
          }
          }
          con.close();
          }
          
          catch(Exception e)
          {
              request.setAttribute("error","ENTER THE CORRECT STUDENT ID" );
              RequestDispatcher rd=request.getRequestDispatcher("studentdeatil.jsp");
              rd.forward(request, response);
          }
        %>
        </table>
    </center>
    </body>
</html>
