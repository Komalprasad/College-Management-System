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
public class Lissue extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookid=request.getParameter("bookid");
        bookid=bookid.toUpperCase();
        String lecname=request.getParameter("lecname");
        int start =0,x = 0;
        int end =3;
        ResultSet rs=null;
        String n=null,check1=null,check2=null;
       
             DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
             java.util.Date date = new java.util.Date();
             String idate = dateFormat.format(date);
        try {
            if(!bookid.equals(null) && !lecname.equals(null))
            {
            char hansu[]=new char[end - start];
            bookid.getChars(start, end, hansu,0);
            String bookclass=new String(hansu);
            Statement st=new Connectionjdbc().komal();
            String checkbook="select bookid from "+bookclass+" where bookid='"+bookid+"'";
            rs=st.executeQuery(checkbook);
            while(rs.next())
            {
               n=rs.getString("bookid");
            }
            if((""+bookid+"").equals(n))
            {
                
               String checkbook2="select studentid,issuedate from "+bookclass+" where bookid='"+bookid+"'";
               rs=st.executeQuery(checkbook2);
               while(rs.next())
               {
                   check1=rs.getString("studentid");
                   check2=rs.getString("issuedate");
               }
               if(check1 == null && check2 == null)
               {
                   x=st.executeUpdate("update "+bookclass+" set studentid='"+lecname+"',issuedate='"+idate+"' where bookid='"+bookid+"'");
                   x=st.executeUpdate("insert into lecbooks values ('"+bookid+"','"+lecname+"','"+idate+"','')");
               }
             if(x>0)
               {
                   response.sendRedirect("teachers.jsp");
               }
               if(check1!= null && check2!= null)
               {               
                   request.setAttribute("error","BOOK IS ALREADY ISSUED");
                   request.setAttribute("errorc","teachers.jsp");
                   RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                   rd.forward(request, response);
               }
           }
         if(n==null)
          { 
              request.setAttribute("error","BOOK IS NOT PRESENT");
              request.setAttribute("errorc","teachers.jsp");
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
              rd.forward(request, response);
          }
            }                       
       }
        catch(Exception e)
        {
              request.setAttribute("error","CHECK THE BOOK ID AND LECTURER NAME");
              request.setAttribute("errorc","teachers.jsp");
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
              rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }
}
