<%-- 
    Document   : Lib
    Created on : 23 Jun, 2014, 6:57:44 PM
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
            String totalbooks=null;
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from total");
			while(rs.next())
			{
				totalbooks=rs.getString("tnb");
			}
                       con.close();
            }catch(Exception e)
            {
            }
            
        %>
        <h1 style="color: #0047b2">
            TOTAL BOOKS
            <b style="color: #00e231;">
                <%=totalbooks%>
            </b>
        </h1>
        <center>
           
        <form action="Bookentry.jsp">
            <input type="submit" value="ENTRY BOOK" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
        <form action="bookbank.jsp">
            <input type="submit" value="BOOK BANK" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
        <form action ="Issue.jsp">
            <input type="submit" value="I R R" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
        <form action="Nofine.jsp">
            <input type="submit" value="NO FINE" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
        <form action="detail.jsp">
            <input type="submit" value="DETAIL" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
            <form action="teachers.jsp">
            <input type="submit" value="LECTURER" style="background-color: white;font-size: larger;border: whitesmoke"/>                
            </form><br><br>
            <form action="Calfine.jsp">
            <input type="submit" value="CALCULATE FINE" style="background-color: white;font-size: larger;border: whitesmoke"/>
        </form><br><br>
            <form action="rebook.jsp">
            <input type="submit" value="REMOVE BOOK" style="background-color: white;font-size: larger;border: whitesmoke"/>                
            </form><br><br>
        </center>
            <form action="index.jsp">
                <b><input type="submit" value="EXIT" style="background-color: white;font-size: larger;border: whitesmoke"/></b>
            </form><br><br>
            
    </body>
</html>
