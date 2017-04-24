
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en" ng-app="login-app">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Login, registration forms">
<meta name="author" content="Seong Lee">

<title>Login Page</title>
	
<!--  <link type="text/css" rel="shortcut icon" href="resources/images/gvk.png"> -->
  <link type="text/css" rel="stylesheet" href="resources/assets/alertjs/jquery.alerts.css">
  <link type="text/css" rel="stylesheet" href="resources/assets/fonts/fonts.googleapis.com.css">
  <link rel="stylesheet" type="text/css" href="resources/assets/font-awesome/4.2.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="resources/assets/css/ace.min.css" type="text/css">
  <link rel="stylesheet" type="text/css" type="text/css" href="resources/assets/navcssnew.css" type="text/css">
<!--   <link rel="stylesheet" type="text/css" href="resources/assets/style11.css"> -->
<!--   <link rel="stylesheet" type="text/css" href="resources/mainjavascript/font-awesome.css"> -->
 <link rel="stylesheet" type="text/css" href="resources/mainjavascript/loginpagescript/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="resources/mainjavascript/datepicker3.css" >
<!--  <link rel="stylesheet" href="resources/css/alert.css" /> -->
 <link rel="stylesheet" type="text/css" href="resources/timepicker/css/timepicki.css" >
<!--  <script src="resources/assets/alertjs/js/jquery.ui.draggable.js"></script> -->
 <script src="resources/assets/alertjs/js/jquery.alerts.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/angular.min.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/angular-route.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/dirPagination.js" type="text/javascript"></script>
  <script src="resources/mainjavascript/jquery.min.js" type="text/javascript"></script>
  <script src="resources/mainjavascript/bootstrap.min.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/bootstrap-datepicker.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/jsapi" type="text/javascript"></script>
<script src="resources/assets/js/ace.min.js" type="text/javascript"></script>
<script src="resources/script/timpicker.js" type="text/javascript"></script>
<!-- <script src="resources/assets/newpdf/jspdf.min.js" type="text/javascript"></script>  -->
<script src="resources/assets/Exportjs/jquery.base64.js" type="text/javascript"></script>
<!-- //pdf -->

<style>
body {
	/* background-color: #D6D1E2;  */
	/*  background: url('http://www.trakm8.com/wp-content/uploads/2014/06/trakm8slidernew.jpg') no-repeat center center fixed;   */
/* 	background: url('resources/images/abul1.jpg') no-repeat center  */
/* 		center fixed;   */
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow: scroll;
}

#footer {
	position: fixed;
	height: 30px;
	bottom: 0;
	width: 100%;
}

.authenty.signin-main {
	background-color: transparent;
}

.authenty {
	background-color: transparent;
}

.text, #form_1 span.un {
	display: inline-block;
}

.buttoncolor {
	background-color: #52417F;
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

#loading {
	width: 50px;
	height: 57px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -28px 0 0 -25px;
}



/* The Modal (Company) */
.modal { 
    display: none; /* Hidden by default */ 
     position: fixed; /* Stay in place */ 
   
     padding-top: 80px; /* Location of the box */ 
     left: 0; 
     top: 0; 
    width: 100%; /* Full width */ 
     height: 100%; /* Full height */ 
     overflow: auto; /* Enable scroll if needed */ 
    
 } 
/* Modal Content */
 .modal-content { 
     position: relative; 
     background-color: #fefefe; 
     margin: auto; 
     padding: 0; 
     border: 1px solid #888; 
     width:60%; 
     box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19); 
     -webkit-animation-name: animatetop; 
     -webkit-animation-duration: 0.4s; 
     animation-name: animatetop; 
     animation-duration: 0.4s 
 } 

 /* Add Animation */ 
 @-webkit-keyframes animatetop { 
     from {top:-300px; opacity:0}  
     to {top:0; opacity:1} 
 } 

 @keyframes animatetop { 
     from {top:-300px; opacity:0} 
    to {top:0; opacity:1} 
 } 

 /* The Close Button */ 
 .close { 
     color: white; 
     float: right; 
     font-size: 30px; 
     font-weight: bold; 
 } 

 .close:hover, 
 .close:focus { 
     color:white; 
     text-decoration: none; 
     cursor: pointer; 
 } 

 .modal-header {
     padding: 2px 20px; 
     background-color: #1a2e4f; 
     color: white; 
 } 

 .modal-body {padding: 2px 24px;} 

 .modal-footer { 
     padding: 25px 20px; 
/*      background-color:#1a2e4f;  */
     color: white; 
 } 
 
 
 
 .authenty.signin-main {
	background-color: transparent;
}

