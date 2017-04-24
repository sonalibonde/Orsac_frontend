/**
 * 
 */

scotchApp.controller('vehdevctrl', function($scope,$http, $compile, $filter) {
			
//			alert("hello");
			var time = new Date();
				
				var diffMs = (time-mydate); // milliseconds between now & Christmas
				var diffDays = Math.round(diffMs / 86400000); // days
				var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
				var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
				if(diffMins>20){
					jAlert('Session Expired Please Login Again','Information');
					window.location.replace("/");
				}
				mydate = new Date();
				
				clearInterval(interval);

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
							$scope.query = {};
					   		$scope.queryBy = '$';
					   		$scope.pagesno = [20,50,80,100,120,240];
							$scope.pagesint=20;
							$scope.onpagechange = function(page){
								$scope.pagesint=page;
							}
							
//							alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyvehicleno=');
//							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyvehicleno=')
//							.success(function(data, status, headers, config) {
//								
//								var country = [];
//			  					for(var i=0;i<data.length;i++){
//			  						country.push(data[i].vehicleregno);
//			  					}
////			  					alert(country.length);
//			  					$("#vehdealerdetails").select2({
//									  data: country
//								});
//			  					
//							}).error(function(data, status, headers, config) {
//								console.log('error: data = ', data);
//							});
							try{
							
							 $scope.getCustomers = function(){
								 alert("in change");
								 alert('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid=&companyid='+sptstr[7]+'&dealerid='+$scope.vehdealerdetails);
								 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid=&companyid='+sptstr[7]+'&dealerid='+$scope.vehdealerdetails)
									.success(function(data, status, headers, config) {
										$scope.customerList = data;
										$("#devcustomer").select2();
									}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									});
						      }
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
							.success(function(data, status, headers, config) {
									$scope.dealerdetailslist= data;
									$("#vehdealerdetails").select2();
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							
							
							}catch(e){
								alert(e);
							}
							
		  					
				$scope.VehicleInsert = function(){
					alert("in");
					
					
				}
				
			});

