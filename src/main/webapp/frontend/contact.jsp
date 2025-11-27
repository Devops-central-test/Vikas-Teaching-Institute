<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            #mapp {
	width: 100%;
	height: 600px;
	position: relative;
	
	
}
        </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="include/header.jsp"></jsp:include>
		
<%      String m=null;
        String a=null;
        String t=null;
        String f=null;
        String e=null;
        String c=null;
        String l=null;
        
                    
                    Connection con1=new connect_db().getConnection();
            PreparedStatement ps1=con1.prepareStatement("select * from contact_info");
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next())
            {            
            m=rs1.getString("message");
            a=rs1.getString("address");
            t=rs1.getString("telephone");
            f=rs1.getString("fax");
            e=rs1.getString("email");
            c=rs1.getString("company");}
             PreparedStatement ps2=con1.prepareStatement("select * from location_link");
             ResultSet rs2=ps2.executeQuery();
            while(rs2.next())
            { 
                l=rs2.getString("location");
            }    
            %>
		<div class="colorlib-contact">
                    <div class="container" style="    padding-top: 90px">
				<div class="row row-pb-md">
					<div class="col-md-12 animate-box">
						<h2>Contact Information</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="contact-info-wrap-flex">
									<div class="con-info">
										<p><span><i class="icon-location-2"></i></span> <%=c%> <br><%=a%> </p>
									</div>
									<div class="con-info">
										<p><span><i class="icon-phone3"></i></span> <a href="<%=t%>"><%=t%></a></p>
									</div>
									<div class="con-info">
										<p><span><i class="icon-paperplane"></i></span> <a href="mailto:<%=e%>"><%=e%></a></p>
									</div>
									<div class="con-info">
										<p><span><i class="icon-file"></i></span><%=f%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h2>Contact Us</h2>
					</div>
					<div class="col-md-6">
                                            <form action="./contact_form" method="post">
							<div class="row form-group">
								<div class="col-md-6">
									<!-- <label for="fname">First Name</label> -->
                                                                        <input type="text" name="name" required="" id="fname" class="form-control" placeholder="Your name" pattern="[a-zA-Z][a-zA-Z ]*" title="Alphabets allowed Only!!">
								</div>
								<div class="col-md-6">
									<!-- <label for="lname">Last Name</label> -->
                                                                        <input type="text" name="phone" required="" id="lname" class="form-control" placeholder="Your phone number" pattern="[6|7|8|9]\d{9}" title="enter 10 digit mobile number starting with 6/7/8/9">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<!-- <label for="email">Email</label> -->
                                                                        <input type="text" name="email" required="" id="email" class="form-control" placeholder="Your email address" pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}" title="Example: test@test.com">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<!-- <label for="subject">Subject</label> -->
                                                                        <input type="text" name="subject" required="" id="subject" class="form-control" placeholder="Subject">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<!-- <label for="message">Message</label> -->
                                                                        <textarea name="message" required="" id="message" cols="30" rows="10" class="form-control" placeholder="Message body"></textarea>
								</div>
							</div>
							<div class="form-group">
								<input type="submit" value="Send Message" class="btn btn-primary">
							</div>
						</form>		
					</div>
					<div class="col-md-6">
                                            <div id="mapp" >
                                                        <figure>
                                                        <iframe src="<%=l%>" width="500px" height="450px" frameborder="0" style="border:0" allowfullscreen style="border:0"></iframe>
							</figure>
                                            </div>
					</div>
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
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

