<%-- 
    Document   : bookbank
    Created on : 27 Sep, 2014, 7:08:04 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>komal prasad</title>
    </head>
    <body>
        <form action="Lib.jsp">
            <input type="submit" value="HOMEPAGE" style="background: white;border: white;font-size: xx-large"/>
        </form>
    <center>
        <form action="bookbank.jsp">
            <input type="submit" name="reset" value="RESET" style="background: white;border: white;font-size: x-large "/>
        </form>
    </center>
        <form action="Bookbank">
            <center>
                <%
                    String reset=request.getParameter("reset");
                    String error=(String)request.getAttribute("error");
                    if(error!=null)
                    {
                        %>
                        <b style="color: #ff0000;font-size: x-large"><%=error%></b>
                        <%
                    }
                    String val="",bookid=null,stu="";
                    if(reset==null)
                    {
                        String sid=(String)request.getAttribute("sid");
                        if(sid!=null)
                        {
                            stu=sid;
                        }
                    }
                %>
            <br><br>
            <b style="color: #000000">STUDENT ID</b>
            <input type="text" name="sid" value="<%=stu%>"/>
            <br><br>
            <b> BOOK ID's</b>
            <br><br>
            <%
               int komal=1,set=0;
               while(komal<7)
               {     
                   if(reset==null)
                   {
                   bookid=(String)request.getAttribute("b"+komal+"");
                   if(bookid!=null)
                   {
                       val=bookid;
                   }
                   }
                   %>
                   <b style="color: #0000FF"><%=komal%></b>
                   <b style="color: #ff0000">.</b>
                   <input type="text" name="<%=komal%>" value="<%=val%>"/>
                   <%
                    String info=(String)request.getAttribute("i"+komal+"");
                    if(info!=null)
                    {
                        if(info.equals("ISSUED"))
                        {
                             %>
                        <b style="color: #00cc00;font-size: larger"><%=info%></b>
                             <%
                        }
                        else
                        {
                          %>
                        <b style="color: #ff0000;font-size: large"><%=info%></b>
                          <%
                        }
                    }
                   %>
                   <br><br>
                    <%
                    komal++;
               }
            %>
            <input type="submit" value="ISSUE" style="background: white;border: white;font-size: x-large"/>
            </center>
        </form>
    </body>
</html>