.authenty {
	background-color: transparent;
}
/*
 #loginmodalcss 
 { 	 -webkit-box-shadow: 3px 0px 15px 4px rgba(0,0,0,0.75); 
 -moz-box-shadow: 3px 0px 15px 4px rgba(0,0,0,0.75); 
 box-shadow: 3px 0px 15px 4px rgba(0,0,0,0.75); 
} */

#panelwidth
{
width:280px;
}
.ikon:hover 
{ 
background: -moz-linear-gradient(left, rgba(98,125,77,1) 0%, rgba(31,59,8,1) 100%); 
color:orange; 
font-weight:bold;
text-shadow: 3px 2px 4px orange;
}
.ikon2:hover
 {
 background: -moz-linear-gradient(left, rgba(122,184,214,1) 0%, rgba(98,168,203,1) 37%, rgba(68,145,183,1) 93%, rgba(68,145,183,1) 93%, rgba(64,142,181,1) 100%);
 }
 .ikon3:hover
 {
background: -moz-linear-gradient(left, rgba(179,173,86,1) 0%, rgba(142,134,22,1) 86%, rgba(136,128,12,1) 100%); }
 
 .ikon4:hover
 {
 background: -moz-linear-gradient(left, rgba(243,226,199,1) 0%, rgba(193,158,103,1) 21%, rgba(193,158,103,1) 31%, rgba(182,141,76,1) 61%, rgba(233,212,179,1) 100%);
 }
 
 
</style>

