<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.connect_db"%>
<%
        
        if(session.getAttribute("email")!=null){
        %>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Knowledge Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
        <style>
                    .vikastbl{
                        border:1px solid grey;
                        width:100%;
                        margin: auto;
                        width: 1000px;
                        text-align: center;
                       
                    }
                    .vikastbl>thead>tr{border:1px solid black;}
                    .vikastbl>thead>tr>th{border:1px solid black;height: 50px;}
                    .vikastbl>tbody>tr{border:1px solid black;}
                    .vikastbl>tbody>tr>td{border:1px solid black;}
                </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="include/header.jsp"></jsp:include>
                <div style="margin-top:200px">
                   <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
						<h1 class="heading-big">Booking History</h1>
						<h2>Booking History</h2>
					</div>
                 <table class="vikastbl" >
        <thead>
                      <tr>
                        <th>Name</th>
                        <th>Email</th>
                        
                        <th>Course</th>
                        <th>Price</th>
                        
                        <th> Order Status</th>
                        <th> Action</th>
                      </tr>
                    </thead>
                    <% String status="pending";
                String email=session.getAttribute("email").toString();
                Connection con=new connect_db().getConnection();
                PreparedStatement ps=con.prepareStatement("select * from course_register where email=?");
                ps.setString(1,email );
                System.out.println("email"+email);
               
                ResultSet rs=ps.executeQuery();
               
                while(rs.next())
                {                   
                 
                %>
                <tbody>
                      <tr>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        
                         <td><%=rs.getString("courses")%></td>
                         <td><%=rs.getString("price")%></td>
                         <td><%=rs.getString("status")%></td>
                         <% if(rs.getString("status").equals(status)){%>
                         
                         <td> <button type="button" class="btn btn-success btn-xs" style="background-color:lightgreen" onclick="window.location.href='booking_status_user?id=<%=rs.getString("id")%>'">Cancel Registration</button></td>
                        <%}else{%> 
                         <td><button type="button" class="btn btn-danger"  readonly="">Cancel</button></td>
                            <% }%>
                      </tr>
                     <% } %>
                    </tbody>
                    </table>
                </div>
                <br>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Counters -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

<%}
else{
out.println("<script type=\"text/javascript\">");
out.println("alert('please login')");
out.println("window.location.href='index.jsp'");
out.println("</script>");
}%>