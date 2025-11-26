<%-- 
    Document   : footer
    Created on : Jan 24, 2019, 8:29:12 PM
    Author     : vikas upadhyay
--%>

<%@page import="db.connect_db"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .fa {
  padding: 20px;
  font-size: 30px;
  width: 50px;
  text-align: center;
  text-decoration: none;
}

/* Add a hover effect if you want */
.fa:hover {
  opacity: 0.7;
}

/* Set a specific color for each brand */

/* Facebook */
.fa-facebook {
  background: #3B5998;
  color: white;
}

/* Twitter */
.fa-twitter {
  background: #55ACEE;
  color: white;
}
        </style>
    </head>
    <body>
      <%    String c=null;
            String a=null;
            String t=null;
            String e=null;
            String ff=null;
            Connection con2=new connect_db().getConnection();
            PreparedStatement ps3=con2.prepareStatement("select * from contact_info");
            ResultSet rs3=ps3.executeQuery();
            while(rs3.next())
            {
            c=rs3.getString("company");
            a=rs3.getString("address");
            t=rs3.getString("telephone");
            e=rs3.getString("email");
            ff=rs3.getString("fax");
            }
                %>
        <footer id="colorlib-footer">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-3 colorlib-widget">
						<h4>Contact Info</h4>
						<ul class="colorlib-footer-links">
							<li><%=c%>, <br> <%=a%></li>
							<li><a href="tel://<%=t%>"><i class="icon-phone"></i> +91 <%=t%></a></li>
							<li><a href="mailto:<%=e%>"><i class="icon-envelope"></i><%=e%></a></li>
							<li><a href="#"><i class="icon-file"></i> <%=ff%></a></li>
						</ul>
					</div>
					<div class="col-md-2 colorlib-widget">
<!--						<h4>Programs</h4>
						<p>
							<ul class="colorlib-footer-links">
								<li><a href="#"><i class="icon-check"></i> Diploma Degree</a></li>
								<li><a href="#"><i class="icon-check"></i> BS Degree</a></li>
								<li><a href="#"><i class="icon-check"></i> Beginner</a></li>
								<li><a href="#"><i class="icon-check"></i> Intermediate</a></li>
								<li><a href="#"><i class="icon-check"></i> Advance</a></li>
								<li><a href="#"><i class="icon-check"></i> Difficulty</a></li>
							</ul>
						</p>-->
					</div>
					<div class="col-md-2 colorlib-widget">
						<h4>Useful Links</h4>
						<p>
							<ul class="colorlib-footer-links">
								<li><a href="about.jsp"><i class="icon-check"></i> About Us</a></li>
								<li><a href="testimonial_viewall.jsp"><i class="icon-check"></i> Testimonials</a></li>
								<li><a href="courses.jsp"><i class="icon-check"></i> Courses</a></li>
								<li><a href="event.jsp"><i class="icon-check"></i> Event</a></li>
								<li><a href="services.jsp"><i class="icon-check"></i> Services</a></li>
								<li><a href="contact.jsp"><i class="icon-check"></i> Contact</a></li>
                                                                 <%
                                                        if(session.getAttribute("email")!=null){
                                                        %>
                                                                <li ><a href="service_query.jsp"><i class="icon-check"></i> Can we help you</a> </li>
                                                                <% } %>
							</ul>
						</p>
					</div>

					<div class="col-md-2 colorlib-widget">
<!--						<h4>Support</h4>
						<p>
							<ul class="colorlib-footer-links">
								<li><a href="#"><i class="icon-check"></i> Documentation</a></li>
								<li><a href="#"><i class="icon-check"></i> Forums</a></li>
								<li><a href="#"><i class="icon-check"></i> Help &amp; Support</a></li>
								<li><a href="#"><i class="icon-check"></i> Scholarship</a></li>
								<li><a href="#"><i class="icon-check"></i> Student Transport</a></li>
								<li><a href="#"><i class="icon-check"></i> Release Status</a></li>
							</ul>
						</p>-->
					</div>
 
					<div class="col-md-3 colorlib-widget">
						
					</div>
				</div>
			</div>
            <%      String f=null;
                    String g=null;
                    String i=null;
                    String y=null;
                  Connection con1=new connect_db().getConnection();
            PreparedStatement ps1=con1.prepareStatement("select * from location_link");
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
                f=rs1.getString("facebook");
                g=rs1.getString("google");
                i=rs1.getString("instagram");
                y=rs1.getString("youtube");
                
            }
            %>
            
                                        <div style="text-align: center">   
                                                <a href="<%=f%>" class="fa fa-facebook"></a>
                                                <a href="<%=g%>" class="fa fa-google-plus"></a>
                                                <a href="<%=i%>" class="fa fa-instagram"></a>
                                                <a href="<%=y%>" class="fa fa-youtube"></a>
                                        </div>
                
                
           
			<div class="copy">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
					<p>
                                        
								<small class="block">&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="http://web.dictiontechnology.com/" target="_blank">Diction Technology</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small><br> 
								
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
    </body>
</html>
