<%-- 
    Document   : sbalance
    Created on : 26 Jul, 2014, 8:14:02 AM
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
        <form action="balance.jsp">
            <input type="submit" value="BACK" style="background-color: white;color: #000000;border: white; font-size:  larger;"/>
        </form>
        <form action="Bal">
            <%
                    int bal=0;
                    String studentname=null,studentid=null;
                    String error=null;
                    studentid=request.getParameter("studentid");
                    studentid=studentid.toUpperCase();
                    String f=request.getParameter("hostel");
                    error=(String)request.getAttribute("error");
                  
                    if(f==null )
                         f="TRANSPORT";
                     
                    if(error!=null)
                    {
                        %>
                        <center>
                            <b style="color: #ff0000"><%=error%></b>
                        </center>
                        <%
                    }                   
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
            Statement st=con.createStatement();
            ResultSet rs;
            rs=st.executeQuery("select balance,studentname from "+f+" where studentid='"+studentid+"'");
            while(rs.next())
            {
                bal=rs.getInt("balance");
                studentname=rs.getString("studentname");
            }
            con.close();
             }
        catch(Exception e)
        {
         %>
         <input type="text" name="" value="<%=e%>" readonly="readonly" style="color: #0000cc"/>
            <%
        }
                    
            %>
            <center>
               <%
                    if(studentname==null)
                    {
                        request.setAttribute("error","FILL THE CORRECT STUDENT ID");
                        RequestDispatcher rd=request.getRequestDispatcher("balance.jsp");
                        rd.forward(request, response);
                    } %>
                <h1 style="color: #000000;font-family: cursive"><%=f%></h1>
                <b style="color: #0000FF;font-size: medium"><%=studentname%></b><br><br>
                <b style="color: #000000">STUDENT ID</b>   
                <input style="color: #0000cc;width: 10em;size: 10em;height: 2em;" name="studentid" readonly="readonly" value="<%=studentid%>" />
                <b style="color: #000000">CURRENT BALANCE</b>
                <input type="text" name="balance" value="<%=bal%>" readonly="readonly" style="color: #0000cc;width: 10em;size: 10em;height: 2em"/><br><br>
                <b style="color: #000000">ENTER NEW AMOUNT</b>
                <input type="text" name="amount" style="background-color: white;color: #000000;width: 10em;size: 10em;height: 2em"/><br><br>
                <input type="submit" name="facility" value="<%=f%>" style="background-color: white;color: #ff0033;border: white;font-size: xx-large;font-family: monospace"/>
            </center>
            </form>
    </body>
</html>
