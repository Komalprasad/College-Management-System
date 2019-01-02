<%-- 
    Document   : satten
    Created on : 18 Aug, 2014, 1:00:37 AM
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
     <%
            String branch=request.getParameter("branch");
            String batch=request.getParameter("batch");
            String sid=request.getParameter("sid");
            Calendar kops=Calendar.getInstance();
            int month=kops.get(Calendar.MONTH)+1;
            %>
            <form action="komal.jsp">
                <input type="submit" value="BACK" style="background-color: white;border: white;font-size: larger"/>
                <input type="hidden" name="pass" value="<%=sid%>"  />
            </form>
    <center>
        <form action="ssatten.jsp">
            <input type="hidden" name="sid" value="<%=sid%>" />
            <input type="hidden" name="branch" value="<%=branch%>" />
            <input type="hidden" name="batch" value="<%=batch%>" />
             <input type="hidden" name="month" value="<%=month%>" />
            <br><br><br>
            <select name="subject" style="color: #00cc00">           
       
        <%
            
            String subclass=null;
            try
            {
                 Class.forName("oracle.jdbc.driver.OracleDriver");
                          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                          Statement st=con.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from "+branch+" where batchname='"+batch+"'");
                while(rs.next())
                {
                 subclass=rs.getString("classname");
                }
                if(!subclass.equals(null))
                {
                    rs=st.executeQuery("select subject from "+subclass+"");
                    while(rs.next())
                    {
                       %>
                         <option><%=rs.getString("subject")%></option>
                        <% 
                    }
                }
                con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
          </select>
          <br><br>
        <input type="submit" value="See Attendance" style="background-color: white;border: white;font-size: x-large;font-family: cursive"/>
        </form>
    </center>
    </body>
</html>

