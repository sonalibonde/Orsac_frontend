
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Login, registration forms">
<meta name="author" content="Seong Lee">

<title>Login Page</title>
	
<!-- Stylesheets -->
<!-- <link rel="shortcut icon" href="resources/assets/images/logonew.png"> -->
<link href="resources/assets/newlogin/bootstrap.css" rel="stylesheet">
<!-- <link href="resources/assets/newlogin/animation.css"> -->
<!-- <link href="resources/assets/newlogin/orange.css "> -->
<!-- <link href="resources/assets/newlogin/preview.css" rel="stylesheet"> -->
<link href="resources/assets/newlogin/authenty.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/alert.css" /> -->
<!-- <link href="resources/assets/newlogin/css" rel="stylesheet"> -->
<!-- <link href="resources/assets/newlogin/open.css" rel="stylesheet"> -->

<!-- Font Awesome CDN -->
  <link rel="stylesheet" href="resources/assets/fonts/fonts.googleapis.com.css" >

<script src="resources/mainjavascript/loginpagescript/angular.min.js"></script>
<script src="resources/mainjavascript/loginpagescript/angular-route.min.js"></script>

<!-- <link rel="stylesheet" href="resources/css/alert.css" /> -->
<link rel="stylesheet" type="text/css" href="resources/assets/style11.css">
<style>
body {
	/* background-color: #D6D1E2;  */
	/*  background: url('http://www.trakm8.com/wp-content/uploads/2014/06/trakm8slidernew.jpg') no-repeat center center fixed;   */
/* 	background: url('resources/assets/images/Orsac_bck5.jpg') no-repeat center fixed */
/* 	; */
	
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow: hidden;
	padding-bottom: 0px;
}
.fa-unlock-alt {
    background-color:#001355 !important;}

 .form-footer {
    border-radius:0px 0px 10px 10px !important;
    }

#footer {
	position:fixed;
	height: 30px;
	bottom: 0px;
	width: 100%;
	
}

.authenty.signin-main {
	background-color: transparent;
	padding-right:0px;
}

.authenty {
	background-color: transparent;
}

.text, #form_1 span.un {
	display: inline-block;
}

.buttoncolor {
	background-color: #3b5998;
}

.loader {
	text-align: center;
	z-index: 999;
	position: relative;
	top: 10px;
}


#overlay {
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	background: #ccc;
	opacity: 1;
	filter: alpha(opacity = 80);
	background-color: transparent;
	background: url('resources/assets/images/horizontalloader.gif') no-repeat
		center center rgba(0, 0, 0, 0.25)
}
.alert{

height:10%;

}
.row{
text-align: left;  

 padding-left:5px;
 padding-bottom:5px;

  margin-right:20px; 
  margin-top:-10px;
 
  height:auto;
  width:100%;}
#loading {

	width: 50px;
	height: 57px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -28px 0 0 -25px;
}

ul.img-list {
list-style-type: auto;
float:right;

padding-top: 10px;
padding-right: 30px;
text-align: center;

}
ul.img-list li {
display: inline-block;
height: 150px;

margin: 0px 15px 0px 55px;
position: relative;
width: 120px;
}


span.text-content span {
display: table-cell;
text-align: center;
vertical-align: middle;
}

span.text-content {
background: #001254;
color: white;
font-size:12px;
cursor: pointer;
display: table;
height: 120px;
left: 0;
position: absolute;
top: 0;
width: 150px;
opacity: 0;
-webkit-transition: opacity 500ms;
-moz-transition: opacity 500ms;
-o-transition: opacity 500ms;
transition: opacity 500ms;

}
ul.img-list li:hover span.text-content {
opacity: 1.5;
}

.modalDialog {
    position: fixed;
    font-family: Arial, Helvetica, sans-serif;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    z-index: 99999;
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.modalDialog:target {
    opacity:1;
    pointer-events: auto;
}
.modalDialog > div {
    width: 400px;
    position: relative;
    margin: 10% auto;
    padding: 5px 20px 13px 20px;
    border-radius: 10px;
    background: #fff;
    background: -moz-linear-gradient(#fff, #999);
    background: -webkit-linear-gradient(#fff, #999);
    background: -o-linear-gradient(#fff, #999);
}
.close {
    background: #606061;
    color: #FFFFFF;
    line-height: 25px;
    position: absolute;
    right: -12px;
    text-align: center;
    top: -10px;
    width: 24px;
    text-decoration: none;
    font-weight: bold;
    -webkit-border-radius: 12px;
    -moz-border-radius: 12px;
    border-radius: 12px;
    -moz-box-shadow: 1px 1px 3px #000;
    -webkit-box-shadow: 1px 1px 3px #000;
    box-shadow: 1px 1px 3px #000;
}
.close:hover {
    background: #00d9ff;
}


</style>

<script>
  var tokenkey = "${token}";
  var customerApp = angular.module('login-app', [ 'ngRoute' ]);

  angular.module('login-app').controller("LoginController", function($scope, $http, $routeParams) {

		var response = $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/loginkey?key='+tokenkey);
	  	
	  	response.success(function(data, status, headers, config) {
	       window.location.replace("index?key="+data[0].key);
		});
  	
	
  
  });
  
  </script>



</head>
<body ng-app="login-app" ng-controller="LoginController">
	
	
	
</body>

    
    <style>

    </style>
</html>





