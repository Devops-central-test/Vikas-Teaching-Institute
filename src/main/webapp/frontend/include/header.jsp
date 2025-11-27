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

    <!-- Load CSS from correct absolute context path -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">

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
                        <a href="${pageContext.request.contextPath}/frontend/index.jsp">
                            Shiva Teaching
                        </a>
                    </div>
                </div>

                <!-- MENU -->
                <div class="col-md-9 text-right menu-1" style="margin-top:-43px">

                    <%
                    Connection con = new connect_db().getConnection();
                    PreparedStatement ps1;
                    ResultSet rs1;
                    %>

                    <ul>
                        <li><a href="${pageContext.request.contextPath}/frontend/index.jsp">Home</a></li>

                        <% 
                        ps1 = con.prepareStatement("SELECT * FROM add_category WHERE status='active'");
                        rs1 = ps1.executeQuery();
                        %>

                        <!-- COURSES DROPDOWN -->
                        <li class="has-dropdown">
                            <a href="${pageContext.request.contextPath}/frontend/courses.jsp">Courses</a>
                            <ul class="dropdown">
                                <% while (rs1.next()) { %>
                                <li>
                                    <a href="${pageContext.request.contextPath}/frontend/course_category.jsp?id=<%=rs1.getString("id")%>">
                                        <%= rs1.getString("category") %>
                                    </a>
                                </li>
                                <% } %>
                            </ul>
                        </li>

                        <li><a href="${pageContext.request.contextPath}/frontend/teachers.jsp">Mentors</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontend/about.jsp">About</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontend/event.jsp">Events</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontend/services.jsp">Services</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontend/blog.jsp">Blog</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontend/contact.jsp">Contact</a></li>

                        <% if (email == null) { %>
                            <li class="btn-cta"><a href="${pageContext.request.contextPath}/frontend/signin.jsp"><span>Sign In</span></a></li>
                            <li class="btn-cta"><a href="${pageContext.request.contextPath}/frontend/signup.jsp"><span>Sign Up</span></a></li>
                        <% } else { %>

                        <!-- LOGGED IN DROPDOWN -->
                        <li class="has-dropdown">
                            <span class="fa fa-user"></span>
                            <a href="#"><b><%=name%></b></a>

                            <ul class="dropdown">
                                <li><a href="${pageContext.request.contextPath}/frontend/profile_user.jsp">PROFILE</a></li>
                                <li><a href="${pageContext.request.contextPath}/frontend/booking.jsp">ORDER HISTORY</a></li>
                                <li><a href="${pageContext.request.contextPath}/frontend/testimonial.jsp">FEEDBACK</a></li>
                                <li><a href="${pageContext.request.contextPath}/frontend/service_query.jsp">SERVICE QUERY</a></li>
                                <li><a href="${pageContext.request.contextPath}/frontend/change_password.jsp">CHANGE PASSWORD</a></li>
                                <li><a href="${pageContext.request.contextPath}/frontend/logout.jsp">LOGOUT</a></li>
                            </ul>
                        </li>

                        <% } %>

                    </ul>

                    <!-- Search box -->
                    <form action="${pageContext.request.contextPath}/frontend/search.jsp">
                        <input type="text" placeholder="Search.." name="search" style="height:30px">
                        <button type="submit"
                                class="fa fa-search"
                                style="color:white;border-radius:20px;border:none;background:none">
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</nav>

</body>
</html>
