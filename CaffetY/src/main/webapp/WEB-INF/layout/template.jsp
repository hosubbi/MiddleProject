<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
	/* body {font-family: Arial, Helvetica, sans-serif;} */
	
	/* Full-width input fields */
	input[type=text], input[type=password] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	
	/* Set a style for all buttons */
	button {
	  background-color: #04AA6D;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 100%;
	}
	
	button:hover {
	  opacity: 0.8;
	}
	
	/* Extra styles for the cancel button */
	.cancelbtn {
	  width: auto;
	  padding: 10px 18px;
	  background-color: #f44336;
	}
	
	/* Center the image and position the close button */
	.imgcontainer {
	  text-align: center;
	  margin: 24px 0 12px 0;
	  position: relative;
	}
	
	img.avatar {
	  width: 40%;
	  border-radius: 50%;
	}
	
	.container {
	  padding: 16px;
	}
	
	span.psw {
	  float: right;
	  padding-top: 16px;
	}
	
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	  padding-top: 60px;
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 1% auto 1% auto; /* 5% from the top, 15% from the bottom and centered */
	  border: 1px solid #888;
	  width: 80%; /* Could be more or less, depending on screen size */
	}
	
	/* The Close Button (x) */
	.close {
	  position: absolute;
	  right: 25px;
	  top: 0;
	  color: #000;
	  font-size: 35px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: red;
	  cursor: pointer;
	}

	/* Add Zoom Animation */
	.animate {
	  -webkit-animation: animatezoom 0.6s;
	  animation: animatezoom 0.6s
	}
	
	.joinradio {
		text-align: center;
		padding: 20px;
	}

	@-webkit-keyframes animatezoom {
	  from {-webkit-transform: scale(0)} 
	  to {-webkit-transform: scale(1)}
	}
	  
	@keyframes animatezoom {
	  from {transform: scale(0)} 
	  to {transform: scale(1)}
	}
	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	  span.psw {
		 display: block;
		 float: none;
	  }
	  .cancelbtn {
		 width: 100%;
	  }
	}
	</style>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="css/tiny-slider.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/style.css">

	<title>Property &mdash; Caffet</title>
</head>

<body>
		<!-- top -->  
		<tiles:insertAttribute name = "top" />
        <!-- Header-->
       	<tiles:insertAttribute name = "header" />
        <!-- Section-->
       	<tiles:insertAttribute name = "body" />
        <!-- Footer-->
      	<tiles:insertAttribute name = "footer" />
        
<!-- Preloader -->
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<script src="./js/bootstrap.bundle.min.js"></script>
	<script src="./js/tiny-slider.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/navbar.js"></script>
	<script src="./js/counter.js"></script>
	<script src="./js/custom.js"></script>
</body>

</html>