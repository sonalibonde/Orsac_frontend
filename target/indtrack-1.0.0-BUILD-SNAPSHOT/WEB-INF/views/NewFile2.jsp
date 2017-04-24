<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<!-- define angular app -->
<html lang="en" ng-app="scotchApp">

<head>
  <!-- SCROLLS -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular-route.js"></script>
  <script src="http://code.ciphertrick.com/demo/search-sort-pagination/lib/dirPagination.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/css/datepicker.css"/>">
<script src="<c:url value="https://code.jquery.com/ui/1.10.3/jquery-ui.js"/>"></script>
		<script src="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"/>"></script>
		<script type='text/javascript' src="<c:url value="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
		<script src="<c:url value="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.10.0/ui-bootstrap-tpls.js"/>"></script>
  <script src="<c:url value="https://code.highcharts.com/highcharts.js"/>"></script>
<script src="<c:url value="https://code.highcharts.com/highcharts-3d.js"/>"></script>
<script src="<c:url value="https://code.highcharts.com/modules/exporting.js"/>"></script>
<link rel="stylesheet" href="<c:url value="resources/assets/fonts/fonts.googleapis.com.css" />" />
<link rel="stylesheet" href="<c:url value="resources/assets/font-awesome/4.2.0/css/font-awesome.min.css" />" />
<link rel="stylesheet" href="<c:url value="resources/assets/css/ace.min.css" />" class="ace-main-stylesheet" id="main-ace-style" />
<!-- 3d bar -->
<script src="<c:url value="https://code.highcharts.com/highcharts.js"/>"></script>
<script src="<c:url value="https://code.highcharts.com/highcharts-3d.js"/>"></script>
<script src="<c:url value="https://code.highcharts.com/modules/exporting.js"/>"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href="<c:url value="resources/css/alert.css"/>" />

<!-- alertjs -->

<title>Vehicle Tracking System</title>
<style>
#container1, #sliders1 {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto;
}

#container1 {
	height: 400px;
}

.nav .open > a, .nav .open > a:hover, .nav .open > a:focus
{
/*  background-color: black;  */
 background: -moz-linear-gradient(45deg, rgba(192,192,192,1) 0%, rgba(255,255,255,1) 50%, rgba(128,128,128,1) 100%); 
}

.nav-list > li .submenu > li > a:focus {
    
    background-color: red;
}



</style>
	<script src="<c:url value="resources/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="resources/assets/js/ace-elements.min.js" />"></script>
	<script src="<c:url value="resources/assets/js/ace.min.js" />"></script>
  <script>
	// create the module and name it scotchApp
	
	try{
	$(document).ready(function() {
						  function setHeight() {
						    windowHeight = $(window).innerHeight();
						    $('.main-container').css('min-height', windowHeight);
						    $('#pagecontent').css('min-height', '900px');
						  };
						  setHeight();
						  
						  $(window).resize(function() {
						    setHeight();
						  });
						});
	
	
	   $(document).ready(function() {
		  $('[data-toggle=offcanvas]').click(function() {
		    $('.row-offcanvas').toggleClass('active');
		  });
		});
	
	   var key = "${key}";
		var sptstr = key.split("&&");
		
		jQuery(function($) {
			 
			  
			  // /////
			  // CLEARABLE INPUT
			  function tog(v){return v?'addClass':'removeClass';} 
			  $(document).on('input', '.clearable', function(){
			    $(this)[tog(this.value)]('x');
			  }).on('mousemove', '.x', function( e ){
			    $(this)[tog(this.offsetWidth-18 < e.clientX-this.getBoundingClientRect().left)]('onX');   
			  }).on('touchstart click', '.onX', function( ev ){
			    ev.preventDefault();
			    $(this).removeClass('x onX').val('').change();
			  });
			  
			  
			});
		
		



		function PhoneValidation(ob) {
		  		var invalidChars = /[^0-9]/gi;
		 		 if(invalidChars.test(ob.value)) {
// 		 			document.getElementById('phonevalidmsg').hidden=false;
					document.getElementById('idmsg').hidden=false;
				 	ob.value = ob.value.replace(invalidChars,"");
				 	
				 	return false;
			  }
				}
		function lengthValidation(obj)
		{
	  		var number = (obj.value).length;
			
			if(number<10) {
// 	 			document.getElementById('phonenolength').hidden=false;

				document.getElementById('length').hidden=false;
	 		 	obj.value = ob.value.replace(number,"");
	
	    	 	}
			}
		
		
		
	var scotchApp = angular.module('scotchApp', ['ngRoute','angularUtils.directives.dirPagination']);
	// configure our routes
	scotchApp.config(function($routeProvider) {
		$routeProvider

			// route for the home page
			.when('/', {
				templateUrl : 'dashboard',
				controller  : 'mainController'
			})
			.when('/LiveSummary', {
				templateUrl : 'LiveSummary',
				controller  : 'mainController'
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
			}).
			otherwise({
				redirectTo : '/'
			});
	});

	// create the controller and inject Angular's $scope   
	

	scotchApp.controller('MapCtrl', function($scope,$http, $compile, $filter) {
		// create a message to display in our view
		
		$scope.query = {}
	   		$scope.queryBy = '$'
		$scope.sort = function(keyname) {
			$scope.sortKey = keyname; //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
	});
	
	scotchApp.controller('mainController', function($scope,$http, $compile, $filter) {
		// create a message to display in our view
		
		$scope.query = {}
	   		$scope.queryBy = '$'
		$scope.sort = function(keyname) {
			$scope.sortKey = keyname; //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		$scope.pagesno = [5,10,50,100,150,200];
		$scope.pagesint=5;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		
		$scope.name = sptstr[0];
		$scope.logout = function() {
			window.location.replace("Logout");
		}
		if(sptstr[4]=='0'){
// 		alert("in if");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-1]+'&parentid='+sptstr[4])
			.success(function(data, status, headers, config) {
				$scope.menus = data;
//					alert(data);

			}).error(function(data, status, headers, config) {
// 				alert(data);
				console.log('error: data = ', data);
			});
		
		}
		else{
// 			alert("in else"+sptstr[4]);
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[4])
			.success(function(data, status, headers, config) {
				$scope.menus = data;
// 					alert(data);

			}).error(function(data, status, headers, config) {
// 				alert("error"+data);
				console.log('error: data = ', data);
			});
		}
		try {

			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1])
					.success(
							function(data, status, headers, config) {
								$scope.users = data;

								$scope.speed = data[0].vehiclespeed;
								//alert("in success"+data);
								
								// 				          alert("speed in red"+ $scope.red+" "+ $scope.yellow+" "+ $scope.green);
								// 				         piechart

								


								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1])
										.success(
												function(data, status, headers,
														config) {
													$scope.ignitionoff = data.ignitionoff;
													$scope.ignitionon = data.ignitionon;
													$scope.validgps = data.validgps;
													$scope.invalidgps = data.invalidgps;
													$scope.totald = data.totalVehicles;
													$scope.working_devices = data.working_devices;
													$scope.not_working_devices = data.not_working_devices;
													$scope.red = data.red;
													$scope.green = data.green;
													$scope.yellow = data.yellow;
													
													
													$(function() {
														//alert("in pie");
														$('#3dpie')
																.highcharts(
																		{
																			colors : [ "orange",
																					"Green", "red" ],
																			chart : {
																				type : 'pie',
																				options3d : {
																					enabled : true,
																					legend : [
																							'Live Vehicle with Speed Zero',
																							'Live Running Vehicle',
																							'Stopped Vehicle' ],
																					alpha : 45,
																					beta : 0
																				}
																			},
																			title : {
																				text : 'Vehicle Statistics'
																			},
																			tooltip : {
																				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>',
																				backgroundColor : 'rgba(219,219,216,0.8)',
																			},
																			// 						            legend: {
																			// 						                itemStyle: {
																			// 						                	text:['Live Vehicle with Speed Zero', 'Live Running Vehicle', 'Stopped Vehicle'],
																			// 						                   fontWeight: 'bold',
																			// 						                   fontSize: '13px'
																			// 						                }
																			// 						             },
																			plotOptions : {
																				pie : {
																					allowPointSelect : true,
																					cursor : 'pointer',
																					depth : 35,
																					dataLabels : {
																						enabled : true,
																						format : '{point.name}'
																					}

																				}
																			},
																			series : [ {
																				type : 'pie',
																				//name: 'Browser share',
																				data : [
																						[
																								'Live Vehicle with Speed Zero',
																								$scope.yellow ],
																						[
																								'Live Running Vehicle ',
																								$scope.green ],
																						// 						                    {
																						// 						                        name: 'Chrome',
																						// 						                        y: 12.8,
																						// 						                        sliced: true,
																						// 						                        selected: true
																						// 						                    },
																						// 						                    ['Safari', 8.5],
																						// 						                    ['Opera', 6.2],
																						[
																								'Stopped Vehicle',
																								$scope.red ] ]
																			} ]
																		});
													});
													
													
													
													
													
													$(function() {
														// Set up the chart
														var chart = new Highcharts.Chart(
																{
																	colors : [
																			"Green",
																			"red" ],
																	chart : {
																		renderTo : 'container1',
																		type : 'column',
																		margin : 75,
																		options3d : {
																			enabled : true,
																			alpha : 15,
																			beta : 15,
																			depth : 50,
																			viewDistance : 25
																		}
																	},
																	title : {
																		text : 'Device Statistics'
																	},
																	yAxis : {
																		allowDecimals : false,
																		// 		    					            min: 0,
																		title : {
																			text : 'Devices'
																		}
																	},
																	//		    				         subtitle: {
																	//		    				             text: 'Test options by dragging the sliders below'
																	//		    				         },
																	plotOptions : {
																		column : {
																			depth : 25
																		}
																	},
																	series : [

																			{
																				name : 'Working Devices',
																				data : [ $scope.working_devices ],
																				stack : 'male'
																			},
																			{
																				name : 'Non Working Devices',
																				data : [ $scope.not_working_devices ],
																				stack : 'male'
																			} ]
																});

														function showValues() {
															$('#R0-value')
																	.html(
																			chart.options.chart.options3d.alpha);
															$('#R1-value')
																	.html(
																			chart.options.chart.options3d.beta);
														}

														// Activate the sliders
														$('#R0')
																.on(
																		'change',
																		function() {
																			chart.options.chart.options3d.alpha = this.value;
																			showValues();
																			chart
																					.redraw(false);
																		});
														$('#R1')
																.on(
																		'change',
																		function() {
																			chart.options.chart.options3d.beta = this.value;
																			showValues();
																			chart
																					.redraw(false);
																		});

														showValues();
													});
												}).error(
												function(data, status, headers,
														config) {
													console.log(
															'error: data = ',
															data);
												});

								// simplebarchart

								// end of simple bar
								// wave
								// end of wave

							}).error(function(data, status, headers, config) {

						console.log('error: data = ', data);
					});

		} catch (e) {
			alert(e);

		}

		$scope.showmapdiv1 = function(user) {

			document.getElementById("mapframe").src = "http://localhost:8080/org1/map?lat="+user.latitude+"&longi="+user.longitude+"&speed="+user.vehiclespeed
														+"&vehicle="+user.vehicleid;
			document.getElementById("maptrack").hidden = false;
			document.getElementById("main").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("main").hidden = false;
			document.getElementById("maptrack").hidden = true;
		}
		
		
		$scope.showDiv = function() {
			$scope.showhideprop = true;
		}

	});

	scotchApp.controller('companyController', function($scope,$http, $compile, $filter) {
	try {
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		
	   		$scope.pagesno = [5,10,50,100,150,200];
			$scope.pagesint=5;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}
			
			$scope.deletecom = function(comp){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydelete?id='+comp.companyid)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.company = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
					document.getElementById("successmsg").hidden = false;
					

				}).error(function(data, status, headers, config) {
					document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
					document.getElementById("errorsmsg").hidden = false;
					console.log('error: data = ', data);
				});
			}
	   		
	   		
	   		
