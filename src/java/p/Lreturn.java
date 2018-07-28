/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author sony
 */
public class Lreturn extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookid,bookclass,rdate,n = null;
        bookid=request.getParameter("bookid");
        bookid=bookid.toUpperCase();
        int x=0;
        int start =0;
        int end =3;
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
          rdate = dateFormat.format(date);
        try {
                if(bookid!=null)
                {
                    Statement st=new Connectionjdbc().komal();
                    ResultSet rs;  
                    
                char hansu[]=new char[end - start];
                bookid.getChars(start, end, hansu,0);
                bookclass=new String(hansu);
                String checkbook="select bookid from "+bookclass+" where bookid='"+bookid+"'";
                rs=st.executeQuery(checkbook);
                while(rs.next())
                  {
                    n=rs.getString("bookid");
                  }
                 if((""+bookid+"").equals(n))
                {
               x=st.executeUpdate("update lecbooks set returndate='"+rdate+"' where bookid='"+bookid+"'");
                }
                if(n==null)
                {
                    request.setAttribute("error","Book is not present");
                    request.setAttribute("errorc","teachers.jsp");
                    RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                    rd.forward(request, response);
          }
                }
        }
        catch(Exception e)
        {
              request.setAttribute("error","PLEASE CHECK THE BOOK ID");
              request.setAttribute("errorc","teachers.jsp");
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
              rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }
}
