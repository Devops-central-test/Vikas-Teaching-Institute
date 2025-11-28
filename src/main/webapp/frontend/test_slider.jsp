<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/sss/sss.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/sss/estilos.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/sss/sss.js"></script>

<script>
    jQuery(function($){
        $('.slider-testimonial').sss({
            slideShow : true,
            speed : 3500
        });
    });
</script>

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
            <div class="testimonial-client">
                <img src="<%= request.getContextPath() %>/admin/images/<%= rst.getString("image") %>" alt="">
                <p class="client-name"><%= rst.getString("title") %></p>
            </div>
            <div class="testimonial-text">
                <p><%= rst.getString("content") %></p>
            </div>
        </div>

        <% } %>

    </div>
</div>
