/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author sony
 */
public class Issue extends HttpServlet {

   @Override
@SuppressWarnings("empty-statement")
   public void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException , ServletException
   {
         PrintWriter out=response.getWriter();
         response.setContentType("text/html");
          int x=0;
          String n=null,check1 = null,check2 = null,n1=null,studentname=null;
          String bookid=null,studentid=null,bi="BOOK ISSUED TO";
           bookid=request.getParameter("bookid");
           bookid=bookid.toUpperCase();
           studentid=request.getParameter("studentid");
           studentid=studentid.toUpperCase();
             DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
             java.util.Date date = new java.util.Date();
             String idate = dateFormat.format(date);
             int start =0;
             int end =3,ends=4;
             ResultSet rs;
       try
       {
           if(studentid!=null && bookid!=null)
           {
            char hansu[]=new char[end - start];
            bookid.getChars(start, end, hansu,0);
            String bookclass=new String(hansu);
            char han[]=new char[ends - start];
            studentid.getChars(start, ends, han, 0);
            String studentbranch=new String(han);
            
            Statement st=new Connectionjdbc().komal();
           rs=st.executeQuery("select bookid from "+bookclass+" where bookid='"+bookid+"'");
           while(rs.next())
           {
               n=rs.getString("bookid");
           }
           if((""+bookid).equals(n))
           {
               rs=st.executeQuery("select studentid,issuedate from "+bookclass+" where bookid='"+bookid+"'");
               while(rs.next())
               {
                   check1=rs.getString("studentid");
                   check2=rs.getString("issuedate");
               }
               if(check1 == null && check2 == null)
               {
                   x=st.executeUpdate("update "+bookclass+" set studentid='"+studentid+"',issuedate='"+idate+"' where bookid='"+bookid+"'");
                   rs=st.executeQuery("select studentname from "+studentbranch+" where studentid='"+studentid+"'");
                   while(rs.next())
                       {
                           studentname=rs.getString("studentname");
                       }
                   rs=st.executeQuery("select studentid from fine where studentid='"+studentid+"'");
                   while(rs.next())
                   {
                       n1=rs.getString("studentid");
                   }
                   if(n1==null)
                   { 
                       x=st.executeUpdate("insert into fine values ('"+studentid+"','"+studentname+"','0','"+studentbranch+"')");
                   }
                   x=st.executeUpdate("insert into cfine values ('"+bookid+"','"+studentid+"','"+idate+"','','0','"+studentbranch+"','')");
               }
               if(x>0)
               {
                   String komal = null,prasad = null;
                   rs=st.executeQuery("select bookname,author from bookentry where bookid='"+bookid+"'");
                   while(rs.next())
                   {
                       komal=rs.getString("bookname");
                       prasad=rs.getString("author");
                   }
                   request.setAttribute("bi", bi);
                  request.setAttribute("studentid", studentid);
                  request.setAttribute("studentname", studentname);
                  request.setAttribute("bookid", bookid);
                  request.setAttribute("bookname", komal);
                  request.setAttribute("author", prasad);
                  RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
                  rd.forward(request, response);
               }
               if(check1!= null && check2!= null)
               {             
              request.setAttribute("error","BOOK IS ALREADY ISSSUED");
              request.setAttribute("errorc","Issue");
              RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
              rd.forward(request, response);
               }
           }
         if(n==null)
          { 
             request.setAttribute("error","BOOK IS NOT PRESENT");
              request.setAttribute("errorc","Issue");
              RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
              rd.forward(request, response);
          }
       }
           
       }
       catch(Exception e)
       {     
              request.setAttribute("error","PLEASE ENTER THE CORRECT BOOK ID AND STUDENT ID");
              request.setAttribute("errorc","Issue");
              RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
              rd.forward(request, response);
       }
       finally 
       {
              out.close();}       
   }
}