// 			Page.setTitle("Welcome");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.company = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});

		
			
			$scope.query = {}
			$scope.queryBy = '$'
			$scope.orderProp = "CompanyName";

			$scope.showcomdiv1 = function() {
				//alert("in");
				document.getElementById("showedit").hidden = false;
				document.getElementById("maincom").hidden = true;
			}
			$scope.back = function() {
				document.getElementById("maincom").hidden = false;
				document.getElementById("showedit").hidden = true;
			}

			$scope.companyData = function companyData(editname) {
				$scope.editcompanyy = editname;
				
			}

			$scope.companyinsert = function companyinsert() {
				
				var myForm = document.form1;
			      if (myForm.cname1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.cname1.focus();
			      }
			      else if (myForm.person1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.person1.focus();
			      }
			      else if (myForm.mobile1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.mobile1.focus();
			    	
			      }
			      
			      else if (myForm.cadd1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.cadd1.focus();
			    	
			      }
			    
			     else if (myForm.radd1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.radd1.focus();
			    	
			      }
			     else if (myForm.email1.value== "")
			      {
			    	// alert("company name not be empty");
			    	 myForm.email1.focus();
			    	
			      }
			   else
			   {
				     
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companyinsert?companyname='
										+ document.getElementById('cname1').value
										+ '&shortname='
										+ document.getElementById('sname1').value
										+ '&caddress='
										+ document.getElementById('cadd1').value
										+ '&personname='
										+ document.getElementById('person1').value
										+ '&landlin1='
										+ document.getElementById('landline1').value
										+ '&faxnumber='
										+ document.getElementById('fax1').value
										+ '&regisraddress='
										+ document.getElementById('radd1').value
										+ '&emailid='
										+ document.getElementById('email1').value
										+ '&remark='
										+ document.getElementById('rem1').value
										+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]).success(
								function(data, status, headers, config) {
// 									$scope.company1 = data;
// 									alert("Record Inserted Successfully");
// 									document.getElementById("succ").hidden = false;
									document.getElementById("successmsg").hidden = false;
									document.getElementById("infodiv").hidden = false;
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
											.success(function(data, status,
															headers, config) {
														$scope.company = data;
													})
											.error(
													function(data, status,
															headers, config) {
														console.log('error: data = ',data);
// 														alert("Record Not inserted");
														document.getElementById("errorsmsg").hidden = false;
													});
								}).error(
								function(data, status, headers, config) {
									alert(data);
									console.log('error: data = ', data);
								});
				   }
			}
		$scope.companyedit = function companyedit() {
					try
					{
					//alert("in edit");
					$scope.companydetails=$scope.company;
					//alert("$scope.companydetails"+$scope.companydetails);
					var i=0;
					//alert($scope.compid+" ");
					}catch(e){alert(e);}
					var myForm1 = document.form2;
				      if (myForm1.compname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.compname.focus();
				      }
				      else if (myForm1.personname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.personname.focus();
				      }
				      else if (myForm1.mobileno.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.mobileno.focus();
				    	
				      }
				      
				      else if (myForm1.caddress.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.caddress.focus();
				    	
				      }
				    
				     else if (myForm1.raddress.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.raddress.focus();
				    	
				      }
				     else if (myForm1.emailID.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm1.emailID.focus();
				    	
				      }
				   else
				   {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companyedit?companyid='+$scope.editcompanyy.companyid+'&companyname='+ document.getElementById('compname').value
					+ '&shortname='+ document.getElementById('shortname').value+ '&caddress='+ document.getElementById('caddress').value+ '&personname='+ document.getElementById('personname').value+ '&landlin1='+ document.getElementById('mobileno').value+ '&faxnumber='+ document.getElementById('faxno').value+ '&regisraddress='+ document.getElementById('raddress').value+ '&emailid='+ document.getElementById('emailID').value+ '&remark='+ document.getElementById('remark').value
					+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
												.success(function(data, status,	headers, config) {
														$scope.company = data;
															document.getElementById("maincom").hidden = false;
															document.getElementById("showedit").hidden = true;
															//alert("in afetr");
														})
												.error(function(data, status,headers, config) {
															console.log('error: data = ',data);
														});
// 										alert("Record Updated Successfully");
										document.getElementById("updatemsg").hidden = false;
									})
									.error(function(data, status, headers, config) {
										document.getElementById("errorsmsg").hidden = false;
										console.log('error: data = ', data);
									});
				}

	}
		} catch (e) {
			alert(e);
		}
	});
	
	
	scotchApp.controller('roleController', function($scope,$http, $compile, $filter) {
		try {
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [5,10,50,100,150,200];
				$scope.pagesint=5;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.deleterole = function(comp){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydelete?id='+comp.companyid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
							.success(function(data, status, headers, config) {
								$scope.company = data;

							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
						document.getElementById("successmsg").hidden = false;
						

					}).error(function(data, status, headers, config) {
						document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
						document.getElementById("errorsmsg").hidden = false;
						console.log('error: data = ', data);
					});
				}
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[1]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.roledet = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});

			
				
				$scope.query = {}
				$scope.queryBy = '$'
				$scope.orderProp = "CompanyName";

				$scope.showrolediv1 = function() {
					//alert("in");
					document.getElementById("roleedit").hidden = false;
					document.getElementById("rolemain").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("rolemain").hidden = false;
					document.getElementById("roleedit").hidden = true;
				}

				
//	 			$scope.msgdiv= function msgdiv() {
//	 				//alert("in");
//	 			document.getElementById("infodiv").hidden = false;
				
//	 			}
				
				$scope.roleData = function roleData(editname) {
					$scope.roleeditdet = editname;
					
				}

				$scope.roleinsertform = function roleinsertform() {
					var myForm = document.roleinsert;
				      if (myForm.rolenameinsert.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.rolenameinsert.focus();
				      }
				     
				   else
				   {
					     
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roleinsert?'+
							'rolename='+document.getElementById("rolenameinsert").value+
							'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+
							'&remarks='+document.getElementById("roleremarkinsert").value).success(
									function(data, status, headers, config) {
//	 									$scope.company1 = data;
//	 									alert("Record Inserted Successfully");
//	 									document.getElementById("succ").hidden = false;
										document.getElementById("successmsg").hidden = false;
										document.getElementById("infodiv").hidden = false;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[1]+'&loginid='+sptstr[2])
												.success(function(data, status, headers, config) {
															$scope.roledet = data;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
//	 														alert("Record Not inserted");
															document.getElementById("errorsmsg").hidden = false;
														});
									}).error(
									function(data, status, headers, config) {
// 										alert(data);
										console.log('error: data = ', data);
									});
					   }
				}
			$scope.roleupdate = function roleupdate() {
						try
						{
						var i=0;
						//alert($scope.compid+" ");
						}catch(e){alert(e);}
						var myForm = document.roleeditform;
					      if (myForm.editrolename.value== "")
					      {
					    	// alert("company name not be empty");
					    	 myForm.editrolename.focus();
					      }
					   else
					   {
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roleedit?'+
								'roleid='+$scope.roleeditdet.roleid+'&rolename='+document.getElementById("editrolename").value+
								'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+
								'&remarks='+document.getElementById("editroleremark").value)
						.success(function(data, status, headers, config) {
											$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[1]+'&loginid='+sptstr[2])
													.success(function(data, status,	headers, config) {
															$scope.roledet = data;
															document.getElementById("rolemain").hidden = false;
															document.getElementById("roleedit").hidden = true;
																//alert("in afetr");
															})
													.error(function(data, status,headers, config) {
																console.log('error: data = ',data);
															});
//	 										alert("Record Updated Successfully");
											document.getElementById("updatemsg").hidden = false;
										})
										.error(function(data, status, headers, config) {
											document.getElementById("errorsmsg").hidden = false;
											console.log('error: data = ', data);
										});
					}

		}
			} catch (e) {
				alert(e);
			}
		});
	
	
	scotchApp.controller('menuassignController', function($scope,$http, $compile, $filter) {
		try {
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [5,10,50,100,150,200];
				$scope.pagesint=5;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.deleterole = function(comp){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydelete?id='+comp.companyid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
							.success(function(data, status, headers, config) {
								$scope.company = data;

							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
						document.getElementById("successmsg").hidden = false;
						

					}).error(function(data, status, headers, config) {
						document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
						document.getElementById("errorsmsg").hidden = false;
						console.log('error: data = ', data);
					});
				}
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[1]+'&loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
							$scope.roledetails = data;
						})
				.error(function(data, status, headers, config) {
							console.log('error: data = ',data);
//								alert("Record Not inserted");
							document.getElementById("errorsmsg").hidden = false;
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-1]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menudetails = data;
//						alert(data);

				}).error(function(data, status, headers, config) {
//	 				alert(data);
					console.log('error: data = ', data);
				});
			
				
				$scope.query = {}
				$scope.queryBy = '$'
				$scope.orderProp = "CompanyName";

				$scope.showmenurolediv1 = function() {
					//alert("in");
					document.getElementById("menuroleedit").hidden = false;
					document.getElementById("menurolemain").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("menurolemain").hidden = false;
					document.getElementById("menuroleedit").hidden = true;
				} 
				
				
				$scope.menuroleData = function menuroleData(editname) {
					$scope.menuroleeditdet = editname;
					
				}

				$scope.menuroleinsertform = function menuroleinsertform() {
					var myForm = document.menuassignInsert;
				      if (myForm.insertmenuassmenuname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.insertmenuassmenuname.focus();
				      }else if (myForm.insertmenuassrolename.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.insertmenuassrolename.focus();
					    }
				     
				   else
				   {
					   var i=0;
					   for(i=0;i<$scope.roledetails.length;i++)
						{
							if($scope.roledetails[i].rolename==document.getElementById('insertmenuassrolename').value)
							{
							$scope.menuroleid=$scope.roledetails[i].roleid;
							}
						}
						for(i=0;i<$scope.menudetails.length;i++){
							if($scope.menudetails[i].menutext == document.getElementById('insertmenuassmenuname').value)
							{
								$scope.menuid=$scope.menudetails[i].menuid;
							}
						}
// 						alert($scope.menuroleid+" "+$scope.menuid);
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassigninsert?'+
							'menuid='+$scope.menuid+
							'&roleid='+$scope.menuroleid+'&loginid='+sptstr[2]).success(
									function(data, status, headers, config) {
//	 									$scope.company1 = data;
//	 									alert("Record Inserted Successfully");
//	 									document.getElementById("succ").hidden = false;
										document.getElementById("successmsg").hidden = false;
										document.getElementById("infodiv").hidden = false;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1])
												.success(function(data, status, headers, config) {
															$scope.menuassigndet = data;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
//	 														alert("Record Not inserted");
															document.getElementById("errorsmsg").hidden = false;
														});
									}).error(
									function(data, status, headers, config) {
// 										alert(data);
										document.getElementById("errorsmsg").hidden = false;
										console.log('error: data = ', data);
									});
					   }
				}
				$scope.menuroleupdateform = function menuroleupdateform() {
					var myForm = document.menuassignUpdate;
				      if (myForm.editmenuassmenuname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.editmenuassmenuname.focus();
				      }else if (myForm.editmenuassrolename.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.editmenuassrolename.focus();
					    }
				     
				   else
				   {
					   var i=0;
					   for(i=0;i<$scope.roledetails.length;i++)
						{
							if($scope.roledetails[i].rolename==document.getElementById('editmenuassrolename').value)
							{
							$scope.menuroleidedit=$scope.roledetails[i].roleid;
							}
						}
						for(i=0;i<$scope.menudetails.length;i++){
							if($scope.menudetails[i].menutext == document.getElementById('editmenuassmenuname').value)
							{
								$scope.menuidedit=$scope.menudetails[i].menuid;
							}
						}
// 						alert($scope.menuroleid+" "+$scope.menuid);
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassignupdate?'+
							'menuid='+$scope.menuidedit+'&id='+$scope.menuroleeditdet.mid+
							'&roleid='+$scope.menuroleidedit+'&loginid='+sptstr[2]).success(
									function(data, status, headers, config) {
//	 									$scope.company1 = data;
//	 									alert("Record Inserted Successfully");
//	 									document.getElementById("succ").hidden = false;
										document.getElementById("successmsg").hidden = false;
// 										document.getElementById("infodiv").hidden = false;
										
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1])
												.success(function(data, status, headers, config) {
															$scope.menuassigndet = data;
// 															alert(data);
															document.getElementById("menurolemain").hidden = false;
															document.getElementById("menuroleedit").hidden = true;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
// 	 														alert("Record Not inserted");
															document.getElementById("errorsmsg").hidden = false;
														});
										
									}).error(function(data, status, headers, config) {
// 										alert("error:"+data);
										document.getElementById("errorsmsg").hidden = false;
										console.log('error: data = ', data);
									});
					   }
				}			} catch (e) {
				alert(e);
			}
		});
	
	scotchApp.controller('DeviceCtrl', function($scope,$http, $compile, $filter) {
		$scope.query = {}
	   	$scope.queryBy = '$';
		
		$(function() {
			$('.datepick').datepicker({
			    format: "dd-M-yyyy",
			    endDate: '+0d',
			    autoclose: true
			});  
			 $('.datepick').datepicker('setDate', '+0d');
		});
		
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		$scope.pagesno = [5,10,50,100,150,200];
		$scope.pagesint=5;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		
		
		$scope.deletedevice = function(comp){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedelete?id='+comp.deviceid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.device = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
				document.getElementById("successmsg").hidden = false;
				

			}).error(function(data, status, headers, config) {
				document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
				document.getElementById("errorsmsg").hidden = false;
				console.log('error: data = ', data);
			});
		}
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			$scope.device = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		$scope.orderProp = "vehicleN0";
		$scope.deviceData = function deviceData(edit) {
			$scope.editdevice = edit;
		}


