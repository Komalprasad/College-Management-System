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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class test1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String returndate=null,ab="ABSENT",pr="PRESENT",n=null;
        String a[]=new String[20];
        int i=0;
         String studentid=request.getParameter("stu");
       try
       {
           Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
            ResultSet rs=null;
            Statement st=con.createStatement();
            rs=st.executeQuery("select 1 from cs15");
            while(rs.next())
            {
                int s=rs.getInt(1);
                System.out.println(""+s);
            }
            }
            
       catch(Exception e)
       {}
         
        }  
    }

