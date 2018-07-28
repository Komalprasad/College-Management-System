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
 * @komal
 */
public class Calattendance extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String h=null,ab="ABSENT",pr="PRESENT",n=null,nee="";
        int month,y;
        char j='"';
        Calendar cal = Calendar.getInstance();
        String attend=request.getParameter("attendance");
        String branch=request.getParameter("branch");
        String semester=request.getParameter("sem");
        String subject=request.getParameter("sub");
        String day=request.getParameter("day");
        String mon=request.getParameter("month");
        if(mon.equals(nee))
        {month=cal.get(Calendar.MONTH)+1;
        mon=""+month+"";
        }
        String yea=request.getParameter("year");
        if(yea.equals(nee))
        {   
            y= cal.get(Calendar.YEAR);
            yea=""+y+"";
        }
        String date=day+"/"+mon+"/"+yea;
      
        int x,i=1,tc=1;
        int a[]=new int[100];
        String classname=null,attanclass=null,batchname=null;
        if(!day.equals(nee))
        {
        try 
        {          
                        Statement st=new Connectionjdbc().komal();
                        ResultSet rs=st.executeQuery("select classname,batchname from "+branch+" where semester='"+semester+"'");
                        while(rs.next())
                        {
                         classname=rs.getString("classname");
                         batchname=rs.getString("batchname");
                        }
                        rs=st.executeQuery("select attdanceclass from "+classname+" where subject='"+subject+"'");
                        while(rs.next())
                        {
                            attanclass=rs.getString("attdanceclass");
                        }
                        rs=st.executeQuery("select classdate from "+attanclass+" where classdate='"+date+"'");
                        while(rs.next())
                        {
                            tc++;
                        }
                        x=st.executeUpdate("insert into "+attanclass+" (classdate,tc) values('"+date+"','"+tc+"')");
                        rs=st.executeQuery("select rollno from "+batchname+"");
                        while(rs.next())
                        {
                            a[i]=rs.getInt("rollno");
                            i++;
                        }
                        
                        for(int ne=1;ne<i;ne++)
                        {   
                           
                            String ap=request.getParameter("r"+a[ne]+"");
                           
                            if(attend.equals(ab))
                            {  
                                  h=ap;
                                if(ap==n)
                                {
                                  h="P"; 
                                 
                                }                   
                             }
                           if(attend.equals(pr))
                            {
                                h=ap;
                                if(ap==n)
                                {
                                    h="A";
                                }
                            }
                            
                            x=st.executeUpdate("update "+attanclass+" set "+j+""+a[ne]+""+j+"='"+h+"' where classdate='"+date+"' and tc='"+tc+"'");
                        }
                        if(x>0)
                        {
                          request.setAttribute("semester", semester);
                          request.setAttribute("branch", branch);  
                            RequestDispatcher rd=request.getRequestDispatcher("continue.jsp");
                            rd.forward(request, response);
                        }    
        
    }
        catch(Exception e)
        {
            out.println(e);
        }
        
        finally {
            out.close();
        }
    }
        if(day.equals(nee))
        {
            request.setAttribute("errorc", "chooseap.jsp");
            request.setAttribute("error", "PLEASE fill the date");
             RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                            rd.forward(request, response);
        }
        
    }
}
