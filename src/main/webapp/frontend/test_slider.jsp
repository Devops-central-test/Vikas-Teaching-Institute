<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<%
    String ctx = request.getContextPath();    // SINGLE context variable
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <!-- Correct CSS Paths -->
    <link rel="stylesheet" href="<%= ctx %>/sss/sss.css">
    <link rel="stylesheet" href="<%= ctx %>/sss/estilos.css">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <!-- Testimonials Slider JS -->
    <script src="<%= ctx %>/sss/sss.js"></script>

    <script>
        jQuery(function($){
            $('.slider-testimonial').sss({
                slideShow : true,
                speed : 3500
            });
        });
    </script>

</head>

<body>

<%
    Connection conT = new connect_db().getConnection();
    String sql = "SELECT t.content, t.title, u.image " +
                 "FROM testmonial t INNER JOIN user_register u " +
                 "ON t.email = u.email WHERE t.status = 'active'";
    PreparedStatement pst = conT.prepareStatement(sql);
    ResultSet rst = pst.executeQuery();
%>

<div class="wrapper">
    <div class="slider-testimonial">

        <% while(rst.next()) { %>

        <div class="testimonial-item">

            <!-- Client Info -->
            <div class="testimonial-client">
                <img src="<%= ctx %>/admin/images/<%= rst.getString("image") %>" alt="">
                <p class="client-name"><%= rst.getString("title") %></p>
            </div>

            <!-- Testimonial Text -->
            <div class="testimonial-text">
                <p><%= rst.getString("content") %></p>
            </div>

        </div>

        <% } %>

    </div>
</div>

</body>
</html>
