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
        h3.a {
            white-space: nowrap; 


            overflow: hidden;

            word-break: break-all;
        }
    </style>

    <body>

        <div class="colorlib-loader"></div>

        <div id="page">
            <div>
                <jsp:include page="include/header.jsp"></jsp:include>
                </div>
                <div >
                    <aside id="colorlib-hero" style="    padding-top: 133px">

                    <%@include file="banner.jsp" %>


                </aside></div>


            <!--		<div id="colorlib-services">
                                    <div class="container">
                                            <div class="row">
                                                    <div class="col-md-12 services-wrap">
                                                            <div class="row">
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-desktop"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>Web <br>Development</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-smartphone"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>Mobile <br>Development</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-laboratory"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>Science <br>Data</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-computer-graphic"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>Graphic <br>Design</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-video-player"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>Media <br>Courses</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-6 text-center animate-box">
                                                                            <a href="services.html" class="services">
                                                                                    <span class="icon">
                                                                                            <i class="flaticon-layers"></i>
                                                                                    </span>
                                                                                    <div class="desc">
                                                                                            <h3>User <br>Interface</h3>
                                                                                    </div>
                                                                            </a>
                                                                    </div>
                                                            </div>
                                                    </div>
                                                    <div class="col-md-12 text-center animate-box">
                                                            <p><a href="https://vimeo.com/channels/staffpicks/93951774" class="btn btn-primary btn-outline btn-lg btn-discover popup-vimeo"><span class="icon"><i class="icon-play3"></i></span>Discover Courses</a></p>
                                                    </div>
                                            </div>
                                    </div>
                            </div>-->
            <%
                Connection con1 = new connect_db().getConnection();
                PreparedStatement ps1 = con1.prepareStatement("select * from events order by id desc limit 3");
                ResultSet rs1 = ps1.executeQuery();

            %>



<!--            <div class="colorlib-classes">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                            <h1 class="heading-big"> Events</h1>
                            <h2> Events</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 animate-box">
                            <div class="owl-carousel">
                                
                                <div class="item">
                                    <div class="classes">
                                        <div class="classes-img" style="background-image: url(admin/images/);width: 313px">
                                        </div>
                                        <div class="wrap">
                                            <div class="desc">
                                                <span class="teacher"></span>
                                                <h3 class="a"><a href="#"></a></h3>
                                            </div>
                                            <div class="desc">
                                                <button class="btn-cta" style="float: right;margin-top: -10px;"><a href="event_detail.jsp?id="><span>Read More</span></a></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>	
            </div>-->
                                <div class="colorlib-classes">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                            <h1 class="heading-big">Events</h1>
                            <h2>Events</h2>
                        </div>
                    </div>
                    <div class="row">
                       <% while(rs1.next()){%>
                        <div class="col-md-4 animate-box">
                            <div class="classes">
                                <div class="classes-img" style="background-image: url(admin/images/<%=rs1.getString("image")%>);width: 341px"">
                                </div>
                                <div class="wrap">
                                    <div class="desc">
                                        <span class="teacher"><%=rs1.getString("heading")%></span>
                                        <h3 class="a"><a href="#"><%=rs1.getString("details")%></a></h3>
                                    </div>
                                    <div class="pricing" style="height: 37px">
                                        <button class="btn btn-default" style="float: right;margin-top: -16px;"><a href="event_detail.jsp?id=<%=rs1.getString("id")%>"><span>Read More</span></a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                                    <% } %>
                        
                        
                        
                        
                    </div>
                </div>	
            </div>
                                
            <!--		<div id="colorlib-counter" class="colorlib-counters">
                                    <div class="container">
                                            <div class="col-md-7">
                                                    <div class="about-desc">
                                                            <div class="about-img-1 animate-box" style="background-image: url(images/about-img-2.jpg);"></div>
                                                            <div class="about-img-2 animate-box" style="background-image: url(images/about-img-1.jpg);"></div>
                                                    </div>
                                            </div>
                                            <div class="col-md-5">
                                                    <div class="row">
                                                            <div class="col-md-12 colorlib-heading animate-box">
                                                                    <h1 class="heading-big">Who are we</h1>
                                                                    <h2>Who are we</h2>
                                                            </div>
                                                    </div>
                                                    <div class="row">
                                                            <div class="col-md-12 animate-box">
                                                                    <p><strong>Even the all-powerful Pointing has no control about the blind texts</strong></p>
                                                                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 animate-box">
                                                                    <div class="counter-entry">
                                                                            <div class="desc">
                                                                                    <span class="colorlib-counter js-counter" data-from="0" data-to="1539" data-speed="5000" data-refresh-interval="50"></span>
                                                                                    <span class="colorlib-counter-label">Courses</span>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 animate-box">
                                                                    <div class="counter-entry">
                                                                            <div class="desc">
                                                                                    <span class="colorlib-counter js-counter" data-from="0" data-to="3653" data-speed="5000" data-refresh-interval="50"></span>
                                                                                    <span class="colorlib-counter-label">Students</span>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 animate-box">
                                                                    <div class="counter-entry">
                                                                            <div class="desc">
                                                                                    <span class="colorlib-counter js-counter" data-from="0" data-to="2300" data-speed="5000" data-refresh-interval="50"></span>
                                                                                    <span class="colorlib-counter-label">Teachers online</span>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 animate-box">
                                                                    <div class="counter-entry">
                                                                            <div class="desc">
                                                                                    <span class="colorlib-counter js-counter" data-from="0" data-to="200" data-speed="5000" data-refresh-interval="50"></span>
                                                                                    <span class="colorlib-counter-label">Countries</span>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                            </div>-->

