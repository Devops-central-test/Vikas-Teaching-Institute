<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String ctx = request.getContextPath();
    Connection con2 = new connect_db().getConnection();

    // CONTACT INFO
    PreparedStatement ps = con2.prepareStatement("SELECT * FROM contact_info");
    ResultSet rs = ps.executeQuery();

    String company="", address="", telephone="", email="", fax="";
    if(rs.next()){
        company    = rs.getString("company");
        address    = rs.getString("address");
        telephone  = rs.getString("telephone");
        email      = rs.getString("email");
        fax        = rs.getString("fax");
    }

    // SOCIAL LINKS
    PreparedStatement ps2 = con2.prepareStatement("SELECT * FROM location_link");
    ResultSet rs2 = ps2.executeQuery();

    String fb="", google="", insta="", youtube="";
    if(rs2.next()){
        fb      = rs2.getString("facebook");
        google  = rs2.getString("google");
        insta   = rs2.getString("instagram");
        youtube = rs2.getString("youtube");
    }
%>

<footer id="colorlib-footer">
    <div class="container">

        <div class="row row-pb-md">

            <div class="col-md-3 colorlib-widget">
                <h4>Contact Info</h4>

                <ul>
                    <li><strong><%= company %></strong><br><%= address %></li>
                    <li><a href="tel:<%= telephone %>">+91 <%= telephone %></a></li>
                    <li><a href="mailto:<%= email %>"><%= email %></a></li>
                    <li><%= fax %></li>
                </ul>
            </div>

            <div class="col-md-2 colorlib-widget"></div>

            <div class="col-md-2 colorlib-widget">
                <h4>Useful Links</h4>
                <ul>
                    <li><a href="<%= ctx %>/frontend/about.jsp">About</a></li>
                    <li><a href="<%= ctx %>/frontend/courses.jsp">Courses</a></li>
                    <li><a href="<%= ctx %>/frontend/event.jsp">Events</a></li>
                    <li><a href="<%= ctx %>/frontend/services.jsp">Services</a></li>
                    <li><a href="<%= ctx %>/frontend/contact.jsp">Contact</a></li>
                </ul>
            </div>

            <div class="col-md-3 colorlib-widget"></div>

        </div>
    </div>

    <!-- SOCIAL LINKS -->
    <div style="text-align:center; margin-bottom:20px;">
        <a href="<%= fb %>" class="fa fa-facebook"></a>
        <a href="<%= google %>" class="fa fa-google-plus"></a>
        <a href="<%= insta %>" class="fa fa-instagram"></a>
        <a href="<%= youtube %>" class="fa fa-youtube"></a>
    </div>
</footer>
