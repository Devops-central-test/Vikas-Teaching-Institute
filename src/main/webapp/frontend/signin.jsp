<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<%
    String ctx = request.getContextPath();
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Shiva Teaching - Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="<%= ctx %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%= ctx %>/css/style.css">

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

    <!-- HEADER -->
    <jsp:include page="/frontend/include/header.jsp" />

    <div class="about">
        <div class="container" style="margin-top:160px; width:40%;">

            <h2 class="text-center">Sign In</h2>
            <br>

            <!-- FIX: Correct form action path -->
            <form action="<%= ctx %>/userlogin" method="post">

                <label>Email</label>
                <input type="text" name="email" required>

                <label>Password</label>
                <input type="password" name="password" required>

                <br><br>

                <input type="submit" value="Sign In" class="btn btn-primary" style="width:100%;">

            </form>

            <br>

            <p class="text-center">
                Don’t have an account?
                <a href="<%= ctx %>/frontend/signup.jsp">Sign Up</a>
            </p>

        </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="/frontend/include/footer.jsp" />

</div>

<!-- JS -->
<script src="<%= ctx %>/js/jquery.min.js"></script>
<script src="<%= ctx %>/js/bootstrap.min.js"></script>

</body>
</html>
