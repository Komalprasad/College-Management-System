<%-- 
    Document   : printfine
    Created on : 4 Jul, 2014, 7:14:15 PM
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
            <input type="submit" value="HOMEPAGE" style="color: #000000;background-color: white;border: white;font-size: larger">
        </form>
    <center>
        <h1 style="color: #000000;font-family: cursive">
            FINE LIST
        </h1>
    </center>
    <center>
        <%
            String sid=request.getParameter("komal");
            String n=null,check=null;
        %>
        <form>
            <input type="text" value="" name="komal"/>
            <input type="submit" value="SEARCH" style="color: #000000;background-color: white;border: white;font-size: larger">
        </form>
        <table>
            
            <td style="color: #0000ff;width: 8em;size: 10em;height: 2em"><b>STUDENT ID</b></td>
            <td style="color: #0000ff;width: 10em;size: 10em;height: 2em"><b>STUDENT NAME</b></td>
            <td style="color: #0000ff;width: 5em;size: 10em;height: 2em"><b>FINE</b></td>
            <td style="color: #0000ff;width: 5em;size: 10em;height: 2em"><b>BATCH</b></td>
            <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
			Statement st=con.createStatement();
                        ResultSet rs=null;
                        if(sid==null|| sid==""){
			 rs=st.executeQuery("select * from fine");
                        }
                        else
                        {
                            sid=sid.toUpperCase();
                           rs=st.executeQuery("select * from fine where studentid='"+sid+"'");
                        }
			while(rs.next())
			{
                            check=rs.getString("studentid");
                                %>
                                <tr></tr>
                                <td style="color: #ff3333;font-size: larger"><%=check%></td>
                                <td style="color: #009900;font-size: larger"><%=rs.getString("studentname")%></td>
                                <td style="color: #ff3333;font-size: larger"><%=rs.getString("fine")%></td>
                                <td style="color: #4a22ee;font-size: larger"><%=rs.getString("branch")%></td>
                        <% 
			}
                        if(check==null)
                        {
                            %>
                            <br>
                            <b style="color: #ff3333;width: 20em">ENTER THE CORRECT STUDENT ID</b>
                                <%
                        }
                        out.close();
            }catch(Exception e)
            {
            }
        %>
        </table>
    </center>
    </body>
</html>
