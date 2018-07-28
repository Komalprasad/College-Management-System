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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Calfine extends HttpServlet {
int dater,datei,moni,monr,yeari,yearr,output,feb=28,fine,x;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int pf=0,i=1;
        String check1=null,check2=null;
        String idate[]=new String[2000];
        String studentid[]=new String[2000];
        String komal="null";
        try {
             Statement st=new Connectionjdbc().komal();
            ResultSet rs=null;
            int start,end;
            Calendar cal = Calendar.getInstance();
             dater = cal.get(Calendar.DATE);
             monr = cal.get(Calendar.MONTH)+1 ;
             yearr = cal.get(Calendar.YEAR);
            String sql="select returndate,issuedate,studentid,bookbank from cfine"; 
            rs=st.executeQuery(sql);
            while(rs.next())
            {
                check1=""+rs.getString("returndate");
                check2=""+rs.getString("bookbank");
                if(check1.equals(komal) && check2.equals(komal))
                {
                idate[i]=rs.getString("issuedate");
                studentid[i]=rs.getString("studentid");
                i++;
                }
            }
            for(int j=1;j<i;j++)
                {
                     start=0;end=2;
                     char hans[]=new char[end - start];
                     idate[j].getChars(start, end, hans,0);
                     String day1=new String(hans);
                     datei=Integer.parseInt(day1);
                     start=3;end=5;
                     char han[] =new char[end - start];
                     idate[j].getChars(start, end, han, 0);
                     String mon1=new String(han);
                     moni=Integer.parseInt(mon1);
                     start=6;end=10;
                     char ne[] =new char[end - start];
                     idate[j].getChars(start, end, ne, 0);
                     String year1=new String(ne); 
                     yeari=Integer.parseInt(year1);
                     call(); 
                     rs=st.executeQuery("select fine from fine where studentid='"+studentid[j]+"'");
                     while(rs.next())
                     {
                         pf=rs.getInt("fine");
                     }  
                     if(output>14)
                     {
                         fine=output;
                     }
                     fine=fine+pf;
                           x=st.executeUpdate("update fine set fine='"+fine+"' where studentid='"+studentid[j]+"'");
                           fine=0;pf=0;output=0;
                }
            if(x>0)
        {
            response.sendRedirect("printfine.jsp");
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