<script>
  
  var customerApp = angular.module('login-app', [ 'ngRoute' ]);

  angular.module('login-app').controller("LoginController", function($scope, $http, $routeParams) {

	  $scope.hide = function hide(){
  		document.getElementById("infodiv").hidden = true;
  	}
  	
	  $scope.showforget=function showforget()
	  {
		  document.getElementById('forgetpass').hidden=false;
		  document.getElementById('signin_main').hidden=true;
	  }
	  
  	try{
	    $scope.add = function add(loginform) {
	    	

// 	    	var over = '<div id="overlay">' +
// //		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
// 		     '</div>';
// 		    $(over).appendTo('body');
//  	alert("hwlo"+document.getElementById('username').value+" "+document.getElementById('password').value);
	    	$scope.username = document.getElementById('username').value;
	    	$scope.password = document.getElementById('password').value;
	    	var loginForm= document.loginform; 
			
		      if(loginForm.username.value=="") 
		      { 
		    	  loginForm.username.focus(); 
		      } 
		      else if(loginForm.password.value=="")
		    	  {
		    	  loginForm.password.focus();
		    	  }
		      else
		    	  {
		    //  alert('http://localhost:8080/indtrackwebservice/rest/CallService/login1?username='+$scope.username+'&password='+$scope.password);
	    	var response = $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/login1?username='+$scope.username+'&password='+$scope.password);
	    	response.success(function(data, status, headers, config) {
   		//	alert("iinn"+data[0].key);
       window.location.replace("index?key="+data[0].key);
      });
      response.error(function(data, status, headers, config) {
    ///	alert("Check Useranme and Password"+data+" =>"+status+"=>"+headers+"=>");
		$('#overlay').remove();
		document.getElementById('invalidpass').hidden=false;
      	console.log('error: data = ' , data);
      });
		    	  }
    };
   
  	}catch(e)
  	{
  		alert(e);
  	}
  	
  	$scope.checkotp=function checkotp()
  	{
  	var invalidChars = /[^0-9]/gi;
  	 if(invalidChars.test(document.getElementById('email-phone').value)) { 
  		document.getElementById('emailcheck').hidden=false;
  		 }
  	 else{
 		document.getElementById('showotp').hidden=false;
		document.getElementById('forgotdiv').hidden=true;}
  	}
    
  	$scope.getDetails = function getDetails()
  	{
try
	{ 

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/checkuser?param='+document.getElementById('email-phone').value+'&username='+document.getElementById('forgotuser').value)
        .success(function(data, status, headers, config) {
         $scope.details=data;
      	$scope.ownerid=data[0].ownersid;
      	document.getElementById('wrongid').hidden=true;
      	document.getElementById('emailcheck').hidden=false;
      	var invalidChars = /[^0-9]/gi;
     	 if(invalidChars.test(document.getElementById('email-phone').value)) { 
//      		   document.getElementById('showotp').hidden=false;
//     		   document.getElementById('forgotdiv').hidden=true;
     		 }
     	 else{
//      		 alert("in else")
    		document.getElementById('showotp').hidden=false;
   		   document.getElementById('forgotdiv').hidden=true;
   		}
      	
      	
		//alert("in ownersid"+data[0].ownersid);
		   })
       .error(function(data, status, headers, config) {
//     	   alert("error ");

    	  document.getElementById('wrongid').hidden=false;
    	  document.getElementById('emailcheck').hidden=true;
   		console.log('error: data = ' , data);
       });
   		}
  		catch(e)
  		{
  			alert(e);
  		}
  	}
  $scope.verifyotp=function verifyotp()
  
  {
	  try
	  {
// 	alert('checkotp?otp='+document.getElementById('otp').value+'&ownersid='+$scope.ownerid);
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/checkotp?otp='+document.getElementById('otp').value+'&ownersid='+$scope.ownerid)
	        .success(function(data, status, headers, config) {
	        	document.getElementById('changepassdiv').hidden=false;
	        	document.getElementById('showotp').hidden=true;
		})
	       .error(function(data, status, headers, config) {
	    	  
	   		console.log('error: data = ' , data);
	       });
	  }
	  catch(e)
	  {
		  alert(e);
	  }
  }
  
  $scope.showbacklogin=function()
  {
	  window.location.replace("");
// 	  document.getElementById('contents').hidden=false;
// 		document.getElementById('forgetpass').hidden=true;
	
  }
  
  
  $scope.resetPassword=function resetPassword()
  {   try
	  {
	
	 if(!(document.getElementById('password2').value == document.getElementById('confirmpassword').value))
	{	
		 document.getElementById('notmatch').hidden=false;
		 
	}
	 else {
		  $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/passwordinsert?ownersid='+$scope.ownerid+'&password='+document.getElementById('password2').value)
	        .success(function(data, status, headers, config) {
	        document.getElementById('successbox').hidden=false;
	        document.getElementById('notmatch').hidden=true;
		  document.getElementById('contents').hidden=false;
		  document.getElementById('forgetpass').hidden=true;
		}) .error(function(data, status, headers, config) {
	    	  // alert("error");
	   		console.log('error: data = ' , data);
	       });
		}
	  }
	  catch(e)
	  {
		  
	  }
  }
  
  
  });
  </script>



</head>
<body ng-controller="LoginController">
<div id="navbar" class="navbar navbar-default navbar-fixed-top"  style="  background: #1252ba; min-height: 25px !important;">
	
</div>
<!-- <div class="col-xs-12" style="margin-top:30px;"> -->
<!-- 	<div class="row"> -->
<!-- 	<div class="col-xs-6"> -->
<!-- 		<img  src="resources/images/gvk.png" -->
<!-- 				height="70px" width="300px"> -->
<!-- 	</div> -->
	
	
<!-- 	<div  class="col-xs-6" style="text-align: right;"><img  src="resources/images/embulaceimage.jpg" -->
<!-- 				height="105px" width="200px"></div> -->
<!-- </div> -->
<!-- 	<div  style="text-align: center;margin-top:0px;"><img  src="resources/assets/images/tamil.png" -->
<!-- 				height="150px" width="150px"></div> -->
</div>	