<!--            <div id="colorlib-testimony" class="testimony-img" style="background-image: url(images/img_bg_2.jpg); margin-bottom: 4em;" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 center-heading text-center colorlib-heading animate-box">
                            <h1 class="heading-big">What are the students says</h1>
                            <h2>What are the students says</h2>
                        </div>
                    </div>

                    
                </div>
            </div>-->
<br><br>
  <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                            <h1 class="heading-big"> Testimonials</h1>
                            <h2> Testimonials</h2>
                        </div>
                      <div>
                        
                          <%@include file="test_slider.jsp" %>   
                      </div>
                      <div>
                          <center>        <button class="btn btn-default" ><a href="testimonial_viewall.jsp">View all</a></button></center>
                      </div>

                      <br>
            <%

                PreparedStatement ps3 = con1.prepareStatement("select * from add_team order by id desc limit 4");
                ResultSet rs3 = ps3.executeQuery();

            %>
            <div class="colorlib-trainers">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                            <h1 class="heading-big">Our Mentors</h1>
                            <h2>Our Mentors</h2>
                        </div>
                    </div>
                    <div class="row">
                        <% while (rs3.next()) {%>
                        <div class="col-md-3 col-sm-3 animate-box">
                            <div class="trainers-entry">

                                <div class="trainer-img" style="background-image: url(admin/images/<%=rs3.getString("image")%>)"></div>
                                <div class="desc" style="background-color: lightblue">
                                    <center>  <h3><%=rs3.getString("name")%></h3>
                                        <span><%=rs3.getString("designation")%></span></center>
                                </div>
                            </div>
                        </div>
                        <% }%>


                    </div>
                </div>
            </div>
 <%

                PreparedStatement ps4 = con1.prepareStatement("select * from services order by id desc limit 6");
                ResultSet rs4 = ps4.executeQuery();

            %>
            <div class="colorlib-classes">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                            <h1 class="heading-big">Our Services</h1>
                            <h2>Our Services</h2>
                        </div>
                    </div>
                    <div class="row">
                       <% while(rs4.next()){%>
                        <div class="col-md-4 animate-box">
                            <div class="classes">
                                <div class="classes-img" style="background-image: url(admin/images/<%=rs4.getString("image")%>);width: 341px"">
                                </div>
                                <div class="wrap">
                                    <div class="desc">
                                        <span class="teacher"><%=rs4.getString("title")%></span>
                                        <h3 class="a"><a href="#"><%=rs4.getString("content")%></a></h3>
                                    </div>
                                    <div class="pricing" style="height: 37px">
                                        <button class="btn btn-default" style="float: right;margin-top: -16px;"><a href="services_details.jsp?id=<%=rs4.getString("id")%>"><span>Read More</span></a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                                    <% } %>
                        
                        
                        
                        
                    </div>
                </div>	
            </div>
                                    <%@include file="top_courses.jsp" %>


            <!-- <div class="colorlib-blog colorlib-light-grey">
                    <div class="container">
                            <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
                                            <h2>Recent News</h2>
                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name</p>
                                    </div>
                            </div>
                            <div class="row">
                                    <div class="col-md-6 animate-box">
                                            <article class="article-entry">
                                                    <a href="blog.html" class="blog-img" style="background-image: url(images/blog-1.jpg);">
                                                            <p class="meta"><span class="day">18</span><span class="month">Apr</span></p>
                                                    </a>
                                                    <div class="desc">
                                                            <h2><a href="blog.html">Creating Mobile Apps</a></h2>
                                                            <p class="admin"><span>Posted by:</span> <span>James Smith</span></p>
                                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life. The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
                                                    </div>
                                            </article>
                                    </div>
                                    <div class="col-md-6">
                                            <div class="f-blog animate-box">
                                                    <a href="blog.html" class="blog-img" style="background-image: url(images/blog-1.jpg);">
                                                    </a>
                                                    <div class="desc">
                                                            <h2><a href="blog.html">How to Create Website in Scratch</a></h2>
                                                            <p class="admin"><span>04 March 2018</span></p>
                                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
                                                    </div>
                                            </div>
                                            <div class="f-blog animate-box">
                                                    <a href="blog.html" class="blog-img" style="background-image: url(images/blog-2.jpg);">
                                                    </a>
                                                    <div class="desc">
                                                            <h2><a href="blog.html">How to Convert PSD File to HTML File?</a></h2>
                                                            <p class="admin"><span>04 March 2018</span></p>
                                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
                                                    </div>
                                            </div>
                                            <div class="f-blog animate-box">
                                                    <a href="blog.html" class="blog-img" style="background-image: url(images/blog-3.jpg);">
                                                    </a>
                                                    <div class="desc">
                                                            <h2><a href="blog.html">How to Build Games App in Mobile</a></h2>
                                                            <p class="admin"><span>04 March 2018</span></p>
                                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div> -->



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

