<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
<link href="<c:url value="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
        
body{
background-image:url('<c:url value='/resources/images/backgro.jpg'/>'); 
overflow:hidden;
 padding:50px; 
  }
 
/*  #login-dp{ */
/*                 min-width: 250px; */
/*                 padding: 14px 14px 0; */
/*                 overflow:hidden; */
/*   } */

.logo
{
    width: 138psx;
    height: 30px;
    text-align: center;
    padding-left:40px;
    margin: 10px 0px 27px 40px;
    background-position: 0px -4px;
    position: relative;
}

.forgotLnk
{
    margin-top: 10px;
    display: block;
}

.purple-bg
{
    background-color: #6E329D;
    color: #fff;
}

.account-box .btn:hover
{
    color: #fff;
}
.btn-facebook
{
    background-color: #3F639E;
    color: #fff;
    font-weight:bold;
}
.btn-google
{
    background-color: #454545;
    color: #fff;
    font-weight:bold;
}
.modal-dialog
{
/* left: 150px; */
}
.mar
{
position: absolute;
top:150px;
/* left:5px; */
width:300px;
z-index: 992px;
/* position: fixed; */
}
    </style>
    
  
  <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"/>"></script>
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28//angular-route.min.js"/>"></script>
  <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-resource.js"/>"></script>
  <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"/>"></script>
  <link  href="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
  <link  href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.cs"/>" rel="stylesheet">
  <script src="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"/>"></script> 
 
 <script type="text/javascript" src="<c:url value="https://code.angularjs.org/1.2.13/angular.js"/>"></script>


<!-- scripts for pdfdownl -->
 <script type="text/javascript" src="<c:url value="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"/>"></script>
 

<!-- scripts for pdfdownl -->
    <script>
//     document.getElementById("infodiv").hidden=true;
    var customerApp = angular.module('single-page-app', [ 'ngRoute' ]);

    customerApp.config(function($routeProvider,$locationProvider) {

    $routeProvider

    .when('/list', {
    templateUrl : 'list',
    //controller : 'CustomerListController'
    })

    .when('/form', {
    templateUrl : 'form',
  //   controller : 'CustomerListController'
    })
    
    .when('/Records', {
    templateUrl : 'Records',
//     controller : 'CustomerListController'
    })
    
    .when('/example', {
    templateUrl : 'example',
  //   controller : 'CustomerListController'
    })
    
//     .when('/report', {
//     templateUrl : 'report',
//   //   controller : 'CustomerListController'
//     })
    // Define other routes here ...

    .otherwise({
    redirectTo : 'example'
    });
    });

    
    angular.module('single-page-app').controller("CustomerListController", function($scope, $http, $routeParams) {
    	$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/roledetails')
        .success(function(data, status, headers, config) {
        	$scope.roledetails = data;
        })
        .error(function(data, status, headers, config) {
//           alert("Check Useranme and Password"+data);        
			console.log('error: data = ' , data);
        });
    	
    	$scope.onrolechange = function onrolechange(role){
//     		alert(role.roleid);
    		$scope.roleid = role.roleid;
    	}
    	
    	$scope.hide = function hide(){
    		document.getElementById("infodiv").hidden = true;
    	}
    	
    	
  	    $scope.add = function add() {
//   	    	alert("hwlo"+$scope.username+" "+$scope.password);
        $http.get('http://localhost:9090/indtrackwebservice/rest/CallService/login1?username='+$scope.username+'&password='+$scope.password)
        .success(function(data, status, headers, config) {
//           alert("login success");
         window.location.replace("index?key="+data[0].key);
        })
        .error(function(data, status, headers, config) {
//           alert("Check Useranme and Password")
			document.getElementById("infodiv").hidden = false;
        	console.log('error: data = ' , data);
        });
      };
      
  	  });
    
      
    </script>
    
    <style>
    
html, body, 
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
 b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, legend {
/* 	background: transparent; */
/* background-color:black; */
background-image:url("http://media.gettyimages.com/photos/buildings-stand-in-singapore-background-as-vehicles-sit-in-traffic-on-picture-id453766522");
	border: 0;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;
}
body.login {
 background: url(bg.jpg); 
/* background-color: white; */
 }
