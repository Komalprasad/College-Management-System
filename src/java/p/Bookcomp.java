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
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author sony
 * @komal
 */
@WebServlet(name = "Bookcomp", urlPatterns = {"/Bookcomp"})
public class Bookcomp extends HttpServlet {
String error,errorc;
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String book=null,bookname=null,subject=null,tbooks=null,bookid=null;
        int tb=0,com= 0,to= 0;
        try {
            Statement st=new Connectionjdbc().komal();
            book=(String)request.getAttribute("bookid");
            bookname=(String)request.getAttribute("bookname");
            subject=(String)request.getAttribute("subject");
            tbooks=(String)request.getAttribute("totalbooks");
            tb=Integer.parseInt(tbooks);
            int start =0;
       int end =3;
       char hansu[]=new char[end - start];
       book.getChars(start, end, hansu,0);
       bookid=new String(hansu);
       ResultSet rs ;
       rs=st.executeQuery("Select TNB from total");
       while(rs.next())
       {
           com=rs.getInt("tnb");
       }
       to=com-tb;  
       to++;
        }
        catch(Exception e)
        {
            error=""+e+"";
            request.setAttribute("error",error);
              request.setAttribute("errorc",errorc);
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
              rd.forward(request, response);
        }
        finally {
            
            request.setAttribute("bookid", ""+bookid+"");
            request.setAttribute("fom",""+com+"");
            request.setAttribute("to", ""+to+"");
            request.setAttribute("bookname", ""+bookname+"");
            request.setAttribute("totalbooks", ""+tb+"");
            RequestDispatcher rd=request.getRequestDispatcher("/Printbook.jsp");
            rd.forward(request, response);
            out.close();
        }
    }
}
