<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>

<%
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Knowledge Template</title>
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
        h3.a { white-space: nowrap; overflow: hidden; word-break: break-all; }
    </style>
</head>

<body>
<div class="colorlib-loader"></div>

<div id="page">

    <!-- HEADER -->
    <jsp:include page="/frontend/include/header.jsp"/>

    <!-- BANNER -->
    <aside id="colorlib-hero" style="padding-top:133px">
        <%@ include file="banner.jsp" %>
    </aside>

<%
    Connection con1 = new connect_db().getConnection();
%>

<!-- EVENTS -->
<%
    PreparedStatement ps1 = con1.prepareStatement("select * from events order by id desc limit 3");
    ResultSet rs1 = ps1.executeQuery();
%>

<div class="colorlib-classes">
    ...
</div>

<!-- TESTIMONIALS -->
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

<!-- SERVICES -->
...
<!-- TOP COURSES -->
<%@ include file="top_courses.jsp" %>

<!-- FOOTER -->
<jsp:include page="/frontend/include/footer.jsp"/>

</div>

<script src="<%= ctx %>/js/jquery.min.js"></script>
<script src="<%= ctx %>/js/bootstrap.min.js"></script>
<script src="<%= ctx %>/js/main.js"></script>

</body>
</html>
