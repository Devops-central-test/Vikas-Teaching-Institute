<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>

<%
    String ctx = request.getContextPath();   // dynamic base path
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Knowledge Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">

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

    <!-- JS -->
    <script src="<%= ctx %>/js/modernizr-2.6.2.min.js"></script>

    <style>
        h3.a {
            white-space: nowrap;
            overflow: hidden;
            word-break: break-all;
        }
    </style>
</head>

<body>

<div class="colorlib-loader"></div>

<div id="page">

    <!-- HEADER -->
  <jsp:include page="/frontend/include/header.jsp"></jsp:include>


    <!-- HERO / BANNER -->
    <aside id="colorlib-hero" style="padding-top:133px">
        <%@ include file="banner.jsp" %>
    </aside>

<!-- -------------------------------------- -->
<!--              EVENTS                     -->
<!-- -------------------------------------- -->
<%
    Connection con1 = new connect_db().getConnection();
    PreparedStatement ps1 = con1.prepareStatement("select * from events order by id desc limit 3");
    ResultSet rs1 = ps1.executeQuery();
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
            <% while(rs1.next()) { %>
            <div class="col-md-4 animate-box">
                <div class="classes">

                    <!-- Event Image -->
                    <div class="classes-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs1.getString("image") %>'); width:341px;">
                    </div>

                    <div class="wrap">
                        <div class="desc">
                            <span class="teacher"><%= rs1.getString("heading") %></span>
                            <h3 class="a"><a href="#"><%= rs1.getString("details") %></a></h3>
                        </div>

                        <div class="pricing" style="height: 37px;">
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


<!-- -------------------------------------- -->
<!--              TESTIMONIALS              -->
<!-- -------------------------------------- -->

<div class="col-md-12 colorlib-heading text-center animate-box">
    <h1 class="heading-big">Testimonials</h1>
    <h2>Testimonials</h2>
</div>

<%@ include file="test_slider.jsp" %>

<center>
    <button class="btn btn-default">
        <a href="<%= ctx %>/frontend/testimonial_viewall.jsp">View All</a>
    </button>
</center>

<br>

<!-- -------------------------------------- -->
<!--              MENTORS                   -->
<!-- -------------------------------------- -->
<%
    PreparedStatement ps3 = con1.prepareStatement("select * from add_team order by id desc limit 4");
    ResultSet rs3 = ps3.executeQuery();
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
            <% while(rs3.next()) { %>
            <div class="col-md-3 col-sm-3 animate-box">
                <div class="trainers-entry">

                    <!-- Mentor Image -->
                    <div class="trainer-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs3.getString("image") %>');">
                    </div>

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

<!-- -------------------------------------- -->
<!--            SERVICES SECTION             -->
<!-- -------------------------------------- -->
<%
    PreparedStatement ps4 = con1.prepareStatement("select * from services order by id desc limit 6");
    ResultSet rs4 = ps4.executeQuery();
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
            <% while(rs4.next()) { %>
            <div class="col-md-4 animate-box">
                <div class="classes">

                    <div class="classes-img"
                         style="background-image:url('<%= ctx %>/admin/images/<%= rs4.getString("image") %>'); width:341px;">
                    </div>

                    <div class="wrap">

                        <div class="desc">
                            <span class="teacher"><%= rs4.getString("title") %></span>
                            <h3 class="a"><a href="#"><%= rs4.getString("content") %></a></h3>
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

<!-- TOP COURSES INCLUDE -->
<%@ include file="top_courses.jsp" %>

<!-- FOOTER -->
<jsp:include page="/frontend/include/footer.jsp"></jsp:include>


</div> <!-- END PAGE -->


<!-- JS FILES -->
<script src="<%= ctx %>/js/jquery.min.js"></script>
<script src="<%= ctx %>/js/jquery.easing.1.3.js"></script>
<script src="<%= ctx %>/js/bootstrap.min.js"></script>
<script src="<%= ctx %>/js/jquery.waypoints.min.js"></script>
<script src="<%= ctx %>/js/jquery.stellar.min.js"></script>
<script src="<%= ctx %>/js/jquery.flexslider-min.js"></script>
<script src="<%= ctx %>/js/owl.carousel.min.js"></script>
<script src="<%= ctx %>/js/jquery.magnific-popup.min.js"></script>
<script src="<%= ctx %>/js/magnific-popup-options.js"></script>
<script src="<%= ctx %>/js/jquery.countTo.js"></script>
<script src="<%= ctx %>/js/main.js"></script>

</body>
</html>
