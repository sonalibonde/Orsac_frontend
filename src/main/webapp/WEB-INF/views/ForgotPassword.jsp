<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en-us">
<meta charset="utf-8" />
<head>
<title>Log In</title>
<link rel="shortcut icon" href="<c:url value="/resources/assets/images/logonew.png"/>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css");
@import url("http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700");
*{margin:0; padding:0}
body{background: url('http://www.trakm8.com/wp-content/uploads/2014/06/trakm8slidernew.jpg') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover; font-family: 'Source Sans Pro', sans-serif}
.form{width:400px; margin:0 auto; background:#1C2B4A; margin-top:90px}
.header{height:50px; background:#1C2B4A}
.header h2{height:44px; line-height:44px; color:#fff; text-align:center}
.login{padding:0 20px;}
.login span.un{width:10%; text-align:center; color:#0C6; border-radius:3px 0 0 3px}
.text{background:#12192C; width:90%; border-radius:0 3px 3px 0; border:none; outline:none; color:#999; font-family: 'Source Sans Pro', sans-serif} 
.text,.login span.un{display:inline-block; vertical-align:top; height:40px; line-height:40px; background:#12192C;}

.btn{height:40px; border:none; background:#0C6; width:100%; outline:none; font-family: 'Source Sans Pro', sans-serif; font-size:20px; font-weight:bold; color:#eee; border-bottom:solid 3px #093; border-radius:3px; cursor:pointer}
ul li{height:40px; margin:15px 0; list-style:none}
.span{display:table; width:100%; font-size:14px;}
.ch{display:inline-block; width:45%; color:#CCC}
.ch a{color:#CCC; text-decoration:none}
.ch:nth-child(2){text-align:right}
/*social*/
.social{height:30px; line-height:30px; display:table; width:100%}
.social div{display:inline-block; width:42%; color:#eee; font-size:12px; text-align:center; border-radius:3px}
.social div i.fa{font-size:16px; line-height:30px}
.fb{background:#3B5A9A; border-bottom:solid 3px #036} .tw{background:#2CA8D2; margin-left:16%; border-bottom:solid 3px #3399CC}
/*bottom*/
.sign{width:90%; padding:0 5%; height:50px; display:table; background:#17233B}
.sign div{display:inline-block; width:50%; line-height:50px; color:#ccc; font-size:14px}
.up{text-align:right}
.up a{display:block; background:#096; text-align:center; height:35px; line-height:35px; width:50%; font-size:16px; text-decoration:none; color:#eee; border-bottom:solid 3px #006633; border-radius:3px; font-weight:bold; margin-left:50%}
@media(max-width:480px){ .form{width:100%}}

#load{
    width:100%;
    height:100%;
    position:fixed;
    z-index:9999;
    background:url('<c:url value="/resources/assets/images/Preloader_7.gif"/>') no-repeat center center rgba(0,0,0,0.25)
}
</style>


  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

 <link rel="stylesheet" type="text/css" href="<c:url value="resources/assets/navcssnew.css"/>">

 <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"/>"></script>
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28//angular-route.min.js"/>"></script>
  <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-resource.js"/>"></script>
  <script src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"/>"></script>
 <link rel="stylesheet" href="<c:url value="resources/css/alert.css"/>" />
 
  <script>
 
  var ownerid='${ownersid}';
  alert("in reset"+ownerid);

  var customerApp = angular.module('forgot-app', [ 'ngRoute' ]);

  angular.module('forgot-app').controller("forgotController", function($scope, $http, $routeParams) {

	 
	//forgot
	$scope.resetpassword=function resetpassword()
	{   try
	{
	if(!(document.getElementById('newpassword').value == document.getElementById('Confirmpassword').value))
	{	
	document.getElementById('danger').hidden=false;
	}
	else {
	  $http.get('http://localhost:9090/indtrackwebservice/rest/CallService/passwordinsert?ownersid='+ownerid+'&password='+document.getElementById('newpassword').value)
	    .success(function(data, status, headers, config) {
		document.getElementById('resetsuccess').hidden=false;
	  window.location.replace("/indtrack");

	})
	   .error(function(data, status, headers, config) {
		   alert("error");
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
<body ng-app="forgot-app" ng-controller="forgotController">
<!-- <div id="load"></div> -->
<div class="login"  id="forgetpass" >
<br>
  <center>
    <img style="border: 0;"  src="<c:url value="/resources/assets/images/logonew.png"/>" height="150px" width="180px">
  </center>
       <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                          <h3><i class="fa fa-lock fa-4x"></i></h3>
                          <h2 class="text-center">Forgot Password?</h2>
                          <p>You can reset your password here.</p>
                       	<div class="panel-body">
                           <div id="changepassdiv">
                          <div class="form-group" >
                          <input  placeholder="password"  id="newpassword"  class="form-control"   type="text" >
                           </div>
                           <div class="form-group">
                        <input  placeholder="confirm password"  id="Confirmpassword"  class="form-control"   type="text" >
                       </div>
                       <div  class="form-group" id="danger" hidden><div class="alert alert-danger">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
  </div></div>
                       <div  class="form-group">
                       <input class="btn btn-lg btn-primary btn-block" value="Reset Password"  ng-click="resetpassword();" type="submit">
                         </div>
                         
                         <div class="form-group" id="resetsuccess " hidden><div class="alert alert-success">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong>Successfully Reset Your Password!
  </div></div>
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</div>




<div id="footer" style="background: #52417F;">
				
				<div  class="col-sm-4 col-lg-12">
				<div   class="col-sm-4">
<font color="white">Vehicle Tracking System </font> </div>
<div class="col-sm-8" style="text-align:right">
<font color="white">© 2016. All Rights reserved E-Locator.</font>
				</div>
					
			</div>
			</div>

</body>
<style>
	#footer {
 
    position: fixed;
 
    height: 30px;
 
    bottom: 0;
 
    width: 100%;
 
 }
 .right-inner-addon input {
    padding-right: 30px;    
}
</style>
</html>