<!-- <div class="col-xs-12" style="margin-top:-110px;text-align:center;"> -->
<!-- 		<img  src="resources/assets/images/tamil.png" height="120px" width="150px"> -->
		
<!-- 		</div> -->


	<div class="col-xs-12" style="margin-top:120px;">
		
		
	<div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-6 " >
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
<!--                             <div class="panel-body"  style="background-color: #E681B5"> -->
 							<div class="panel-body ikon">
  							<i class="fa fa-user fa-5x" style="color:rgb(92,184,92)"></i>
                                <h3>HS</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color: rgb(92,184,92)">
                                

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-blue" id="loginmodalcss">
<!--                             <div class="panel-body"  style="background-color: #DEED53"> -->
							<div class="panel-body ikon2" >
                                <i class="fa fa-user  fa-5x" style="color:rgb(76,177,207)"></i>
                                <h3>MD/PD</h3>
                            </div>
                            <div class="panel-footer back-footer-blue" style="background-color:rgb(76,177,207)">
           			      </div>
                        </div>
                    </div>
                    
                    
                    
                  <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon3">
                                <i class="fa fa-user fa-5x" style="color:rgb(240,67,61)"></i>
                                <h3>PO</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(240,67,61)">
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon4">
                                <i class="fa fa-user fa-5x" style="color:rgb(242,184,68)"></i>
                                <h3>SHO</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(242,184,68)">
                                

                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon2">
                                <i class="fa fa-user fa-5x" style="color:rgb(240,67,61)" ></i>
                               <a href="" data-toggle="modal" data-target="#mydeviceModal1"><h3>Operations</h3></a>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color: rgb(240,67,61)">
                               

                            </div>
                        </div>
                    </div>  
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon4">
                                <i class="fa fa-user fa-5x" style="color:rgb(92,184,92)"></i>
                                <h3>IT</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color: rgb(92,184,92)">
                               

                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon">
                                <i class="fa fa-user fa-5x" style="color:rgb(76,177,207)"></i>
                                <h3>District Collector </h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(76,177,207)">
                                

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon3">
                                <i class="fa fa-user fa-5x" style="color:rgb(240,67,61)"></i>
                                <h3>JDHS</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(240,67,61)">
                               

                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon4">
                                <i class="fa fa-user fa-5x" style="color:rgb(242,184,68)"></i>
                                <h3>Trauma Care Nodal Officers</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color: rgb(242,184,68)">
                                

                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon3">
                                <i class="fa fa-user fa-5x" style="color:rgb(240,67,61)"></i>
                                <h3>District Manager</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color: rgb(240,67,61)">
                                

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon">
                                <i class="fa fa-user fa-5x" style="color:rgb(92,184,92)"></i>
                                <h3>EME</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(92,184,92)">
                                

                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-green" id="loginmodalcss">
                            <div class="panel-body ikon2">
                                <i class="fa fa-user fa-5x" style="color:rgb(76,177,207)"></i>
                                <h3>Regional Fleet Engineer</h3>
                            </div>
                            <div class="panel-footer back-footer-green" style="background-color:rgb(76,177,207)">
                                

                            </div>
                        </div>
                    </div>
                    </div>
	
		
<div id="mydeviceModal1" class="modal fade" role="dialog">

  <!-- Modal content -->
  <div class="modal-content" style="width:670px;">
    <div class="modal-header">
     <span class="close" data-dismiss="modal">×</span>
        <table>
       <tr>
       <td style="width:280px;">
         <h2><font color="white">Login</font></h2>
       </td>
<!--        <td><img  src="resources/assets/images/tamil.png" height="80px" width="80px"></td> -->
       </tr>
       
       </table>
    	
    
     
          </div>
   <div class="modal-body">
	
