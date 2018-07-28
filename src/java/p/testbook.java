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

/**
 *
 * @author sony
 */
public class testbook extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             String bookname = request.getParameter("bookname");
           String author = request.getParameter("author");
           String tn = request.getParameter("totalbooks");
            int tnb=Integer.parseInt(tn);
           String subject =request.getParameter("subject");
           String branch = request.getParameter("type");
           String year= request.getParameter("year");
          int u=Integer.parseInt(year); 
          String bookid=""+branch+""+year;
          out.println(bookname);
          out.println(author);
          out.println(tnb);
          out.println(subject);
          out.println(branch);
          out.println("u is"+u);
          out.println(bookid);

        } finally {
            out.close();
        }
    }
}
