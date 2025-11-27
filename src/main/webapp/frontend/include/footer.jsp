<%@page import="db.connect_db"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<%
    String c=null,a=null,t=null,e=null,ff=null;
    Connection con2 = new connect_db().getConnection();
    PreparedStatement ps3 = con2.prepareStatement("select * from contact_info");
    ResultSet rs3 = ps3.executeQuery();
    while(rs3.next()){
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
                    <li><%=c%>,<br><%=a%></li>
                    <li><a href="tel://<%=t%>">+91 <%=t%></a></li>
                    <li><a href="mailto:<%=e%>"><%=e%></a></li>
                    <li><%=ff%></li>
                </ul>
            </div>

            <div class="col-md-2 colorlib-widget"></div>

            <div class="col-md-2 colorlib-widget">
                <h4>Useful Links</h4>
                <ul class="colorlib-footer-links">
                    <li><a href="<c:url value='/frontend/about.jsp'/>">About</a></li>
                    <li><a href="<c:url value='/frontend/testimonial_viewall.jsp'/>">Testimonials</a></li>
                    <li><a href="<c:url value='/frontend/courses.jsp'/>">Courses</a></li>
                    <li><a href="<c:url value='/frontend/event.jsp'/>">Events</a></li>
                    <li><a href="<c:url value='/frontend/services.jsp'/>">Services</a></li>
                    <li><a href="<c:url value='/frontend/contact.jsp'/>">Contact</a></li>

                    <% if(session.getAttribute("email")!=null) { %>
                    <li><a href="<c:url value='/frontend/service_query.jsp'/>">Can we help you?</a></li>
                    <% } %>
                </ul>
            </div>

            <div class="col-md-3 colorlib-widget"></div>

        </div>
    </div>

<%
    String f=null,g=null,i=null,y=null;
    Connection con1=new connect_db().getConnection();
    PreparedStatement ps1=con1.prepareStatement("select * from location_link");
    ResultSet rs1=ps1.executeQuery();
    while(rs1.next()){
        f = rs1.getString("facebook");
        g = rs1.getString("google");
        i = rs1.getString("instagram");
        y = rs1.getString("youtube");
    }
%>

<div style="text-align:center">
    <a href="<%=f%>" class="fa fa-facebook"></a>
    <a href="<%=g%>" class="fa fa-google-plus"></a>
    <a href="<%=i%>" class="fa fa-instagram"></a>
    <a href="<%=y%>" class="fa fa-youtube"></a>
</div>

<div class="copy">
    <div class="container">
        <div class="col-md-12 text-center">
            <small class="block">
                © <script>document.write(new Date().getFullYear());</script>
                All rights reserved | Made by  
                <a href="http://web.dictiontechnology.com/" target="_blank">Diction Technology</a>
            </small>
        </div>
    </div>
</div>

</footer>

</body>
</html>
