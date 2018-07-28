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
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author sony
 */
public class Sessionl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        char j='"';
        int i=0,month = 0,y=0,n=0;
        String max=request.getParameter("max");
        String branch=request.getParameter("branch");
        String semester=request.getParameter("semester");
        String subject=request.getParameter("subject");
        String day=request.getParameter("day");
        String mon=request.getParameter("month");
        Calendar cal = Calendar.getInstance();
        if(mon.equals(""))
        {month=cal.get(Calendar.MONTH)+1;
        mon=""+month+"";
        }
        String yea=request.getParameter("year");
        if(yea.equals(""))
        {   
            y= cal.get(Calendar.YEAR);
            yea=""+y+"";
        }
        String date=day+"/"+mon+"/"+yea;
        String classname=null,batchname=null,sclass=null;
        String rollno[]=new String[100];
        try {
            Statement st=new Connectionjdbc().komal();
            ResultSet rs;
            rs=st.executeQuery("select * from "+branch+" where semester='"+semester+"'");
            while(rs.next())
            {
                classname=rs.getString(1);
                batchname=rs.getString(3);
            }
            rs=st.executeQuery("select rollno from "+batchname+"");
            while(rs.next())
            {
                rollno[i]=rs.getString("rollno");
                i++;
            }
            rs=st.executeQuery("select sessional from "+classname+" where subject='"+subject+"'");
            while(rs.next())
            {
                sclass=rs.getString("sessional");
            }
            n=st.executeUpdate("insert into "+sclass+" (max,dot) values('"+max+"','"+date+"')");
            for(int kn=0;kn<i;kn++)
            {
                String marks=request.getParameter(""+rollno[kn]+"");
                n=st.executeUpdate("update "+sclass+" set "+j+""+rollno[kn]+""+j+"='"+marks+"' where dot='"+date+"'");
            }
            RequestDispatcher rd=request.getRequestDispatcher("lecture.jsp");
            rd.forward(request, response);
        }
        catch(Exception e)
        {
            out.println(e);
            out.println(mon);
        }
        finally {
            out.close();
        }
    }
}
