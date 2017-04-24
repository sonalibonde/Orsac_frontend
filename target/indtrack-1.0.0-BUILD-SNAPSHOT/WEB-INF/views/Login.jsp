
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
	<link rel="stylesheet" href="resources/js/jssor.slider-22.2.6.debug.js">
<link rel="stylesheet" href="resources/js/jquery-1.11.3.min.js">
<link rel="stylesheet" href="resources/js/jssor.slider-22.2.6.min.js">
<link href="resources/assets/newlogin/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="resources/js/jssor.slider-22.2.6.mini.js">
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
	background: url('resources/img/1115.jpg') no-repeat center fixed 	; 
	
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
	z-index:999;
	
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
    right: 477px;
    text-align: center;
    top: 77px;
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

.nav > li > a:hover, .nav > li > a:focus {
    text-decoration: underline;
    background-color: transparent !important;
}

  .jssora02l, .jssora02r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 55px;
            height: 55px;
            cursor: pointer;
            background: url('img/a02.png') no-repeat;
            overflow: hidden;
        }
        .jssora02l { background-position: -3px -33px; }
        .jssora02r { background-position: -63px -33px; }
        .jssora02l:hover { background-position: -123px -33px; }
        .jssora02r:hover { background-position: -183px -33px; }
        .jssora02l.jssora02ldn { background-position: -3px -33px; }
        .jssora02r.jssora02rdn { background-position: -63px -33px; }
        .jssora02l.jssora02lds { background-position: -3px -33px; opacity: .3; pointer-events: none; }
        .jssora02r.jssora02rds { background-position: -63px -33px; opacity: .3; pointer-events: none; }
        /* jssor slider thumbnail navigator skin 11 css *//*.jssort11 .p            (normal).jssort11 .p:hover      (normal mouseover).jssort11 .pav          (active).jssort11 .pav:hover    (active mouseover).jssort11 .pdn          (mousedown)*/.jssort11 .p {    position: absolute;    top: 0;    left: 0;    width: 200px;    height: 69px;    background: #181818;}.jssort11 .tp {    position: absolute;    top: 0;    left: 0;    width: 100%;    height: 100%;    border: none;}.jssort11 .i, .jssort11 .pav:hover .i {    position: absolute;    top: 3px;    left: 3px;    width: 60px;    height: 30px;    border: white 1px dashed;}* html .jssort11 .i {    width /**/: 62px;    height /**/: 32px;}.jssort11 .pav .i {    border: white 1px solid;}.jssort11 .t, .jssort11 .pav:hover .t {    position: absolute;    top: 3px;    left: 68px;    width: 129px;    height: 32px;    line-height: 32px;    text-align: center;    color: #fc9835;    font-size: 13px;    font-weight: 700;}.jssort11 .pav .t, .jssort11 .p:hover .t {    color: #fff;}.jssort11 .c, .jssort11 .pav:hover .c {    position: absolute;    top: 38px;    left: 3px;    width: 194px;    height: 32px;    line-height: 32px;    color: #fff;    font-size: 11px;    font-weight: 400;    overflow: hidden;}.jssort11 .pav .c, .jssort11 .p:hover .c {    color: #fc9835;}.jssort11 .t, .jssort11 .c {    transition: color 2s;    -moz-transition: color 2s;    -webkit-transition: color 2s;    -o-transition: color 2s;}.jssort11 .p:hover .t, .jssort11 .pav:hover .t, .jssort11 .p:hover .c, .jssort11 .pav:hover .c {    transition: none;    -moz-transition: none;    -webkit-transition: none;    -o-transition: none;}.jssort11 .p:hover, .jssort11 .pav:hover {    background: #333;}.jssort11 .pav, .jssort11 .p.pdn {    background: #462300;}


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
	    $scope.add = function add() {
// 	    	$http.get("https://whispering-woodland-9020.herokuapp.com/getAllBooks")
// 	        .then(function(response) {
// 	          $scope.data = response.data;                               
	          
// // 	          for(var i=0;i<response.data.books.length;i++){
// // 	        	  alert(response.data.books[i].name);
// // 	          }
// 	        });
	    	var over = '<div id="overlay">' +
//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
		    $(over).appendTo('body');
 	//alert("hwlo"+document.getElementById('username').value+" "+document.getElementById('password').value);
	    	$scope.username = document.getElementById('username').value;
	    	$scope.password = document.getElementById('password').value;
	    	var response = $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/login1?username='+$scope.username+'&password='+$scope.password);
	    	
	    	response.success(function(data, status, headers, config) {
//     	  $scope.logindata=data;
//         alert("login success");
        //$('#overlay').remove();
       window.location.replace("index?key="+data[0].key);
      });
      response.error(function(data, status, headers, config) {
//         alert("Check Useranme and Password"+data+" =>"+status+"=>"+headers+"=>");
		$('#overlay').remove();
		document.getElementById('invalidpass').hidden=false;
      	console.log('error: data = ' , data);
      });
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
  
  jssor_1_slider_init = function() {

      var jssor_1_options = {
        $AutoPlay: true,
        $ArrowNavigatorOptions: {
          $Class: $JssorArrowNavigator$
        },
        $ThumbnailNavigatorOptions: {
          $Class: $JssorThumbnailNavigator$,
          $Cols: 4,
          $SpacingX: 5,
          $SpacingY: 5,
          $Orientation: 1,
          $Align: 0
        }
      };

      var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

      /*responsive code begin*/
      /*you can remove responsive code if you don't want the slider scales while window resizing*/
      function ScaleSlider() {
          var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
          if (refSize) {
              refSize = Math.min(refSize, 1000);
              jssor_1_slider.$ScaleWidth(refSize);
          }
          else {
              window.setTimeout(ScaleSlider, 20);
          }
      }
      ScaleSlider();
      $Jssor$.$AddEvent(window, "load", ScaleSlider);
      $Jssor$.$AddEvent(window, "resize", ScaleSlider);
      $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
      /*responsive code end*/
  };
  
  </script>

</head>
<body ng-app="login-app" ng-controller="LoginController" style="padding:0px; margin:0px; width:100%; height:500px; background-color:#000;font-family:'Open Sans',sans-serif,arial,helvetica,verdana">
	<section>
	<div style="background-color: #779ECB; height:80px";>
	<center>
			<img style="border: 0; padding-top:0px;" src="resources/images/transpant.png">

	<div class="navbar-buttons navbar-header pull-right" 
					role="navigation" style="height:0px";>
					<ul class="nav navbar-nav navbar-right">
						<li  style="text-decoration: none; padding-top:15px">
						<a href="#login">
							<font style="border: 0;margin-top:50px;font-size: 20px; padding-right:100px;" color="white"><b>Login</b></font>
						</a></li></ul></div>	</center>
	</div>
	 <script src="resources/js/jssor.slider-22.2.6.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jssor_1_slider_init = function() {

            var jssor_1_options = {
              $AutoPlay: true,
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Cols: 4,
                $SpacingX: 5,
                $SpacingY: 5,
                $Orientation: 1,
                $Align: 0
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*responsive code begin*/
            /*you can remove responsive code if you don't want the slider scales while window resizing*/
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 1000);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 20);
                }
            }
            ScaleSlider();
            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*responsive code end*/
        };
    </script>
		
	  <div id="jssor_1" style="position:relative;margin:0 auto;left:0px;top:30px;width:900px;height:500px;overflow:hidden;visibility:hidden;background-color:#fff;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position:absolute;top:0px;left:0px;background-color:rgba(0,0,0,0.7);">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1000px;height:500px;overflow:hidden;">
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/1111.jpg"/>
                <div data-u="thumb">
                    <img class="i" src="resources/img/thumb-002.jpg" />
                  <div class="t">(0124)44990800</div>
					<div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">Rosmerta Autotech Private Limited.</span></div>
                </div>
            </div>
            <a data-u="any" href="http://localhost:8080" style="display:none;">ORSAC</a>
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/1112.jpg" />
                <div data-u="thumb">
                    <img class="i" src="resources/img/thumb-004.png" />
                    <div class="t">(0120)4607080</div>
                    <div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">Fastrackerz</span></div>
                </div>
            </div>
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/1113.jpg" />
                <div data-u="thumb">
                    <img class="i" src="resources/img/thumb-003.png" />
                   <div class="t"> (011)49039718</div>
					<div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">Atlanta</span></div>
                </div>
            </div>
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/1115.jpg" />
                <div data-u="thumb">
                    <img class="i" src="resources/img/thumb-006.png" />
                    <div class="t">(020)26851072</div>
					<div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">Arya Omnitalk Wireless Solution Pvt.Ltd.</span></div>
                </div>
            </div>
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/8888.jpg" />
                <div data-u="thumb">
                    <img class="i" src="resources/img/thumb-005.png" />
                   <div class="t">18008746253</div>
				   <div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">Trimble Mobility Solutions India Pvt.Ltd.</span></div>
                </div>
            </div>
            <div style="background-color:Transparent;">
                <img data-u="image" src="resources/img/1116.JPG" />
                <div data-u="thumb">
                    <img class="i" src="resources/img/ets.jpg" />
                   <div class="t">(033)23375100</div>
				   <div class="c"><span  style="background-color:Transparent;font-size:12px; left:1px; font-family:'Open Sans',sans-serif,arial,helvetica,verdana">eTrans Solutions Pvt.Ltd.</span></div>
                </div>
            </div>
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort11" style="position:absolute;right:5px;top:62%;font-family:Arial, Helvetica, sans-serif;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none;width:200px;height:300px;" data-autocenter="1">
            <!-- Thumbnail Item Skin Begin -->
            <div data-u="slides" style="cursor: default; height:500px; ">
                <div data-u="prototype" class="p">
                    <div data-u="thumbnailtemplate" class="tp"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora02l" style="top:0px;left:8px;width:55px;height:55px; " data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora02r" style="top:0px;right:8px;width:55px;height:55px; " data-autocenter="2"></span>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
    <!-- #endregion Jssor Slider End -->
