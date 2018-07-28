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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Nofine extends HttpServlet {
String error;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookid,bookclass,rdate,n = null;
        int x,y;
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
          rdate = dateFormat.format(date);
        try {
            Statement st=new Connectionjdbc().komal();
            bookid=request.getParameter("bookid");
            ResultSet rs = null;  
            int start =0;
       int end =3;
       char hansu[]=new char[end - start];
       bookid.getChars(start, end, hansu,0);
       bookclass=new String(hansu);
       RequestDispatcher rd;
       String checkbook="select bookid from "+bookclass+" where bookid='"+bookid+"'";
           rs=st.executeQuery(checkbook);
           while(rs.next())
           {
               n=rs.getString("bookid");
           }
           if((""+bookid+"").equals(n))
       {
      
       x=st.executeUpdate("update "+bookclass+" set studentid='',issuedate='' where bookid='"+bookid+"'");
       x=st.executeUpdate("update cfine set returndate="+rdate+" where bookid='"+bookid+"'");
       if(x>0)
       {
           response.sendRedirect("Nofine.jsp");
       }
       if(x<=0)
       {
             request.setAttribute("error","BOOK IS NOT ISSUED");       
              rd=request.getRequestDispatcher("Nofine.jsp");
              rd.forward(request, response);
       }
        }
            if(n==null)
          { 
              request.setAttribute("error","BOOK IS NOT PRESENT");       
              rd=request.getRequestDispatcher("Nofine.jsp");
              rd.forward(request, response);
          }

        }
        catch(Exception e)
        {
            error="ENTER THE CORRECT BOOK ID";
            request.setAttribute("error",error);
              RequestDispatcher rd=request.getRequestDispatcher("Nofine.jsp");
              rd.forward(request, response);
        }finally {
            out.close();
        }
    }
}
