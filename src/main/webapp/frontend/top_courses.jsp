<%-- 
    Document   : top_courses
    Created on : Feb 1, 2019, 11:03:52 AM
    Author     : vikas upadhyay
--%>

<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
            h3.a {
  white-space: nowrap; 
   
  
  overflow: hidden;
  
  word-break: break-all;
}
        </style>

    <body>
        <%
                Connection con41=new connect_db().getConnection();
                PreparedStatement ps41 = con41.prepareStatement("select count(courses) as ab, courses from course_register group by courses order by ab desc limit 4");
                ResultSet rs41 = ps41.executeQuery();
                if(rs41.next())
                {
                PreparedStatement ps42=con41.prepareStatement("select * from courses inner join course_register on courses.cname=course_register.courses group by courses.cname limit 4 ");
                ResultSet rs42=ps42.executeQuery();
               

            %>
            <div class="colorlib-classes">
			<div class="container">
				<div class="row">
					<div class="col-md-12 colorlib-heading center-heading text-center animate-box">
						<h1 class="heading-big">Top Courses</h1>
						<h2>Top Courses</h2>
					</div>
				</div>
				<div class="row">
                                    <%
                               while(rs42.next()){          


                                        %>
                                    
					<div class="col-md-4 animate-box">
						<div class="classes">
							<div class="classes-img" style="background-image: url(admin/images/<%=rs42.getString("image") %>);width: 341px">
							</div>
							<div class="wrap">
								<div class="desc">
                                                                    <span class="teacher"><%=rs42.getString("cname") %></span>
									<h3 class="a"><a href="#"><%=rs42.getString("description") %></a></h3>
								</div>
								<div class="pricing">
									<p><span class="price">&#8377 <%=rs42.getString("price") %></span> <button class="btn-cta" style="float: right"><a href="courses-single.jsp?id=<%=rs42.getString("id")%>"><span>Read More</span></a></button> </p>
								</div>
							</div>
						</div>
					</div>
				<% 

                                }}
                                
                                %>	
                                    
                                    
				</div>
			</div>	
		</div>
    </body>
</html>
