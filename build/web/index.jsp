<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>komal prasad</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">MERI<br />
          <small>Management Education & Research Institute </small></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span><span>Home</span></span></a></li>
          <li><a href="slogin.jsp"><span><span>Student</span></span></a></li>
          <li><a href="login.jsp"><span><span>Administrator</span></span></a></li>
          <li><a href="about.html"><span><span>About Us</span></span></a></li>
          <li><a href="blog.html"><span><span>Blog</span></span></a></li>
          <li><a href="contact.jsp"><span><span>Contact Us</span></span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <img src="images/image.jpg" width="970" height="239" alt="" />
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>MERI</span></h2>
          <p> <a href="#">Owner</a> | Filed under <a href="#">about</a>, <a href="#">contact us</a></p>
          <p>This is the college management which gives a basic view toward management system.this project includes which have 
              different and specific work. We can calculate fine in library as well as class fine. <a href="http://creativecommons.org/licenses/by/3.0/"></a></p>
          <img src="images/img1.jpg" width="287" height="97" alt="" /> <img src="images/img2.jpg" width="287" height="97" alt="" />
          <p class="lbg"><a href="#" class="obg">Read more</a> <span>&nbsp;&bull;&nbsp;</span> <a href="#" class="obg">Comments (3)</a> | March 16, 2015</p>
        </div>
        <div class="article">
          <h2><span>MERI</span></h2>
          <p>Posted by <a href="#">Owner</a> | Filed under <a href="#">templates</a>, <a href="#">internet</a></p>
          <p>College provides you the best education service in the haryana. This college is been establish in 
              1993 and the btech courses is been introduced in 2008. <a href="#"></a>
          This project will provide you the better way that how a management system of college work. This include different 
          module which have their specific work. 
          </p>
          <p class="lbg"><a href="#" class="obg">Read more</a> <span>&nbsp;&bull;&nbsp;</span> <a href="#" class="obg">Comments (7)</a> | March 15, 2015</p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>QUICK</span> Link</h2>
          <ul class="sb_menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="reception.jsp">RECEPTION</a></li>
            <li><a href="contact.jsp">Contact us</a></li>
            <li><a href="#">Archives</a></li>
            <li><a href="#"></a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star"><span>NOTIFICATION</span></h2>
          <ul class="ex_menu">
            <li>
                <table>
                 <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection komal=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2281993");
                Statement st=komal.createStatement();
                ResultSet rs;
                rs=st.executeQuery("select * from notification");
                while(rs.next())
                {
                    %>
                    
                    <td style="color: white"><%=rs.getString("don")%></td>
                    <td style=" color: white"><%=rs.getString("notify")%></td>
                    <tr></tr>
                    
                    <%
                }
            }  catch(Exception e)
            {
                
            }%>
            </table>
            </li>
            
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image Gallery</span></h2>
        <a href="#"><img src="images/pix1.jpg" width="56" height="56" alt="" /></a> <a href="#"><img src="images/pix2.jpg" width="56" height="56" alt="" /></a> <a href="#"><img src="images/pix3.jpg" width="56" height="56" alt="" /></a> <a href="#"><img src="images/pix4.jpg" width="56" height="56" alt="" /></a> <a href="#"><img src="images/pix5.jpg" width="56" height="56" alt="" /></a> <a href="#"><img src="images/pix6.jpg" width="56" height="56" alt="" /></a> </div>
      <div class="col c2">
        <h2><span>Komal Prasad</span></h2>
        <p>Project <br />
          This project takes lots of time as i have to design the algorithm
        it's working. Unit testing, integral testing as well as white box and black box testing is been done
        before submitting this. Yet there is chances that it may occur some error.</p>
      </div>
      <div class="col c3">
        <h2><span>About</span></h2>
        <img src="images/white.jpg" width="56" height="56" alt="" />
        <p>This is the basic preview of college management it doesn't have
        real front hand design but we can work in it and develop furthur.
        
        </p>
        <p><a href="#" class="lbg">Learn more...</a></p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">design and developed by KOMAL PRASAD <a href="http://www.bluewebtemplates.com/"></a></p>
      <ul class="fmenu">
        <li class="active"><a href="index.html">Home</a></li>
        <li><a href="support.html">Support</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="about.html">About Us</a></li>
        <li><a href="contact.html">Contacts</a></li>
      </ul>
      <div class="clr"></div>
    </div>
  </div>
</div>
<div align=center> project presentation <a href='http://all-free-download.com/free-website-templates/'></a></div></body>
</html>
