<%@page import="java.sql.ResultSet"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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

	</head>
        <style>
            div.a {
  white-space: nowrap; 
   
  
  overflow: hidden;
  
  word-break: break-all;
}
        </style>
            
            
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="include/header.jsp"></jsp:include>
                
                
		

		
		
		

		<div class="colorlib-classes">
			<div class="container">
				<div class="row">
					<div class="col-md-12 colorlib-heading center-heading text-center animate-box">
						<h1 class="heading-big">Our Courses</h1>
						<h2>Our Courses</h2>
					</div>
				</div>
                           <%
                    String search=request.getParameter("search");
                    Connection con1=new connect_db().getConnection();
                    PreparedStatement ps1=con1.prepareStatement("select * from courses where cname like '%" + search +"%'and status='active'");
                    ResultSet rs1=ps1.executeQuery();
            
            %>
				<div class="row">
                                    <% while(rs1.next()){%>
					<div class="col-md-4 animate-box">
						<div class="classes">
							<div class="classes-img" style="background-image: url(admin/images/<%=rs1.getString("image")%>);width: 341px">
							</div>
							<div class="wrap">
								<div class="desc">
									<span class="teacher"><%=rs1.getString("cname")%></span>
                                                                        <div class="a">
                                                                           <%=rs1.getString("description")%></div>
                                                                            
								</div>
								<div class="pricing">
                                                                    <p><span class="price">&#8377 <%=rs1.getString("price")%></span>  <button class="btn-cta" style="float: right"><a href="courses-single.jsp?id=<%=rs1.getString("id")%>"><span>Read More</span></a></button>
								</div>
							</div>
						</div>
					</div><% } %>
					
					
					
					
					
				</div>
			</div>	
		</div>
	
		
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

