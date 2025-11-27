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

	<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">

	<!-- CSS ABSOLUTE PATHS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icomoon.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/flexslider.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

	<!-- JS Absolute Path -->
	<script src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>

	<style>
	    #mapp {
		width: 100%;
		height: 600px;
		position: relative;
	    }
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
		<!-- HEADER INCLUDE -->
		<jsp:include page="
