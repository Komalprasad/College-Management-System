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
public class Leclogin extends HttpServlet{
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           Statement st=new Connectionjdbc().komal();
          String lname=null;
          String password=null;
          RequestDispatcher rd;
          String name = request.getParameter("pass");
          name=name.toLowerCase();
          if(name!=null)
          {
          ResultSet rs ;
          rs=st.executeQuery("select lecturer_name,password from lecpassword where password ='"+name+"'");
          while(rs.next())
          {
             lname=rs.getString("lecturer_name");
             password=rs.getString("password");
          }
          }
          if(lname==null)
          {
              
              request.setAttribute("error","WRONG PASSWORD");
              rd=request.getRequestDispatcher("lecture.jsp");
              rd.forward(request, response);
          }
          if(lname!=null)
          {
              request.setAttribute("name", lname);
              rd=request.getRequestDispatcher("asl.jsp");
              rd.forward(request, response);
          }

        }catch(Exception e) 
        { response.sendRedirect("error.jsp");
        } 
        }
}
