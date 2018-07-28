<%-- 
    Document   : stdetail
    Created on : 18 Aug, 2014, 7:03:16 PM
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
    <%
            String sid=request.getParameter("sid");
            %>
    <body>
         <form action="komal.jsp">
                <input type="submit" value="BACK" style="background-color: white;border: white;font-size: larger"/>
                <input type="hidden" name="pass" value="<%=sid%>"  />
            </form>
    <center>
        <table style="background-color: whitesmoke" cellpadding="5" cellspacing="5">
            <td style="background-color: #000000;color: white">DATE</td>
            <td style="background-color: #000000;color: white;width: 7em">FEE MONTH</td>
            <td style="background-color: #000000;color: white">FEE</td>
            <td style="background-color: #000000;color: white">AMOUNT</td>
            <td style="background-color: #000000;color: white">BALANCE</td>
            <td style="background-color: #000000;color: white">FINE</td>
            <tr></tr>
        
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=c.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from transhostel where studentid='"+sid+"'");
                while(rs.next())
                {
                    %>
                    <td style="color: #0000FF"><%=rs.getString("paydate")%></td>
                    <td style="color: #00cc00"><%=rs.getString("paidmonth")%></td>
                    <td style="color: sandybrown"><%=rs.getString("fee")%></td>
                    <td style="color: #00cc00"><%=rs.getString("paidamount")%></td>
                    <td style="color: springgreen"><%=rs.getString("balance")%></td>
                    <td style="color: #ff3333"><%=rs.getString("fine")%></td>
                    <tr ></tr>
                    <%
                }
                c.close();
            }
            catch(Exception e)
            {
                
            }
                %>
                </table>
    </center>
    </body>
</html>
