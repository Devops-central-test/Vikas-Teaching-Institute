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
        <style>
            input[type=text], input[type=password] {
             padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
            
            }
        </style>
            
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="include/header.jsp"></jsp:include>
		

                
                <div class="about" >
                    <center>        <div class="container" style="margin-top: 180px"> 
                           <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
						<h1 class="heading-big">Sign Up</h1>
						<h2>Sign Up</h2>
					</div>
			<div class="login-form">
                            <form action="./register" method="post" >
					<div ><label>Name</label>
                                            <input type="text"  name="name" required="" pattern="[a-zA-Z][a-zA-Z ]*" title="Alphabets allowed Only!!" placeholder="Enter Name">
						
						
                                        </div><br>
                                        <div><label>Email</label>
                                            <input type="text"  name="email" required="" pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}" title="Example: test@test.com" placeholder="Enter Email">
						
						
                                        </div><br>
					<div>
                                            <label style="margin-left: -35px">Password</label>
                                            <input type="password"  name="password" placeholder="Enter Password" required=""> 
                                            
						
                                        </div> <br>
                                        <div class="styled-input">
                                            <label style="margin-left: -109px">Confirm Password</label>
                                            <input type="password"  name="cpassword" placeholder="Confirm Password"  required=""> 
						
						
                                        </div> <br>
                                        <div class="styled-input">
                                            <label style="margin-left: -9px">Phone</label>
                                            <input type="text"  name="phone" placeholder="Enter Mobile Number" pattern="[6|7|8|9]\d{9}" title="enter 10 digit mobile number starting with 6/7/8/9" required=""> 
						
						
					</div>
                                        
					<div> 
						<ul> 
							
								
                                                                <br>
							
						</ul>
						<div class="clear"> </div>
					</div> 
					<input type="submit" value="Sign Up">		
				</form>
				<p>Already have an account ?<a href="signin.jsp" class="sign-in popup-top-anim"> Sign In</a></p>
                        </div> <br><br><br> 
                        </div></center>
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

