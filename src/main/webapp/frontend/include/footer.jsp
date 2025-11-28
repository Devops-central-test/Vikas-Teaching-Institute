<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String ctx = request.getContextPath();

    Connection con = null;
    PreparedStatement ps = null, ps2 = null;
    ResultSet rs = null, rs2 = null;

    String company="", address="", telephone="", emailId="", fax="";
    String fb="", google="", insta="", youtube="";

    try {
        con = new connect_db().getConnection();

        // CONTACT INFO
        ps = con.prepareStatement("SELECT * FROM contact_info LIMIT 1");
        rs = ps.executeQuery();

        if(rs.next()){
            company    = rs.getString("company");
            address    = rs.getString("address");
            telephone  = rs.getString("telephone");
            emailId    = rs.getString("email");
            fax        = rs.getString("fax");
        }

        // SOCIAL LINKS
        ps2 = con.prepareStatement("SELECT * FROM location_link LIMIT 1");
        rs2 = ps2.executeQuery();

        if(rs2.next()){
            fb      = rs2.getString("facebook");
            google  = rs2.getString("google");
            insta   = rs2.getString("instagram");
            youtube = rs2.getString("youtube");
        }
%>

<!-- FontAwesome Required -->
<link rel="stylesheet" href="<%= ctx %>/css/font-awesome.min.css">

<footer id="colorlib-footer">
    <div class="container">

        <div class="row row-pb-md">

            <!-- CONTACT BLOCK -->
            <div class="col-md-3 colorlib-widget">
                <h4>Contact Info</h4>
                <ul>
                    <li><strong><%= company %></strong><br><%= address %></li>
                    <li><a href="tel:<%= telephone %>">+91 <%= telephone %></a></li>
                    <li><a href="mailto:<%= emailId %>"><%= emailId %></a></li>
                    <li><%= fax %></li>
                </ul>
            </div>

            <div class="col-md-2 colorlib-widget"></div>

            <!-- USEFUL LINKS -->
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

        </div>
    </div>

    <!-- SOCIAL ICONS -->
    <div style="text-align:center; margin-bottom:20px;">
        <a href="<%= fb %>" class="fa fa-facebook"></a>
        <a href="<%= google %>" class="fa fa-google-plus"></a>
        <a href="<%= insta %>" class="fa fa-instagram"></a>
        <a href="<%= youtube %>" class="fa fa-youtube"></a>
    </div>
</footer>

<%
    } finally {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(rs2 != null) rs2.close();
        if(ps2 != null) ps2.close();
        if(con != null) con.close();
    }
%>