</body>
		
<!-- 		<section id="signin_main"> -->
		
     
<!-- 		 <form  ng-submit="add();" class="navbar-form navbar-right" style="margin-right:-40px!important" role="form" > -->
<!-- 		  <div  class="row" >  -->
<!--                <div margin-right="0px"> -->
                   
<!--  									<div align="center">		 -->
<!-- 									<div class="input-group">  -->
<!-- 										 <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
<!-- 												<input type="text" id="username"  -->
<!-- 												style="background-color: #EEECF5; color: #212121"  -->
<!-- 													class="form-control" placeholder="Username"  -->
<!-- 													required="required" autofocus> </div> -->
<!-- 										<div class="input-group">  -->
<!-- 										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> -->
<!-- 													<input type="password"  -->
<!-- 													style="background-color: #EEECF5; color: #212121"  -->
<!-- 												id="password" class="form-control" placeholder="Password"  -->
<!-- 													required="required"> -->
<!-- 											</div>  -->
<!--                  <div class="input-group">    <button id="signIn_1" type="submit" class="btn btn-block buttoncolor"><strong><font  style="color: white; font-weight: bolder; font-size: 12px;">SIGN IN</font></strong></button></div> -->
                    
<!--  									<div class="input-group"> -->
											
<!-- 												<div class="col-xs-7" style="width:100%;!important"> <i class="fa fa-unlock-alt"></i> -->
<!-- 													<a href="" id="forgot_from_1" ng-click="showforget()">  -->
<!--                                                    <font color="white" >Forgot password?</font></a> -->
<!--  												</div>	</div> -->
<!--  												<div  class="alert" style="text-align: center;"  id="invalidpass" hidden>  -->
<!-- 												<a href="#"  -->
<!-- 													>&times;</a> <font color="red"> <strong>Warning!</strong>  -->
<!-- 												Invalid Username and Password!. -->
<!-- 												</font>  -->
<!--  									</div>	 -->
<!--  									</div> -->
<!--  									</div></div> -->
<!--                 </form> -->
<!-- 	</section> -->


    
    


