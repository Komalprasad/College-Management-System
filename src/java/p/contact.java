/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
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
public class contact extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name=null,email=null,mobile=null,message=null;
        name=(String)request.getParameter("name");
        email=(String)request.getParameter("email");
        mobile=(String)request.getParameter("mobile");
        message=(String)request.getParameter("message");
        if(name!=null && email!=null && mobile !=null)
        {
        try {
           Statement st=new Connectionjdbc().komal();
        int x=st.executeUpdate("insert into contact values ('"+name+"','"+email+"','"+mobile+"','"+message+"')");
        if(x>0)
        {
            request.setAttribute("error", "THANK YOU! WE WILL CONTACT YOU SOON ");
            RequestDispatcher rd=request.getRequestDispatcher("contact.jsp");
            rd.forward(request, response);
        }
        else
        {
            request.setAttribute("error", name);
            RequestDispatcher rd=request.getRequestDispatcher("contact.jsp");
            rd.forward(request, response);
        }
        }
        catch(Exception e)
        {}
        }
        else
        {
            request.setAttribute("error","PLEASE ENTER THE REQUIRED FIELD");
            RequestDispatcher rd=request.getRequestDispatcher("contact.jsp");
            rd.forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
