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
import javax.servlet.RequestDispatcher;

/**
 *
 * @author sony
 * @komal
 */
/*
attendance fine calculatuion
*/
public class Cafine extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int x = 0,i=1,totala=0,totalp=0;
        int a[]=new int[100];
        int start =4;
        int end =6;
        int diff = 0;
        char j='"';
        String branch=request.getParameter("branch");
        String semester=request.getParameter("semester");
        String subject=request.getParameter("sub");
        String classname=null,attanclass=null,batchname=null,fcol=null;
        try {
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
                         
                         char hansu[]=new char[end - start];
                         attanclass.getChars(start, end, hansu,0);
                         fcol=new String(hansu);
                        rs=st.executeQuery("select rollno from "+batchname+"");
                        while(rs.next())
                        {
                            a[i]=rs.getInt("rollno");
                            i++;
                        }
                        for(int ne=1;ne<i;ne++)
                        {
                            rs=st.executeQuery("select classdate from "+attanclass+"");
                            while(rs.next())
                            {
                                totala++;
                            }
                            rs=st.executeQuery("select "+j+""+a[ne]+""+j+" from "+attanclass+" where "+j+""+a[ne]+""+j+"='P'");                            
                            while(rs.next())
                            {
                                totalp++;
                            }
                            
                                float aa=(float) 0.75;
                                float o;
                                o=aa*totala;
                                int b=(int)o;
                                if(b>totalp)
                                {
                                    diff=totala-totalp;
                                    diff=diff*5;
                                }
                                x=st.executeUpdate("update "+batchname+" set "+j+""+fcol+""+j+"="+diff+" where rollno='"+a[ne]+"'");
                                totala=0;
                                totalp=0;o=0;diff=0;
                        }
                        if(x>0)
                        {
                            RequestDispatcher rd=request.getRequestDispatcher("fineprint.jsp");
                            rd.forward(request, response);
                            
                        }
        }
        catch(Exception e)
        {
            request.setAttribute("error", e);
            request.setAttribute("errorc", "Afine.jsp");
            RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }
}
