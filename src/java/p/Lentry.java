/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Lentry extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("lname");
        if(name!=null)
        {
        String id,lid;
        int sr=0,x=0;
        String lname[]=new String[7];
        ResultSet rs;
            RequestDispatcher rd;
        try {
            Statement st=new Connectionjdbc().komal();
            rs=st.executeQuery("select srno from lecturerid ");
           while(rs.next())
           {              
               sr=rs.getInt("srno");
           }
           out.println("first"+sr);
           for(int i=1;i<7;i++)
           {
           lname[i]=request.getParameter("l"+i+"");
           if(lname[i]!=null)
           {
               if(x==0)
               {
                    ++sr;
                    x=st.executeUpdate("insert into lecturerid (srno) values("+sr+")");
                    out.println("second"+sr);
               }
               
               id=lname[i]+""+sr;
               lid=lname[i]+"ID";
               x=st.executeUpdate("update lecturerid set "+lname[i]+"='"+name+"',"+lid+"='"+id+"' where srno="+sr+"");
               if(x==1)
               {
                 /*  komal.close();
                   rd=request.getRequestDispatcher("Lecturer1.jsp");
                   rd.forward(request, response);
               */
                         }
               else
               {
                  /* komal.close();
                   request.setAttribute("error", "table can't be updated try agian");
                   rd=request.getRequestDispatcher("Lentry.jsp");
                   rd.forward(request, response);
               */}
           }
          /* if(x==0)
           {
                komal.close();
                   request.setAttribute("error", "table can't be updated try agian");
                   rd=request.getRequestDispatcher("Lentry.jsp");
                   rd.forward(request, response);
           }*/
           }
           
        }
        catch(Exception e)
        {
          out.println(e);
            /*
                   request.setAttribute("error", "PLEASE FILL THE DETAIL"+e);
                   rd=request.getRequestDispatcher("Lentry.jsp");
                   rd.forward(request, response);
        */}
        
        finally {
            
            out.close();
        }
        }
    }
}