<!--      <form name="form" id="form" class="form-horizontal" enctype="multipart/form-data" method="POST"> -->
                   
<!--                     <div class="input-group"> -->
<!--                         <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
<!--                         <input id="user" type="text" class="form-control" name="user" value="" placeholder="User">                                         -->
<!--                     </div> -->

<!--                     <div class="input-group"> -->
<!--                         <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> -->
<!--                         <input id="password" type="password" class="form-control" name="password" placeholder="Password"> -->
<!--                     </div>                                                                   -->

<!--                     <div class="form-group"> -->
<!--                         Button -->
<!--                         <div class="col-sm-12 controls"> -->
                                                  
<!--                         </div> -->
<!--                     </div> -->
<!--      <div class="modal-footer"> -->
<!--              <button type="submit" class="btn btn-primary "><i class="glyphicon glyphicon-log-in"></i> Log in</button>    -->
<!--           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--         </div> -->
<!--                 </form>    -->
  
			<div>&nbsp;</div>
				<div class="row" id="signin_main" class="authenty signin-main">
								<div id="form_1">
							<form method="post"  name="loginform" ng-submit="add(loginform);">
							 <div class="input-group">
                       		 <span class="input-group-addon"><i class="fa fa-user"></i></span>
                       		 <input id="username" type="text" class="form-control" name="user" value="" placeholder="User Name" required="required" autofocus>                                        
                    		</div>
                    		<div>&nbsp;</div>
                    		 <div class="input-group">
                       		 <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                       		 <input id="password" type="password"  class="form-control" name="user" value="" placeholder="Password" required>                                        
                    		</div>
                    		
                    	<div class="alert " style="text-align: center;"
												id="invalidpass" hidden>
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a> <font color="red"> <strong>Warning!</strong>
													Check Username and Password!.
												</font>
											</div>
											<div>&nbsp;</div>
                   	<center> <div class="">
             			<button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>   
         				 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       					 </div></center>
                    </form>	
                    		
<!-- 									<form ng-submit="add();"> -->
										
<!-- 										<div class="form-main" style="background-color: white"> -->
<!-- 											<div class="form-group"> -->
<!-- 												<input type="text" id="username" -->
<!-- 													style="background-color: #EEECF5; color: #211847" -->
<!-- 													class="form-control" placeholder="Username" -->
<!-- 													required="required" autofocus> 
<input type="password" -->
<!-- 													style="background-color: #EEECF5; color: #211847" -->
<!-- 													id="password" class="form-control" placeholder="Password" -->
<!-- 													required="required"> -->
<!-- 											</div> -->
<!-- 											<button id="signIn_1" type="submit" -->
<!-- 												class="btn btn-block buttoncolor "> -->
<!-- 												<font color="white">Sign In</font> -->
<!-- 											</button> -->
<!-- 											<div class="alert " style="text-align: center;" -->
<!-- 												id="invalidpass" hidden> -->
<!-- 												<a href="#" class="close" data-dismiss="alert" -->
<!-- 													aria-label="close">&times;</a> <font color="red"> <strong>Warning!</strong> -->
<!-- 													Check Username and Password!. -->
<!-- 												</font> -->
<!-- 											</div> -->
<!-- 										</div> -->

										
<!-- 									</form> -->
								</div>
							</div>
						
		

        
</div>
</div>
</div>
		
</div>	
	
	
	
	<div id="footer"  style="background: #db1308">
				
				<div  class="col-sm-4 col-lg-12">
				<div   class="col-sm-4">
<font color="white">Vehicle Tracking System </font> </div>
<div class="col-sm-8" style="text-align:right">
<font color="white">Rosmerta Technologies Limited © 2016</font>
				</div>
			</div>
			
			</div>

		
		
		

		
		
		
		
		
		

	<!-- js library -->

	<script src="resources/assets/newlogin/jquery.min.js"></script>

	
</body>

</html>