h2 { font-size: 30px; line-height:38px; font-weight:normal; }
.loginbox { background: #FBFCFD; padding: 10px; width: 490px; margin: 4% auto 0 auto; position: relative; }
.loginboxinner { 
	background: #FBFCFD; padding: 5px; position: relative; border: 1px solid #FBFCFD;
	-moz-box-shadow: inset 0 1px 0 #FBFCFD; -webkit-box-shadow: inset 0 1px 0 #FBFCFD; box-shadow: inset 0 1px 0 #FBFCFD;
}
.loginheader { height: 20px; }
.loginform { margin: 4px auto; text-align:center; }

.loginbox h1 { font-size: 30px; letter-spacing: 1px; color: #555; font-weight: normal; padding-top: 10px; }
.loginbox p { margin: 7px 0 5px 0; }
.loginbox label { display: block; color: #666; letter-spacing: 1px; font-size: 18px; }
.loginbox input.mini { width:195px; }
.loginbox input { 
	padding: 12px 10px; color: #ccc; 
	font-family: Arial, Helvetica, sans-serif; margin-top: 8px; font-size: 15px; border: 1px solid #ccc; width: 420px;  outline: none; 
}
.loginbox button { 
	background: #5870A8; background-image:-webkit-linear-gradient(top, #637BAD, #4F67A4); padding: 10px 20px; font-size: 18px; border: 1px solid #1D3871; letter-spacing: 1px; color: #fff; width: 440px; line-height:30px; font-family:	'Helvetica Neue', Helvetica, Arial, sans-serif;
	-moz-box-shadow: 1px 1px 3px #1D3871; -webkit-box-shadow: 1px 1px 3px #1D3871; box-shadow: 1px 1px 3px #1D3871; cursor: pointer;
}

.radius { -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; }
.radius1 { -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; }
.title { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color:#8E989E; line-height:28px; font-weight:normal; text-align:center; font-size:16px; }


@media screen and (max-width: 430px) {
	
	body { font-size: 11px;
	background-color: black;
	 }
	button, input, select, textarea { font-size: 11px; }
	
	.loginbox { width: auto; margin: 10px; }
	.loginbox input { width: 95%; }
	.loginbox button { width: 100%; }
}	


#facebook-Bar {
/* background:#45619D;  */
/* background: -moz-linear-gradient(top, rgba(216,224,222,1) 0%, rgba(174,191,188,1) 22%, rgba(153,175,171,1) 33%, rgba(142,166,162,1) 50%, rgba(130,157,152,1) 67%, rgba(78,92,90,1) 82%, rgba(14,14,14,1) 100%); */
background: -moz-linear-gradient(top, rgba(167,207,223,1) 0%, rgba(35,83,138,1) 100%);


	border-bottom: 1px solid #0053A6;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.52);
	min-width: 1000px;
	width: 100%;
	z-index: 1000;
}
#facebook-Frame {
	margin-left:auto;
	margin-right:auto;
	max-width:1000px;
	height:70px;
	display:block;
}
/*-------LOGO-----------*/
#logo {
	float: left;
	height: 70px;
	position: relative;
	width: 160px;
}
#logo a {
	position: absolute;
	top: 20px;
	font-size:23px; font-weight:bold; color:#FFF;
	text-decoration:none;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
}

/*-------Login-----------*/
#header-main-right {
	float: right;
	height: 68px;
	position: relative;
	top:5px;
}
#header-main-right-nav {
	padding: 4px 6px 4px 4px;
	position: absolute;
	right: 0;
}
#login_form .inputtext {
	background-color: #FFFFFF;
	height:24px;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 13px;
	margin: 0;
	padding: 5px 8px 5px 8px;
	width: 166px;
	border:1px solid #3A518A;
}
#login_form .inputtext:hover {
 	border-color: #A0A0A0 #B9B9B9 #B9B9B9; 
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1) inset;
}

#login_form table tr td {
	padding: 0 0 0 5px;
}
#login_form table tr td label {
	color: #fff;
	cursor: pointer;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 12px;
	font-weight: normal;
	padding-left: 1px;
	text-align: left;
	vertical-align: middle;
}
.fbbutton 
{ 
/* background: #5870A8;  */
	background-color: #3498DB;
	border-bottom: 5px solid #2980B9;
	text-shadow: 0px -2px #2980B9;
	cursor:pointer; 
 	padding: 4px 10px;
  	border:1px solid #1D3871;
   	width:67px; 
/*    background-image:-webkit-linear-gradient(top, #637BAD, #4F67A4);   */
  	 font-size:12px; 
   	line-height:14px;
    font-weight:normal;
     color:#fff; }
     
     
     div#fixedfooter {
   background: -moz-linear-gradient(top, rgba(167,207,223,1) 0%, rgba(35,83,138,1) 100%);
     
	position:fixed;
	bottom:0px;
	left:0px;
	width:100%;
	color:#CCC;
	
	padding:8px;
}
    </style>
                                         
</head>
<!-- <body > -->
          
<!--   <div ng-app="single-page-app" ng-controller="CustomerListController"> -->
 <body class="login" ng-app="single-page-app" ng-controller="CustomerListController">
<!-- header starts here -->
<div id="facebook-Bar">
  <div id="facebook-Frame">
    <div id="logo"> <a href="">Logo</a> </div>
<div id="header-main-right">
 <div id="header-main-right-nav">
        <form  ng-submit="add()" class="form-horizontal" method="post" action="" id="login_form" name="login_form">
         <table>
            <tr>
              <td><input type="text" tabindex="1"  id="email" placeholder="User Name"  ng-model="username"  name="email" class="inputtext radius1" value=""></td>
              <td><input type="password" tabindex="2" id="pass"  ng-model="password" placeholder="Password" name="pass" class="inputtext radius1" ></td>
              <td><input type="submit" class="fbbutton" name="login" value="Login" /></td>
            </tr>
            <tr>
            <td><label><input id="persist_box" type="checkbox" name="persistent" value="1" checked="1"/><span style="color:#ccc;">Keep me logged in</span></label>
            </td>
            <td><label><a href="" style="color:#ccc; text-decoration:none">Forgot your password?</a></label></td>
            </tr>
          </table>
        </form>
      </div>
          </div>
      </div>
</div>


<div id="fixedfooter">Copyright2016</div>





</body>
</html>