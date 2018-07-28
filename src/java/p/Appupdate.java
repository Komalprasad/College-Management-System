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
public class Appupdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         RequestDispatcher rd;
        String sid=request.getParameter("sid");
        String reason=request.getParameter("reason");
        String srno=request.getParameter("srno");
        if("".equals(sid) || "".equals(srno))
        {
            request.setAttribute("msg", "STUDENT ID AND SERIAL NO MAY NOT BE BLANK ");
                rd=request.getRequestDispatcher("appupdate.jsp");
                 rd.forward(request, response);
        }
        sid=sid.toUpperCase();
        String status=request.getParameter("status");
        char k[]=new char[2 - 0];
        sid.getChars(0, 2, k, 0);
        String ko=new String(k);
        int x=0;
        try {
            Statement st=new Connectionjdbc().komal();
            x=st.executeUpdate("update reception"+ko+" set status='"+status+"',reason='"+reason+"' where studentid='"+sid+"' and srno='"+srno+"'");
            if(x==1)
            {
                request.setAttribute("msg", "STATUS UPDATED");
                rd=request.getRequestDispatcher("appupdate.jsp");
               
            }
            else
            {
                request.setAttribute("msg", "CAN'T UPDATED ");
                rd=request.getRequestDispatcher("appupdate.jsp");
            }
            rd.forward(request, response);
        }
        catch(Exception e)
        {
                 request.setAttribute("msg", "PLEASE ENTER THE CORRECT DATA ");
                rd=request.getRequestDispatcher("appupdate.jsp");
                rd.forward(request, response);
        }
        finally {
           
            out.close();
        }
    }
}