//	makkename vbind modeldetails
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.devicemakenamelist = data;
// 						alert($scope.devicemakenamelist);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					//	MODEL BIN
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.devicemodeldetails = data;
// 						alert($scope.devicemodeldetails);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					
					
					//	vendordetails
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						
						$scope.devicevendordetails = data;
					
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					
					//	insertdevice
					$scope.devieinsert = function devieinsert() {
					try
					{
						$scope.deviceinsertvendordetails=null;
						$scope.deviceinsertmakid=null;
						$scope.deviceinsertmodelid=null;
					
					var i=0;
					for(i=0;i<$scope.devicevendordetails.length;i++)
					{
						if($scope.devicevendordetails[i].vendorfirmname==document.getElementById('deviceinsertVendor').value)
						{
						$scope.deviceinsertvendordetails=$scope.devicevendordetails[i].vendorid;
						}
					}
					for(i=0;i<$scope.devicemakenamelist.length;i++){
						if($scope.devicemakenamelist[i].makename == document.getElementById('deviceinsertMakeName').value)
						{
							$scope.deviceinsertmakid=$scope.devicemakenamelist[i].makeid;
						}
					}
					for(i=0;i<$scope.devicemodeldetails.length;i++){
						if($scope.devicemodeldetails[i].modelname==document.getElementById('deviceinsertModelName').value)
						{
						$scope.deviceinsertmodelid=$scope.devicemodeldetails[i].modelid;
						}
					}
					
					for(i=0;i<$scope.device.length;i++){
					if($scope.device[i].assetname==document.getElementById('insertassetname').value)
					{
					$scope.insertdeviceassetid=$scope.device[i].assetid;
					}
					}	
					var mydeviceinsert = document.deviceindert;
					if(mydeviceinsert.deviceinsertdeviceno.value== "")
					{
					mydeviceinsert.deviceinsertdeviceno.focus();
					}
					else if(mydeviceinsert.deviceinsertMakeName.value== "")
					{
					mydeviceinsert.deviceinsertMakeName.focus();
					}
					else if(mydeviceinsert.deviceinsertModelName.value== "")
					{
					mydeviceinsert.deviceinsertModelName.focus();
					}
// 					else if(mydeviceinsert.insertdevicecom.value== "")
// 					{
// 					mydeviceinsert.insertdevicecom.focus();
// 					}
					else if(mydeviceinsert.deviceinsertVendor.value== "")
					{
					mydeviceinsert.deviceinsertVendor.focus();
					}
					else if(mydeviceinsert.insertassetname.value== "")
					{
					mydeviceinsert.insertassetname.focus();
					}
					
					else 
					{
						var k=0;
						if($scope.deviceinsertvendordetails==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceinsert.deviceinsertVendor.focus();
							k++;
// 							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.deviceinsertmakid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceinsert.deviceinsertMakeName.focus();
							k++;
// 							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.deviceinsertmodelid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Model Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceinsert.deviceinsertModelName.focus();
							k++;
// 							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
// 						alert(document.getElementById('deviceinsertdeviceno').value);
					if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceinsert?makeid='+$scope.deviceinsertmakid+'&modelid='+$scope.deviceinsertmodelid+'&uniqueid='+document.getElementById('deviceinsertdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceinsertRemarkd').value+'&companyid='+sptstr[1]+'&assetid='+$scope.insertdeviceassetid+'&vendorid='+$scope.deviceinsertvendordetails)
						.success(function(data, status, headers, config) {
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
							.success(function(data, status, headers, config) {
								$scope.device = data;
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
	// 						alert("Record Inserted successfully");
							document.getElementById("successmsg").hidden = false;
						}).error(function(data, status, headers, config) {
	// 						alert("Not Inserted");
							document.getElementById("errorsmsg").hidden = false;
							console.log('error: data = ', data);
						});
					}
					}
					}catch(e){alert(e);}
					}
					
					//deviceupdate
					$scope.devieupdate = function devieupdate() 
					{
					
					var i=0;$scope.deviceeditvendordetails=null;$scope.deviceeditmakid=null;
					$scope.deviceeditmodelid=null;
					for(i=0;i<$scope.devicevendordetails.length;i++)
					{
						if($scope.devicevendordetails[i].vendorfirmname==document.getElementById('deviceeditvendor').value)
						{
						$scope.deviceeditvendordetails=$scope.devicevendordetails[i].vendorid;
						}
					}
					for(i=0;i<$scope.devicemakenamelist.length;i++){
						if($scope.devicemakenamelist[i].makename == document.getElementById('deviceditmake').value)
						{
							$scope.deviceeditmakid=$scope.devicemakenamelist[i].makeid;
						}
					}
					for(i=0;i<$scope.devicemodeldetails.length;i++){
						if($scope.devicemodeldetails[i].modelname==document.getElementById('deviceeditmodel').value)
						{
						$scope.deviceeditmodelid=$scope.devicemodeldetails[i].modelid;
						}
					}
						
					
					var mydeviceedit = document.deviceEdit;
					if(mydeviceedit.editdeviceno.value== "")
					{
					mydeviceedit.editdeviceno.focus();
					}
					else if(mydeviceedit.deviceditmake.value== "")
					{
					mydeviceedit.deviceditmake.focus();
					}
					else if(mydeviceedit.deviceeditmodel.value== "")
					{
					mydeviceedit.deviceeditmodel.focus();
					}
					
					else if(mydeviceedit.deviceeditvendor.value== "")
					{
					mydeviceedit.deviceeditvendor.focus();
					}
					
					else if(mydeviceedit.editassetname.value== "")
					{
					mydeviceedit.editassetname.focus();
					}
					else
					{
						
						var k=0;
						if($scope.deviceeditvendordetails==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceedit.deviceeditvendor.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.deviceeditmakid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceedit.deviceditmake.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.deviceeditmodelid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Model Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mydeviceedit.deviceeditmodel.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
					
					//alert('http://localhost:8080/indtrackwebservice/rest/CallService/deviceupdate?deviceid='+$scope.deviceid1+'&makeid='+$scope.makid1+'&modelid='+$scope.modelid1+'&uniqueid='+document.getElementById('deviceno')+'&loginid=44001&remark='+document.getElementById('Remarkd1').value+'&companyid='+$scope.compyid1+'&assetid=110008&vendorid='+$scope.vendorid1);
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceupdate?deviceid='+$scope.editdevice.deviceid+'&makeid='+$scope.deviceeditmakid+'&modelid='+$scope.deviceeditmodelid+'&uniqueid='+document.getElementById('editdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceeditRemarkd1').value+'&companyid='+sptstr[1]+'&assetid=110008&vendorid='+$scope.deviceeditvendordetails)
						.success(function(data, status, headers, config) {
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
						.success(function(data, status,	headers, config) {
							$scope.device = data;
							document.getElementById("devicemain").hidden = false;
							document.getElementById("deviceedit").hidden = true;
	// 						alert("Updated SuccessFully");
							document.getElementById("updatemsg").hidden = false;
						})
						.error(function(data, status,headers, config) {
							console.log('error: data = ',data);
							
	// 						alert("Not Updated");
						});
						}).error(function(data, status, headers, config) {
							document.getElementById("errorsmsg").hidden = false;
							console.log('error: data = ', data);
						});
					  }
					}	
					}
					
					
					$scope.showdevicediv1 = function() {
					//alert("in");
					document.getElementById("deviceedit").hidden = false;
					document.getElementById("devicemain").hidden = true;
					}
					$scope.back = function() {
					document.getElementById("devicemain").hidden = false;
					document.getElementById("deviceedit").hidden = true;
					}


	});

	scotchApp.controller('SimCtrl', function($scope,$http, $compile, $filter) {
		// create a message to display in our view
		$scope.sort = function(keyname) {
			$scope.sortKey = keyname; //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		
		$(function() {
			$('.datepick').datepicker({
			    format: "dd-M-yyyy",
			    endDate: '+0d',
			    autoclose: true
			});  
			 $('.datepick').datepicker('setDate', '+0d');
		});
		
		
		try {
			// alert("in list contol") siminsert;
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		$scope.pagesno = [5,10,50,100,150,200];
			$scope.pagesint=5;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}
			
			$scope.deletesim = function(comp){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdelete?id='+comp.simid)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.sim = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
					document.getElementById("successmsg").hidden = false;
					

				}).error(function(data, status, headers, config) {
					document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
					document.getElementById("errorsmsg").hidden = false;
					console.log('error: data = ', data);
				});
			}
	   		
// 			Page.setTitle("Welcome");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.sim = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
						
					});
		} catch (e) {
			alert(e);
		}
		$scope.simdata = function simdata(editsim) {
			$scope.simdata=editsim;
		
		}
		
		$scope.showsimdiv1 = function() {
			//alert("in");
			document.getElementById("simedit").hidden = false;
			document.getElementById("mainsim").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainsim").hidden = false;
			document.getElementById("simedit").hidden = true;
		}
		
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
// 						alert(data);
							$scope.simvendordetails = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						
						//network
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?companyid='+sptstr[1]).success
						 	 (function(data, status, headers, config) {
// 								alert(data);
						 		$scope.simnetworkdetails=data;

						  })
						      .error(function(data, status, headers, config) 
						     		 {
						        console.log('error: data = ' , data);
						      });

	$scope.Siminsert = function Siminsert() {
			try {
// 				alert("in Siminsert");

			// alert($scope.simcompanydetailslist1[i].companyname+""+document.getElementById('insertsimcompany').value+""+document.getElementById('insertsimnetwork').value );
				var i=0;$scope.simnetworkid=null;$scope.simvendorid=null;
				$scope.simassetid=null;
				for(i=0;i<$scope.simnetworkdetails.length;i++){
					if($scope.simnetworkdetails[i].networkname==document.getElementById('insertsimnetwork').value)
					{
					$scope.simnetworkid=$scope.simnetworkdetails[i].networkid;
					}
				}	
				for(i=0;i<$scope.simvendordetails.length;i++){
					if($scope.simvendordetails[i].vendorfirmname==document.getElementById('simvendorinsert').value)
					{
					$scope.simvendorid=$scope.simvendordetails[i].vendorid;
					}
				}	
				
				for(i=0;i<$scope.sim.length;i++){
					if($scope.sim[i].assetname==document.getElementById('simassetname').value)
					{
					$scope.simassetid=$scope.sim[i].assettypeid;
					}
				}	
				
				
				var mysiminsert=document.siminsertform;
				
			      if (mysiminsert.insertsimno.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.insertsimno.focus();
			      }	
			      else if (mysiminsert.insertsimnetwork.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.insertsimnetwork.focus();
			      }	
			      else if (mysiminsert.insertsimmobileno.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.insertsimmobileno.focus();
			      }	
			      else if (mysiminsert.simvendorinsert.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.simvendorinsert.focus();
			      }	
// 			      else if (mysiminsert.insertsimcompany.value== "")
// 			      {
// 			    	// alert("company name not be empty");
// 			    	 mysiminsert.insertsimcompany.focus();
// 			      }	
			      else if (mysiminsert.simassetname.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.simassetname.focus();
			      }	
			      else if (mysiminsert.insertsimactivedate.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mysiminsert.insertsimactivedate.focus();
			      }	
			      else
			    	  {
			    	  
			    	  var k=0;
						if($scope.simnetworkid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Network Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							 mysiminsert.insertsimnetwork.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.simvendorid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mysiminsert.simvendorinsert.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.simassetid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Asset Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mysiminsert.simassetname.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
			    	  
//alert('http://localhost:8080/indtrackwebservice/rest/CallService/siminsert?networkid='+$scope.simnetworkid+'&assettypeid='+$scope.simassetid+'&simno='+document.getElementById('insertsimno').value+'&mobileno='+document.getElementById('insertsimmobileno').value+'&vendorid='+$scope.simvendorid+'&receiptdt='+document.getElementById('siminsertreciptdate').value+'&loginid=44001&companyid='+$scope.simcompanyyid+'&remark='+document.getElementById('insertsimRemark1').value+'&dateofactive='+document.getElementById('insertsimactivedate').value);
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/siminsert?networkid='+$scope.simnetworkid+'&assettypeid='+$scope.simassetid+'&simno='+document.getElementById('insertsimno').value+'&mobileno='+document.getElementById('insertsimmobileno').value+'&vendorid='+$scope.simvendorid+'&receiptdt='+document.getElementById('siminsertreciptdate').value+'&loginid='+sptstr[2]+'&companyid='+sptstr[1]+'&remark='+document.getElementById('insertsimRemark1').value+'&dateofactive='+document.getElementById('insertsimactivedate').value)
						 .success(function(data, status, headers, config) {
// 					 				alert("Records  Inserted Successfully");
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails')
											.success(function(data, status, headers, config) {
												$scope.sim = data;
											}).error(function(data, status, headers, config) {
												console.log('error: data = ', data);
												
											});
								 document.getElementById("successmsg").hidden = false;
							      })
							      .error(function(data, status, headers, config) 
							     		 {
							        console.log('error: data = ' , data);
// 							        alert("Not Inserted");
							        document.getElementById("errorsmsg").hidden = false;
							      });
						}
			    	  }
				// alert("success");
				//}
			} catch (e) {
				alert(e);
			}
		}
	
	
	
	//update
	
