/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sony
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        try {
           Statement st=new Connectionjdbc().komal();
           String com=null;
           String name = request.getParameter("pass");
           name=name.toLowerCase();
          if(name!=null)
          {
          String sql = "select idname from password where password ='"+name+"'";
          ResultSet rs ;
          rs=st.executeQuery(sql);
          while(rs.next())
          {
             com=(rs.getString("idname"));
          }
          }
          if(com==null)
          {
              request.setAttribute("error","INCORRECT LOGIN ID");
              request.setAttribute("errorc","login.jsp");
              
              RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
              HttpSession hs=request.getSession();
              hs.setAttribute(name,"name");
              rd.forward(request, response);
          }
          if(com!=null)
         response.sendRedirect(""+com+".jsp");

        }catch(Exception e) 
        { response.sendRedirect("error.jsp");
        } 
        }
}
  

