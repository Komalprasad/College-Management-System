<%-- 
    Document   : showattand
    Created on : 10 Jul, 2014, 8:21:22 PM
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
            String subject=request.getParameter("sub");
            String month=request.getParameter("month");
            String rollno=request.getParameter("rollno");
            String all=request.getParameter("all");
            %>
        <form action="Ashowsub.jsp" >
            <input type="submit" value="BACK" style="color: #000000;background-color:white;border: white;font-size: larger"/>            
             <input type="hidden" name="semester" value="<%=semester%>"  />
            <input type="hidden" name="branch" value="<%=branch%>"  />
        </form>
    <center>
        <form>
            <input type="submit" value=" MONTH" style="background-color: white;border: white;font-size: larger;font-family: cursive"/>
            <input type="text" value="<%=month%>" name="month" style="border: white;color: #00cc00;font-size: larger"/>
            <input type="submit" value="ALL" name="all" style="background: white;border: white;font-size: larger"/>
            <input type="text" value="" name="rollno" style="border: #0000FF;border-style: double"/>
            <input type="hidden" name="semester" value="<%=semester%>"  />
            <input type="hidden" name="sub" value="<%=subject%>"  />
            <input type="hidden" name="branch" value="<%=branch%>"  />
            <input type="text" value="" name="rollno" style="border: #0000ff;size: 5em;color: #00cc00;font-size: larger"/>
            <input type="submit" value="SEARCH" style="background-color: white;border: white;font-size: larger;font-family: cursive"/>
            
        </form>
    </center>
        <br>
        
        <%
            String sname[]=new String[100];
            int roll[]=new int[100];
            int i=1;
            float ta=0,p=0,ne=0;
            boolean k=true;
            String pr="P",ab="A",nk=null;
            String batchname=null,classname=null,attend=null;
            try
            {
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=con.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select classname,batchname from "+branch+" where semester='"+semester+"'"  );
                while(rs.next())
                {
                    classname=rs.getString("classname");
                    batchname=rs.getString("batchname");
                }
                rs=st.executeQuery("select attdanceclass from "+classname+" where subject='"+subject+"'");
                while(rs.next())
                {
                    attend=rs.getString("attdanceclass");
                }
                if(rollno==null||rollno=="")
                rs=st.executeQuery("select rollno,studentname from "+batchname+"");
                else
                    rs=st.executeQuery("select rollno,studentname from "+batchname+" where rollno='"+rollno+"'");
                while(rs.next())
                {
                    roll[i]=rs.getInt("rollno");
                    sname[i]=rs.getString("studentname");
                    i++;
                }
                %>
   
                <table cellspacing="5" cellpadding="5">
                    <td style="color: #3300ff;">ROLL NO</td>
                    <td style="color: #3300ff">STUDENT NAME</td>
                <%
                rs=st.executeQuery("select classdate from "+attend+"");
                while(rs.next())
                {
                    String date=rs.getString("classdate");
                    if(all==null ||all.equals(""))
                    {
                    char h[]=new char[4 - 2];
                    date. getChars(2, 4, h,0);
                    nk=new String(h);
                    k=nk.contains(""+month+"");
                    }
                   if(k)
                   {
                    %>
                    <td style="color:#ff3333;background-color: whitesmoke;"><%=date%></td>
                    <%
                }
                }
                for(int n=1;n<i;n++)
                {
                    %>
                    <tr></tr>
                    <td style="color: #3300ff;"><%=roll[n]%></td>
                    <td style="color: #3300ff;"><%=sname[n]%></td>
                    <%
                    rs=st.executeQuery("select * from "+attend+"");
                    while(rs.next())
                    {
                        String date=rs.getString("classdate");
                    if(all==null ||all.equals(""))
                    {
                        char h[]=new char[4 - 2];
                    date.getChars(2, 4, h,0);
                    nk=new String(h);
                     k=nk.contains(""+month);
                    }
                   if(k)
                   {   String pa=rs.getString(""+roll[n]);                      
                        {
                         if("P".equals(pa))
                                 {ta++;p++;
                            %>
                            <td style="color:whitesmoke;background-color: #00e231;font-weight: 900"><%=pa%></td>                         
                       <%
                                 }
                          if("A".equals(pa))
                         {ta++;
                          %>
                            <td style="color:whitesmoke;background-color: #ff3366;font-weight: 900 "><%=pa%></td>                         
                       <%   
                         }
                          if(pa==null)
                         {ta++;
                             %>
                             <td style="color:#ff33ff;"><%="KOMAL"%></td>                         
                       <%   
                         }
                    }
                   }
                        }
                     ne=( 100 / ta)*p;
                        %>
                        <td style="color: #ff0033;font-weight: bold;background-color: whitesmoke"><%=(int)ne%>%</td>
                             <%
                             ta=0;p=0;ne=0;
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
