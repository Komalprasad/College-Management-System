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
import java.util.Calendar;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author sony
 */
public class Transport extends HttpServlet {
    int dater,datei,moni,monr,yeari,yearr,output,feb=28;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int paise=0,fee=0,balance=0,fine,x;
        int pbalance=0,pfine=0;
        String studentid=null,paid=null,money=null,paidyear=null,classname=null,type=null;
        String studentname=null,paydate,sname=null;
        studentid=request.getParameter("studentid");
        studentid=studentid.toUpperCase();
        paid=request.getParameter("paidmonth");
        money=request.getParameter("money");
        paidyear=request.getParameter("paidyear");
        classname=request.getParameter("komal"); 
        moni=Integer.parseInt(paid);
        yeari=Integer.parseInt(paidyear);
        Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH)+1 ;
        int year = cal.get(Calendar.YEAR);
        dater=day;
        monr=month;
        yearr=year;
        paydate=day+"/"+month+"/"+year;
       if(moni<=monr &&yeari<=yearr)
       {
           if(studentid==null)
           {
            
               request.setAttribute("error", "student id may not be blank");
               RequestDispatcher rd=request.getRequestDispatcher("transport.jsp");
               rd.forward(request, response);
           }
           if(studentid!=null && money!=null)
           { 
           try {
                paise=Integer.parseInt(money);
                Statement st=new Connectionjdbc().komal();
                ResultSet rs;
                rs=st.executeQuery("select studentid,type,studentname from "+classname+" where studentid='"+studentid+"'");
                while(rs.next())
                {
                    type=rs.getString("type");
                    sname=rs.getString("studentid");
                    studentname=rs.getString("studentname");
                }
                
                rs=st.executeQuery("select fee from "+classname+"fee where type='"+type+"' AND month='"+paid+"' ");
                while(rs.next())
                {
                    fee=rs.getInt("fee");
                }
                if(!sname.equals(null))
                {
                    if(paise<fee)
                    {
                        balance=fee-paise;
                    }   
                    if(paise<=fee && paise!=0)
                    {
                            kops();
                            fine=output*10;   
                            x=st.executeUpdate("insert into transhostel values('"+studentid+"','"+studentname+"','"+paydate+"',"
                                                + "'"+paid+"','"+fee+"','"+paise+"','"+balance+"','"+fine+"','"+classname+"')");
                            rs=st.executeQuery("select balance,fine from "+classname+" where studentid='"+studentid+"'");
                            while(rs.next())
                            {
                               pbalance=rs.getInt("balance");
                                pfine=rs.getInt("fine");
                            }
                            pbalance=balance+pbalance;
                            pfine=fine+pfine;
                            x=st.executeUpdate("update "+classname+" set balance='"+pbalance+"',fine='"+pfine+"' where studentid='"+studentid+"'");
                            if(x>0)
                        {
                          
                          request.setAttribute("facility", classname);
                          request.setAttribute("studentname", studentname);
                          request.setAttribute("studentid", studentid);
                          request.setAttribute("totalbalance",""+pbalance+"" );
                          request.setAttribute("balance",""+balance+"");
                          request.setAttribute("totalfine", ""+pfine+"");
                          request.setAttribute("fine", ""+fine+"");
                          RequestDispatcher rd=request.getRequestDispatcher("transport.jsp");
                           rd.forward(request, response);
                        }
                       
                    }
                    else
                    {
                     request.setAttribute("error", "Money you enter is more than the fee for month"+month+"");
                     RequestDispatcher rd=request.getRequestDispatcher("transport.jsp");
                     rd.forward(request, response);
                    }
                }
        } catch (Exception e) 
        {
            request.setAttribute("error", "ENTER THE  ALL DETAIL CORRECTLY");
            RequestDispatcher rd=request.getRequestDispatcher("transport.jsp");
            rd.forward(request, response);
        }
    
        finally {
            out.close();
        }
       }
       }
       else
       {
           request.setAttribute("error", "PLEASE FILL THE DATE  CORECTlY");
            RequestDispatcher rd=request.getRequestDispatcher("transport.jsp");
            rd.forward(request, response);
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
        if(dater>15)
        output=dater-15;
        else 
            output=0;
    }
    public void second()
    {
       if(moni==1||moni==3||moni==5||moni==7||moni==8||moni==10||moni==12)
       {
        output=31-15;           
       }
       if(moni==2)
       {
           output=feb-15;
       }
       if(moni==4||moni==6||moni==9||moni==11)
       {
           output=30-15;        
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
        if(yearr==2016||yearr==2020||yearr==2024)
        {feb++;
        }
    } 
}
