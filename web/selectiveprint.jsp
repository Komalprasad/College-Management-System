<%-- 
    Document   : selectiveprint
    Created on : 9 Jul, 2014, 7:29:10 PM
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
        <form action="detail.jsp">
            <input type="submit" value="BACK" style="color: #000000;background-color: white;border: white;font-size: larger">
        </form>
         <center>
        <h1 style="color: #000000;font-family: cursive">
            STUDENT DETAIL
        </h1>
    </center>
    <form action="Returnall">
        <b style="color: #000000">STUDENT ID</b>
        <input type="text" name="stu" value="<%=request.getParameter("studentid")%>" size="4" readonly="readonly" style="color: #000099"/>   
        <br>
    <center>
        <table style="font-size: larger" cellpadding="5">
            
                <td style="background-color: black;color: white">BOOK ID</td>
                <td style="background-color: black;color: white">STUDENT ID</td>
                <td style="background-color: black;color: white">ISSUE DATE</td>
                <td style="background-color: black;color: white">RETURN DATE</td>
                <td style="background-color: black;color: white">FINE</td>
                <td style="background-color: black;color: white">BRANCH</td>
                <tr></tr>
        <%
            String check=null,n=null;
            int tfine=0,i=0;
            String s;
                    s=request.getParameter("studentid");
                    s=s.toUpperCase();        
            try
            {
                          Class.forName("oracle.jdbc.OracleDriver");
                          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                          Statement st=con.createStatement();
                          ResultSet rs;
                          rs=st.executeQuery("select studentid from fine where studentid='"+s+"'");
                          while(rs.next())
                          {
                              check=rs.getString("studentid");
                          }
                         if(!check.equals(n))
                          {             
                          rs=st.executeQuery("select * from cfine where studentid='"+s+"'");
                          while(rs.next())
                          {
                              i++;
                              String bookid=rs.getString("bookid");
                              String studentid=rs.getString("studentid");
                              String issuedate=rs.getString("issuedate");
                              String returndate=rs.getString("returndate");
                              String fine=rs.getString("fine");
                              String branch=rs.getString("branch");
                              %>
                          <td style="background-color: #ff9999"><%=bookid%></td>
                          <td style="background-color: #9999ff"><%=studentid%></td>
                          <td style="background-color: #ff9999"><%=issuedate%></td>
                          <td style="background-color: #9999ff"><%=returndate%></td>
                          <td style="background-color: #ff9999"><%=fine%></td>
                          <td style="background-color: #9999ff"><%=branch%></td>
                          <tr></tr>    
                
                <%      
                          }
                          
                          rs=st.executeQuery("select fine from fine where studentid='"+s+"'");
                          while(rs.next())
                          {
                              tfine=rs.getInt("fine");
                          }
                          }
                            con.close();
                          %>
                          </table>
                <%
            }            
            catch(Exception e)
            {
                request.setAttribute("error","STUDENT IS NOT PRESENT");
                request.setAttribute("errorc","detail.jsp");
                RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
               
            }
           

        %>
        <b>TOTAL FINE IS <%=tfine%></b>
    </center>
    <b style="color: #000000">TOTAL BOOKS ISSUED
        <input type="text" name="totalbooks" value="<%=i%>" size="1" readonly="readonly" style="color: #000000;"/>
    </b>
    <center>
            <input type="submit" value="RETURN ALL" style="color: #000000;background-color: white;border: white;font-size: larger"/>              
    </center>
    </form>
    </body>
</html>
