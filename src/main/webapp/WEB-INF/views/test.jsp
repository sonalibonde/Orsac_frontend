<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="scotchApp">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex, nofollow">
<link rel="stylesheet" type="text/css" href="resources/mainjavascript/loginpagescript/bootstrap.min.css">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.1.1/angular.min.js"></script>
<title>AngularJS Simple Router Example by cmckeachie</title>

<script type='text/javascript'>//<![CDATA[
var key = "${key}";
var sptstr = key.split("&&");
var mydate = new Date(sptstr[5]);
 var scotchApp = angular.module('scotchApp', []);

 scotchApp.config(function ($routeProvider) {
    $routeProvider.
    when('/home', {
		templateUrl : 'dashboard',
		controller  : 'dashController'
	}).	when('/admindash', {
		templateUrl : 'admindash',
		controller  : 'dasboardctrlnew'

	})
	.when('/LiveSummary', {
		templateUrl : 'LiveSummary',
		controller  : 'dashController'
	})
	.when('/CompanyFormUpdate', {
		templateUrl : 'companyupdate',
		controller  : 'companyController'
	})
	.when('/CompanyFormInsert', {
		templateUrl : 'companyinsert',
		controller  : 'companyController'
	}).
	when('/DeviceFormUpdate', {
		templateUrl : 'deviceupdate',
		controller  : 'DeviceCtrl'
	}).
	when('/DeviceFormInsert', {
		templateUrl : 'deviceinsert',
		controller  : 'DeviceCtrl'
	}).
	when('/SimFormInsert', {
		templateUrl : 'siminsert',
		controller  : 'SimCtrl'
	}).
	when('/SimFormUpdate', {
		templateUrl : 'simupdate',
		controller  : 'SimCtrl'
	}).
	when('/SimAssignFormInsert', {
		templateUrl : 'simassigninsert',
		controller  : 'SimAssignCtrl'
	}).
	when('/SimAssignFormUpdate', {
		templateUrl : 'simassignupdate',
		controller  : 'SimAssignCtrl'
	}).
	when('/mapall', {
		templateUrl : 'mapall',
		controller  : 'MapCtrl'
	}).
	when('/livevehicle', {
		templateUrl : 'livevehicle',
		controller  : 'mainController'
	}).
	when('/DeviceAssignFormUpdate', {
		templateUrl : 'deviceassignupdate',
		controller  : 'DeviceAssignCtrl'
	}).
	when('/DeviceAssignFormInsert', {
		templateUrl : 'deviceassigninsert',
		controller  : 'DeviceAssignCtrl'
	}).when('/VehicleFormUpdate', {
		templateUrl : 'VehicleFormUpdate',
		controller  : 'VehicleCtrl'
	}).when('/VehicleFormInsert', {
		templateUrl : 'VehicleFormInsert',
		controller  : 'VehicleCtrl'
	}).when('/MakeFormUpdate', {
		templateUrl : 'MakeFormUpdate',
		controller  : 'MakeCtrl'
	})
	.when('/MakeFormInsert', {
		templateUrl : 'MakeFormInsert',
		controller  : 'MakeCtrl'
	})
	.when('/UserFormUpdate', {
		templateUrl : 'UserFormUpdate',
		controller  : 'userCtrl'
	}).when('/UserFormInsert', {
		templateUrl : 'UserFormInsert',
		controller  : 'userCtrl'
	})
	.when('/DealerFormUpdate', {
		templateUrl : 'DealerFormUpdate',
		controller  : 'dealerCtrl'
	})
	.when('/DealerFormInsert', {
		templateUrl : 'DealerFormInsert',
		controller  : 'dealerCtrl'
	})
	.when('/NetworkFormUpdate', {
		templateUrl : 'NetworkFormUpdate',
		controller  : 'netCtrl'
	})
	.when('/NetworkFormInsert', {
		templateUrl : 'NetworkFormInsert',
		controller  : 'netCtrl'
	})
	.when('/ModelFormUpdate', {
		templateUrl : 'ModelFormUpdate',
		controller  : 'modelCtrl'
	})
	.when('/ModelFormInsert', {
		templateUrl : 'ModelFormInsert',
		controller  : 'modelCtrl'
	})
	.when('/VendorFormUpdate', {
		templateUrl : 'VendorFormUpdate',
		controller  : 'vendorCtrl'
	})
	.when('/VendorFormInsert', {
		templateUrl : 'VendorFormInsert',
		controller  : 'vendorCtrl'
	}).
	when('/RoleFormUpdate', {
		templateUrl : 'RoleFormUpdate',
		controller  : 'roleController'
	})
	.when('/RoleFormInsert', {
		templateUrl : 'RoleFormInsert',
		controller  : 'roleController'
	}).
	when('/MenuassignFormUpdate', {
		templateUrl : 'MenuassignFormUpdate',
		controller  : 'menuassignController'
	})
	.when('/MenuassignFormInsert', {
		templateUrl : 'MenuassignFormInsert',
		controller  : 'menuassignController'
	})
	.when('/AssetFormUpdate', {
		templateUrl : 'AssetFormUpdate',
		controller  : 'assetController'
	})
	.when('/AssetFormInsert', {
		templateUrl : 'AssetFormInsert',
		controller  : 'assetController'
	})
	.when('/CustomerMasterFormUpdate', {
		templateUrl : 'CustomerMasterFormUpdate',
		controller  : 'customerCtrl'
	}).when('/CustomerMasterFormInsert', {
		templateUrl : 'CustomerMasterFormInsert',
		controller  : 'customerCtrl'
	}).
	when('/MenuFormUpdate', {
		templateUrl : 'MenuFormUpdate',
		controller  : 'menuCtrl'
	}).when('/MenuFormInsert', {
		templateUrl : 'MenuFormInsert',
		controller  : 'menuCtrl'
	}).
	when('/DealerAssignFormInsert', {
		templateUrl : 'DealerAssignFormInsert',
		controller  : 'dealerassignCtrl'
	})
	.when('/DealerAssignFormUpdate', {
		templateUrl : 'DealerAssignFormUpdate',
		controller  : 'dealerassignCtrl'
	}).when('/report', {
		templateUrl : 'report',
		controller  : 'reportCtrl'
	}).when('/response', {
		templateUrl : 'response',
		controller  : 'responseCtrl'
	}).when('/vehiclesummaryreport', {
		templateUrl : 'vehiclesummaryreport',
		controller  : 'vehiclesummaryCtrl'
	}).when('/RawData', {
	templateUrl : 'RawData',
	controller  : 'rawdataCtrl'
		
	}).when('/CustomerAssignFormInsert', {
	templateUrl : 'CustomerAssignFormInsert',
	controller  : 'customerassignCtrl'
	
	}).when('/CustomerAssignFormUpdate', {
	templateUrl : 'CustomerAssignFormUpdate',
	controller  : 'customerassignCtrl'
	
	})
	.when('/forgot', {
	templateUrl : 'forgot',
	controller  : 'foraCtrl'
	
	})
	.when('/DealerDashboard', {
	templateUrl : 'DealerDashboard',
	controller  : 'dealerdasboardctrl'
	
	})
	.when('/DayWiseAllvehiclesReport', {
	templateUrl : 'DayWiseAllvehiclesReport',
	controller  : 'daywiseAllvehicleCtrl'
	
	}).	when('/geofencereport', {
	templateUrl : 'geofencereport',
	controller  : 'geofencesummaryCtrl'
	
	}).	when('/Dealerdashnew', {
	templateUrl : 'Dealerdashnew',
	controller  : 'dealerdasboardctrl'
	
	}).	when('/bangloreimei', {
	templateUrl : 'bangloreimei',
	controller  : 'bangalorectrl'
	
	}).	when('/historylogs', {
	templateUrl : 'historylogs',
	controller  : 'historyCtrl'
	
	}).	when('/IdlehourReport', {
	templateUrl : 'IdlehourReport',
	controller  : 'idlehoursCtrl'
	
	}).	when('/OverspeedReport', {
	templateUrl : 'OverspeedReport',
	controller  : 'overspeedctrl'
	
	})
});
//]]> 
 </script>
	
	<script src="resources/pagescripts/dealerdashboard2.js"></script>
	
	
	
	

	<script>
	
	
	scotchApp.controller('mainController', function($scope,$http, $compile, $filter,$location) {
		$scope.loginid = sptstr[2];
		$scope.roleid = sptstr[6];
		if($scope.roleid=='1002'){
		 $location.path('/Dealerdashnew');
		}else if($scope.roleid=='1003'){
			 $location.path('/home');
		}else if($scope.roleid=='1004'){
			 $location.path('/admindash');
		}
		

				
//		    //mydate = new Date();

			$scope.compname=sptstr[3];
			$scope.query = {}
		   		$scope.queryBy = '$'
			$scope.sort = function(keyname) {
				$scope.sortKey = keyname; //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
			
			$scope.pagesno = [20,50,80,100,120];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}
			
			$scope.name = sptstr[0];
			$scope.logout = function() {
				window.location.replace("Logout");
			}
			if(sptstr[4]=='0'){

				$http.get('http://elocator.in/webservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menus = data;
			}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
				});
			}
			else{

				$http.get('http://elocator.in/webservice/rest/CallService/menudalletails?companyid='+sptstr[1]+'&roleid='+sptstr[sptstr.length-2])
				.success(function(data, status, headers, config) {
					$scope.menus = data;
			}).error(function(data, status, headers, config) {

					console.log('error: data = ', data);
				});
			}
			$scope.showDiv = function() {
				$scope.showhideprop = true;
			}

		});


	
	
