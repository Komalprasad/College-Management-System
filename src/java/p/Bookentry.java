/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author sony
 * @komal
 */
public class Bookentry extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookname=null,subject=null,tn=null;
        String komal = null;
        int tnb=0;
        try {
           int pe = 0,e,t,u,y=0;
           String bookid;
           Statement st=new Connectionjdbc().komal();
           ResultSet rs;
            bookname = request.getParameter("bookname");
           String author = request.getParameter("author");
           tn = request.getParameter("totalbooks");
            tnb=Integer.parseInt(tn);
           subject =request.getParameter("subject");
           String branch = request.getParameter("type");
           String year= request.getParameter("year");
           u=Integer.parseInt(year);           
           Calendar cal = Calendar.getInstance();
           Date time=cal.getTime();
            rs=st.executeQuery("select TNB from total");
            while(rs.next())
            {
                  pe=rs.getInt("TNB");
            }
            t=pe+tnb;
            y=st.executeUpdate("update total set TNB='"+t+"' where TNB='"+pe+"'");
           for(int i=0;i<tnb;i++)
            {                
                pe++;
                bookid=""+branch+""+year+""+pe+"";
                if(u==0)
                {
                    bookid=branch+pe;
                }
                y=st.executeUpdate("insert into bookentry values('"+bookid+"','"+bookname+"','"+author+"','"+subject+"','"+branch+"','"+year+"','"+time+"','')");
                 komal=""+branch+""+year+"";
                 if(u==0)
                 {
                     komal=branch;
                 }
                y=st.executeUpdate("insert into "+komal+" values('"+bookid+"','"+bookname+"','','')");
            }
          
        }catch(Exception e)
        {
              request.setAttribute("error","ALL GIVEN BLOCKS NEED TO BE FILL");
              request.setAttribute("errorc","Bookentry.jsp");
              RequestDispatcher rd=request.getRequestDispatcher("Bookentry.jsp");
              rd.forward(request, response);
        }
        finally {
             request.setAttribute("bookid", ""+komal+"");
             request.setAttribute("bookname",""+bookname+"");
             request.setAttribute("subject",""+subject+"");
             request.setAttribute("totalbooks",""+tn+"");
             RequestDispatcher rd=request.getRequestDispatcher("/Bookcomp");
                rd.forward(request, response);
            out.close();
        }
    } 
}
