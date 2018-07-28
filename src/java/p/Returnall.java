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
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author sony
 */
public class Returnall extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int x = 0,i=1;
        int start =0;
        int end =3;
        String n=null,bookclass;
        String returndate;
        String studentid=request.getParameter("stu");
        String a[]=new String[20];
        String b[]=new String[20];
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Date date = new java.util.Date();
            String idate = dateFormat.format(date);
        try {
            Statement st=new Connectionjdbc().komal();
            ResultSet rs=null;
            rs=st.executeQuery("select bookid,returndate,issuedate from cfine where studentid='"+studentid+"'");
            while(rs.next())
            {
                 returndate=rs.getString("returndate");
                if(returndate==null)
                {
                a[i]=rs.getString("bookid");
                b[i]=rs.getString("issuedate");
                i++;
                }
            }
            for(int j=1;j<i;j++)
            {
                   char hansu[]=new char[end - start];
                   a[j].getChars(start, end, hansu,0);
                   bookclass=new String(hansu);
                   x=st.executeUpdate("update "+bookclass+" set issuedate='',studentid='' where bookid='"+a[j]+"' AND issuedate='"+b[j]+"'");
                   x=st.executeUpdate("update cfine set returndate='"+idate+"' where bookid='"+a[j]+"'");
            }
            if(x>0)
                response.sendRedirect("detail.jsp");
        }
        catch(Exception e)
        {
              request.setAttribute("error",e);
              request.setAttribute("errorc","detail.jsp");
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
              rd.forward(request, response);   
        }
        finally {
            out.close();
        }
    }
}
