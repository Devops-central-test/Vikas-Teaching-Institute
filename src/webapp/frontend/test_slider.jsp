<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Carousel de testimonios</title>
	<link rel="stylesheet" href="sss/sss.css">
	<link rel="stylesheet" href="sss/estilos.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="sss/sss.js"></script>
	<script>
	    jQuery(function($){
	        $('.slider-testimonial').sss({
	        	slideShow : true,
	        	speed : 3500
	        });
	    });
	</script>
	<style>
	body{
	background-color:white;
	}
	</style>
</head>
<body>
    <%
                    
            Connection con15=new connect_db().getConnection();
            PreparedStatement ps15=con15.prepareStatement("select testmonial.content,testmonial.title,user_register.image from testmonial inner join user_register on testmonial.email=user_register.email where status='active' ");
            ResultSet rs15=ps15.executeQuery();
            
            %>
	<div class="wrapper">
		<div class="slider-testimonial">
                    <% while(rs15.next()){ %>
			<div class="testimonial-item">
				<div class="testimonial-client">
					<img src="admin/images/<%=rs15.getString("image") %>" alt="">
                                        <p class="client-name"><%=rs15.getString("title") %></p>
				</div>
				<div class="testimonial-text">
					<p> <%=rs15.getString("content") %></p>
				</div>
			</div>
                        <% } %>
			
		</div>
	</div>
</body>
</html>