</script>


</head>

<body ng-controller="mainController" style="overflow:auto; margin:0;">
<div id="load"></div>
<div id="contents">
    <div id="navbar" class="navbar navbar-default navbar-fixed-top"  style="background: #52417F;">
			

			<div class="navbar-container" id="navbar-container" >
				<button type="button" class="navbar-toggle menu-toggler pull-left"
					id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left" style="padding-left:0px;">
					<a class="navbar-brand">
					 <small> 
<%-- 					     <img style="border: 0; padding-left:0px;" src="resources/images/indtrack-3_01.gif" height="50px" width="170px"></h2> --%>
					 
					    <img style="border: 0; padding-left:0px;"  src="resources/assets/images/logonew.png" height="50px" width="60px">
					   <!-- <font>Vehicle Tracking System</font> -->
					</small>
					</a>
				</div>
				<div class="navbar-buttons navbar-header pull-right"
					role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li  style="text-decoration: none; ">
						<a><i class=""></i>
<%-- 		  <img style="border: 0; padding-left:0px;" src="resources/images/activeuser1.png"></h2>  --%>
								 <font color="white"> Welcome: {{name}}</font>
						</a></li>
					
						<li><a 	 title="Log Out" href="Logout" ng-click="logout()" >
<!-- 						 <i	class="fa fa-power-off"></i>  -->
  <img style="border: 0; padding-left:0px;" src="resources/assets/images/loout1.png"></h2> 
								
								<font color="white">Logout</font>
						</a></li>
					</ul>
				</div>
			</div>
			<!-- /.navbar-container     #C9D3DF -->
		</div>
