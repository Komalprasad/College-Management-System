<%-- 
    Document   : ssmarks
    Created on : 13 Sep, 2014, 9:54:25 PM
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
            String rollno=null,classname=null;
            String sub[]=new String[20];
            String subject[]=new String[20];
            int k=1,i=1;
            char j='"';
        %>
        <form action="komal.jsp">
            <input type="submit" value="BACK" style="font-size: larger;background-color: white;border: white"/>
            <br><br>
            <input type="hidden" name="pass" value="<%=sid%>" />
             </form>
    <center>
        <table cellpadding="5" cellspacing="5" style="background-color: whitesmoke">
            <td style="color: white;background-color: #000000">SUBJECT</td>
            <td style="color: white;background: #000000">DATE</td>
            <td style="color: white;background-color: #000000">MARKS</td>
            <tr></tr>
        <%
            try
            {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
            Statement st=komal.createStatement();
            ResultSet rs;
            rs=st.executeQuery("select rollno from "+batch+" where studentid='"+sid+"'");
            while(rs.next())
            {
                rollno=rs.getString("rollno");
            }
            rs=st.executeQuery("select classname from "+branch+" where batchname='"+batch+"'");
            while(rs.next())
            {
                classname=rs.getString("classname");
            }
            rs=st.executeQuery("select * from "+classname+"");
            while(rs.next())
            {
                String kn,subj;
                kn=rs.getString("sessional");
                subj=rs.getString("subject");
                if(kn!=null)
                {
                    sub[k]=kn;
                    subject[k]=subj;
                    k++;
                }  
                
            }
            for(int n=1;n<k;n++)
            {
               
                rs=st.executeQuery("select * from "+sub[n]+"");
                while(rs.next())
                {
                    %>
                    <td><%=subject[n]%></td>
                    <td><%=rs.getString("dot")%></td>
                    <td><%=rs.getString(""+rollno+"")%></td>
                    <tr></tr>
        <%
                 }
            }
            komal.close();
            }
            catch(Exception e)
            {
                out.println(e);
                out.println(""+j+""+rollno+""+j+"");
            }
        %>
        </table>
    </center>
    </body>
</html>
