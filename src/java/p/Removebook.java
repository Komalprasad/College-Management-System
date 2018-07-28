/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Removebook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookid=null,bookclass=null,check = null;
        int start=0,end=3,x = 0;
        RequestDispatcher rd;
        bookid=(String)request.getParameter("bookid");
        bookid=bookid.toUpperCase();
        try {
                if(bookid!=null)
                {
                    char hansu[]=new char[end - start];
                    bookid.getChars(start, end, hansu, 0);
                    bookclass=new String(hansu);
                    Statement st=new Connectionjdbc().komal();
                    ResultSet rs;
                    rs=st.executeQuery("select issuedate from "+bookclass+" where bookid='"+bookid+"'");
                    while(rs.next())
                    {
                        check=rs.getString("issuedate");
                    }
                    if(check==null)
                    {
                    x=st.executeUpdate("delete from bookentry where bookid='"+bookid+"'");
                    x=st.executeUpdate("delete from "+bookclass+" where bookid='"+bookid+"'");
                    }
                    if(check!=null)
                    {
                        request.setAttribute("error", "BOOK CANT BE REMOVED IT MAY BE ISSUED");
                        request.setAttribute("errorc", "rebook.jsp");
                        rd=request.getRequestDispatcher("error.jsp");
                                rd.forward(request, response);
                    }
                    if(x>0)
                    {
                        request.setAttribute("error", bookid);
                        rd=request.getRequestDispatcher("rebook.jsp");
                                rd.forward(request, response);
                    }
                }
        }
        catch(Exception e)
        {
                    request.setAttribute("error", "PLEASE ENTER THE CORRECT BOOK ID");
                    request.setAttribute("errorc", "rebook.jsp");
                    rd=request.getRequestDispatcher("error.jsp");
                    rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }
}