<div class="main-container" id="main-container" style="margin-top:19px;">
<!-- 			<div id="sidebar" class="sidebar responsive" style="background: #EEEEEE;"> -->
				<div id="sidebar" class="sidebar responsive" style="background-color:#C9D3DF">
			<ul class="nav nav-list">
			
				<li ng-if="roleid=='1002'"  ><a href="#/Dealerdashnew" > <i
							class="menu-icon fa fa-tachometer" style="color: black"></i> <span
							class="menu-text"> 
							<font color="black" style="font-size: 15px;">DashBoard </font></span>
					</a></li>
				<li ng-if="roleid=='1003'"  ><a href="#/home" > <i
							class="menu-icon fa fa-tachometer" style="color: black"></i> <span
							class="menu-text"> 
							<font color="black" style="font-size: 15px;">DashBoard </font></span>
					</a></li> 
					
					<li ng-if="roleid=='1004'"  ><a href="#/admindash" > <i
							class="menu-icon fa fa-tachometer" style="color: black"></i> <span
							class="menu-text"> 
							<font color="black" style="font-size: 15px;">DashBoard </font></span>
					</a></li>
					
					<li ng-if="loginid=='10002'"  ><a href="#/bangloreimei" > <i
							class="menu-icon fa fa-tachometer" style="color: black"></i> <span
							class="menu-text"> 
							<font color="black" style="font-size: 15px;">Check Data </font></span>
					</a></li>
					<li ng-repeat="x in menus | filter:{parentid: '11'}|orderBy:'orderno'"  >
						<a href="{{x.navigateurl}}" class="dropdown-toggle"> <i
								class="menu-icon fa {{x.description}}" style="color: black"></i> <span
								class="menu-text" > <font
									color="black" style="font-size: 15px;">{{x.menutext}}</font> </span> <b class="arrow fa fa-angle-down"></b>
						</a> <b class="arrow"></b>
						<ul class="submenu">
							<li ng-repeat="y in menus | filter:{parentid: x.menuid}|orderBy:'orderno'" 
							style="background: #8B9BAC;">
							<a href="{{y.navigateurl}}"> <i
									class="menu-icon fa fa-caret-right"></i> 
									<font color="Black" style="font-size: 13px;">{{y.menutext}}
										</font>
							</a> <b class="arrow"></b></li>
						</ul>
					</li>
				</ul>

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left"
						data-icon1="ace-icon fa fa-angle-double-left"
						data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>
			<div id="pagecontent" class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
<!-- 				<div class="page-header navbar-fixed"> -->
				
<!-- 				<a><font>Dashboard</font></a> -->
<!-- 				<a><font>Track On map</font></a>	 -->
						
<!-- 				</div> -->
<!-- 						ng-view     -->
						<ng-view>Loading...</ng-view>
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
			</div>
		<!-- Inline Templates (Partials) -->


  </div>