<div id="login" class="modalDialog">


<section id="signin_main" class="authenty signin-main">
	<div class="">	
		<div class="wrap">
			<div class="container">
						<div class="form-wrap">
							<div class="row">
								<div id="form_1">
									<form ng-submit="add();">
										<div class="form-header" style="background-color: #bcb6b4;margin-top:150px;">

											<div style="text-align: left; margin-left:50px;">
												<Strong><font
													style="color: black; font-weight: bolder; font-size: 24px;">
														<b>Login</b></font></Strong>
												<a href="#close" title="Close" style="text-align: right; margin-left: 200px;font-size: 24px">X</a>
											</div>
											
											
											
										</div>
										<div class="form-main" style="background-color: white">
											<div class="form-group">
												<input type="text" id="username"
													style="background-color: #EEECF5; color: #212121"
													class="form-control" placeholder="Username"
													required="required" autofocus> <input type="password"
													style="background-color: #EEECF5; color: #212121"
													id="password" class="form-control" placeholder="Password"
													required="required">
											</div>
											<button id="signIn_1" type="submit"
												class="btn btn-block buttoncolor">
												<font color="white">Sign In</font>
											</button>
											<div class="alert " style="text-align: center;"
												id="invalidpass" hidden>
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a> <font color="red"> 
													<strong>Warning!</strong>
													Check Username and Password!.
												</font>
											</div>
										</div>

										<div class="form-footer" style="background-color: #bcb6b4;">
											<div class="row">
												<div class="col-xs-7">
												
													<a href="" id="forgot_from_1" ng-click="showforget()">
													<font
														color="black">Forgot password?</font></a>
												</div>

											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
	</div>
			</div>
		</section>

		<section id="forgetpass" class="authenty signin-main" hidden>
			<div class="">
				<div class="wrap">
					<div class="container">
						<div class="form-wrap">
							<div class="row">
								<div id="form_1">
									<div class="form-header" style="background-color: #bcb6b4">
										<h3>
											<i class="fa fa-lock" style="color: white"></i>
										</h3>
										<p>
											<font color="black"><b>You can reset your password here. </b></font>
										</p>
									</div>
									<div class="form-main" style="background-color: white">
										<div class="panel-body" id="forgotdiv">
											<form id="forgeotform">
												<div class="form-group">
													<input placeholder="Username"
														style="background-color: #EEECF5; color: #779ECB"
														id="forgotuser" class="form-control" required=""
														type="text"> <input
														placeholder="email address/Mobile No"
														style="background-color: #EEECF5; color: #779ECB"
														id="email-phone" class="form-control" required=""
														type="text">
												</div>
												<div class="form-group">
													<button class="btn btn-block buttoncolor"
														value="Request passwordr" ng-click="getDetails();"
														type="submit">
														<font color="white">Request Password</font>
													</button>
												</div>
											</form>

											<div class="alert alert-danger" id="wrongid" hidden>
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a><font color="red"> <strong>Warning!</strong>
												Wrong Credentials!</font>
											</div>




											<div class="alert alert-info" id="emailcheck" hidden>
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a> <strong>Info!</strong>Check
												Your Gmail For Further Process Please!
											</div>
										</div>

										<div id="showotp" hidden>
											<div class="form-group">
												<input placeholder="otp"
													style="background-color: #EEECF5; color: #779ECB" id="otp"
													class="form-control" type="text"> <br>
												<button class="btn btn-block buttoncolor"
													ng-click="verifyotp();">Verify Otp</button>
											</div>
										</div>


										<div id="changepassdiv" hidden>
											<div class="form-group">
												<input style="background-color: #EEECF5; color: #779ECB"
													placeholder="password" id="password2" class="form-control"
													type="text">
											</div>
											<div class="form-group">
												<input style="background-color: #EEECF5; color: #779ECB"
													placeholder="confirm password" id="confirmpassword"
													class="form-control" type="text">
											</div>
											<div class="form-group">
												<button class="btn btn-block buttoncolor"
													value="Reset Password" ng-click="resetPassword();"
													type="submit">Reset Password</button>
											</div>
											<div class="form-group" id="notmatch" hidden>
												<div class="alert " style="text-align: center;">
													<a href="#" class="close" data-dismiss="alert"
														aria-label="close">&times;</a> <font color="red"><strong>Warning!</strong>
														Password and Confirm Password Not Match!.</font>
												</div>
											</div>


											<div class="form-group" id="successbox" hidden>
												<div class="alert alert-success">
													<a href="#" class="close" data-dismiss="alert"
														aria-label="close">&times;</a> <strong>Success!</strong>
													Your Password Is successfully changed!
												</div>
											</div>



										</div>



									</div>
									<div class="form-footer" style="background-color:#bcb6b4">
										<div class="row">
											<div class="col-xs-7" style="text-align: right">
												<!-- 													<i class="fa fa-unlock-alt"></i> -->
												<a type="button" class="btn btn-link"
													ng-click='showbacklogin();'><font color="black"
													style="font-weight: bold">Back</font></a>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>	
		</div>
		<section>
		<div id="footer" style="background: #181837;">
			<div  class="col-sm-4 col-lg-12">
				<div   class="col-sm-4">
				<font color="white">Designed And Developed By Rosmerta Technologies Ltd.</font>
 </div>
