<%@page import="java.sql.ResultSet"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- All CSS through context path -->
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
</head>

<body>

<%
    String email = (String) session.getAttribute("email");
    String name  = (String) session.getAttribute("user");
%>

<nav class="colorlib-nav" role="navigation" style="background-color:black;height:133px;">
    <div class="top-menu" style="padding:49px">
        <div class="container">
            <div class="row">

                <!-- LOGO -->
                <div class="col-md-3">
                    <div id="colorlib-logo" class="fa fa-book" style="color:blue;">
                        <a href="<c:url value='/frontend/index.jsp'/>">Shiva Teaching</a>
                    </div>
                </div>

                <!-- MENU -->
                <div class="col-md-9 text-right menu-1" style="margin-top:-43px">

                    <%
                    if (email == null) {
                    %>

                    <ul>
                        <li><a href="<c:url value='/frontend/index.jsp'/>">Home</a></li>

                        <% 
                        Connection con = new connect_db().getConnection();
                        PreparedStatement ps1 = con.prepareStatement("SELECT * from add_category where status='active'");
                        ResultSet rs1 = ps1.executeQuery();
                        %>

                        <li class="has-dropdown">
                            <a href="<c:url value='/frontend/courses.jsp'/>">Courses</a>
                            <ul class="dropdown">
                                <% while(rs1.next()) { %>
                                <li>
                                    <a href="<c:url value='/frontend/course_category.jsp?id='/><%=rs1.getString("id")%>">
                                        <%=rs1.getString("category")%>
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

                        <li class="btn-cta"><a href="<c:url value='/frontend/signin.jsp'/>"><span>Sign In</span></a></li>
                        <li class="btn-cta"><a href="<c:url value='/frontend/signup.jsp'/>"><span>Sign Up</span></a></li>
                    </ul>

                    <!-- SEARCH -->
                    <form action="<c:url value='/frontend/search.jsp'/>">
                        <input type="text" placeholder="Search.." name="search" style="height:30px">
                        <button type="submit" class="fa fa-search"
                                style="color:white;border-radius:20px;border:none;background:none"></button>
                    </form>

                    <%
                    } else {
                    %>

                    <!-- LOGGED-IN USER MENU -->
                    <ul>
                        <li><a href="<c:url value='/frontend/index.jsp'/>">Home</a></li>

                        <% 
                        ps1 = con.prepareStatement("SELECT * from add_category");
                        rs1 = ps1.executeQuery();
                        %>

                        <li class="has-dropdown">
                            <a href="<c:url value='/frontend/courses.jsp'/>">Courses</a>
                            <ul class="dropdown">
                                <% while(rs1.next()) { %>
                                <li>
                                    <a href="<c:url value='/frontend/course_category.jsp?id='/><%=rs1.getString("id")%>">
                                        <%=rs1.getString("category")%>
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

                        <li class="has-dropdown">
                            <span class="fa fa-user"></span>
                            <a href="#"><b><%=name%></b></a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/frontend/profile_user.jsp'/>">PROFILE</a></li>
                                <li><a href="<c:url value='/frontend/booking.jsp'/>">ORDER HISTORY</a></li>
                                <li><a href="<c:url value='/frontend/testimonial.jsp'/>">FEEDBACK</a></li>
                                <li><a href="<c:url value='/frontend/service_query.jsp'/>">SERVICE QUERY</a></li>
                                <li><a href="<c:url value='/frontend/change_password.jsp'/>">CHANGE PASSWORD</a></li>
                                <li><a href="<c:url value='/frontend/logout.jsp'/>">LOGOUT</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!-- SEARCH -->
                    <form action="<c:url value='/frontend/search.jsp'/>">
                        <input type="text" placeholder="Search.." name="search" style="height:30px">
                        <button type="submit" class="fa fa-search"
                                style="color:white;border-radius:20px;border:none;background:none"></button>
                    </form>

                    <% } %>

                </div>
            </div>
        </div>
    </div>
</nav>

</body>
</html>
