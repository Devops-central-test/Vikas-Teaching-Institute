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
    <title>Shiva Teaching - Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- GOOGLE FONT -->
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
        input[type=text], input[type=password] {
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }
    </style>

</head>

<body>

<div class="colorlib-loader"></div>

<div id="page">

    <!-- HEADER (very important: ../include/) -->
    <jsp:include page="../include/header.jsp"></jsp:include>

    <div class="about">
        <center>
            <div class="container" style="margin-top:180px">
                <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                    <h1 class="heading-big">Sign In</h1>
                    <h2>Sign In</h2>
                </div>

                <div class="login-form">

                    <!-- SIGNIN FORM -->
                    <form action="<%= ctx %>/userlogin" method="post">

                        <div>
                            <label>Email</label>
                            <input type="text" name="email" required
                                   placeholder="Enter Email"
                                   pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}">
                        </div>

                        <br>

                        <div>
                            <label>Password</label>
                            <input type="password" name="password" required>
                        </div>

                        <br>

                        <div>
                            <ul>
                                <input type="checkbox"> Remember me?
                                <br>
                                <a href="<%= ctx %>/frontend/forgot_password.jsp">Forgot password?</a>
                            </ul>
                        </div>

                        <input type="submit" value="Sign In">
                    </form>

                    <p>
                        Don’t have an account?
                        <a href="<%= ctx %>/frontend/signup.jsp">Sign Up</a>
                    </p>

                </div>
            </div>
        </center>
    </div>

    <!-- FOOTER -->
    <jsp:include page="../include/footer.jsp"></jsp:include>

</div>

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