</body>
<style>
.loader{
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
    opacity: 0.5;
    filter: alpha(opacity=80);
	background-color:white;
    background:url('resources/assets/images/Preloader_7.gif') no-repeat center center rgba(0,0,0,0.25)
}
#loading {
    width: 50px;
    height: 57px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -28px 0 0 -25px;
}


	#footer {
 
    position: fixed;
 
    height: 25px;
 
    bottom: 0;
 
    width: 100%;
 
}

.nav .open > a, .nav .open > a:hover
{
/* background-color: rgb(130,191,86); */
background: #9A95BC;

}


.nav-list > li .submenu > li > a:active
{
background-color: red;
}

.nav-list > li .submenu > li > a:hover 
{
background-color: white;
}
.nav-list > li .submenu > li > a:focus {
    
/*     background-color: rgb(82,65,127); */
/* background-color: rgb(52,152,219); */
/* background: #9A95BC; */
background-color: #D3E057;
}


.nav-list > li .submenu > li > a {background-color: #C9D3DF;}


.nav > li > a:focus, .nav > li > a:hover 
{
background: #9A95BC;
}

#popover_content_wrapper,#solddevice,#availableDevice,#dealercustomer
{ padding: 10px;
    position: absolute;
    width: 300px;
    height: 290px;
    background-color: white;
     border-radius: 5px 5px 5px 5px; 
    -moz-border-radius: 5px 5px 5px 5px; 
    -webkit-border-radius: 5px 5px 5px 5px;
    margin-top: 20px;
    margin-left: 300px;

    -moz-box-shadow: 3px 3px 4px #000;
    -webkit-box-shadow: 3px 3px 4px #000;
    box-shadow: 3px 3px 4px #000;
}
	
.panel-heading 
	{
	height:32px;
	
	}
	#dealerlabel
	{
	background-color: #52417F;
	text-align: justify;
	padding-top: 0px;
	}

.nav .open > a, .nav .open > a:focus, .nav .open > a:hover
{
 background: #9A95BC; 

}

.popover-title{
   background-color: #52417F;
   color:white;
}


@-webkit-keyframes blink {
    0% {
        opacity:1;
    }
    50% {
        opacity:0;
    }
    100% {
        opacity:1;
    }
}
@-moz-keyframes blink {
    0% {
        opacity:1;
    }
    50% {
        opacity:0;
    }
    100% {
        opacity:1;
    }
}
.objblink {
-webkit-transition: all 1s ease-in-out;
    -moz-transition: all 1s ease-in-out;
    -o-transition: all 1s ease-in-out;
    -ms-transition: all 1s ease-in-out;
    transition: all 1s ease-in-out;
    
    -webkit-animation-direction: normal;
    -webkit-animation-duration: 0.5s;
    -webkit-animation-iteration-count: infinite;
    -webkit-animation-name: blink;
    -webkit-animation-timing-function: ease-in-out;
    
-moz-animation-direction: normal;
    -moz-animation-duration: 0.5s;
    -moz-animation-iteration-count: infinite;
    -moz-animation-name: blink;
    -moz-animation-timing-function: ease-in-out;    
}


	 </style>
	 
<style>

.modal-box {
  display: none;
  position: absolute;
  z-index: 1000;
  width: 98%;
  background: white;
  border-bottom: 1px solid #aaa;
  border-radius: 4px;
  box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  border: 1px solid rgba(0, 0, 0, 0.1);
  background-clip: padding-box;
}
@media (min-width: 32em) {

.modal-box { width: 70%; }
}

.modal-box header,
.modal-box .modal-header {
/*   padding: 1.25em 1.5em;  */
  border-bottom: 1px solid #ddd;
}

/* .modal-box header h3, */
/* .modal-box header h4, */
/* .modal-box .modal-header h3, */
/* .modal-box .modal-header h4 { margin: 0; } */

.modal-box .modal-body { 
/* padding: 2em 1.5em; */
 }

.modal-box footer,
.modal-box .modal-footer {
/*   padding: 1em; */
  border-top: 1px solid #ddd;
  background: rgba(0, 0, 0, 0.02);
  text-align: right;
}

.modal-overlay {
  opacity: 0;
  filter: alpha(opacity=0);
  position: absolute;
  top: 0;
  left: 0;
  z-index: 900;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.3) !important;
}

a.close {
  line-height: 1;
  font-size: 1.5em;
  position: absolute;
  top: 5%;
  right: 2%;
  text-decoration: none;
  color: #bbb;
}

a.close:hover {
  color: #222;
  -webkit-transition: color 1s ease;
  -moz-transition: color 1s ease;
  transition: color 1s ease;
}
</style>

</html>
