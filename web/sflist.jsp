<%-- 
    Document   : sflist
    Created on : 14 Jul, 2014, 5:40:45 PM
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
           String semester=request.getParameter("semester");
           String roll=request.getParameter("rollno");
           %>
        <form action="flist.jsp">
            <input type="submit" value="BACK" style="color: #000000;background-color: white;border: white;font-size: larger">
        </form>
        <form><center>
            <input type="text" value="" name="rollno" style="border: #009900;border-style: double"/>
            <input type="hidden" value="<%=branch%>" name="branch"/>
            <input type="hidden" value="<%=semester%>" name="semester"/>
            <input type="submit" value="SEARCH" style="background: white;border: white;font-size: x-large"/>
            </center>
        </form>
            <table style="color: white;font-size: " cellpadding="5" cellspacing="5">
            <td style="background-color: #000000">ROLL NO</td>
            <td style="background-color: #000000">STUDENT NAME</td>
       
       <%
           String classname=null,batchname=null;
           int i=1,n=1,ko,transfine=0,hosfine=0,th;
           int start =4;
           int end =6,fine=0,totalfine=0,lfine=0;
           int rollno[]=new int[100];
           String fcol[]=new String [100];
           String sub[]=new String[100];
           String studentid[]=new String[100];
           char j='"';
           try
           {
               
                Class.forName("oracle.jdbc.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select classname,batchname from "+branch+" where semester='"+semester+"'");
                while(rs.next())
                {
                    classname=rs.getString("classname");
                    batchname=rs.getString("batchname");
                }
                rs=st.executeQuery("select subject,attdanceclass from "+classname+"");
                while(rs.next())
                {
                    String s=rs.getString("subject");
                    String attanclass=rs.getString("attdanceclass");
                    %>
                    <td style="background-color: #000000"><%=s%></td>
                    <%
                    char hansu[]=new char[end - start];
                         attanclass.getChars(start, end, hansu,0);
                         String test=new String(hansu);
                         fcol[i]=test;
                i++;
                }
                %>
                    <td style="background-color: #000000">LIBRARY FINE</td> 
                    <td style="background-color: #000000">T/H FINE</td> 
                <%
                if(roll==null||roll=="")
                rs=st.executeQuery("select * from "+batchname+"");
                else
                    rs=st.executeQuery("select * from "+batchname+" where rollno='"+roll+"'");
                while(rs.next())
                {
                    rollno[n]=rs.getInt("rollno");
                    sub[n]=rs.getString("studentname");
                    studentid[n]=rs.getString("studentid");
                    n++;
                }
                   
                for(int ne=1;ne<n;ne++)
                {
                    %>
                    <tr></tr>
                    <td style="background-color: #0000FF;font-weight: bold "><%=rollno[ne]%></td>
                    <td  style="color: #0000FF;font-weight: bold; "><%=sub[ne]%></td>
                    <%
                    for(ko=1;ko<i;ko++)
                    {
                     rs=st.executeQuery("select "+j+""+fcol[ko]+""+j+" from "+batchname+" where rollno='"+rollno[ne]+"'");
                     while(rs.next())
                     {
                         fine=rs.getInt(1);
                         
                         %>
                         <td style="background-color: whitesmoke;color: #ff0033"><%=fine%></td>
                        <%
                     }
                     totalfine=totalfine+fine;
                    }
                   rs=st.executeQuery("select fine from fine where studentid='"+studentid[ne]+"'");
                   while(rs.next())
                   {
                       lfine=rs.getInt("fine");                        
                   }
                      %>
                             <td style="background-color: whitesmoke;color: #ff0033"><%=lfine%></td>                     
                        <% 
                    totalfine=totalfine+lfine;
                    rs=st.executeQuery("select fine from transport where studentid='"+studentid[ne]+"'");
                    while(rs.next())
                    {
                        transfine=rs.getInt("fine");
                    }
                    th=transfine;
                    rs=st.executeQuery("select fine from hostel where studentid='"+studentid[ne]+"'");
                    while(rs.next())
                    {
                        hosfine=rs.getInt("fine");
                    }
                    th=transfine+hosfine;
                    %>
                    <td style="background-color: whitesmoke;color: #ff0033"><%=th%></td>                          
                    <%
                    totalfine=th+totalfine;
                     %>
                            <td style="background-color: #0000FF;color: whitesmoke;font-weight: bold"><%=totalfine%></td>                     
                    <%
                    totalfine=0;
                    lfine=0;
                    th=0;
                    transfine=0;hosfine=0;
                }
                con.close();
           }
           catch(Exception e)
           {
               out.println(e);
           }
       %>
       </table>   
    </body>
</html>
