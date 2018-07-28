<%-- 
    Document   : alldetail
    Created on : 7 Jul, 2014, 8:37:46 PM
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
        <% 
            String month=request.getParameter("month");
            String kp=request.getParameter("komal");
            String kop=request.getParameter("komalp");
            String kops=null;
            int ti=0,r=0,nr=0;
        %>
         <form action="detail.jsp">
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger">
         </form>
        <center>
            <form action="alldetail.jsp">
                <b>MONTH </b>
                <input type="text" value="<%=month%>" name="month" style="font-size: large;border: white;color: #00cc00"/>
                <b>STUDENT </b>
                <input type="text" value="" name="komal"/>               
                 <b>BOOK </b>
                 <input type="text" value="" name="komalp"/>
                <input type="submit" value="SEARCH" style="background-color: white;border: white;font-size: larger"/>   
              
            </form>
            <br>
            <table style="background-color: white;color: whitesmoke;" cellspacing="3">
     
                <td style="font-size: large;background-color: #000000">BOOK ID</td>
                <td style="font-size: large;background-color: #000000;width: 6em">STUDENT ID</td>
                <td style="font-size: large;background-color: #000000;width: 6em">ISSUE DATE</td>
                <td style="font-size: large;background-color: #000000;width: 7em">RETURN DATE</td>
                <td style="font-size: large;background-color: #000000">FINE</td>
                <td style="font-size: large;background-color: #000000">BATCH</td>
                <tr></tr>
                <%
                    try
                    {
                          Class.forName("oracle.jdbc.driver.OracleDriver");
                          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                          Statement st=con.createStatement();
                           ResultSet rs=null;
                           String issuedate=null;
                           if((kop==""||kop==null) && (kp==""||kp==null))
                           {
                           rs=st.executeQuery("select * from cfine");
                           }
                           else if(kop==""||kop==null)
                           {    
                               kp=kp.toUpperCase();
                               rs=st.executeQuery("select * from cfine where studentid='"+kp+"'");
                           }
                           else
                           {
                               kop=kop.toUpperCase();
                               rs=st.executeQuery("select * from cfine where bookid='"+kop+"'");
                           }
                          while(rs.next())
                          { 
                              issuedate=rs.getString("issuedate");
                              char h[]=new char[5 - 3];
                              issuedate.getChars(3, 5, h, 0);
                              kops=new String(h);
                              boolean komal=kops.contains(""+month+"");
                              if(komal)
                              {ti++;
                              String returndate=rs.getString("returndate");
                          %>
                          <td style="background-color: #0000FF"><%=rs.getString("bookid")%></td>
                          <td style="background-color: #009900"><%=rs.getString("studentid")%></td>
                          <%
                          if(returndate==null)
                          {nr++;
                              %>
                            <td style="background-color: #ff9933 "><%=issuedate%></td>
                            <td></td>  
                            <td></td>
                          <%
                          }
                          if(returndate!=null)
                          {r++;
                              %>
                          <td style="background-color: #009900 "><%=issuedate%></td>    
                          <td style="background-color: #009900"><%=returndate%></td>
                          <td style="color: white;background-color: #ff0000"><%=rs.getString("fine")%></td>
                            <%
                          }
                          %>        
                          <td style="background-color: #009900"><%=rs.getString("branch")%></td>
                          <tr></tr>                         
                <%
                          }
                          }
                            if(issuedate==null)
                              {
                                  %>
                                  <b style="color: #ff0000">ENTER THE CORRECT SEARCH KEYWORD</b>
                                  <br><br>
                          <%
                              }
                          con.close();
                    }
                    catch(Exception e)
                    {out.println(e);}
                   
                %>
                <b style="font-size: large;color: #0000FF">ISSUE BOOKS : </b>
                <b style="font-size: large;color: #009900"><%=ti%> </b>
                <b style="font-size: large;color: #0000FF">RETURN BOOKS : </b>
                <b style="font-size: large;color: #009900"><%=r%> </b>
                <b style="font-size: large;color: #0000FF"> NON RETURN : </b>
                <b style="font-size: large;color: #009900"><%=nr%> </b>
            </table>
        </center>
    </body>
</html>
