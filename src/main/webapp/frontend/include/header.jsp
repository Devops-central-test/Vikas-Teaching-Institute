<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String email = (String) session.getAttribute("email");
    String name  = (String) session.getAttribute("user");
%>

<nav class="colorlib-nav" role="navigation" style="background:black;height:133px;">
    <div class="top-menu" style="padding:49px">
        <div class="container">
            <div class="row">

                <!-- LOGO -->
                <div class="col-md-3">
                    <h3 style="color:white; margin:0;">
                        <i class="fa fa-book" style="color:blue;"></i>
                        <a href="<c:url value='/frontend/index.jsp'/>" style="color:white; text-decoration:none;">
                            Shiva Teaching
                        </a>
                    </h3>
                </div>

                <!-- MENU -->
                <div class="col-md-9 text-right menu-1" style="margin-top:-43px">
                    <ul>

                        <li><a href="<c:url value='/frontend/index.jsp'/>">Home</a></li>

                        <!-- CATEGORY DROPDOWN -->
                        <%
                            Connection con = new connect_db().getConnection();
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM add_category");
                            ResultSet rs = ps.executeQuery();
                        %>

                        <li class="has-dropdown">
                            <a href="<c:url value='/frontend/courses.jsp'/>">Courses</a>
                            <ul class="dropdown">
                                <% while(rs.next()) { %>
                                <li>
                                    <a href="<c:url value='/frontend/course_category.jsp'/>?id=<%= rs.getString("id") %>">
                                        <%= rs.getString("category") %>
                                    </a>
                                </li>
                                <% } %>
                            </ul>
                        </li>

                        <li><a href="<c:url value='/frontend/teachers.jsp'/>">Mentors</a></li>
                        <li><a href="<c:url value='/frontend/about.jsp'/>">About</a></li>
                        <li><a href="<c:url value='/frontend/event.jsp'/>">Events</a></li>
                        <li><a href="<c:url value='/frontend/services.jsp'/>">Services</a></li>
                        <li><a href="<c:url value='/frontend/blog.jsp'/>">Blog</a></li>
                        <li><a href="<c:url value='/frontend/contact.jsp'/>">Contact</a></li>

                        <% if(email == null) { %>

                            <li><a href="<c:url value='/frontend/signin.jsp'/>">Sign In</a></li>
                            <li><a href="<c:url value='/frontend/signup.jsp'/>">Sign Up</a></li>

                        <% } else { %>

                            <li class="has-dropdown">
                                <a href="#"><span class="fa fa-user"></span> <b><%= name %></b></a>
                                <ul class="dropdown">
                                    <li><a href="<c:url value='/frontend/profile_user.jsp'/>">PROFILE</a></li>
                                    <li><a href="<c:url value='/frontend/logout.jsp'/>">LOGOUT</a></li>
                                </ul>
                            </li>

                        <% } %>

                    </ul>
                </div>

            </div>
        </div>
    </div>
</nav>