$scope.simupdate=function simupdate()
{
		try
		{
			var i=0;$scope.simeditnetworkid=null;$scope.simeditvendorid=null;
			$scope.simeditassetid=null;$scope.editsimid=null;
			
			for(i=0;i<$scope.simnetworkdetails.length;i++){
				if($scope.simnetworkdetails[i].networkname==document.getElementById('editsimnetworkname').value)
				{
				$scope.simeditnetworkid=$scope.simnetworkdetails[i].networkid;
				}
			}	
			for(i=0;i<$scope.simvendordetails.length;i++){
				if($scope.simvendordetails[i].vendorfirmname==document.getElementById('editsimvendorname').value)
				{
				$scope.simeditvendorid=$scope.simvendordetails[i].vendorid;
				}
			}	
			
			for(i=0;i<$scope.sim.length;i++){
				if($scope.sim[i].assetname==document.getElementById('editsimassetname').value)
				{
				$scope.simeditassetid=$scope.sim[i].assettypeid;
				}
			}	
			 
			
			var mysimedit=document.simeditform;
			
		      if (mysimedit.editsimnumber.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mysimedit.editsimnumber.focus();
		      }	
		      else  if (mysimedit.editsimnetworkname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimnetworkname.focus();
			      }	
		      else  if (mysimedit.editsimmobileno.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimmobileno.focus();
			      }	
		      else  if (mysimedit.editsimvendorname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimvendorname.focus();
			      }	
// 		      else  if (mysimedit.editsimcompanyname.value== "")
// 		      {
// 			    	// alert("company name not be empty");
// 			    	 mysimedit.editsimcompanyname.focus();
// 			      }	
		      else  if (mysimedit.editsimassetname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimassetname.focus();
			      }	
		      else  if (mysimedit.editsimactivedate.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimactivedate.focus();
			      }
		      else
		    	  {
		    	  var k=0;
					if($scope.simeditnetworkid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Network Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mysimedit.editsimnetworkname.focus();
						k++;
//							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
					}
					if($scope.simeditvendorid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						mysimedit.editsimvendorname.focus();
						k++;
//							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
					}
					if($scope.simeditassetid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Asset Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mysimedit.editsimassetname.focus();
						k++;
//							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
					}
// 		    	  alert('http://localhost:8080/indtrackwebservice/rest/CallService/simupdate?simid='+$scope.editsimid+'&networkid='+$scope.simeditnetworkid+'&assettypeid='+$scope.simeditassetid+'&simno='+document.getElementById('editsimnumber').value+'&mobileno='+document.getElementById('editsimmobileno').value+'&vendorid='+$scope.simeditvendorid+'&receiptdt='+document.getElementById('editsimreceiptdate').value+'&loginid='+sptstr[2]+'&companyid='+sptstr[1]+'&remark='+document.getElementById('editsimRemark').value+'&dateofactive='+document.getElementById('editsimactivedate').value);
			if(k==0){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simupdate?simid='+$scope.simdata.simid+'&networkid='+$scope.simeditnetworkid+'&assettypeid='+$scope.simeditassetid+'&simno='+document.getElementById('editsimnumber').value+'&mobileno='+document.getElementById('editsimmobileno').value+'&vendorid='+$scope.simeditvendorid+'&receiptdt='+document.getElementById('editsimreceiptdate').value+'&loginid='+sptstr[2]+'&companyid='+sptstr[1]+'&remark='+document.getElementById('editsimRemark').value+'&dateofactive='+document.getElementById('editsimactivedate').value)
			 .success(function(data, status, headers, config) {
				 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
			
				$scope.sim = data;
				document.getElementById("mainsim").hidden = false;
				document.getElementById("simedit").hidden = true;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
				alert(data);
			});
		 document.getElementById("updatemsg").hidden=false;
// 						 				alert("Records  Updated Successfully");
								      })
								      .error(function(data, status, headers, config) 
								     		 {
								        console.log('error: data = ' , data);
// 								        alert("Not Updated");
								        document.getElementById("errorsmsg").hidden=false;
								      });
			}
		   }
}
catch(e){alert(e);}
}
	});
	
	
	scotchApp.controller('SimAssignCtrl', function($scope,$http, $compile, $filter) {
		// create a message to display in our view
		$scope.sort = function(keyname) {
			$scope.sortKey = keyname; //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		
			$(function() {
				$('.datepick').datepicker({
				    format: "dd-M-yyyy",
				    endDate: '+0d',
				    autoclose: true
				});  
				 $('.datepick').datepicker('setDate', '+0d');
			});
			
		
// 		alert("sdkjhgudhf");
		$scope.pagesno = [5,10,50,100,150,200];
		$scope.pagesint=5;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		
		$scope.deletesimassign = function(comp){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndelete?id='+comp.devicesimid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {
					$scope.simassign = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
				document.getElementById("successmsg").hidden = false;
				

			}).error(function(data, status, headers, config) {
				document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
				document.getElementById("errorsmsg").hidden = false;
				console.log('error: data = ', data);
			});
		}
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			$scope.simassign = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		$scope.orderProp = "vehicleN0";
		$scope.simData = function simData(edit) {
			$scope.editsim = edit;
		}


//	makkename vbind modeldetails
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
.success(function(data, status, headers, config) {

	$scope.devicedetails = data;

}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});
//	MODEL BIN
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?companyid='+sptstr[1])
.success(function(data, status, headers, config) {

	$scope.simdetails = data;

}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});



//	insertdevice
$scope.simassigninsertnew = function simassigninsertnew() {
try
{
// 	alert("sojhgusdifhgskdfj"+document.getElementById('devicenumber').value+" "+document.getElementById('simnumber').value);
var i=0;$scope.deviceid=null;$scope.simid=null;
for(i=0;i<$scope.devicedetails.length;i++)
{
// 	alert($scope.devicedetails[i].uniqueid+" "+document.getElementById('devicenumber').value);
	if($scope.devicedetails[i].uniqueid==document.getElementById('devicenumber').value)
	{
	$scope.deviceid=$scope.devicedetails[i].deviceid;
	}
}
for(i=0;i<$scope.simdetails.length;i++){
// 	alert(document.getElementById('simnumber').value+" "+$scope.simdetails[i].simnumber);
	if($scope.simdetails[i].simnumber == document.getElementById('simnumber').value)
	{
		$scope.simid=$scope.simdetails[i].simid;
	}
}




var mySimassignInsertForm = document.simassigninsert;
if (mySimassignInsertForm.devicenumber.value== "")
{
// alert("company name not be empty");
mySimassignInsertForm.devicenumber.focus();
}
else if(mySimassignInsertForm.simnumber.value=="")
{
mySimassignInsertForm.simnumber.focus();
}
else if(mySimassignInsertForm.assigndate.value=="")
{
mySimassignInsertForm.assigndate.focus();
}
else if(mySimassignInsertForm.status.value=="")
{
mySimassignInsertForm.status.focus();
}
else
{
	
	var k=0;
	if($scope.deviceid==null){
		document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
		document.getElementById("errorsmsg").hidden = false;
		mySimassignInsertForm.devicenumber.focus();
		k++;
//			alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
	}
	if($scope.simid==null){
		document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Sim Number Does Not Exist";
		document.getElementById("errorsmsg").hidden = false;
		mySimassignInsertForm.simnumber.focus();
		k++;
//			alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
	}
//alert($scope.deviceid+"  "+$scope.simid);
// alert('http://localhost:8080/indtrackwebservice/rest/CallService/simassigninsert?deviceid='+$scope.deviceid+'&simid='+$scope.simid+'&loginid='+sptstr[2]+'&status='+document.getElementById("status").value+'&remark='+document.getElementById("remark").value+'&assigndate='+document.getElementById("assigndate").value);
		if(k==0){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigninsert?deviceid='+$scope.deviceid+'&simid='+$scope.simid+'&loginid='+sptstr[2]+'&status='+document.getElementById("status").value+'&remarks='+document.getElementById("remark").value+'&assigndate='+document.getElementById("assigndate").value)
			.success(function(data, status, headers, config) {
			//        alert("Record Inserted Successfully");
				document.getElementById("successmsg").hidden=false;
			}).error(function(data, status, headers, config) {
			// 	alert("Not Inserted");
			document.getElementById("errorsmsg").hidden=false;
				console.log('error: data = ', data);
			});
		}
}
}catch(e){alert(e);}
}



