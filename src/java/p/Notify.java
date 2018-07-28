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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Notify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int x = 0,srno=1;
        String batchname = null;
        RequestDispatcher rd;
        String notify=request.getParameter("notify");
        String branch=request.getParameter("branch");
        String semester=request.getParameter("semester");
        if(notify=="")
        {
            request.setAttribute("msg","NOTIFICATION IS BLANK");
            rd=request.getRequestDispatcher("notify.jsp");
            rd.forward(request, response);
        }
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date date = new java.util.Date();
        String idate = dateFormat.format(date);
        try {
           Statement st=new Connectionjdbc().komal();
            ResultSet rs;
            if(branch.equals("ALL"))
            {
                rs=st.executeQuery("select srno from notification");
                while(rs.next())
                {
                    srno++;
                }
            }
            else
            {
                rs=st.executeQuery("select srno from notify"+branch+"");
                while(rs.next())
                {
                    srno++;
                }
            }
            if(branch.equals("ALL"))
            {
            x=st.executeUpdate("insert into notification values ('"+idate+"','"+notify+"','"+srno+"')");
            }
            else
            {
            rs=st.executeQuery("select batchname from "+branch+" where semester="+semester+"");
            while(rs.next())
            {
                batchname=rs.getString("batchname");
            }
            x=st.executeUpdate("insert into notify"+branch+" values('"+batchname+"','"+idate+"','"+notify+"','"+srno+"')");
            }
            if(x==1)
            {
                request.setAttribute("msg","NOTIFICATION SUBMITTED" );
                
            }else
            {
                request.setAttribute("msg","CAN'T UPDATED");
            }
            rd=request.getRequestDispatcher("notify.jsp");
            rd.forward(request, response);
            }
        catch(Exception e)
        {
            out.println(e);
        }
        finally {
            out.close();
        }
    }
}
