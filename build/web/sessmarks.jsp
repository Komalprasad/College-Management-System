<%-- 
    Document   : sessmarks
    Created on : 11 Sep, 2014, 1:51:09 PM
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
            String batchname=request.getParameter("batchname");
            String classname=request.getParameter("classname");
            String subject=request.getParameter("subject");
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            %> 
            <form action="sesssub.jsp" method="POST">
                <input type="hidden" value="<%=branch%>" name="branch"/>
                <input type="hidden" value="<%=semester%>" name="semester"/>
                <input type="submit" value="BACK" style="background: white;border: white;font-size: x-large"/> 
            </form>
    <center>
        <%
            String rollno[]=new String[100];
            String name[]=new String[100];
            String dot[]=new String[10];
            String sclass=null;
            int mmax[]=new int[3];
            int no[]=new int[3];
            int i=1,max=1;
            int kp=1;
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select rollno,studentname from "+batchname+"");
                while(rs.next())
                {
                    rollno[i]=rs.getString("rollno");
                    name[i]=rs.getString("studentname");
                    i++;
                }
                rs=st.executeQuery("select sessional from "+classname+" where subject='"+subject+"'");
                while(rs.next())
                {
                    sclass=rs.getString("sessional");
                }
                rs=st.executeQuery("select max,dot from "+sclass+"");
                while(rs.next())
                {
                    no[max]=rs.getInt("max");
                    mmax[max]=rs.getInt("max");
                    dot[max]=rs.getString("dot");
                    max++;
                }
                for(int ko=1;ko<max;ko++)
                {
               
                mmax[ko]=(mmax[ko]*40)/100;
                }
                rs=st.executeQuery("select * from "+sclass+"");
                while(rs.next())
                {
                    %>
                    
                    <table style="background: whitesmoke;color: white;font-weight: 900" cellspacing="5" cellpadding="5">
                    <%
                  %>
                  <br>
                  <b><%=kp%>: SESSIONAL</b>
                  <br>
                    <b>TEST DATE</b>
                    <b style="color: red"><%=dot[kp]%></b>
                    <b style="color: #0000ff">MAX MARKS :</b>
                    <b style="color: red"><%=no[kp]%></b>
                <%   
                for(int n=1;n<i;n++)
                {
                    int marks=rs.getInt(""+rollno[n]);
                    if(marks >= mmax[kp])
                    {
                  %>
                  <td style="background: #0000FF"><%=rollno[n]%></td>
                  <td style="color: #0000FF"><%=name[n]%></td>
                  <td style="color: #00cc00;"><%=marks%></td>
                  <td><%=mmax[kp]%></td>
                  <tr></tr>
                    <%  
                    }
                    else
                    {
                     %>
                  <td style="background: #0000FF"><%=rollno[n]%></td>
                  <td style="color: #0000FF;background: #ff9999"><%=name[n]%></td>
                  <td style="color: #ff0000;"><%=marks%></td>
                  <td><%=mmax[kp]%></td>
                  <tr></tr>
                    <%     
                    }
                }
                kp++;
                }
                komal.close();
            }
            catch(Exception e)
            {
                out.println(e);
                out.println(sclass);
                out.println(classname);
            }
        %>
        </table>
    </center>
    </body>
</html>
