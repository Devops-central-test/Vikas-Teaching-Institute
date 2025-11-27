<%-- 
    Document   : header
    Created on : Jul 31, 2018, 9:42:19 AM
    Author     : APTA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        if(session.getAttribute("email1")!=null){
                %>
        
        <% Connection con=new connect_db().getConnection();
PreparedStatement ps=con.prepareStatement("select * from admin_profile");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    

%>
       <div class="navbar nav_title" style="border: 0;">
						<a href="dashboard.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Shiva Teaching</span></a>
					</div>
					<div class="clearfix"></div>

					<!-- menu prile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img src="images/<%=rs.getString("image")%>" alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=rs.getString("name")%></h2>
						</div>
					</div>
					<!-- /menu prile quick info -->

					<br />
                                        <% }} else if(session.getAttribute("email2")!=null) {%>

        <% String email2=session.getAttribute("email2").toString();
            Connection con=new connect_db().getConnection();
PreparedStatement ps=con.prepareStatement("select * from add_subadmin where email=?");
ps.setString(1, email2);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
    

%>
       <div class="navbar nav_title" style="border: 0;">
						<a href="dashboard.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Shiva Teaching</span></a>
					</div>
					<div class="clearfix"></div>

					<!-- menu prile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img src="images/<%=rs.getString("image")%>" alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=rs.getString("sname")%></h2>
						</div>
					</div>
					<!-- /menu prile quick info -->

					<br />  
                                        <% }}%>
    </body>
</html>