$scope.simassignupdate = function simassignupdate() {
try
{
//$scope.vendors=	$scope.devicedetails;
//$scope.make=$scope.simdetails;
// alert($scope.devicedetails +" "+document.getElementById('devicename').value);
var i=0;$scope.deviceid1=null;$scope.simid1=null;
for(i=0;i<$scope.devicedetails.length;i++)
{
	if($scope.devicedetails[i].uniqueid==document.getElementById('devicename').value)
	{
	$scope.deviceid1=$scope.devicedetails[i].deviceid;
	}
}
for(i=0;i<$scope.simdetails.length;i++){
if($scope.simdetails[i].simnumber == document.getElementById('simname').value)
{
	$scope.simid1=$scope.simdetails[i].simid;
}
}
$scope.devicesimid=$scope.editsim.devicesimid;


var mySimassigneditForm = document.simassignedit;
if (mySimassigneditForm.devicename.value== "")
{
// alert("company name not be empty");
mySimassigneditForm.devicename.focus();
}
else if(mySimassigneditForm.simname.value=="")
{
mySimassigneditForm.simname.focus();
}
else if(mySimassigneditForm.datesim.value=="")
{
mySimassigneditForm.datesim.focus();
}
else if(mySimassigneditForm.statusname.value=="")
{
mySimassigneditForm.statusname.focus();
}
else
{
	
	var k=0;
	if($scope.deviceid1==null){
		document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
		document.getElementById("errorsmsg").hidden = false;
		mySimassigneditForm.devicename.focus();
		k++;
//			alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
	}
	if($scope.simid1==null){
		document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Sim Number Does Not Exist";
		document.getElementById("errorsmsg").hidden = false;
		mySimassigneditForm.simname.focus();
		k++;
//			alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
	}
//alert('http://localhost:8080/indtrackwebservice/rest/CallService/simassigninsert?deviceid='+$scope.deviceid+'&simid='+$scope.simid+'&loginid=44001&status='+document.getElementById("status").value+'&remark='+document.getElementById("remark").value+'&assigndate='+document.getElementById("assigndate").value);
		if(k==0){
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassignupdate?devicesimid='+$scope.devicesimid+'&deviceid='+$scope.deviceid1+'&simid='+$scope.simid1+'&loginid='+sptstr[2]+'&status='+document.getElementById("statusname").value+'&remarks='+document.getElementById("remarkname").value+'&assigndate='+document.getElementById("datesim").value)
		.success(function(data, status, headers, config) {
			
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {
			
					$scope.simassign = data;
					document.getElementById("simassignmain").hidden = false;
					document.getElementById("simassignedit").hidden = true;
			
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			// 	alert("Record Inserted Successfully");
				document.getElementById("updatemsg").hidden=false;
		}).error(function(data, status, headers, config) {
		// 	alert("Record Not Inserted");
		document.getElementById("errorsmsg").hidden=false;
			console.log('error: data = ', data);
		});
		}
}
}catch(e){alert(e);}
}


$scope.showsimdevicediv1 = function() {
//alert("in");
document.getElementById("simassignedit").hidden = false;
document.getElementById("simassignmain").hidden = true;
}
$scope.back = function() {
document.getElementById("simassignmain").hidden = false;
document.getElementById("simassignedit").hidden = true;
}
	});
	
	scotchApp.controller('alertcntrl', function($scope,$http, $compile, $filter) {
		$scope.close = function close(){
    		document.getElementById("successmsg").hidden = true;
    		document.getElementById("textsuccess").innerHTML = "<center>Records Saved Successfully!</center>";
    	}
		
		
		$scope.closeupdate=function closeupdate()
		{
			document.getElementById('updatemsg').hidden=true;
		}
		
		$scope.error=function error()
		{
			document.getElementById('errorsmsg').hidden=true;
			document.getElementById("texterror").innerHTML = "Problem in Saving Records!";
		}
		
		$scope.phonevalid=function phonevalid()
		{
			document.getElementById('phonevalidmsg').hidden=true;
			///document.getElemenetById("texterror").innerHTML = "Problem in Saving Records!";
		}
		$scope.phonelength=function phonelength()
		{
			document.getElementById('phonenolength').hidden=true;
			///document.getElemenetById("texterror").innerHTML = "Problem in Saving Records!";
		}
	});
	
	
	scotchApp.controller('DeviceAssignCtrl', function($scope,$http, $compile, $filter) {
		try {
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
			
			
			$(function() {
				$('.datepick').datepicker({
				    format: "dd-M-yyyy",
				    endDate: '+0d',
				    autoclose: true
				});  
				 $('.datepick').datepicker('setDate', '+0d');
			});
			
			
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [5,10,50,100,150,200];
				$scope.pagesint=5;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.deletevehicleassign = function(comp){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndelete?id='+comp.id)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.deviceassign = data;
// 							alert(data);
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>";
						document.getElementById("successmsg").hidden = false;
						

					}).error(function(data, status, headers, config) {
						document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
						document.getElementById("errorsmsg").hidden = false;
						console.log('error: data = ', data);
					});
				}
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.deviceassign = data;
// 							alert(data);
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {
					$scope.devicedetails = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {
					$scope.vehicledetails = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			
				
				$scope.query = {}
				$scope.queryBy = '$'
				$scope.orderProp = "CompanyName";

				$scope.showvehicleassigndiv1 = function() {
					//alert("in");
					document.getElementById("showeditvehicleassign").hidden = false;
					document.getElementById("mainvehicleassign").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("mainvehicleassign").hidden = false;
					document.getElementById("showeditvehicleassign").hidden = true;
				}

				
//	 			$scope.msgdiv= function msgdiv() {
//	 				//alert("in");
//	 			document.getElementById("infodiv").hidden = false;
				
//	 			}
				
				$scope.vehicleassignData = function vehicleassignData(editname) {
					$scope.editvehicleassign = editname;
					
				}
try{
				$scope.vehicleassigninsert = function vehicleassigninsert() {
					var myForm = document.vehicleassigninsert1;
				      if (myForm.vehicleassignvehicleinsert.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.vehicleassignvehicleinsert.focus();
				      }
				      else if (myForm.vehicleassigndeviceinsert.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.vehicleassigndeviceinsert.focus();
				      }
				      else if (myForm.vehicleassigndateinsert.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.vehicleassigndateinsert.focus();
				    	
				      }
				      
				   else
				   {
					   var i=0;
						  for(i=0;i<$scope.devicedetails.length;i++){
							  if($scope.devicedetails[i].uniqueid==document.getElementById("vehicleassigndeviceinsert").value){
								  $scope.vdeviceid1 = $scope.devicedetails[i].deviceid;
							  }
						  }
						  for(i=0;i<$scope.vehicledetails.length;i++){
							  if($scope.vehicledetails[i].vehicleregno==document.getElementById("vehicleassignvehicleinsert").value){
								  $scope.vvehicleid1 = $scope.vehicledetails[i].vehicleid;
							  }
						  }	
						  
						  var k=0;
							if($scope.vdeviceid1==null){
								document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
								document.getElementById("errorsmsg").hidden = false;
								 myForm.vehicleassigndeviceinsert.focus();
								k++;
//									alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
							}
							if($scope.vvehicleid1==null){
								document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vehicle Number Does Not Exist";
								document.getElementById("errorsmsg").hidden = false;
								myForm.vehicleassignvehicleinsert.focus();
								k++;
//									alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
							}
						 if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigninsert'+
								'?vehicleid='+$scope.vvehicleid1+'&deviceid='+$scope.vdeviceid1+'&status=1&assigndate='+document.getElementById("vehicleassigndateinsert").value
								+'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+'&remarks='+document.getElementById("vehicleassignremarksinsert").value).success(
									function(data, status, headers, config) {
//	 									$scope.company1 = data;
//	 									alert("Record Inserted Successfully");
										document.getElementById("successmsg").hidden = false;
										document.getElementById("infodiv").hidden = false;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndetails?companyid='+sptstr[1])
										.success(function(data, status, headers, config) {
											$scope.deviceassign = data;
//				 							alert(data);
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
									}).error(
									function(data, status, headers, config) {
										alert(data);
										document.getElementById("errormsg").hidden = false;
										console.log('error: data = ', data);
									});
						 }
					   }
				}
}catch(e){alert(e);}
			$scope.vehicleassignedit = function vehicleassignedit() {
						try
						{
						$scope.deviceassigndetails=$scope.deviceassign;
						var i=0;
						//alert($scope.compid+" ");
						
						var myForm1 = document.formeditvehicle;
					      if (myForm1.vehicleassignvehicleedit.value== "")
					      {
					    	// alert("company name not be empty");
					    	 myForm1.vehicleassignvehicleedit.focus();
					      }
					      else if (myForm1.vehicleassigndeviceedit.value== "")
					      {
					    	// alert("company name not be empty");
					    	 myForm1.vehicleassigndeviceedit.focus();
					      }
					      else if (myForm1.vehicleassigndateedit.value== "")
					      {
					    	// alert("company name not be empty");
					    	 myForm1.vehicleassigndateedit.focus();
					    	
					      }
					      
					   else
					   {
						   var i=0;
						  for(i=0;i<$scope.devicedetails.length;i++){
							  if($scope.devicedetails[i].uniqueid==document.getElementById("vehicleassigndeviceedit").value){
								  $scope.vdeviceid = $scope.devicedetails[i].deviceid;
							  }
						  }
						  for(i=0;i<$scope.vehicledetails.length;i++){
							  if($scope.vehicledetails[i].vehicleregno==document.getElementById("vehicleassignvehicleedit").value){
								  $scope.vvehicleid = $scope.vehicledetails[i].vehicleid;
							  }
						  }	
						  
						  
						  var k=0;
							if($scope.vdeviceid==null){
								document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
								document.getElementById("errorsmsg").hidden = false;
								myForm1.vehicleassigndeviceedit.focus();
								k++;
//									alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
							}
							if($scope.vvehicleid==null){
								document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vehicle Number Does Not Exist";
								document.getElementById("errorsmsg").hidden = false;
								 myForm1.vehicleassignvehicleedit.focus();
								k++;
//									alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
							}
// 						  id,vehicleid,deviceid,status,assigndate,companyid,loginid,remarks,datetimestamp
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassignupdate'+
								'?id='+$scope.editvehicleassign.id+'&vehicleid='+$scope.vvehicleid
								+'&deviceid='+$scope.vdeviceid+'&status=1&assigndate='+document.getElementById("vehicleassigndateedit").value
								+'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+'&remarks='+document.getElementById("vehicleassignremarksedit").value)
						.success(function(data, status, headers, config) {
							document.getElementById("mainvehicleassign").hidden = false;
							document.getElementById("showeditvehicleassign").hidden = true;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndetails?companyid='+sptstr[1])
										.success(function(data, status, headers, config) {
											$scope.deviceassign = data;
			//	 							alert(data);
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
//	 										alert("Record Updated Successfully");
											document.getElementById("updatemsg").hidden = false;
										})
										.error(function(data, status, headers, config) {
											document.getElementById("errorsmsg").hidden = false;
											console.log('error: data = ', data);
										});
						}
					}
						}catch(e){alert(e);}
		}
			} catch (e) {
				alert(e);
			}
		});
	
	scotchApp.controller('VehicleCtrl', function($scope,$http, $compile, $filter) {
		
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		
		$(function() {
			$('.datepick').datepicker({
			    format: "dd-M-yyyy",
			    endDate: '+0d',
			    autoclose: true
			});  
			 $('.datepick').datepicker('setDate', '+0d');
		});
		
		
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		
	   		$scope.pagesno = [5,10,50,100,150,200];
			$scope.pagesint=5;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}
			
			
			$scope.showvehclediv1 = function() {
				//alert("in");
				document.getElementById("showeditvehicle").hidden = false;
				document.getElementById("mainvehicle").hidden = true;
			}
			$scope.back = function() {
				document.getElementById("mainvehicle").hidden = false;
				document.getElementById("showeditvehicle").hidden = true;
			}
			
			
			
			
		try
		{
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {

				$scope.vehicle = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			
			$scope.vehicleeditdata=function vehicleeditdata(vehicledata)
			{
				$scope.editvehicledata=vehicledata;
			}
			
	//		makkename vbind modeldetails
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {

				$scope.vehcilemakenamelist = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
//	 		MODEL BIN
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
			
				$scope.vehiclemodeldetails = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			/// vcehicletypeiddtails  
			
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicletypedetails')
			.success(function(data, status, headers, config) {
			
				$scope.vehicletype = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			
			
	$scope.VehicleInsert=function VehicleInsert()
			{
				
				try
				{
					var i=0;
					
					for(i=0;i<$scope.vehcilemakenamelist.length;i++)
					{

						if($scope.vehcilemakenamelist[i].makename==document.getElementById('vehiinsertmake1').value)
							{
							$scope.vehiclemakeid=$scope.vehcilemakenamelist[i].makeid;
							}
					}
					for(i=0;i<$scope.vehiclemodeldetails.length;i++)
					{

						if($scope.vehiclemodeldetails[i].modelname==document.getElementById('vehicleinsertmodel').value)
							{
							$scope.vehiclemodelid=$scope.vehiclemodeldetails[i].modelid;
							}
					}
					for(i=0;i<$scope.vehicletype.length;i++)
					{
						if($scope.vehicletype[i].vehicletypename==document.getElementById('insertvehicletype').value)
							{
								$scope.vehicleinserttypeid=$scope.vehicletype[i].vehicletypeid;
							}
					}
					
// 					alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.vehiclemakeid+'&modelid='+$scope.vehiclemodelid+'&vehicletypeid='+$scope.vehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+
// 							'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+
// 							'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=&regdate=&regvaliddate=&insurancevaliddate=&pucdate='+document.getElementById('vehinsertpurchasedate').value+
// 							'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('vehinsertremark').value+'&companyid='+sptstr[1]+'&fullpump=&codometer=&nodometer=&lodometer=&maincycle=&mainduration=');
					
					
					var myvehicleForm1 = document.vehicleinsertform;
					      if (myvehicleForm1.vehicleinsertvehno.value== "")
					      {
					    	// alert("company name not be empty");
					    	 myvehicleForm1.vehicleinsertvehno.focus();
					      }
					      else if (myvehicleForm1.vehinsertchassis.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.vehinsertchassis.focus();
						      }
					      else if (myvehicleForm1.vehiinsertmake1.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.vehiinsertmake1.focus();
						      }
					      else if (myvehicleForm1.vehicleinsertmodel.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.vehicleinsertmodel.focus();
						      }
					      else if (myvehicleForm1.insertvehicletype.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.insertvehicletype.focus();
						      }
					      else if (myvehicleForm1.vehinsertengineno.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.vehinsertengineno.focus();
						      }
					      else if (myvehicleForm1.vehinsertpurchasedate.value== "")
					      {
						    	// alert("company name not be empty");
						    	 myvehicleForm1.vehinsertpurchasedate.focus();
						      }
					      else
					    	  {
					    	  
					    	  var k=0;
								if($scope.vehiclemakeid==null){
									document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
									document.getElementById("errorsmsg").hidden = false;
									myvehicleForm1.vehiinsertmake1.focus();
									k++;
//										alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
								} 
								if($scope.vehiclemodelid==null){
									document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
									document.getElementById("errorsmsg").hidden = false;
									myvehicleForm1.vehicleinsertmodel.focus();
									k++;
//										alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
								} 
								if($scope.vehicleinserttypeid==null){
									document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Device Number Does Not Exist";
									document.getElementById("errorsmsg").hidden = false;
									myvehicleForm1.insertvehicletype.focus();
									k++;
//										alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
								} 
								if(k==0){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.vehiclemakeid+'&modelid='+$scope.vehiclemodelid+'&vehicletypeid='+$scope.vehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+
							'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+
							'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=&regdate=&regvaliddate=&insurancevaliddate=&pucdate='+document.getElementById('vehinsertpurchasedate').value+
							'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('vehinsertremark').value+'&companyid='+sptstr[1]+'&fullpump=&codometer=&nodometer=&lodometer=&maincycle=&mainduration=')
								.success(function(data, status, headers, config) {
									
							document.getElementById("successmsg").hidden = false;
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[1])
							.success(function(data, status, headers, config) {

								$scope.vehicle = data;

							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
	

								}).error(function(data, status, headers, config) {
									alert(data);
									console.log('error: data = ', data);
								});
					    	  }
					    	  }
				}
				catch(e)
				{
					alert(e);
				}
				
			}
			
			
	
	
	
	$scope.VehicleUpdate=function VehicleUpdate()
	{
		try
		{
			
			
			var i=0;
			alert($scope.vehcilemakenamelist+" "+document.getElementById('editmake').value);
			for(i=0;i<$scope.vehcilemakenamelist.length;i++)
			{
// 				alert("make"+$scope.vehcilemakenamelist[i].makename+""+document.getElementById('editmake').value);

				if($scope.vehcilemakenamelist[i].makename==document.getElementById('editmake').value)
					{
					$scope.vehicleEditmakeid=$scope.vehcilemakenamelist[i].makeid;
					}
			}
			for(i=0;i<$scope.vehiclemodeldetails.length;i++)
			{
// 			alert("model"+$scope.vehiclemodeldetails[i].modelname+""+document.getElementById('editmodel').value);

				if($scope.vehiclemodeldetails[i].modelname==document.getElementById('editmodel').value)
					{
					$scope.vehicleEditmodelid=$scope.vehiclemodeldetails[i].modelid;
					}
			}
			
					$scope.vehicleEditid=$scope.editvehicledata.vehicleid;
			
			var myvehicleForm2 = document.vehicleeditform;
		      if (myvehicleForm2.editvehino.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editvehino.focus();
		      }
		      else if (myvehicleForm2.editchasisno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editchasisno.focus();
		      }
		      else if (myvehicleForm2.editmake.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editmake.focus();
		      }
		      else if (myvehicleForm2.editmodel.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editmodel.focus();
		      }
		      else if (myvehicleForm2.editengineno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editengineno.focus();
		      }
		      else if (myvehicleForm2.editpudate.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myvehicleForm1.editpudate.focus();
		      }
		      
		      var k=0;
				if($scope.vehicleEditmakeid==null){
					document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
					document.getElementById("errorsmsg").hidden = false;
					myvehicleForm2.editmake.focus();
					k++;
//						alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
				} 
				if($scope.vehicleEditmodelid==null){
					document.getElementById("texterror").innerHTML = "Problem in Saving Records!\nModel Name Does Not Exist";
					document.getElementById("errorsmsg").hidden = false;
					myvehicleForm2.editmodel.focus();
					k++;
//						alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
				} 
				
				if(k==0){
		      
		      
		      
// 			alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleupdate?vehicleid='+$scope.vehicleEditid+'&makeid='+$scope.vehicleEditmakeid+'&modelid='+$scope.vehicleEditmodelid+'&vehicletypeid=&vehicleregno='+document.getElementById('editvehino').value+
// 					'&chasisnumber='+document.getElementById('editchasisno').value+'&enginenumber='+document.getElementById('editengineno').value+
// 					'&bodycolor='+document.getElementById('editbodycolor').value+'&fueltypeid=&regdate=&regvaliddate=&insurancevaliddate=&pucdate='+document.getElementById('editpudate').value+
// 					'&tankcapacity='+document.getElementById('edittankcapa').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('editremark').value+'&companyid='+sptstr[1]+'&fullpump=&codometer=&nodometer=&lodometer=&maincycle=&mainduration=')
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleupdate?vehicleid='+$scope.vehicleEditid+'&makeid='+$scope.vehicleEditmakeid+'&modelid='+$scope.vehicleEditmodelid+'&vehicletypeid=&vehicleregno='+document.getElementById('editvehino').value+
					'&chasisnumber='+document.getElementById('editchasisno').value+'&enginenumber='+document.getElementById('editengineno').value+
					'&bodycolor='+document.getElementById('editbodycolor').value+'&fueltypeid=&regdate=&regvaliddate=&insurancevaliddate=&pucdate='+document.getElementById('editpudate').value+
					'&tankcapacity='+document.getElementById('edittankcapa').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('editremark').value+'&companyid='+sptstr[1]+'&fullpump=&codometer=&nodometer=&lodometer=&maincycle=&mainduration=')
				.success(function(data, status, headers, config) {
					
					document.getElementById("mainvehicle").hidden = false;
					document.getElementById("showeditvehicle").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {

						$scope.vehicle = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					
					document.getElementById("updatemsg").hidden = false;

							
						}).error(function(data, status, headers, config) {
							alert(data);
							console.log('error: data = ', data);
						});
				}
		
		}
		catch(e)
		{
			alert(e);
		}
	}
			
		}
		catch(e)
		{
			
		}
		
	});

	
	
	scotchApp.controller('MakeCtrl', function($scope,$http, $compile, $filter) {
	
		
		$scope.showmakediv1 = function() {
			//alert("in");
			document.getElementById("showeditmake").hidden = false;
			document.getElementById("mainmake").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainmake").hidden = false;
			document.getElementById("showeditmake").hidden = true;
		}
		
		
		$scope.makeeditdata=function makeeditdata(editmake)
		{
			$scope.editmakedetails=editmake;
		}
		
		
		
		try
		{
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2])
			.success(function(data, status, headers, config) {

				$scope.makenamelist = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			//vendordetails
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
				$scope.vendorlist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			//assetname
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
				$scope.assetnamelist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
		
			
			
			$scope.makeInsert= function makeInsert()
			{
				try
				{
					var i=0;
					for(i=0;i<$scope.vendorlist.length;i++)
						{
							if($scope.vendorlist[i].vendorfirmname==document.getElementById('insertmakevendorname').value)
							{
								$scope.insertvendorid=$scope.vendorlist[i].vendorid;
// 								alert($scope.vendorlist[i].vendorfirmname+" "+document.getElementById('insertmakevendorname').value);
							}
						}
					
					for(i=0;i<$scope.assetnamelist.length;i++)
					{
						
						if($scope.assetnamelist[i].assetname==document.getElementById('insertmakeassetname').value)
						{
							$scope.insertassetid=$scope.assetnamelist[i].assettypeid;
// 							alert($scope.assetnamelist[i].assetname+" "+document.getElementById('insertmakeassetname').value);
						}
					}
					
			
					
					var mymakeinsert = document.makeforminsert;
		      if (mymakeinsert.insertmakename.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeinsert.insertmakename.focus();
		      }
		      else  if (mymakeinsert.insertmakevendorname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeinsert.insertmakevendorname.focus();
		      }
				
		      else  if (mymakeinsert.insertmakeassetname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeinsert.insertmakeassetname.focus();
		      }
		      else
		    	  {
		       var k=0;
		    	  if($scope.insertvendorid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mymakeinsert.insertmakevendorname.focus();
						k++;
					} 
		    	  if($scope.insertassetid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Asset Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mymakeinsert.insertmakeassetname.focus();
						k++;
					} 
					if(k==0){
		      		alert('http://localhost:8080/indtrackwebservice/rest/CallService/makeinsert?makename='+document.getElementById('insertmakename').value+
							'&assetid='+$scope.insertassetid+'&vendorid='+$scope.insertvendorid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmakeremark').value);
		      		
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeinsert?makename='+document.getElementById('insertmakename').value+
							'&assetid='+$scope.insertassetid+'&vendorid='+$scope.insertvendorid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmakeremark').value)
					.success(function(data, status, headers, config) {
						document.getElementById("successmsg").hidden = false;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {

							$scope.makenamelist = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});

						

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
		    	  }	
					
		    	  }		
				}
				catch(e)
				{
					alert(e);
				}
				
			}
			
			
			
			$scope.makeupdate=function makeupdate()
			{
				
				try{
					
					
					//
		var mymakeEdit = document.makeedit;
		      if (mymakeEdit.editMakeName.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeEdit.editMakeName.focus();
		      }
		      else  if (mymakeEdit.editmakevendorname1.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeEdit.editmakevendorname1.focus();
		      }
		      else  if (mymakeEdit.editmakeassetname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mymakeEdit.editmakeassetname.focus();
		      }	
		      else
		    	  {
		    	  $scope.makeEditid=$scope.editmakedetails.makeid;
//					alert("n up"+$scope.makeEditid);
					var i=0;
					for(i=0;i<$scope.vendorlist.length;i++)
						{
//						alert("n up"+$scope.vendorlist[i].vendorfirmname+" "+document.getElementById('editmakevendorname1').value);
							if($scope.vendorlist[i].vendorfirmname==document.getElementById('editmakevendorname1').value)
							{
								$scope.editvendorid=$scope.vendorlist[i].vendorid;
							}
						}
					
					for(i=0;i<$scope.assetnamelist.length;i++)
					{
//						alert("n up"+$scope.assetnamelist[i].assetname+" "+document.getElementById('editmakeassetname').value);
						if($scope.assetnamelist[i].assetname==document.getElementById('editmakeassetname').value)
						{
							$scope.editassetid=$scope.assetnamelist[i].assettypeid;
//							alert($scope.editassetid+ " "+$scope.assetnamelist[i].assettypename+""+document.getElementById('editmakeassetname').value);
						}
					}
		    	  
		    	  var k=0;
		    	  if($scope.editvendorid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Vendor Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						mymakeEdit.editmakevendorname1.focus();
						k++;
					} 
		    	  if($scope.editassetid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Asset Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mymakeEdit.editmakeassetname.focus();
						k++;
					} 
					if(k==0){
						
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeupdate?makeid='+$scope.makeEditid+
					'&makename='+document.getElementById('editMakeName').value+'&assetid='+
					$scope.editassetid+'&vendorid='+$scope.editvendorid+'&loginid='+sptstr[2]+
					'&remarks='+document.getElementById('editmakeremark').value)
					.success(function(data, status, headers, config) {
						document.getElementById("mainmake").hidden = false;
						document.getElementById("showeditmake").hidden = true;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2])
						.success(function(data, status, headers, config) {

							$scope.makenamelist = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						document.getElementById("updatemsg").hidden = false;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
		    	  }	
					
				}
				}
				catch(e)
				{
					alert(e);
				}
				
				
			}
			
		}
		catch(e)
		{
			
		};
	});

	scotchApp.controller('userCtrl', function($scope,$http, $compile, $filter) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {

			$scope.userdetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$scope.showuserdiv1 = function() {
			//alert("in");
			document.getElementById("showedituser").hidden = false;
			document.getElementById("mainuser").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainuser").hidden = false;
			document.getElementById("showedituser").hidden = true;
		}
		
		$scope.usereditdetails=function usereditdetails(edituser)
		{
			$scope.userdata=edituser;
		}
		
		
		//companynamebind
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.usercompanylist = data;
// 						alert("data = "+data);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});

		
		//rolebind
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[1]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.insertroledetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		
		$scope.userInsert=function userInsert()
		{
			var i=0;
			for(i=0;i<$scope.usercompanylist.length;i++)
			{
				if($scope.usercompanylist[i].companyname==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.usercompanylist[i].companyid;
					}
			}
			
			for(i=0;i<$scope.insertroledetailslist.length;i++)
			{
				if($scope.insertroledetailslist[i].rolename==document.getElementById('insertuserrolename').value)
					{
					$scope.userroleId=$scope.insertroledetailslist[i].roleid;
					}
			}
			
			
			var myinsertuser = document.insertuserform;
		      if (myinsertuser.insertusername.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myinsertuser.insertusername.focus();
		      }
			
		      else  if (myinsertuser.insertusermobileno.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertusermobileno.focus();
			      }
		      
		      else  if (myinsertuser.insertuseremailid.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertuseremailid.focus();
			      }
		      
		      else  if (myinsertuser.insertuserloginname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertuserloginname.focus();
			      }
		      
		      
		      else  if (myinsertuser.insertuserpassword.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertuserpassword.focus();
			      }
		      
		      else  if (myinsertuser.insertusercompany.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertusercompany.focus();
			      }
		      
		      
		      else  if (myinsertuser.insertuserrolename.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myinsertuser.insertuserrolename.focus();
			      }
		      else
		    	  {
		    	  
		    	  
		    	  
		    	  var k=0;
		    	  if($scope.usercomId==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n company Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 myinsertuser.insertusercompany.focus();
						k++;
					} 
		    	  
		    	  if($scope.userroleId==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Role Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 myinsertuser.insertuserrolename.focus();
						k++;
					} 
		    	  if(k==0)
		    		  {
// 		    		  loginid,  username, loginname, password, mobileno, emailid, roleid, datetimestamp, 
//		    		     flag, companyid
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userinsert?'
					+'username='+document.getElementById('insertusername').value+
					'&loginname='+document.getElementById('insertuserloginname').value+
					'&password='+document.getElementById('insertuserpassword').value+
					'&mobileno='+document.getElementById('insertusermobileno').value+
					'&emailid='+document.getElementById('insertuseremailid').value+
					'&companyid='+$scope.usercomId+'&roleid='+$scope.userroleId)
			.success(function(data, status, headers, config) {
				document.getElementById("successmsg").hidden = false;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {

					$scope.userdetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
		    	  }	
		    	  }
		}
	
		
		
		$scope.userUpdate=function userUpdate()
		{
			
			$scope.updateuserid=$scope.userdata.loginid;
			var i=0;
			
			
			var myedituser = document.useredit;
		      if (myedituser.editUserName.value== "")
		      {
		    	// alert("company name not be empty");
		    	 myedituser.editUserName.focus();
		      }
		      else if (myedituser.editusermobileno.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myedituser.editusermobileno.focus();
			      }
		      else if (myedituser.edituseremailid.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myedituser.edituseremailid.focus();
			      }
		      else if (myedituser.edituserloginname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myedituser.edituserloginname.focus();
			      }
		      else if (myedituser.edituserpass.value== "")
		      {
			    	// alert("company name not be empty");
			    	 myedituser.edituserpass.focus();
			      }
//			  loginid,  username, loginname, password, mobileno, emailid, roleid, datetimestamp, 
//			     flag, companyid
			else{
				var i=0;
				for(i=0;i<$scope.usercompanylist.length;i++)
				{
					if($scope.usercompanylist[i].companyname==document.getElementById('editusercompname').value)
						{
						$scope.usercomIdedit=$scope.usercompanylist[i].companyid;
						}
				}
				
				for(i=0;i<$scope.insertroledetailslist.length;i++)
				{
					if($scope.insertroledetailslist[i].rolename==document.getElementById('edituserrolename').value)
						{
						$scope.userroleIdrdit=$scope.insertroledetailslist[i].roleid;
						}
				}
				
				
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userupdate?loginid='+$scope.updateuserid+
					'&username='+document.getElementById('editUserName').value+
					'&loginname='+document.getElementById('edituserloginname').value+
					'&password='+document.getElementById('edituserpass').value+
					'&mobileno='+document.getElementById('editusermobileno').value+
					'&emailid='+document.getElementById('edituseremailid').value+
					'&companyid='+$scope.usercomIdedit+'&roleid='+$scope.userroleIdrdit)
			.success(function(data, status, headers, config) {

				document.getElementById("mainuser").hidden = false;
				document.getElementById("showedituser").hidden = true;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {

					$scope.userdetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				document.getElementById("updatemsg").hidden = false;

				
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
		}
		}
		
		
		
	});
	
	
	scotchApp.controller('dealerCtrl', function($scope,$http, $compile, $filter) {
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails')
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$scope.delaereditdetails=function delaereditdetails(editdealerdata)
		{
			$scope.dealereditdata=editdealerdata;
		}
		
		$scope.showdelaerdiv1 = function() {
			//alert("in");
			document.getElementById("showeditdealer").hidden = false;
			document.getElementById("maindealer").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("maindealer").hidden = false;
			document.getElementById("showeditdealer").hidden = true;
		}
		
		
		
		
		//rolename
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails')
		.success(function(data, status, headers, config) {

			$scope.roledetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		
		$scope.dealerInsert=function dealerInsert()
		{
			
			var i=0;
			
			for(i=0;i<$scope.roledetailslist.length;i++)
				{
					if($scope.roledetailslist[i].rolename==document.getElementById('insertdealerrolename').value)
					{
						$scope.insertroleid=$scope.roledetailslist[i].roleid;
					}
				}
			
			var mydelaerinsert = document.inserdealerform;
		      if (mydelaerinsert.insertDealername.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertDealername.focus();
		      }
		      else if (mydelaerinsert.insertdealertype.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealertype.focus();
		      }
		      else if (mydelaerinsert.insertdealermobileno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealermobileno.focus();
		      }
		      else if (mydelaerinsert.insertdealeraltno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealeraltno.focus();
		      }
		      else if (mydelaerinsert.insertdealerperadd.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerperadd.focus();
		      }
		      else if (mydelaerinsert.insertdealerpercity.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerpercity.focus();
		      }
		      else if (mydelaerinsert.insertdealerperpincode.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerperpincode.focus();
		      }
		      else if (mydelaerinsert.insertdealerrolename.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerrolename.focus();
		      }
		      else if (mydelaerinsert.insertdealerloginname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerloginname.focus();
		      }
		      else if (mydelaerinsert.insertdealerpassword.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerinsert.insertdealerpassword.focus();
		      }
		      else
		    	  {
		    	  
		    	  var k=0;
		    	  if($scope.insertroleid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Role Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mydelaerinsert.insertdealerrolename.focus();
						k++;
					} 
		    	  
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerinsert?dealername='+document.getElementById('insertDealername').value+'&dealertype='+document.getElementById('insertdealertype').value+'&localaddress='+document.getElementById('insertlocaladd').value+'&localcity='+document.getElementById('insertlocalcity').value+'&localpincode='+document.getElementById('insertlocalpincode').value+'&mobilenumber='+document.getElementById('insertdealermobileno').value+'&alternatecontnumber='+document.getElementById('insertdealeraltno').value+'&permanentaddress='+document.getElementById('insertdealerperadd').value+'&permanentcity='+document.getElementById('insertdealerpercity').value+'&permcitypincode='+document.getElementById('insertdealerperpincode').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('insertdealerremark').value+'&companyid='+sptstr[1]+'&available=0&assetid=110015&roleid='+$scope.insertroleid+'&loginpassword='+document.getElementById('insertdealerpassword').value+'&loginname='+document.getElementById('insertdealerloginname').value+'&flag=0')
			.success(function(data, status, headers, config) {
				document.getElementById("successmsg").hidden = false;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails')
				.success(function(data, status, headers, config) {

					$scope.dealerdetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
		    	  }	
			
		}
		
		
		
		$scope.dealerUpdate=function dealerUpdate()
		{
			
			$scope.updatedealerid=$scope.dealereditdata.dealerid;
			
			
			for(i=0;i<$scope.roledetailslist.length;i++)
			{
				alert($scope.roledetailslist[i].rolename+" "+document.getElementById('editdealerrolename').value);
				if($scope.roledetailslist[i].rolename==document.getElementById('editdealerrolename').value)
				{
					$scope.editroleid=$scope.roledetailslist[i].roleid;
				}
			}

			var mydelaerEdit = document.editdealerform;
		      if (mydelaerEdit.editDealername.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editDealername.focus();
		      }
		      else if (mydelaerEdit.editdealertype.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealertype.focus();
		      }
		      else if (mydelaerEdit.editdealermobileno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealermobileno.focus();
		      }
		      else if (mydelaerEdit.editdealeraltno.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealeraltno.focus();
		      }
		      else if (mydelaerEdit.editdealerperadd.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerperadd.focus();
		      }
		      else if (mydelaerEdit.editdealerpercity.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerpercity.focus();
		      }
		      else if (mydelaerEdit.editdealerperpincode.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerperpincode.focus();
		      }
		      else if (mydelaerEdit.editdealerrolebind.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerrolebind.focus();
		      }
		      else if (mydelaerEdit.editdealerloginname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerloginname.focus();
		      }
		      else if (mydelaerEdit.editdealerpassword.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mydelaerEdit.editdealerpassword.focus();
		      }
		      else
		    	  {
		    	  

		    	  var k=0;
		    	  if($scope.$scope.editroleid==null){
						document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Role Name Does Not Exist";
						document.getElementById("errorsmsg").hidden = false;
						 mydelaerEdit.editdealerrolebind.focus();
						k++;
					} 
		    	  if(k==0)
		    		  {
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerupdate?dealerid='+$scope.updatedealerid+'&dealername='+document.getElementById('editDealername').value+'&dealertype='+document.getElementById('editdealertype').value +'&localaddress='+document.getElementById('editlocaladd').value+'&localcity='+document.getElementById('editlocalcity').value+'&localpincode='+document.getElementById('editlocalpincode').value+'&mobilenumber='+document.getElementById('editdealermobileno').value+'&alternatecontnumber='+document.getElementById('editdealeraltno').value+'&permanentaddress='+document.getElementById('editdealerperadd').value+'&permanentcity='+document.getElementById('editdealerpercity').value+'&permcitypincode='+document.getElementById('editdealerperpincode').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('editdealerremark').value+'&companyid='+sptstr[1]+'&available=0&assetid=110015&roleid='+$scope.editroleid+'&loginpassword='+document.getElementById('editdealerpassword').value+'&loginname='+document.getElementById('editdealerloginname').value+'&flag=0')
				.success(function(data, status, headers, config) {
					document.getElementById("maindealer").hidden = false;
					document.getElementById("showeditdealer").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails')
					.success(function(data, status, headers, config) {

						$scope.dealerdetailslist = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				
		document.getElementById("updatemsg").hidden = false;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
		
		    		  }  }
		
		}
		
		
		
		
	});
	scotchApp.controller('netCtrl', function($scope,$http, $compile, $filter) {
	try{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {

			$scope.networkdetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
	}
	catch(e)
	{
		alert(e);
	}
		
		$scope.shownetworkdiv1 = function() {
			//alert("in");
			document.getElementById("showeditnetwork").hidden = false;
			document.getElementById("mainnetwork").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainnetwork").hidden = false;
			document.getElementById("showeditnetwork").hidden = true;
		}
		
		$scope.networkeditdata=function networkeditdata(editnetworkdata)
		{
			$scope.networkdata=editnetworkdata;
		}
		
		
		//company bind
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.networkcompanylist = data;
						
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
		
		
		
		
		$scope.networkInsert=function networkInsert()
		{
			try
			{
				var i=0;
				for(i=0;i<$scope.networkcompanylist.length;i++)
				{
					if($scope.networkcompanylist[i].companyname==document.getElementById('insertnetworkcompname').value)
						{
						
						$scope.netinsertcomid=$scope.networkcompanylist[i].companyid;
						}
		
				}
				
				var mynetworkinsert = document.networkinsertform;
			      if (mynetworkinsert.insertnetworkname.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mynetworkinsert.insertnetworkname.focus();
			      }
			      else if (mynetworkinsert.insertnetworkapn.value== "")
			      {
				    	// alert("company name not be empty");
				    	 mynetworkinsert.insertnetworkapn.focus();
				      }
			      else if (mynetworkinsert.insertnetworkcompname.value== "")
			      {
				    	// alert("company name not be empty");
				    	 mynetworkinsert.insertnetworkcompname.focus();
				      }
			      else
			    	  {
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkinsert?networkname='+document.getElementById('insertnetworkname').value+'&networkapn='+document.getElementById('insertnetworkapn').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('insertnetworkremark').value+'&companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
				
				document.getElementById("successmsg").hidden = false;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {
					$scope.networkdetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			    	  }
		}
			catch(e)
			{
				
			}
		}
		
		
		
		$scope.networkUpdate= function networkUpdate()
		{
			
			alert("in network update");
			try
			{
			$scope.editnetworkid=$scope.networkdata.networkid;
			alert("networkid"+$scope.editnetworkid);
			var i=0;
			for(i=0;i<$scope.networkcompanylist.length;i++)
			{
				alert("in"+$scope.networkcompanylist[i].companyname+""+document.getElementById('editnetworkcomname').value);
				if($scope.networkcompanylist[i].companyname==document.getElementById('editnetworkcomname').value)
					{
					$scope.neteditcomid=$scope.networkcompanylist[i].companyid;
					}
	
			}
			
			var mynetworkEdit = document.networkedit;
		      if (mynetworkEdit.editnetworkname.value== "")
		      {
		    	// alert("company name not be empty");
		    	 mynetworkEdit.editnetworkname.focus();
		      }
		      else if (mynetworkEdit.editnetworkapn.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mynetworkEdit.editnetworkapn.focus();
			      }
		      else if (mynetworkEdit.editnetworkcomname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mynetworkEdit.editnetworkcomname.focus();
			 }
		      else{
			
			alert('http://localhost:8080/indtrackwebservice/rest/CallService/networkupdate?networkid='+$scope.editnetworkid+'&networkname='+document.getElementById('editnetworkname').value+'&networkapn='+document.getElementById('editnetworkapn').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('editnetworkremark').value+'&companyid='+sptstr[1]);
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkupdate?networkid='+$scope.editnetworkid+'&networkname='+document.getElementById('editnetworkname').value+'&networkapn='+document.getElementById('editnetworkapn').value+'&loginid='+sptstr[1]+'&remarks='+document.getElementById('editnetworkremark').value+'&companyid='+sptstr[1])
			.success(function(data, status, headers, config) {

				document.getElementById("mainnetwork").hidden = false;
				document.getElementById("showeditnetwork").hidden = true;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {

					$scope.networkdetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				}); 
			document.getElementById("updatemsg").hidden = false;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
		      }	
			}
			catch(e)
			{
				alert(e);
				
			}
		}
		
		
	});
	
	
	scotchApp.controller('modelCtrl', function($scope,$http, $compile, $filter) {

		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.modeldetailslist = data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$scope.modeleditdata=function modeleditdata(editdatamodel)
		{
			$scope.modeldata=editdatamodel;
		}
		
		
		
		$scope.showmodeldiv1 = function() {
			//alert("in");
			document.getElementById("showeditmodel").hidden = false;
			document.getElementById("mainmodel").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainmodel").hidden = false;
			document.getElementById("showeditmodel").hidden = true;
		}
		
		//mmakelist
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.modelmakenamelist = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
		
		
		
		$scope.modelInsert=function modelInsert()
		{
			
			try
			{	var i=0;
				for(i=0;i<$scope.modelmakenamelist.length;i++)
				{
					if($scope.modelmakenamelist[i].makename==document.getElementById('insertmodelmakename').value)
						{
						 $scope.insertmodelmakeid=$scope.modelmakenamelist[i].makeid;
						}
			}
				
				
				var mymodelinsert = document.modelforminsert;
			      if (mymodelinsert.insertmodelname.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mymodelinsert.insertmodelname.focus();
			      }
			      else  if (mymodelinsert.insertmodelmakename.value== "")
			      	{
				    	// alert("company name not be empty");
				    	 mymodelinsert.insertmodelmakename.focus();
				      }
			      else  {
			    	  
			    	  var k=0;
			    	  if($scope.insertmodelmakeid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							mymodelinsert.insertmodelmakename.focus();
							k++;
						} 
			    	  if(k==0)
			    		  {
			    	  
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelinsert?modelname='+document.getElementById('insertmodelname').value+'&makeid='+$scope.insertmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmodelmakename').value)
			.success(function(data, status, headers, config) {
				document.getElementById("successmsg").hidden = false;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2])
				.success(function(data, status, headers, config) {

					$scope.modeldetailslist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			}
			      } 
			}
			catch(e)
			{
				alert(e);
			}
			
		}
		
		
		
		$scope.modelUpdate=function modelUpdate()
		{
			try
			{
				
				$scope.eidtmodelid=$scope.modeldata.modelid;
					
				var i=0;
				for(i=0;i<$scope.modelmakenamelist.length;i++)
				{
					if($scope.modelmakenamelist[i].makename==document.getElementById('modeleditmakename').value)
						{
						 $scope.editmodelmakeid=$scope.modelmakenamelist[i].makeid;
						}
				}
				
				
				var mymodeledit = document.modeleditForm;
			      if (mymodeledit.editmodelname.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mymodeledit.editmodelname.focus();
			      }
			      else  if (mymodeledit.modeleditmakename.value== "")
			      {
			    	// alert("company name not be empty");
			    	 mymodeledit.modeleditmakename.focus();
			      }
			      else 
			    	  {
			    	  
			    	  var k=0;
			    	  if($scope.editmodelmakeid==null){
							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
							document.getElementById("errorsmsg").hidden = false;
							 mymodeledit.modeleditmakename.focus();
							k++;
						} 
			    	  if(k==0)
			    		  {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelUpdate?modelid='+$scope.eidtmodelid+'&modelname='+document.getElementById('editmodelname').value+'&makeid='+$scope.editmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editmodelremark').value)
				.success(function(data, status, headers, config) {
					document.getElementById("mainmodel").hidden = false;
					document.getElementById("showeditmodel").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {

						$scope.modeldetailslist = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					document.getElementById("updatemsg").hidden = false;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			    	  }
			}
			}
			catch(e)
			{
				alert(e);
				
			}
		}
		
		
	});
	
	
	scotchApp.controller('vendorCtrl', function($scope,$http, $compile, $filter) {
		try
		{
// 		alert("in controller");
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2])
		.success(function(data, status, headers, config) {
			$scope.vendordetailslist = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			$scope.vendorassetdetails = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		}catch(e)
		{
			alert(e);
		}
		
		
		$scope.showvendordiv1 = function() {
			//alert("in");
			document.getElementById("showeditvendor").hidden = false;
			document.getElementById("mainvendor").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainvendor").hidden = false;
			document.getElementById("showeditvendor").hidden = true;
		}
		
		
		$scope.vendoreditdata = function vendoreditdata(vendor){
			$scope.vendorupdate = vendor;
		}
		
		
		$scope.vendorInsert=function vendorInsert()
		{
			try
			{
				var i=0;
				for(i=0;i<$scope.vendorassetdetails.length;i++){
					if($scope.vendorassetdetails[i].assetname==document.getElementById("insertvendorassetname").value){
						$scope.vendorassetid = $scope.vendorassetdetails[i].assettypeid;
					}
				}
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendorinsert?'
						+'vendorfirmname='+document.getElementById('insertvendorname').value+
						'&vendoraddress='+document.getElementById('insertvendoraddress').value+
						'&city='+document.getElementById('insertvendorcity').value+
						'&statename='+document.getElementById('insertvendorstate').value+
						'&landlinenumber='+document.getElementById('insertvendorlandlineno').value+
						'&contactperson='+document.getElementById('insertvendorcontactperson').value+
						'&designation='+document.getElementById('insertvendordesignation').value+
						'&mobilenumber='+document.getElementById('insertvendormobileno').value+
						'&emailid='+document.getElementById('insertvendoremailid').value+
						'&assettypeid='+$scope.vendorassetid+'&servicestationaddr='
						+document.getElementById('insertvendorserstationadd').value+
						'&servstationcontactno='+document.getElementById('insertvendorserstationcontactno').value+
						'&creditdays='+document.getElementById('insertvendorcreditdays').value+
						'&loginid='+sptstr[2]+'&paymentdate='+document.getElementById('insertvendorpaymentdate').value+
						'&remarks='+document.getElementById('insertvendorremark').value)
					.success(function(data, status, headers, config) {
					
					alert("success");
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.vendordetailslist = data;
						
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				
			}
			catch(e)
			{
				alert(e);
			}
		}
		
		
		
		$scope.vendorUpdate=function vendorUpdate()
		{
			try
			{
				var i=0;
				for(i=0;i<$scope.vendorassetdetails.length;i++){
					if($scope.vendorassetdetails[i].assetname==document.getElementById("updatevendorassetname").value){
						$scope.vendorassetidedit = $scope.vendorassetdetails[i].assettypeid;
					}
				}
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendorupdate?'
						+'vendorid='+$scope.vendorupdate.vendorid
						+'&vendorfirmname='+document.getElementById('updatevendorname').value+
						'&vendoraddress='+document.getElementById('updatevendoraddress').value+
						'&city='+document.getElementById('updatevendorcity').value+
						'&statename='+document.getElementById('updatevendorstate').value+
						'&landlinenumber='+document.getElementById('updatevendorlandlineno').value+
						'&contactperson='+document.getElementById('updatevendorcontactperson').value+
						'&designation='+document.getElementById('updatevendordesignation').value+
						'&mobilenumber='+document.getElementById('updatevendormobileno').value+
						'&emailid='+document.getElementById('updatevendoremailid').value+
						'&assettypeid='+$scope.vendorassetidedit+'&servicestationaddr='
						+document.getElementById('updatevendorserstationadd').value+
						'&servstationcontactno='+document.getElementById('updatevendorserstationcontactno').value+
						'&creditdays='+document.getElementById('updatevendorcreditdays').value+
						'&loginid='+sptstr[2]+'&paymentdate='+document.getElementById('updatevendorpaymentdate').value+
						'&remarks='+document.getElementById('updatevendorremark').value)
					.success(function(data, status, headers, config) {

					alert("success");
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.vendordetailslist = data;
						document.getElementById("mainvendor").hidden = false;
						document.getElementById("showeditvendor").hidden = true;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});

				}).error(function(data, status, headers, config) {
					alert(data);
					console.log('error: data = ', data);
				});
				
				
			}
			catch(e)
			{
				alert(e);
			}
		}
		
		
	});
	}catch(e){alert(e);}
  </script>
</head>

<!-- define angular controller -->
<body ng-controller="mainController">
    <div id="navbar" class="navbar navbar-default" style="background: -moz-linear-gradient(top, rgba(143,2,34,1) 62%, rgba(109,0,25,1) 100%); ">
			

			<div class="navbar-container" id="navbar-container" >
				<button type="button" class="navbar-toggle menu-toggler pull-left"
					id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
					 <small> 
<!-- 					 <i	class="fa fa-leaf"></i> -->
							Vehicle Tracking System
					</small>
					</a>
				</div>
				<div class="navbar-buttons navbar-header pull-right"
					role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li><a 
							href="#"  > <i
								class=""></i>  Welcome: {{name}}
						</a></li>
					
						<li><a 	href="Logout" ng-click="logout()" class="dropdown-toggle" > <i
								class="fa fa-power-off"></i> Logout
						</a></li>
						
					</ul>
				</div>
			</div>
			<!-- /.navbar-container -->
		</div>

<div class="main-container" id="main-container" >
			<div id="sidebar" class="sidebar responsive" style="background: -moz-linear-gradient(20deg, rgba(192,192,192,1) 0%, rgba(255,255,255,1) 50%, rgba(128,128,128,1) 100%);background-color:#EEEEEE">
				
			<ul class="nav nav-list">
<!-- 				<li class=""><a href="#/home"> <i -->
<!-- 							class="menu-icon fa fa-tachometer" style="color: black"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="black">DashBoard </font></span> -->
<!-- 					</a></li> -->
					<li ng-repeat="x in menus | filter:{parentid: '11'}" >
						<a href="{{x.navigateurl}}" class="dropdown-toggle"> <i
								class="menu-icon fa {{x.description}}" style="color:black" ></i> <span
								class="menu-text" > <font
									color="black">{{x.menutext}}</font> </span> <b class="arrow fa fa-angle-down"></b>
						</a> <b class="arrow"></b>
						<ul class="submenu">
							<li ng-repeat="y in menus | filter:{parentid: x.menuid}|orderBy:orderno" style="background: -moz-linear-gradient(20deg, rgba(192,192,192,1) 0%, rgba(255,255,255,1) 50%, rgba(128,128,128,1) 100%);"><a href="{{y.navigateurl}}"> <i
									class="menu-icon fa fa-caret-right"></i> <font color="white">{{y.menutext}}
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

			<div id="pagecontent" class="main-content" style="height:900px">
				<div class="main-content-inner">
					<div class="page-content">
<!-- 						ng-view     -->
						<ng-view>Loading...</ng-view>
					</div>
				</div>
			</div>
		</div>
		<!-- Inline Templates (Partials) -->

<div ng-controller="alertcntrl">
<div id="successmsg" hidden class="cd">
	  <div class="cd modal-dialog">
	    <div class="modal-content">
	    <div class="modal-header">
	<!-- 		<button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<h4 class="modal-title">
			<img src="<c:url value="/resources/assets/images/info.gif"/>"/>Success Message
			</h4>
			</div>
	        <div class="modal-body" id="textsuccess">
<%-- 	      <img src="<c:url value="/resources/assets/images/information.gif"/>"/> --%>
	   		<center>Records Saved Successfully!</center>
	        </div>
	         <div class="modal-footer">
	        <button type="button" class="btn btn-success" ng-click="close();">Close</button>
	      </div>
	    </div>
	  </div>
  </div>
  
  <div id="updatemsg" hidden class="cd">
	  <div class="cd modal-dialog">
	    <div class="modal-content">
	    <div class="modal-header">
	<!-- 		<button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<h4 class="modal-title">
			<img src="<c:url value="/resources/assets/images/info.gif"/>"/>Success Message
			</h4>
			</div>
	        <div class="modal-body">
<%-- 	      <img src="<c:url value="/resources/assets/images/information.gif"/>"/> --%>
	   		<center>Records Updated Successfully!</center>
	        </div>
	         <div class="modal-footer">
	        <button type="button" class="btn btn-success" ng-click="closeupdate();">Close</button>
	      </div>
	    </div>
	  </div>
  </div>
  <div id="errorsmsg" hidden class="cd">
	  <div class="cd modal-dialog">
	    <div class="modal-content">
	    <div class="modal-header">
	<!-- 		<button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<h4 class="modal-title">
			<img src="<c:url value="/resources/assets/images/important.gif"/>"/>Warning Message
			</h4>
			</div>
	        <div class="modal-body" id="texterror">
<%-- 	      <img src="<c:url value="/resources/assets/images/important.gif"/>"/> --%>
	   		<center>Problem in Saving Records!</center>
	        </div>
	         <div class="modal-footer">
	        <button type="button" class="btn btn-warning" ng-click="error();">Close</button>
	      </div>
	    </div>
	  </div>
  </div>
   <div id="phonevalidmsg" hidden class="cd">
	  <div class="cd modal-dialog">
	    <div class="modal-content">
	    <div class="modal-header">
	<!-- 		<button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<h4 class="modal-title">
			<img src="<c:url value="/resources/assets/images/important.gif"/>"/>Warning Message
			</h4>
			</div>
	        <div class="modal-body" id="texterror">
<%-- 	      <img src="<c:url value="/resources/assets/images/important.gif"/>"/> --%>
	   		<center>Mobile Number Is Not Valid</center>
	        </div>
	         <div class="modal-footer">
	        <button type="button" class="action-button shadow animate red" ng-click="phonevalid();"><font color="black">Ok</font></button>
	      </div>
	    </div>
	  </div>
  </div>
  


 
  <div id="phonenolength" hidden class="cd">
	  <div class="cd modal-dialog">
	    <div class="modal-content">
	    <div class="modal-header">
	<!-- 		<button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<h4 class="modal-title">
			<img src="<c:url value="/resources/assets/images/important.gif"/>"/>Warning Message
			</h4>
			</div>
	        <div class="modal-body" id="texterror">
<%-- 	      <img src="<c:url value="/resources/assets/images/important.gif"/>"/> --%>
	   		<center>Number should not be less than 10 Digit</center>
	        </div>
	         <div class="modal-footer">
	        <button type="button" class="action-button shadow animate red" ng-click="phonelength();"><font color="black">Ok</font></button>
	      </div>
	    </div>
	  </div>
  </div>
  
  </div>  
  

<style>


 .nav-list > li .submenu > li > a  
 {
 background-color:#282424; 
 } 

	.cd {
/*   		display:none; */
			width:450px;
			position:relative;
		    top:120px;
 		 	left: 330px; 
/* 			z-index:500px;  */
			position: fixed;
			padding: 1px;
			background-color:white;
		}
		
		
		
		.clearable{
/*   background: #fff url('<c:url value='/resources/images/backgro.jpg'/>') no-repeat right -10px center; */
   background: #fff  no-repeat right -10px center;
 
  border: 1px solid #999;
  padding: 3px 18px 3px 4px; /* Use the same right padding (18) in jQ! */
  border-radius: 3px;
  transition: background 0.4s;
}
.clearable.x  { background-position: right 5px center; }
.clearable.onX{ cursor: pointer; }
.clearable::-ms-clear {display: none; width:0; height:0;}
	


.animate
{
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.action-button
{
	position: relative;
/* 	padding: 10px 40px; */
    padding: 10px 40px;
  	margin: 0px 10px 10px 0px;
/*   	float: left; */
	border-radius: 10px;
/* font-family: 'Pacifico', cursive;  */
font-family: 'Pacifico'; 

	font-size: 12px;
	color: #FFF;
	text-decoration: none;	
	
/* 	text-align: center; */
}

.blue
{	

	background-color: #3498DB;
	border-bottom: 5px solid #2980B9;
	text-shadow: 0px -2px #2980B9;
}

.red
{
	background-color: #E74C3C;
	border-bottom: 5px solid #BD3E31;
	text-shadow: 0px -2px #BD3E31;
}

.green
{
	background-color: #82BF56;
	border-bottom: 5px solid #669644;
	text-shadow: 0px -2px #669644;
}

.yellow
{
	background-color: #F2CF66;
	border-bottom: 5px solid #D1B358;
	text-shadow: 0px -2px #D1B358;
}

.action-button:active
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}
		
</style>
</body>

</html>
