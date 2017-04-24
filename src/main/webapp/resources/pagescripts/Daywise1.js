/**
 * 
 */

scotchApp.controller('daywiseAllvehicleCtrl', function($scope,$http, $compile, $filter)
			{	
	var time = new Date();
	
	var diffMs = (time-mydate); // milliseconds between now & Christmas
	var diffDays = Math.round(diffMs / 86400000); // days
	var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
	var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
	if(diffMins>20){
		jAlert('Session Expired Please Login Again','Information');
		window.location.replace("Logout");
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
		   		$scope.pagesno = [20,50,80,100,120];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.reportvehicledetails = data;
				
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				$("#reportallvehicles").change(function () {
				
			        var name = this.value;
			       
			        if(name=='Day wise All Vehicles'){
			        	document.getElementById('daywise').hidden=false;
						document.getElementById('daterangewise').hidden=true;
						document.getElementById('daywiseparticular').hidden=true;
						document.getElementById('datewisevehicles').hidden=true;
						
						document.getElementById('dayparticulart').hidden=true;
						document.getElementById('daterangeparticulart').hidden=true;
						
						
						document.getElementById('datrangeallchart').hidden=true;
						document.getElementById('dayallchart').hidden=true;
						
				    }else if(name=='Date Range wise All Vehicles'){
				    	document.getElementById('daterangewise').hidden=false;
						document.getElementById('daywise').hidden=true;
						document.getElementById('daywiseparticular').hidden=true;
						document.getElementById('datewisevehicles').hidden=true;
						
						document.getElementById('dayparticulart').hidden=true;
						document.getElementById('daterangeparticulart').hidden=true;
						document.getElementById('datrangeallchart').hidden=true;
						document.getElementById('dayallchart').hidden=true;
						
						
				    }
				    else if(name=='Day wise Vehicles'){
			        	document.getElementById('daywiseparticular').hidden=false;
						document.getElementById('datewisevehicles').hidden=true;
						document.getElementById('daywise').hidden=true;
						document.getElementById('daterangewise').hidden=true;
						
						document.getElementById('dayparticulart').hidden=true;
						document.getElementById('daterangeparticulart').hidden=true;
						document.getElementById('datrangeallchart').hidden=true;
						document.getElementById('dayallchart').hidden=true;
						
				    }else if(name=='Date Range wise Vehicles'){
				    	document.getElementById('datewisevehicles').hidden=false;
						document.getElementById('daywiseparticular').hidden=true;
						document.getElementById('daywise').hidden=true;
						document.getElementById('daterangewise').hidden=true;
						
						document.getElementById('dayparticulart').hidden=true;
						document.getElementById('daterangeparticulart').hidden=true;
						document.getElementById('datrangeallchart').hidden=true;
						document.getElementById('dayallchart').hidden=true;
				    }
				   
				});
				
				$scope.getReport=function getReport()
				{
					
					var myform = document.daywisallform;
				      if (myform.allvehiclesDay.value== "")
				      {
				    	  myform.allvehiclesDay.focus();
				      }	
				      else {
					
					
				 var over = '<div id="overlay">' +
////			     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
			    $(over).appendTo('body');
					try
					{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesDay').value+'&tdate=&loginid1='+sptstr[2])
					.success(function(data, status, headers, config) {
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
						.success(function(data, status, headers, config) {
							$scope.daywiseAllvehiclesList = data;
							
							document.getElementById('daywisereport').hidden=false;
							document.getElementById('dayallchart').hidden=false;
							document.getElementById('daterangeparticulart').hidden=true;
							document.getElementById('dayparticulart').hidden=true;
							document.getElementById('datrangeallchart').hidden=true;
							
							
							try
							{
								 function drawVisualization() {
									
									    // Some raw data (not necessarily accurate)
									 try{
									 var data = new google.visualization.DataTable();
								      data.addColumn('string', 'VehicleNo');
								      data.addColumn('number', 'Distance');
								      var m =0;
								      for(m = 0;m < $scope.daywiseAllvehiclesList.length;m++){
								    	   data.addRows([
									        [String($scope.daywiseAllvehiclesList[m].vehicleno), Number($scope.daywiseAllvehiclesList[m].total)
									         ]
									      ]);
								      }
									 

								    var options = {
								      title : '',
								      legend:'right',
								      colors:["#FF9900"],
								      is3D:true,
								      bar: {groupWidth: '30%'},
								      vAxis: {title: 'Distance'},
								      hAxis: {title: 'Vehicle no'},
								      seriesType: 'bars',
								      series: {5: {type: 'line'}}
								     
								    };

								    var chart = new google.visualization.ComboChart(document.getElementById('vehiclechart'));
								    chart.draw(data, options);
									 }catch(e){
										 alert(e);
										 
									 }
								  }
								   google.load("visualization", "1", {
								        packages: ["corechart"],
								        callback: drawVisualization
								    });
							}
							catch(e)
							{
							  
							}
							
							$('#overlay').remove();
						}).error(function(data, status, headers, config) {
							 $('#overlay').remove();
							 jAlert('No Data Found','Information');
							console.log('error: data = ', data);
						});
						
					}).error(function(data, status, headers, config) {
						 $('#overlay').remove();
						 jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					});
					}catch(e){}
					
				}	
				}
				
				
				

				
				
				$scope.getRangewisereport=function()
				{
					
					var myform = document.allvehdaterangeform;
				      if (myform.allvehiclesdate1.value== "")
				      {
				    	  myform.allvehiclesdate1.focus();
				      }	
				      else  if (myform.allvehiclesdate2.value== "")
				      {
				    	  myform.allvehiclesdate2.focus();
				      }	
				      else {
					
					
					
					 var over = '<div id="overlay">' +
////			     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
			    $(over).appendTo('body');
			    try{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesdate1').value+'&tdate='+document.getElementById('allvehiclesdate2').value+'&loginid1='+sptstr[2])
					.success(function(data, status, headers, config) {
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
						.success(function(data, status, headers, config) {
							$scope.daterangewiseAllvehiclesList = data;
						
							document.getElementById('daterangeall').hidden=false;
							document.getElementById('datrangeallchart').hidden=false;
							document.getElementById('dayallchart').hidden=true;
							document.getElementById('daterangeparticulart').hidden=true;
							document.getElementById('dayparticulart').hidden=true;
							

							try
							{
								 function drawVisualization() {
									
									    // Some raw data (not necessarily accurate)
									 try{
									 var data = new google.visualization.DataTable();
								      data.addColumn('string', 'VehicleNo');
								      data.addColumn('number', 'Distance');
								      var m =0;
								      for(m = 0;m < $scope.daterangewiseAllvehiclesList.length;m++){
								    	   data.addRows([
									        [String($scope.daterangewiseAllvehiclesList[m].vehicleno), Number($scope.daterangewiseAllvehiclesList[m].total)
									         ]
									      ]);
								      }
									 

								    var options = {
								      title : '',
								      legend:'right',
								      colors:["#FF9900"],
								      is3D:true,
								      bar: {groupWidth: '30%'},
								      vAxis: {title: 'Distance'},
								      hAxis: {title: 'Vehicle no'},
								      seriesType: 'bars',
								      series: {5: {type: 'line'}}
								     
								    };

								    var chart = new google.visualization.ComboChart(document.getElementById('vehiclechartdaterange'));
								    chart.draw(data, options);
									 }catch(e){
										 alert(e);
										 
									 }
								  }
								   google.load("visualization", "1", {
								        packages: ["corechart"],
								        callback: drawVisualization
								    });
							}
							catch(e)
							{
							  alert(e);	
							}
							
						
							 $('#overlay').remove();
						}).error(function(data, status, headers, config) {
							 $('#overlay').remove();
							 jAlert('No Data Found','Information');
							console.log('error: data = ', data);
							
						});
						
					}).error(function(data, status, headers, config) {
						 $('#overlay').remove();
						 jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					
					});
			    }catch(e){};	
					
	
				}
					
				}
				
								
				
				
				
				
//				vehcilewis
				
				$scope.getDaywiseParticularvehiclereport=function()
				{
					var myform2 = document.particulardateform;
				      if (myform2.particularvehicleday.value== "")
				      {
				    	  myform2.particularvehicleday.focus();
				      }	
				      else  if (myform2.daywisevehicleno.value== "")
				      {
				    	  myform2.daywisevehicleno.focus();
				      }	
				      else {
					
					
					 var over = '<div id="overlay">' +
//	     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
		    $(over).appendTo('body');
						try
						{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno='+document.getElementById('daywisevehicleno').value+'&fdate='+document.getElementById('particularvehicleday').value+'&tdate=&loginid1='+sptstr[2])
					.success(function(data, status, headers, config) {
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
						.success(function(data, status, headers, config) {
							$scope.reportvehicledetails = data;
							document.getElementById('dateiwsevehi').hidden=false;
							document.getElementById('dayparticulart').hidden=false;
							document.getElementById('datrangeallchart').hidden=true;
							document.getElementById('dayallchart').hidden=true;
							document.getElementById('daterangeparticulart').hidden=true;
							
							
							try
							{
								 function drawVisualization() {
									
									    // Some raw data (not necessarily accurate)
									 try{
									 var data = new google.visualization.DataTable();
								      data.addColumn('string', 'VehicleNo');
								      data.addColumn('number', 'Distance');
								      var m =0;
								      for(m = 0;m < $scope.reportvehicledetails.length;m++){
								    	   data.addRows([
									        [String($scope.reportvehicledetails[m].vehicleno), Number($scope.reportvehicledetails[m].total)
									         ]
									      ]);
								      }
									 

								    var options = {
								      title : '',
								      legend:'right',
								      colors:["#FF9900"],
								      is3D:true,
								      bar: {groupWidth: '30%'},
								      vAxis: {title: 'Distance'},
								      hAxis: {title: 'Vehicle no'},
								      seriesType: 'bars',
								      series: {5: {type: 'line'}}
								     
								    };

								    var chart = new google.visualization.ComboChart(document.getElementById('vehiclechartdaywise'));
								    chart.draw(data, options);
									 }catch(e){
										 
										 
									 }
								  }
								   google.load("visualization", "1", {
								        packages: ["corechart"],
								        callback: drawVisualization
								    });
							}
							catch(e)
							{
							  	
							}
							
							
							
							
							
							 $('#overlay').remove();
						}).error(function(data, status, headers, config) {
							 $('#overlay').remove();
							 jAlert('No Data Found','Information');
							console.log('error: data = ', data);
							
						});
						
					}).error(function(data, status, headers, config) {
						 $('#overlay').remove();
						 jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					});
						}
						catch(e){}
					
				}
				
			}
				
				
				$scope.getdatewisevehicle=function getdatewisevehicle()
				{
					
					var myform3 = document.particulardaterangeForm;
				      if (myform3.particularvehicledate1.value== "")
				      {
				    	  myform3.particularvehicledate1.focus();
				      }	
				      else  if (myform3.particularvehicledate2.value== "")
				      {
				    	  myform3.particularvehicledate2.focus();
				      }	
				      else  if (myform3.datewisevehicleno.value== "")
				      {
				    	  myform3.datewisevehicleno.focus();
				      }	
				      else {
					
					
					
					 var over = '<div id="overlay">' +
//				     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
					     '</div>';
					    $(over).appendTo('body');
					    
					    
					    $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno='+document.getElementById('datewisevehicleno').value+'&fdate='+document.getElementById('particularvehicledate1').value+'&tdate='+document.getElementById('particularvehicledate2').value+'&loginid1='+sptstr[2])
						.success(function(data, status, headers, config) {
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
							.success(function(data, status, headers, config) {
								$scope.rangewisevehicle = data;
								document.getElementById('daterangewisevehi').hidden=false;
								document.getElementById('daterangeparticulart').hidden=false;
								document.getElementById('dayparticulart').hidden=true;
								document.getElementById('datrangeallchart').hidden=true;
								document.getElementById('dayallchart').hidden=true;
							
								
								
								try
								{
									 function drawVisualization() {
										
										    // Some raw data (not necessarily accurate)
										 try{
										 var data = new google.visualization.DataTable();
									      data.addColumn('string', 'VehicleNo');
									      data.addColumn('number', 'Distance');
									      var m =0;
									      for(m = 0;m < $scope.rangewisevehicle.length;m++){
									    	   data.addRows([
										        [String($scope.rangewisevehicle[m].vehicleno), Number($scope.rangewisevehicle[m].total)
										         ]
										      ]);
									      }
										 

									    var options = {
									      title : '',
									      legend:'right',
									      colors:["#FF9900"],
									      is3D:true,
									      bar: {groupWidth: '30%'},
									      vAxis: {title: 'Distance'},
									      hAxis: {title: 'Vehicle no'},
									      seriesType: 'bars',
									      series: {5: {type: 'line'}}
									     
									    };

									    var chart = new google.visualization.ComboChart(document.getElementById('vehiclechartdaterangewise'));
									    chart.draw(data, options);
										 }catch(e){
											 
											 
										 }
									  }
									   google.load("visualization", "1", {
									        packages: ["corechart"],
									        callback: drawVisualization
									    });
								}
								catch(e)
								{
								  	
								}
								
								
								
								
								
								 $('#overlay').remove();
							}).error(function(data, status, headers, config) {
								 $('#overlay').remove();
								 jAlert('No Data Found','Information');
								console.log('error: data = ', data);
								
							});
							
						}).error(function(data, status, headers, config) {
							 $('#overlay').remove();
							 jAlert('No Data Found','Information');
							console.log('error: data = ', data);
						});
					
				}
				
				
				
				}
				
				
				
	
					
			});
			




			
