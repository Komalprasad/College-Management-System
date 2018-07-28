/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author sony
 * @komal
 */
public class Bal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String am=null;
        String studentid=request.getParameter("studentid");
        String f=request.getParameter("facility");
        String bala=request.getParameter("balance");
         am=request.getParameter("amount");
        if(am.equals(""))
        {
        request.setAttribute("error", "FILL THE AMOUNT");
        RequestDispatcher rd=request.getRequestDispatcher("sbalance.jsp");
        rd.forward(request, response);
        }
        int amount=Integer.parseInt(am);
        int balance=Integer.parseInt(bala);
        try {
           Statement st=new Connectionjdbc().komal();
            if(amount<=balance)
            {
                balance=balance-amount;
                int x=st.executeUpdate("update "+f+" set balance='"+balance+"' where studentid='"+studentid+"'");
                if(x>0)
                {
                    response.sendRedirect("balance.jsp");
                }
                else
                    {
                        request.setAttribute("error", "TABLE CAN'T BE UPDATED");
                        request.setAttribute("errorc", "balance.jsp");
                        RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                        rd.forward(request, response);
                    }
            }
            if(amount>balance)
            {
                request.setAttribute("error", "AMOUNT YOU ENTERED IS MORE THAN THE BALANCE");
                RequestDispatcher rd=request.getRequestDispatcher("sbalance.jsp");
                        rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
                request.setAttribute("error", "enter the amount in correct format");
                RequestDispatcher rd=request.getRequestDispatcher("sbalance.jsp");
                 rd.forward(request, response);
        }finally {
            out.close();
        }
    }
}
