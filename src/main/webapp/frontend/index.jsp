<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<%
    String ctx = request.getContextPath();
    Connection con1 = null;
    PreparedStatement ps1 = null, ps3 = null, ps4 = null;
    ResultSet rs1 = null, rs3 = null, rs4 = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Shiva Teaching Institute</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS FILES -->
    <link rel="stylesheet" href="<%= ctx %>/css/animate.css">
    <link rel="stylesheet" href="<%= ctx %>/css/icomoon.css">
    <link rel="stylesheet" href="<%= ctx %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%= ctx %>/css/magnific-popup.css">
    <link rel="stylesheet" href="<%= ctx %>/css/flexslider.css">
    <link rel="stylesheet" href="<%= ctx %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%= ctx %>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%= ctx %>/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="<%= ctx %>/css/style.css">

    <script src="<%= ctx %>/js/modernizr-2.6.2.min.js"></script>

    <style>
        h3.a { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    </style>
</head>

<body>
<div class="colorlib-loader"></div>

<div id="page">

    <!-- HEADER -->
    <jsp:include page="/frontend/include/header.jsp" />

    <!-- BANNER -->
    <aside id="colorlib-hero" style="padding-top:133px;">
        <jsp:include page="/frontend/banner.jsp" />
    </aside>

<%
    try {
        con1 = new connect_db().getConnection();
%>

<!-- EVENTS -->
<%
        ps1 = con1.prepareStatement("SELECT * FROM events ORDER BY id DESC LIMIT 3");
        rs1 = ps1.executeQuery();
%>

<div class="colorlib-classes">
    <div class="container">
        <div class="row">
            <div class="col-md-12 colorlib-heading text-center animate-box">
                <h1 class="heading-big">Events</h1>
                <h2>Events</h2>
            </div>
        </div>

        <div class="row">
            <% while (rs1.next()) { %>
            <div class="col-md-4 animate-box">
                <div class="classes">

                    <div class="classes-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs1.getString("image") %>'); width:341px;">
                    </div>

                    <div class="wrap">
                        <div class="desc">
                            <span class="teacher"><%= rs1.getString("heading") %></span>
                            <h3 class="a"><%= rs1.getString("details") %></h3>
                        </div>

                        <div class="pricing" style="height:37px;">
                            <button class="btn btn-default" style="float:right;margin-top:-16px;">
                                <a href="<%= ctx %>/frontend/event_detail.jsp?id=<%= rs1.getString("id") %>">Read More</a>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- TESTIMONIALS SECTION -->
<div class="col-md-12 colorlib-heading text-center animate-box">
    <h1 class="heading-big">Testimonials</h1>
    <h2>Testimonials</h2>
</div>

<!-- INCLUDE TEST SLIDER -->
<jsp:include page="/frontend/test_slider.jsp" />

<center>
    <button class="btn btn-default">
        <a href="<%= ctx %>/frontend/testimonial_viewall.jsp">View All</a>
    </button>
</center>

<br>

<!-- MENTORS -->
<%
        ps3 = con1.prepareStatement("SELECT * FROM add_team ORDER BY id DESC LIMIT 4");
        rs3 = ps3.executeQuery();
%>

<div class="colorlib-trainers">
    <div class="container">
        <div class="row">
            <div class="col-md-12 colorlib-heading text-center animate-box">
                <h1 class="heading-big">Our Mentors</h1>
                <h2>Our Mentors</h2>
            </div>
        </div>

        <div class="row">
            <% while (rs3.next()) { %>
            <div class="col-md-3 col-sm-3 animate-box">
                <div class="trainers-entry">
                    <div class="trainer-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs3.getString("image") %>');"></div>
                    <div class="desc" style="background-color: lightblue;">
                        <center>
                            <h3><%= rs3.getString("name") %></h3>
                            <span><%= rs3.getString("designation") %></span>
                        </center>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- SERVICES -->
<%
        ps4 = con1.prepareStatement("SELECT * FROM services ORDER BY id DESC LIMIT 6");
        rs4 = ps4.executeQuery();
%>

<div class="colorlib-classes">
    <div class="container">
        <div class="row">
            <div class="col-md-12 colorlib-heading text-center animate-box">
                <h1 class="heading-big">Our Services</h1>
                <h2>Our Services</h2>
            </div>
        </div>

        <div class="row">
            <% while (rs4.next()) { %>
            <div class="col-md-4 animate-box">
                <div class="classes">

                    <div class="classes-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs4.getString("image") %>'); width:341px;">
                    </div>

                    <div class="wrap">
                        <div class="desc">
                            <span class="teacher"><%= rs4.getString("title") %></span>
                            <h3 class="a"><%= rs4.getString("content") %></h3>
                        </div>

                        <div class="pricing" style="height:37px;">
                            <button class="btn btn-default" style="float:right;margin-top:-16px;">
                                <a href="<%= ctx %>/frontend/services_details.jsp?id=<%= rs4.getString("id") %>">Read More</a>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- TOP COURSES -->
<jsp:include page="/frontend/top_courses.jsp" />

<!-- FOOTER -->
<jsp:include page="/frontend/include/footer.jsp" />

<%
    } finally {
        if (rs1 != null) rs1.close();
        if (ps1 != null) ps1.close();
        if (rs3 != null) rs3.close();
        if (ps3 != null) ps3.close();
        if (rs4 != null) rs4.close();
        if (ps4 != null) ps4.close();
        if (con1 != null) con1.close();
    }
%>

</div> <!-- END page -->

<!-- JS -->
<script src="<%= ctx %>/js/jquery.min.js"></script>
<script src="<%= ctx %>/js/bootstrap.min.js"></script>
<script src="<%= ctx %>/js/main.js"></script>

</body>
</html>
