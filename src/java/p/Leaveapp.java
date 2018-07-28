/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Leaveapp extends HttpServlet {
int dayf,monf,dayt,mont,year,x,feb=28;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        char j='"';
        String pa=request.getParameter("***");
          if(pa.equals("PRESENT"))
                  pa="P";
        else
            pa="A";
        String rollno=request.getParameter("rollno");
        String fday=request.getParameter("fday");
        String fmon=request.getParameter("fmon");
        String tday=request.getParameter("tday");
        String tmon=request.getParameter("tmon");
        String branch=request.getParameter("branch");
        String semester=request.getParameter("semester");
        String subject=request.getParameter("subject");
        Calendar c=Calendar.getInstance();
        year=c.get(Calendar.YEAR);
        if(year%2==0)
            feb=29;
        String date=null,classname=null,atten=null;
        try {
            Statement st=new Connectionjdbc().komal();
            ResultSet rs;
            rs=st.executeQuery("select * from "+branch+" where semester='"+semester+"'");
            while(rs.next())
            {
                classname=rs.getString("classname");
            }
            rs=st.executeQuery("select * from "+classname+" where subject='"+subject+"'");
            while(rs.next())
            {
                atten=rs.getString("attdanceclass");
            }
            if(fmon.equals(tmon))
            {
                dayf=Integer.parseInt(fday);
                dayt=Integer.parseInt(tday);
                while(dayf<=dayt)
                {
                    date=dayf+"/"+fmon+"/"+year;
                    x=st.executeUpdate("update "+atten+" set "+j+""+rollno+""+j+"='"+pa+"' where classdate='"+date+"'");
                    dayf++;
                }
            }
            else
            {
                dayf=Integer.parseInt(fday);
                dayt=Integer.parseInt(tday);
                monf=Integer.parseInt(fmon);
                mont=Integer.parseInt(tmon);
                while(monf!=mont)
                {
                    if(monf%2==0)
                    {
                        if(monf==2)
                        {
                            while(dayf<=feb)
                            {
                              date=dayf+"/"+fmon+"/"+year;
                                x=st.executeUpdate("update "+atten+" set "+j+""+rollno+""+j+"='"+pa+"' where classdate='"+date+"'");
                                dayf++;  
                            }
                        }
                        else
                        {
                            while(dayf<=30)
                            {
                              date=dayf+"/"+fmon+"/"+year;
                                x=st.executeUpdate("update "+atten+" set "+j+""+rollno+""+j+"='"+pa+"' where classdate='"+date+"'");
                                dayf++;  
                            }
                        }
                    }
                    else
                    {
                        while(dayf<=31)
                            {
                              date=dayf+"/"+fmon+"/"+year;
                                x=st.executeUpdate("update "+atten+" set "+j+""+rollno+""+j+"='"+pa+"' where classdate='"+date+"'");
                                dayf++;  
                            }
                    }
                    monf++;
                }
                if(monf==mont)
                {
                    dayf=1;
                    while(dayf<=dayt)
                {
                    date=dayf+"/"+monf+"/"+year;
                    x=st.executeUpdate("update "+atten+" set "+j+""+rollno+""+j+"='"+pa+"' where classdate='"+date+"'");
                    dayf++;
                }
                }
            }
           RequestDispatcher rd=request.getRequestDispatcher("lecture.jsp");
            rd.forward(request, response);
        } 
        catch(Exception e)
        {
            request.setAttribute("error","FILL ALL THE DETAIL ");
            RequestDispatcher rd=request.getRequestDispatcher("lcs.jsp");
            rd.forward(request, response);
            
        }finally {
            out.close();
        }
    }
}
