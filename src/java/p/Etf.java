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
import java.sql.Statement;

/**
 *
 * @author sony
 */
public class Etf extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int x=0;
        String amount=request.getParameter("amount");
        String type=request.getParameter("type");
        String month=request.getParameter("month");
        String classname=request.getParameter("komal");
        try {
            Statement st=new Connectionjdbc().komal();
            if(amount!=null && type!=null && month!=null)
            {
              x=st.executeUpdate("insert into "+classname+" values('"+amount+"','"+month+"','"+type+"')");
            }
            else
            {
                request.setAttribute("error", "FILL THE  DETAILS OF "+classname+" ");
                RequestDispatcher rd=request.getRequestDispatcher("fee.jsp");
                rd.forward(request, response);
            }
            if(x>0)
            {  
                request.setAttribute("error", "FEE OF MONTH "+month+" IS "+amount+" FOR "+classname+" ");
                RequestDispatcher rd=request.getRequestDispatcher("fee.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }finally {
            out.close();
        }
    }
}
