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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Changepassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pass=request.getParameter("pass");
        String opass=request.getParameter("opass");
        int x;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
            Statement st=con.createStatement();
            x=st.executeUpdate("update lecpassword set password="+pass+" where password="+opass+"");
            if(x==1)
            {
                response.sendRedirect("index.jsp");
            }
            else
            {
                out.println("error");
            }
        } 
        catch(Exception e)
        {
            
        }finally {
            out.close();
        }
    }
}