<div class="col-sm-8" style="text-align:right">
<font color="white">&#169;2016. All Rights Reserved ORSAC.</font>

				</div>
					
			</div>
			<a href="" id="scroll" class="os-back-to-top" style="display: block;" hidden="true"></a>
			</div>
		</section>
	
 
	</section>


	<!-- js library -->

	<script src="resources/assets/newlogin/jquery.min.js"></script>
<!-- 	<script src="resources/assets/newlogin/jquery-ui.min.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/bootstrap.min.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/jquery.icheck.min.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/waypoints.min.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/authenty.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/jquery.malihu.PageScroll2id.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/jquery.address-1.6.min.js"></script> -->
<!-- 	<script src="resources/assets/newlogin/scrollTo.min.js"></script> -->
	<%--    	<script src="src/main/webappresources/assets/newlogin/init.js"></script> --%>


	<!-- preview scripts -->
	<script>
			(function($) {
				
				// get full window size
				$(window).on('load resize', function(){
				    var w = $(window).width();
				    var h = $(window).height();

				    $('section').height(h);
				});		

				// scrollTo plugin
				$('#signup_from_1').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_1').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#signup_from_2').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_2').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_3').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				
				
				// set focus on input
				var firstInput = $('section').find('input[type=text], input[type=email]').filter(':visible:first');
        
				if (firstInput != null) {
            firstInput.focus();
        }
				
				$('section').waypoint(function (direction) {
					var target = $(this).find('input[type=text], input[type=email]').filter(':visible:first');
					target.focus();
				}, {
	          offset: 300
	      }).waypoint(function (direction) {
					var target = $(this).find('input[type=text], input[type=email]').filter(':visible:first');
			  	target.focus();
	      }, {
	          offset: -400
	      });
				
				
				// animation handler
				$('[data-animation-delay]').each(function () {
	          var animationDelay = $(this).data("animation-delay");
	          $(this).css({
	              "-webkit-animation-delay": animationDelay,
	              "-moz-animation-delay": animationDelay,
	              "-o-animation-delay": animationDelay,
	              "-ms-animation-delay": animationDelay,
	              "animation-delay": animationDelay
	          });
	      });
				
	      $('[data-animation]').waypoint(function (direction) {
	          if (direction == "down") {
	              $(this).addClass("animated " + $(this).data("animation"));
	          }
	      }, {
	          offset: '90%'
	      }).waypoint(function (direction) {
	          if (direction == "up") {
	              $(this).removeClass("animated " + $(this).data("animation"));
	          }
	      }, {
	          offset: '100%'
	      });
			
			})(jQuery);
			
			
		
		</script>
</body>

    
    <style>

    </style>
</html>


