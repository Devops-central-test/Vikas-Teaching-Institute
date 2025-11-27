<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Knowledge Template - Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Meta -->
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />

    <!-- Social Meta -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/flexslider.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <!-- Custom Styles -->
    <style>
        input[type=text], input[type=password] {
            padding: 12px 20px;
            margin: 8px 0;
            width: 100%;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .login-form {
            width: 400px;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #dcdcdc;
        }

        input[type=submit] {
            width: 100%;
            padding: 12px;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            margin-top: 15px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background: #0b57d0;
        }
    </style>

</head>

<body>

<div class="colorlib-loader"></div>

<div id="page">

    <!-- Header -->
    <jsp:include page="include/header.jsp"></jsp:include>

    <!-- Sign-In Form -->
    <div class="about">
        <center>
            <div class="container" style="margin-top:180px;">
                <div class="col-md-12 text-center colorlib-heading animate-box">
                    <h1 class="heading-big">Sign In</h1>
                    <h2>Sign In</h2>
                </div>

                <div class="login-form animate-box">
                    <form action="./userlogin" method="post">
                        <div>
                            <label>Username</label>
                            <input type="text" name="email" required
                                   pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}"
                                   title="Example: test@test.com"
                                   placeholder="Enter Email">
                        </div>

                        <div>
                            <label>Password</label>
                            <input type="password" name="password" required placeholder="Enter Password">
                        </div>

                        <div>
                            <ul style="list-style:none; padding-left:0;">
                                <li>
                                    <input type="checkbox" id="brand" value="">
                                    <label for="brand"><span></span> Remember me?</label>
                                </li>
                                <li>
                                    <a href="forgot_password.jsp">Forgot password?</a>
                                </li>
                            </ul>
                        </div>

                        <input type="submit" value="Sign In">
                    </form>

                    <p>Don't have an account?  
                        <a href="signup.jsp" class="sign-in popup-top-anim">Sign Up</a>
                    </p>

                </div>

                <br><br><br>

            </div>
        </center>
    </div>

    <!-- Footer -->
    <jsp:include page="include/footer.jsp"></jsp:include>

</div>

<!-- Scroll to Top -->
<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>

<!-- JS Libraries -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<script src="js/jquery.countTo.js"></script>

<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
<script src="js/google_map.js"></script>

<!-- Main JS -->
<script src="js/main.js"></script>

</body>
</html>
