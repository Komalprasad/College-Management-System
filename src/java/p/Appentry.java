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
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author sony
 */
public class Appentry extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;
        String sid=request.getParameter("sid");
        if(sid=="")
        {
            request.setAttribute("msg", "STUDENT ID MAY NOT BE BLANK");
                rd=request.getRequestDispatcher("appentry.jsp");
                 rd.forward(request, response);
        }
        sid=sid.toUpperCase();
        String sub=request.getParameter("subject");
        char k[]=new char[2 - 0];
        sid.getChars(0, 2, k, 0);
        String ko=new String(k);
        int x=0,ano=0;
        try {
            Statement st=new Connectionjdbc().komal();
            ResultSet rs;
            rs=st.executeQuery("select srno from reception"+ko+"");
            while(rs.next())
            {
                ano=rs.getInt("srno");
            }
            ano++;
            x=st.executeUpdate("insert into reception"+ko+" values('"+ano+"','"+sid+"','"+sub+"','PROCESSING','' )");
            if(x==1)
            {
                request.setAttribute("msg", "APPLICATION SUBMITTED ");
                request.setAttribute("srno", ""+ano);
                rd=request.getRequestDispatcher("appentry.jsp");
               
            }
            else
            {
                request.setAttribute("msg", "APPLICATION NOT SUBMITTED");
                rd=request.getRequestDispatcher("appentry.jsp");
            }
            rd.forward(request, response);
        }
        catch(Exception e)
        {
            out.print(e);
        }
        finally {
            out.close();
            
        }
    }
}
