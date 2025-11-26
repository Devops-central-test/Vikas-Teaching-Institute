

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Admin login</title>

  <!-- Bootstrap core CSS -->

  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/animate.min.css" rel="stylesheet">

  <!-- Custom styling plus plugins -->
  <link href="css/custom.css" rel="stylesheet">
  <link href="css/icheck/flat/green.css" rel="stylesheet">


  <script src="js/jquery.min.js"></script>

  <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
	<style>	body {
    background-image: url("images/bg.jpg");
    background-repeat: repeat-y;
} </style>

</head>

<body id="particle" >

  <div class="">
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>

    <div id="wrapper">
      <div id="login" class="animate form">
	  <img src="images/Logo.png" class="responsive" style="width:90%; padding-left:60px;"/>
        <section class="login_content">
            <form action="../admin_login" method="post">
		     
            <h1><strong>Admin Login Form</strong></h1>
            <div>
                <input type="email" name="email" maxlength="100" pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}" title="Example: test@test.com" class="form-control" placeholder="Enter Email" required="" />
            </div>
            <div>
              <input type="password" name="password" class="form-control" placeholder="Enter Password" required="" />
            </div>
            <div>
            <button class="btn btn-info btn-lg" style="background-color:#000033;">Log in</button>
              <a class="reset_pass" style="color:#000033;  font-size:15px;" href="#toregister"><strong>Lost your password?</strong></a>
            </div>
            <div class="clearfix"></div>
            <div class="separator">

             
              </p>
              <div class="clearfix"></div>
              <br />
              <div>
                <h1><i class="fa fa-toggle-right" style="font-size: 26px;"></i> Diction Technology</h1>

                <strong> ©2018-19 Diction Technology, Noida </strong>
              </div>
            </div>
          </form>
          <!-- form -->
        </section>
        <!-- content -->
      </div>
      <div id="register" class="animate form">
	  <img src="images/Logo.png" class="responsive" style="width:90%; padding-left:60px;"/>
        <section class="login_content">
            <form action="../admin_forgotpassword" method="post">
            <h1>Forget Password</h1>
            
            <div>
              <input type="email" class="form-control" name="email" pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z-]{1,63}\.)+[a-zA-Z]{2,15}" title="Example: test@test.com" placeholder="Email" required="" />
            </div>
            <div>
              <button class="btn btn-info btn-lg" style="background-color:#000033;">Submit</button>
            </div>
            <div class="clearfix"></div>
            <div class="separator">

              <a class="change_link" style="color:#000033; font-weight:40px; font-size:15px;"><strong>Got valid details? </strong>
                <a href="#tologin" class="to_register" style="color:#000033; font-weight:40px; font-size:15px;"><strong>Log In Here</strong></a>
              </p>
              <div class="clearfix"></div>
              <br />
              <div>
                <h1><i class="fa fa-toggle-right" style="font-size: 26px;"></i> Diction Technology</h1>

                <strong>©2018-19 Diction Technology, Noida </strong>
              </div>
            </div>
          </form>
          <!-- form -->
        </section>
        <!-- content -->
      </div>
    </div>
  </div>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
</body>

</html>
