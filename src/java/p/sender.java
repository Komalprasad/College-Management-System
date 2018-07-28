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
import javax.servlet.RequestDispatcher;

/**
 *
 * @author sony
 */
public class sender extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String send=request.getParameter("komal");
        try 
        {
            RequestDispatcher rd=null;
            if(send.equals("FINE"))
            {
                rd=request.getRequestDispatcher("sfdeatil.jsp");
            }
            else if(send.equals("ATTENDANCE"))
            {
                rd=request.getRequestDispatcher("satten.jsp");
            }
            else if(send.equals("BOOK"))
            {
                rd=request.getRequestDispatcher("sbdetail.jsp");
            }
             else if(send.equals("NOTIFICATION"))
            {
               rd=request.getRequestDispatcher("snotify.jsp");
            }
            else if(send.equals("TRANSPORT"))
            {
                 rd=request.getRequestDispatcher("sthdetail.jsp");
            }
            else if(send.equals("HOSTEL"))
            {
                 rd=request.getRequestDispatcher("sthdetail.jsp");
            }
            else if(send.equals("SESSIONAL"))
            {
               rd=request.getRequestDispatcher("ssmarks.jsp");
            }
            else if(send.equals("LEAVEAPPLICATION"))
            {
               rd=request.getRequestDispatcher("sleaveapp.jsp");
            }
            
            rd.forward(request, response);
        } 
        catch(Exception e)
        {
            
        }finally {
            out.close();
        }
    }
}
