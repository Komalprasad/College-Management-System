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
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author sony
 */
public class Bookbank extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Date date = new java.util.Date();
         String idate = dateFormat.format(date);
         String[] info=new String[7];
         String[] bo=new String[8];
         String n = null,check1=null,check2=null,n1=null,studentname=null;
         int x=0;
         String studentid=request.getParameter("sid");
         studentid=studentid.toUpperCase();
        try {
                Statement st=new Connectionjdbc().komal();
                ResultSet rs;
                int ko=1;
                if(studentid!="")
                {
                    char han[]=new char[4 - 0];
                    studentid.getChars(0, 4, han, 0);
                    String studentbranch=new String(han);
                    while(ko<7)
                    {
                        String bookid=request.getParameter(""+ko);
                        bookid=bookid.toUpperCase();
                        bo[ko]=bookid;
                        out.println(bookid+"<br>");
                        if(bookid!="")
                        {
                        char hansu[]=new char[3 - 0];
                        bookid.getChars(0, 3, hansu,0);
                        String bookclass=new String(hansu);
                        rs=st.executeQuery("select * from "+bookclass+" where bookid='"+bookid+"'");
                        while(rs.next())
                        {
                            n=rs.getString("bookid");
                            check1=rs.getString("studentid");
                            check2=rs.getString("issuedate");
                        }
                         if((""+bookid).equals(n))
                          {
                              
                            if(check1 == null && check2 == null)
                                {
                                    
                                     rs=st.executeQuery("select studentname from "+studentbranch+" where studentid='"+studentid+"'");
                                        while(rs.next())
                                            {
                                                studentname=rs.getString("studentname");
                                            }
                                        if(studentname!=null)
                                        {
                                        x=st.executeUpdate("update "+bookclass+" set studentid='"+studentid+"',issuedate='"+idate+"' where bookid='"+bookid+"'");
                                        rs=st.executeQuery("select studentid from fine where studentid='"+studentid+"'");
                                        while(rs.next())
                                        {
                                            n1=rs.getString("studentid");
                                        }
                                        if(n1==null)
                                        { 
                                            x=st.executeUpdate("insert into fine values ('"+studentid+"','"+studentname+"','0','"+studentbranch+"')");
                                        }
                                        x=st.executeUpdate("insert into cfine values ('"+bookid+"','"+studentid+"','"+idate+"','','0','"+studentbranch+"','BOOKBANK')");
                                        if(x==1)
                                            {
                                                info[ko]="ISSUED";
                                            }
                                            else
                                            {
                                                info[ko]="NOT ISSUED";
                                            }
                                        }
                                           else
                                                {
                                                    request.setAttribute("error", "STUDENT NOT PRESENT");
                                                    RequestDispatcher rd=request.getRequestDispatcher("bookbank.jsp");
                                                    rd.forward(request, response);
                                                }     
                                }
                            if(check1!=null )
                            {
                                info[ko]="ALREDY ISSUED ";
                            }
                            
                          }
                         if(n==null)
                         {
                             info[ko]="BOOK NOT PRESENT";
                         }
                        
                    }
                        else
                        {
                            info[ko]="BOOK NOT ENTERED";
                        }
                        check1=null;check2=null;n=null;
                        ko++;
                    }
                    if(ko==7)
                    {
                        request.setAttribute("sid", ""+studentid);
                        request.setAttribute("i1",info[1]);
                        request.setAttribute("i2",info[2]);
                        request.setAttribute("i3",info[3]);
                        request.setAttribute("i4",info[4]);
                        request.setAttribute("i5",info[5]);
                        request.setAttribute("i6",info[6]);
                        request.setAttribute("b1", bo[1]);
                        request.setAttribute("b2", bo[2]);
                        request.setAttribute("b3", bo[3]);
                        request.setAttribute("b4", bo[4]);
                        request.setAttribute("b5", bo[5]);
                        request.setAttribute("b6", bo[6]);
                        RequestDispatcher rd=request.getRequestDispatcher("bookbank.jsp");
                        rd.forward(request, response);
                        /*for(int h=1;h<ko;h++)
                        {
                            out.println("info"+h+info[h]);
                            out.println("<br>");
                            out.println("b is:"+h+bo[ko]);
                            out.println("<br>");
                        }*/
                    }
                }
                else
                {
                    request.setAttribute("error", "ENTER STUDENT ID");
                    RequestDispatcher rd=request.getRequestDispatcher("bookbank.jsp");
                    rd.forward(request, response);
                }
            }
        catch(Exception e)
        {
            request.setAttribute("error", "DATA IS NOT IN CORRECT FORMAT");
                    RequestDispatcher rd=request.getRequestDispatcher("bookbank.jsp");
                    rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }
}
