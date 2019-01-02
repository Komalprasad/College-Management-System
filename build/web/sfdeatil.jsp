<%-- 
    Document   : sfdeatil
    Created on : 17 Aug, 2014, 11:22:13 PM
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
            String branch=request.getParameter("branch");
            String batch=request.getParameter("batch");
            String sid=request.getParameter("sid");
            %>
            <form action="komal.jsp" method="Post">
            <input type="submit" value="BACK" style="font-size: larger;background-color: white;border: white"/>
            <br><br>
            <input type="hidden" name="pass" value="<%=sid%>" />
             </form>
    <center>
        <table cellspacing="5" cellpadding="5">
        
            <%
            String subclass=null,subject;
            String subname[]=new String[20];
            String ko[]=new String[20];
            int i=0,j=0,n=0,k=0;
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
                if(!subclass.equals(null))
                {
                    rs=st.executeQuery("select * from "+subclass+" " );
                    while(rs.next())
                    {
                        String atten=rs.getString("attdanceclass");
                        char h[]=new char[6 - 4];
                        atten.getChars(4, 6, h, 0);
                        ko[i]=new String (h);
                        subname[i]=rs.getString("subject");
                        i++;
                    }
                    while(i!=j)
                    {
                    rs=st.executeQuery("select * from "+batch+" where studentid='"+sid+"'");
                    while(rs.next())
                    {
                        n=rs.getInt(""+ko[j]+"");
                     %>
                     <td style=" color: #0000FF;background-color: whitesmoke"><%=subname[j]%></td>
                     <td style="color: #ff0000;background-color: whitesmoke"><%=n%></td>    
                     <tr></tr>
                        <% 
                        j++;
                        k=k+n;
                    }
                    }
                    rs=st.executeQuery("select fine from fine where studentid='"+sid+"'");
                    while(rs.next())
                    {
                        int kom=rs.getInt("fine");
                        %>
                      <td style=" color: #0000FF;background-color: whitesmoke">LIBRARY</td>
                     <td style="color: #ff0000;background-color: whitesmoke"><%=kom%></td>
                     <tr></tr>
                        <%
                        k=k+kom;
     
                    }
                    rs=st.executeQuery("select fine from transport where studentid='"+sid+"'");
                    while(rs.next())
                    {
                        int kom=rs.getInt("fine");
                        %>
                      <td style=" color: #0000FF;background-color: whitesmoke">TRANSPORT</td>
                     <td style="color: #ff0000;background-color: whitesmoke"><%=kom%></td>
                     <tr></tr>
                        <%
                        k=k+kom;
                       
                    }
                    rs=st.executeQuery("select fine from HOSTEL where studentid='"+sid+"'");
                    while(rs.next())
                    {
                        int kom=rs.getInt("fine");
                        %>
                      <td style=" color: #0000FF;background-color: whitesmoke">HOSTEL</td>
                     <td style="color: #ff0000;background-color: whitesmoke"><%=kom%></td>
                     <tr></tr>
                        <%
                        k=k+kom;
                     
                    }
                    %>
                    <b style="color: #000000;font-size: large">TOTAL FINE : <%=k%></b>   
                     <%
                }
                %>
         </table>
    </center>
    </body>
</html>
<%
                out.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
