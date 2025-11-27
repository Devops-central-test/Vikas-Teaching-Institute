<%-- 
    Document   : sidebar
    Created on : Jul 31, 2018, 9:42:29 AM
    Author     : APTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
                                                                <%
        
                                         if(session.getAttribute("email2")==null){
                                                           %>
                                                            <li><a><i class="fa fa-user"></i> Admin Profile <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                                <li><a href="edit_profile.jsp">Edit Profile</a>
										</li>
										<li><a href="change_Password.jsp">Change Password</a>
										</li>
                                                                                
									</ul>
								</li>
                                                               
                                                                <li><a><i class="fa fa-user"></i> Sub-Admin Profile <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                                <li><a href="add_subadmin.jsp">Add SubAdmin</a>
										</li>
                                                                                <li><a href="view_subadmin.jsp">View subAdmin</a>
										</li>
									</ul>
								</li>
                                                                <% } else{}%>
                                                                
								<li><a><i class="fa fa-file-image-o"></i> Banner <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="Add_Banner.jsp">Add Banner</a>
										</li>
										<li><a href="view_Banner.jsp">View Banner</a>
										</li>
									</ul>
								</li>
<!--                                                                <li><a><i class="fa fa-file-image-o"></i> Gallery <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="Add_Gallery.jsp">Add Gallery</a>
										</li>
										<li><a href="view_Gallery.jsp">View Gallery</a>
										</li>
									</ul>
								</li>-->
                                                                
                                                               <li><a><i class="fa fa-bars"></i> Category <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="Add_Category.jsp">Add Category</a>
										</li>
										<li><a href="view_Category.jsp">View Category</a>
										</li>
<!--                                                                                <li><a href="Add_SubCategory.jsp">Add Sub-Category</a>
										</li>
                                                                                <li><a href="view_SubCategory.jsp">View Sub-Category</a>
										</li>-->
                                                                                <li><a href="Add_Courses.jsp">Add Courses</a>
										</li>
                                                                                <li><a href="view_Courses.jsp">View Courses</a>
										</li>
<!--                                                                                <li><a href="add_pincode.jsp">Add Pincode</a>
										</li>
                                                                                <li><a href="view_pincode.jsp">View Pincode</a>
										</li>-->
                                                                                 
                                                                                
									</ul>
								</li>
								<li><a><i class="glyphicon glyphicon-heart-empty"></i> Testimonial and Services <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="Testimonial.jsp">View Testimonial</a>
										</li>
                                                                               <li><a href="services1.jsp">Add Services</a>
										</li>
                                                                                <li><a href="view_services.jsp">View Services</a>
										</li>
                                                                                <li><a href="add_blog.jsp">Add Blog</a>
										</li>
                                                                                <li><a href="view_blog.jsp">View Blog</a>
										</li>
                                                                                
									    
									</ul>
								</li>
                                                                <li><a><i class="fa fa-question"></i> Mentors and Events <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
<!--                                                                            <li><a href="ADD_FAQ.jsp">Add FAQ</a>
										</li>
										 <li><a href="View_FAQ.jsp">View FAQ</a>
										</li>-->
                                                                                <li><a href="Add_team.jsp">Add Mentors</a>
										</li>
                                                                                <li><a href="View_team.jsp">View Mentors</a>
										</li>
                                                                                <li><a href="add_events.jsp">Add Events</a>
										</li>
                                                                                <li><a href="view_events.jsp">View Events</a>
										</li>
									</ul>
								</li>
                                                                <li><a><i class="fa fa-edit"></i> Pages <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="Addaboutus.jsp">Update About Us</a></li>
<!--                                                                            <li><a href="PrivacyPolicy.jsp">Update Privacy Policy</a> </li>
                                                                            <li><a href="refund_rules.jsp">Update Refund Policy</a> </li>
								            <li><a href="Term_Condition.jsp">Update Terms & Conditions</a>
						                           </li>-->
<!--                                                                           <li><a href="add_cars.jsp">Add Cars </a>
						                           </li>
                                                                           <li><a href="view_cars.jsp">View Cars </a>
						                           </li>-->
                                                                           
                                                                           <li><a href="contact_info.jsp">Contact Information</a>
						                           </li>
<!--                                                                           <li><a href="view_services.jsp">view services</a>
						                           </li>-->
<!--                                                                           <li><a href="services1.jsp">add services</a>
						                           </li>-->
                                                                            
                                                                           <li><a href="location_link.jsp">location link </a>
						                           </li>
                                                                           <li><a href="allUsersTable.jsp">all users</a>
						                           </li>
                              					         </ul>
                                                                </li>
                                                                 <li><a><i class="fa fa-question"></i>Query<span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            <li><a href="contact_Query.jsp">Contact Query</a>
										</li>
										 <li><a href="service_Query.jsp">Service Query</a>
										</li>
									</ul>
								</li>
                                                                
                                                                 <li><a><i class="fa fa-cart-plus"></i>Booking<span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
                                                                            
									 <li><a href="view booking.jsp">Booking History</a>
										
                                                                            </li>
										
									</ul>
								</li>
                                                                 
                                                                
                                                                    
						</div>
					</div>   
    </body>
</html>
