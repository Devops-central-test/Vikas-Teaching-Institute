<%-- 
    Document   : header
    Created on : Jan 24, 2019, 3:59:07 PM
    Author     : vikas upadhyay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String email="";
        email=(String) session.getAttribute("email");
        String name="";
        name=(String) session.getAttribute("user");
        %>
      <nav class="colorlib-nav" role="navigation" style="background-color: black;height: 133px">
          
			
			<div class="top-menu" style="padding: 49px">
				<div class="container">
					<div class="row">
                                            <div class="col-md-3" >
							<div id="colorlib-logo" class="fa fa-book" style="color:blue;" ><a href="index.jsp">Shiva Teaching</a></div>
						</div>
						<div class="col-md-9 text-right menu-1" style="margin-top: -43px">
                                                    <%
                                                        if(session.getAttribute("email")==null){
                                                        %>
							<ul>
								<li ><a href="index.jsp">Home</a></li>
                                             <% Connection con=new connect_db().getConnection();
                                                PreparedStatement ps1=con.prepareStatement("SELECT * from add_category where status='active'");
                                                ResultSet rs1=ps1.executeQuery();
                                                
                                                %>
								<li class="has-dropdown"><a href="courses.jsp">Courses</a>
                                                                    <ul class="dropdown">
                                                                        <%  while(rs1.next()){ %>
                                                                        <li ><a href="course_category.jsp?id=<%=rs1.getString("id")%>"><%=rs1.getString("category")%></a> </li>
                                                                   <% } %>
                                                                    </ul>
                                                                    </li>
								<li><a href="teachers.jsp">Mentors</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="event.jsp">Events</a></li>
								<li><a href="services.jsp">Services</a></li>
                                                                <li><a href="blog.jsp">Blog</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								<li class="btn-cta"><a href="signin.jsp"><span>sign in</span></a></li>
                                                                <li class="btn-cta"><a href="signup.jsp" ><span>sign up</span></a></li>
							</ul>
                                                                       <form action="search.jsp">
                                                                           <input type="text" placeholder="Search.." name="search" style="height: 30px">
                                                                 <button type="submit" style="color: white;border-radius: 20px;border: none;background: none" class="fa fa-search"></button>
                                                                                                     </form>
                                                         <%
                                                            }else{
                                                            %>   
                                                            
                                                            
                                                            
                                                            
                                                    <ul>
								<li ><a href="index.jsp">Home</a></li>
                                             <% Connection con=new connect_db().getConnection();
                                                PreparedStatement ps1=con.prepareStatement("SELECT * from add_category ");
                                                ResultSet rs1=ps1.executeQuery();
                                                %>
								<li class="has-dropdown"><a href="courses.jsp">Courses</a>
                                                              
                                                                    <ul class="dropdown">
                                                                         <%  while(rs1.next()){ %>
                                                                  <li><a href="course_category.jsp?id=<%=rs1.getString("id")%>"><%=rs1.getString("category")%></a> </li>
                                                                    <% } %>
                                                                    </ul>
                                                                    </li>
                                                                    
								<li><a href="teachers.jsp">Mentors</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="event.jsp">Events</a></li>
								<li><a href="services.jsp">Services</a></li>
                                                                <li><a href="blog.jsp">Blog</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								
                                                                
                                                                <li class="has-dropdown"><span class="fa fa-user"></span><a href="#" style="position: absolute"><b><%=name%></b></a>
                                                                            <ul class="dropdown">
                                                                                <li ><a href="profile_user.jsp">PROFILE</a> </li>
                                                                                <li ><a href="booking.jsp">ORDER HISTORY</a> </li>
                                                                                <li ><a href="testimonial.jsp">FEEDBACK</a> </li>
                                                                                <li ><a href="service_query.jsp">SERVICE QUERY</a> </li>
                                                                                <li ><a href="change_password.jsp">CHANGE PASSWORD</a> </li>
                                                                                <li ><a href="logout.jsp">LOGOUT </a> </li>
                                                                            </ul> 
                                                                        </li>
                                                    </ul> 
                                                                           <form action="search.jsp">
                                                                           <input type="text" placeholder="Search.." name="search" style="height: 30px">
                                                                 <button type="submit" style="color: white;border-radius: 20px;border: none;background: none" class="fa fa-search"></button>
                                                                                                     </form>
                                                    
                                                    
                                                    
                                                    <%}%>
						</div>
					</div>
				</div>
			</div>
		</nav>
               
                                                                                             
                                                                        
                                                                        
    </body>
</html>
