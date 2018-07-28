/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
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
public class Reissue extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idate = null,studentid=null,booki=null;
          booki=request.getParameter("bookid");  
        booki=booki.toUpperCase();
       int start =0;
       int end =3;
       
        try {
            if(booki!=null)
            {
                char hansu[]=new char[end - start];
                 booki.getChars(start, end, hansu,0);
                 String name=new String(hansu);
                Statement st=new Connectionjdbc().komal();
                ResultSet rs = null;
                String sql="select issuedate ,studentid from "+name+" where bookid='"+booki+"'";
                rs=st.executeQuery(sql);
                while(rs.next())
                 {
                     idate=rs.getString("issuedate");
                     studentid=rs.getString("studentid");  
                 } 
                if(idate==null)
                 {
                  request.setAttribute("error", "BOOK IS NOT ISSUED");
                  request.setAttribute("errorc", "reissue");
                  RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
                  rd.forward(request, response); 
                 }
          
         start=0;end=2;
         char hans[]=new char[end - start];
         idate.getChars(start, end, hans,0);
         String day1=new String(hans);
        start=3;end=5;
        char han[] =new char[end - start];
        idate.getChars(start, end, han, 0);
        String mon1=new String(han);
        start=6;end=10;
        char ne[] =new char[end - start];
        idate.getChars(start, end, ne, 0);
        String year1=new String(ne);
        request.setAttribute("day1", ""+day1+"");
        request.setAttribute("mon1", ""+mon1+"");
        request.setAttribute("year1", ""+year1+"");
        request.setAttribute("studentid", ""+studentid+"");
        request.setAttribute("bookname",name);
        RequestDispatcher rd=request.getRequestDispatcher("/Rcomputation");
        rd.forward(request, response);
        }
        }
        catch(Exception e) 
        {
        request.setAttribute("error", "PLEASE ENTER THE CORRECT BOOK ID");
        request.setAttribute("errorc", "reissue");
        RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
        rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }

}
