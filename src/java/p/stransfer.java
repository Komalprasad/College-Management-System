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
public class stransfer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String komal=request.getParameter("komal");
        try {
            RequestDispatcher rd=null;
            if(komal.equalsIgnoreCase("FILL"))
            {
                rd=request.getRequestDispatcher("sfillmarks.jsp");
            }
            if(komal.equalsIgnoreCase("see"))
            {
                rd=request.getRequestDispatcher("sesssub.jsp");
            }
            rd.forward(request, response);
        }
        
        finally {
            out.close();
        }
    }
}
