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
public class Computation extends HttpServlet {
       
 int dater,datei,moni,monr,yeari,yearr,output,feb=28,fine=0,cfine;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int x;
        String studentname = null,bi="BOOK RETURN BY";
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        int start=0,end=4 ,pf=0;
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Date date = new java.util.Date();
            String datereturn = dateFormat.format(date);
        try {
           String day=(String)request.getAttribute("day1");
           String mon=(String)request.getAttribute("mon1");
           String year=(String)request.getAttribute("year1");
           String studentid=(String)request.getAttribute("studentid");
           String bookid=request.getParameter("bookid");
           bookid=bookid.toUpperCase();
           String name=(String)request.getAttribute("bookname");
           datei=Integer.parseInt(day);
           moni=Integer.parseInt(mon);
              yeari=Integer.parseInt(year);
              Calendar cal = Calendar.getInstance();
             dater = cal.get(Calendar.DATE);
             monr = cal.get(Calendar.MONTH)+1 ;
             yearr = cal.get(Calendar.YEAR);
         call();
         if(output>7)
         {
         if(output>14)
         {
             fine=output;
             cfine=output;
         }
           Statement st=new Connectionjdbc().komal();
            ResultSet rs = null;
            char han[]=new char[end - start];
            studentid.getChars(start, end, han, 0);
            String studentbranch=new String(han);
            rs=st.executeQuery("select fine from fine where studentid='"+studentid+"'");
            while(rs.next())
            {
                pf=rs.getInt("fine");
            }
            fine=fine+pf;
             x=st.executeUpdate("update "+name+" set issuedate='',studentid='' where bookid='"+bookid+"'");
             x=st.executeUpdate("update fine set fine='"+fine+"' where studentid='"+studentid+"'");
            x=st.executeUpdate(" update cfine set returndate='"+datereturn+"',fine='"+cfine+"' where bookid='"+bookid+"'");
            rs=st.executeQuery("select studentname from "+studentbranch+" where studentid='"+studentid+"'");
                   while(rs.next())
                       {
                           studentname=rs.getString("studentname");
                       }
            if(x>0)
            {
                   String komal = null,prasad = null;
                   rs=st.executeQuery("select bookname,author from bookentry where bookid='"+bookid+"'");
                   while(rs.next())
                   {
                       komal=rs.getString("bookname");
                       prasad=rs.getString("author");
                   }
                  request.setAttribute("bi", bi);
                  request.setAttribute("studentid", studentid);
                  request.setAttribute("studentname", studentname);
                  request.setAttribute("fine", ""+fine);
                  request.setAttribute("ca",""+cfine);
                  request.setAttribute("bookid", bookid);
                  request.setAttribute("bookname", komal);
                  request.setAttribute("author", prasad);
                  RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
                  rd.forward(request, response);
            }
            if(x<=0)
            {
             request.setAttribute("error", "TABLE CAN'T BE UPDATED ");
             request.setAttribute("errorc", "return");
             RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
             rd.forward(request, response);
            }
         }
         if(output<=7)
         {
             request.setAttribute("error", "BOOK CAN'T BE RETURN WITHIN 7 DAYS OF ISSUE");
             request.setAttribute("errorc", "return");
             RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
             rd.forward(request, response);
         }
               
        }catch(Exception e)
        {
             request.setAttribute("error",e);
             request.setAttribute("errorc", "return");
             RequestDispatcher rd=request.getRequestDispatcher("Issue.jsp");
             rd.forward(request, response);
        }
        finally {
            
            out.close();
        }
    }
            
     public void  kops()
    {
       leap();
       if(yearr==yeari)
       {
           if(monr==moni)
           {
               first();
           }
           if(monr!=moni)
           {
               second();
               while(moni!=monr)
               {
                   third();
               }
               if(moni==monr)
               {
                   fourth();
               }
           }
       }
       if(yearr!=yeari)
       {
           second();
           while(moni!=13)
           {
               third();
           }
           moni=1;
           while(moni!=monr)
           {
            third();   
           }
           if(moni==monr)
           {
               fourth();
           }
       }
    }
    public void first()
    {
        output=dater-datei;
    }
    public void second()
    {
       if(moni==1||moni==3||moni==5||moni==7||moni==8||moni==10||moni==12)
       {
        output=31-datei;           
       }
       if(moni==2)
       {
           output=feb-datei;
       }
       if(moni==4||moni==6||moni==9||moni==11)
       {
           output=30-datei;        
       }
       moni++;
    }
    public void third()
    {
        if(moni==1||moni==3||moni==5||moni==7||moni==8||moni==10||moni==12)
       {
        output=31+output;        
       }
       if(moni==2)
       {
           output=feb+output;
       }
       if(moni==4||moni==6||moni==9||moni==11)
       {
           output=30+output;
       } 
       moni++;
    }
    public void fourth()
    { 
       output+=dater;
    }
    public void leap()
    {
        if(yearr==2016||yearr==2020)
        {feb++;
        }
    }
   
    public void call()
    {kops();
    }
}
