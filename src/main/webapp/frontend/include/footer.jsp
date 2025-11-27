<%@page import="db.connect_db"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<%
    // Fetch Contact Info
    String c=null,a=null,t=null,e=null,ff=null;
    Connection con2 = new connect_db().getConnection();
    PreparedStatement ps3 = con2.prepareStatement("SELECT * FROM contact_info");
    ResultSet rs3 = ps3.executeQuery();

    if (rs3.next()) {
        c  = rs3.getString("company");
        a  = rs3.getString("address");
        t  = rs3.getString("telephone");
        e  = rs3.getString("email");
        ff = rs3.getString("fax");
    }
%>

<footer id="colorlib-footer">

    <div class="container">
        <div class="row row-pb-md">

            <!-- Contact Info -->
            <div class="col-md-3 colorlib-widget">
                <h4>Contact Info</h4>
                <ul class="colorlib-footer-links">
                    <li><%=c%>, <br> <%=a%></li>
                    <li><a href="tel:+91<%=t%>">+91 <%=t%></a></li>
                    <li><a href="mailto:<%=e%>"><%=e%></a></li>
                    <li><%=ff%></li>
                </ul>
            </div>

            <div class="col-md-2 colorlib-widget"></div>

            <!-- Useful Links -->
            <div class="col-md-2 colorlib-widget">
                <h4>Useful Links</h4>
                <ul class="colorlib-footer-links">

                    <li><a href="${pageContext.request.contextPath}/frontend/about.jsp">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontend/testimonial_viewall.jsp">Testimonials</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontend/courses.jsp">Courses</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontend/event.jsp">Events</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontend/services.jsp">Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontend/contact.jsp">Contact</a></li>

                    <% if(session.getAttribute("email") != null) { %>
                        <li><a href="${pageContext.request.contextPath}/frontend/service_query.jsp">Can we help you?</a></li>
                    <% } %>

                </ul>
            </div>

            <div class="col-md-3 colorlib-widget"></div>

        </div>
    </div>

<%
    // Fetch Social Links
    String f=null,g=null,i=null,y=null;
    Connection con1 = new connect_db().getConnection();
    PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM location_link");
    ResultSet rs1 = ps1.executeQuery();

    if (rs1.next()) {
        f = rs1.getString("facebook");
        g = rs1.getString("google");
        i = rs1.getString("instagram");
        y = rs1.getString("youtube");
    }
%>

<!-- Social Icons -->
<div style="text-align:center; margin-top:20px;">
    <a href="<%=f%>" class="fa fa-facebook" style="margin:5px;"></a>
    <a href="<%=g%>" class="fa fa-google-plus" style="margin:5px;"></a>
    <a href="<%=i%>" class="fa fa-instagram" style="margin:5px;"></a>
    <a href="<%=y%>" class="fa fa-youtube" style="margin:5px;"></a>
</div>

<!-- Copyright -->
<div class="copy">
    <div class="container">
        <div class="col-md-12 text-center">
            <small class="block">
                © <script>document.write(new Date().getFullYear());</script>
                All rights reserved |
                Designed by <a href="http://web.dictiontechnology.com/" target="_blank">Diction Technology</a>
            </small>
        </div>
    </div>
</div>

</footer>

</body>
</html>
