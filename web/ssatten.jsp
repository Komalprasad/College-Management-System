<%-- 
    Document   : ssatten
    Created on : 18 Aug, 2014, 1:44:47 AM
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
           String subject=request.getParameter("subject");
           String sid=request.getParameter("sid");
           String branch=request.getParameter("branch");
           String batch=request.getParameter("batch");
           String month=request.getParameter("month");
           String all=request.getParameter("all");
           String subclass=null,atten=null,roll=null,nk=null;
           float ta=0,p=0,ne=0,tr=0;
           boolean k=true;
       %>
         <form action="satten.jsp">
                <input type="submit" value="BACK" style="background-color: white;border: white;font-size: larger"/>
                <input type="hidden" name="sid" value="<%=sid%>"  />
                <input type="hidden" name="branch" value="<%=branch%>"  />
                <input type="hidden" name="batch" value="<%=batch%>"  />
            </form>
            <form action="ssatten.jsp"><br>
                <input type="submit" value="CHANGE MONTH" style="background-color: white;border: white;font-size: larger;font-family: cursive"/>
                <input type="text" value="<%=month%>" name="month" style="border: white;size: 5em;color: #00cc00;font-size: larger"/>
                <input type="submit" value="SEE ALL" name="all" style="background-color: white;border: white;font-size: larger;font-family: cursive"/>
                <input type="hidden" name="sid" value="<%=sid%>"  />
                <input type="hidden" name="batch" value="<%=batch%>"  />
                <input type="hidden" name="subject" value="<%=subject%>"  />
                <input type="hidden" name="branch" value="<%=branch%>"  />
            </form><br>
    <center>
        <table cellspacing="5" cellpadding="10" style="font-weight: 600;background-color: #0000FF">
       <%
           try
           {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                          Statement st=con.createStatement();
               ResultSet rs;
               rs=st.executeQuery("select classname from "+branch+" where batchname='"+batch+"'");
               while(rs.next())
               {
                   subclass=rs.getString("classname");
               }
               rs=st.executeQuery("select attdanceclass from "+subclass+" where subject='"+subject+"' ");
               while(rs.next())
               {
                   atten=rs.getString("attdanceclass");
               }
               int a=sid.length();
               if(a==5)
               {
                   char h[]=new char[5 - 4];
               sid.getChars(4, 5, h, 0);
               roll=new String(h);
               }
               else
               {
               char h[]=new char[6 - 4];
               sid.getChars(4, 6, h, 0);
               roll=new String(h);
               }
               rs=st.executeQuery("select * from "+atten+"");
               while(rs.next())
               { 
                   String kops=rs.getString("classdate");
                   if(all==null||all=="")
                   {
                   char h[]=new char[4 -2];
                   kops.getChars(2, 4, h, 0);
                    nk=new String(h);
                   k=nk.contains(""+month+"");
                   }
                   if(k)
                   {tr++;
                   String pa=rs.getString(""+roll+"");
                   if(pa.equals("P"))
                   {
                       p++;ta++;                   
                   %>
                   <td style="background-color: #00cc00;color: whitesmoke;font-weight: 700"><%=kops%></td>
                   <td style="background-color: #00cc00;color: whitesmoke;font-weight: 500"><%=pa%></td>
        <%
                   }
                   else
                   {ta++;
                       %>
                   <td style="background-color: #ff0033;color: whitesmoke;font-weight: 700"><%=kops%></td>
                   <td style="background-color: #ff0033;color: whitesmoke;font-weight: 500"><%=pa%></td>
        <% 
                   }
                   if(tr==5)
                   {tr=0;
        %>
                   <tr></tr>
                   <%}
                   }
                   }
               
               ne=(100 / ta)*p;
              %>
              <b style="color: #000000;font-size: larger"> TOTAL CLASS : </b>
              <b style="color: #0000FF"><%=(int)ta%></b>
              <b style="color: #000000;font-size: larger">  PRESENT : </b>
              <b style="color: #ff0033"><%=(int)p%></b>
              <b style="color: #000000;font-size: larger">  ABSENT : </b>
              <b style="color: #ff0033"><%=(int)ta-(int)p%></b>
              <b style="color: #000000;font-size: larger"> PERCENTAGE : </b>
              <b style="color: #ff0033"><%=(int)ne%></b>
              <br>
              <b style="color: #009900;font-size: larger"><%=subject%></b>
              <br><br>
                   <%
                   ta=0;p=0;ne=0;
               con.close();
           }
           catch(Exception e)
           {
               out.println(e);
           }
       %>
       </table>
    </center>
    </body>
</html>

