/**
 * 
 */
		
	scotchApp.controller('dealerdasboardctrl', function($scope,$http, $compile, $filter)
	{
		$scope.loginid = sptstr[2];	
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
		
		$scope.loginid = sptstr[2];
		clearInterval(interval);
		$(document).ready(function(){
			  $('#popdanger').popover({ 
			    html : true,
			    content: function() {
			      return $('#popover_content_wrapper').html();
			    }
			  });
			});
		
		
		
		$(document).ready(function(){
			  $('#solddanger').popover({ 
			    html : true,
			    content: function() {
			      return $('#solddevice').html();
			    }
			  });
			});
		
		
		
		$(document).ready(function(){
			  $('#availddanger').popover({ 
			    html : true,
			    content: function() {
			      return $('#availableDevice').html();
			    }
			  });
			});
		
		$(document).ready(function(){
			  $('#custdanger').popover({ 
			    html : true,
			    content: function() {
			      return $('#dealercustomer').html();
			    }
			  });
			});
		
		
		$scope.showtext=function showtext()
		{
			
			document.getElementById('customerdet').hidden=false;
			document.getElementById('showgraph').hidden=true;
		}
		
		$scope.showgraph=function showgraph()
		{
			
			document.getElementById('customerdet').hidden=true;
			document.getElementById('showgraph').hidden=false;
		}
		
		
		
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		$scope.pagesno = [10,50,100,150,200,300];
			$scope.pagesint=10;
			$scope.onpagechange = function(page){
			$scope.pagesint=page;
			}
			
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdashvalues?loginid='+sptstr[2])
		.success(function(data, status, headers, config) {
			$scope.totaldevicessold = data;
		
			$scope.soldtotal=data.solddevice;
			$scope.totalDevice=data.totaldevice;
			$scope.AvialDevice=data.availabledevice;
			$scope.damagedDev=data.damageddevice;
			$scope.dealercustdetailslist=data.customers;
			$scope.subdealerdetailslist=data.dealers;
			
			
			$(function () {
			    function drawChart() {
			   
			        var data = google.visualization.arrayToDataTable([
			            ['task', 'percentage'],
			            ['Sold', Number($scope.soldtotal)],
			            ['Available', Number($scope.AvialDevice)],
			            ['Damaged', Number($scope.damagedDev)],
			           
			        ]);
		       var options = {
			            title: '',
			            colors: ["#250F3C",
						"orange", "#A282C1" ],
						 is3D: true,
						// legend:'left'
						 
//			 			 width: 400,
						
		 			
			        };
		      var chart = new google.visualization.PieChart(document.getElementById('chartid'));
			        
			        chart.draw(data, options);
			    }

			    google.load("visualization", "1", {
			        packages: ["corechart"],
			        callback: drawChart
			    });
			});
			
				
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
	
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2])
		.success(
				function(data, status, headers,config) {
					
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
					$scope.temper = data.temper;
					$scope.ac = data.ac;
					$scope.overspeed = data.overspeed;
					
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				
				});
		

	//solddevicedetailsdealers	
		

			try{
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getSubdealerssolddeatils?loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
					$scope.solddetailslist1 = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			}catch(e){
				alert(e);
			}
							
							try{
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getdealercustdetails?loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
									$scope.jsonArr = [];
									$scope.DetailsOfdealercust = data;
									$scope.dealername=data[0].dealername;
									var i=0,count=0,j=0,h=0;
									for(j=0;j<$scope.DetailsOfdealercust.length;j++)
										{
										if($scope.dealername==$scope.DetailsOfdealercust[j].dealername)
											{
											//$scope.dealername=$scope.DetailsOfdealercust[j].dealername
											count=count+1;
											
											}
										else
											{
											h++;
											try{
												$scope.jsonArr.push({
												       dealername:$scope.dealername,
												       count: count
												    });
												$scope.dealername = data[j].dealername;
											
											count=1;
											}catch(e){
												alert(e);
											}
										}
										
									}
										$scope.jsonArr.push({
										       dealername:$scope.dealername,
										       count: count
										    });
						
							$(function () {
							    function drawChart() {
							    	try{
							    	 var data = new google.visualization.DataTable();
								      data.addColumn('string', 'Dealers');
								      data.addColumn('number', 'Customers');
								      for(var m = 0;m < $scope.jsonArr.length;m++){
//								    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
									      data.addRows([
									        [String($scope.jsonArr[m].dealername), Number($scope.jsonArr[m].count)]
									      ]);
								      }
							    	}catch(e){
							    		alert(e);
							    	}
							    	
						       var options = {
							            title: '',
							            colors: ["#250F3C" ],
										 is3D: true,
										 bar: {groupWidth: '60%'},
										    isStacked: true,
										    hAxis: {
									            minValue: 0, format: '0'
									          },
										legend:'bottom'
										 
//							 			 width: 400,
										
						 			
							        };
						      var chart = new google.visualization.BarChart(document.getElementById('bar_chart'));
							        
							        chart.draw(data, options);
							    }

							    google.load("visualization", "1", {
							        packages: ["corechart"],
							        callback: drawChart
							    });
							});
							
							}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								
								});
							}catch(e){alert(e);}
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
							.success(
									function(data, status, headers, config) {
										$scope.users = data;
										$scope.alldata = data;
									}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									
									});
							$scope.keyc;
							$scope.getsorted = function(key){
								try{
									$scope.keyc = key;
									getData(key);
								}catch(e){
									alert(e);
								}
							}
							
							
							function getData(key){
								if(key=='all'){
									$scope.users = $scope.alldata;
								}
								
								if(key=='ac'){
									$scope.users = [];
								}
								
								if(key=='temper'){
									$scope.users = [];
								}
									
									
								if(key=='ignnumberoff'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].ignumber=='resources/images/IGINOff.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								
								if(key=='ignnumberon'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].ignumber=='resources/images/IGINIOn.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								
								if(key=='gpsoff'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].gpsstatus=='resources/images/GPSOFF.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								if(key=='gpson'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].gpsstatus=='resources/images/GPSON.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								if(key=='hault'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].vehiclestatus=='resources/images/hand.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								if(key=='running'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].vehiclestatus=='resources/images/run.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								
								if(key=='stop'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].vehiclestatus=='resources/imagenew/stop.png'){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
								
								
								if(key=='overspeed'){
									var i=0,j=1;
									$scope.users = [];
									
									for(i=0;i<$scope.alldata.length;i++){
										if($scope.alldata[i].vehiclespeed>35){
											$scope.alldata[i].rowno=j;
											$scope.users.push($scope.alldata[i]);
											j++;
										}
									}
								}
							}
				

							//getting assigned details 
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdashsimvehicledetails?loginid='+sptstr[2])
							.success(
									function(data, status, headers, config) {
										$scope.details=data;
										$scope.dealername=data[0].dealername;
										$scope.simassign=data[0].simassigned;
										$scope.simnotassin=data[0].simnotassigned;
										$scope.vehassigned=data[0].vehicleassigned;
										$scope.vehnotass=data[0].vehiclenotassigned;
										
										
										
										 function drawVisualization() {
										        // Some raw data (not necessarily accurate)
											 
											 var data = new google.visualization.DataTable();
										      data.addColumn('string', 'Dealers');
										      data.addColumn('number', 'Sim Assigned');
										      data.addColumn('number', 'Sim  Not Assigned');
										      data.addColumn('number', 'Vehicle Assigned');
										      data.addColumn('number', 'Vehicle Not Assigned');
										      for(var m = 0;m < $scope.details.length;m++){
											      data.addRows([
											        [String($scope.details[m].dealername), Number($scope.details[m].simassigned),Number($scope.details[m].simnotassigned),
											         Number($scope.details[m].vehicleassigned),Number($scope.details[m].vehiclenotassigned)
											         ]
											      ]);
										      }
											 
//										        var data = google.visualization.arrayToDataTable([
//										         ['Month', 'SimAssigned', 'SimnotAssigned', 'VehicleAssigned', 'VehiclenotAssigned'],
////										         [$scope.dealername,Number($scope.simassign),Number($scope.simnotassin),Number($scope.vehassigned),Number($scope.vehnotass)]
//										         ['B',  135, 1120, 599, 1268],
//										         ['C',  157, 1167, 587, 807],
//										         ['D', 139,1110,615,968],
//										         ['C',136,691,  629, 1026]
//										      ]);

										    var options = {
										      title : '',
										      legend:'right',
										      is3D:true,
										      bar: {groupWidth: '30%'},
										      vAxis: {title: 'Values'},
										      hAxis: {title: 'Dealer Name'},
										      seriesType: 'bars',
										      series: {5: {type: 'line'}}
										     
										    };

										    var chart = new google.visualization.ComboChart(document.getElementById('combo'));
										    chart.draw(data, options);
										  }
										   google.load("visualization", "1", {
										        packages: ["corechart"],
										        callback: drawVisualization
										    });
										
										
										}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									});
									
							
							interval = setInterval(function(){
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
								.success(
										function(data, status, headers, config) {
											$scope.alldata = data;
											getData($scope.keyc);
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										
										});
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2])
									.success(
											function(data, status, headers,config) {
												
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
												$scope.temper = data.temper;
												$scope.ac = data.ac;
												$scope.overspeed = data.overspeed;
												
											}).error(function(data, status, headers, config) {
												console.log('error: data = ', data);
											
											});
					
							}, 50000);
								
try
{
	
	
	
	
	
	
//	google.load("visualization", "1", {packages:["imagebarchart"]});
//    google.setOnLoadCallback(drawChart);

//   $scope.bar=function bar()
//   {
//function drawChart1() {
//alert("in bar chart");
//        var data = google.visualization.arrayToDataTable([
//          ['Year', 'Sales', 'Expenses'],
//          ['2004',  1000,      400],
//          ['2005',  1170,      460],
//          ['2006',  660,       1120],
//          ['2007',  1030,      540]
//        ]);
//
//        var chart = new google.visualization.ImageBarChart(document.getElementById('bar_chart'));
//
//        chart.draw(data, {width: 400, height: 240, min: 0});
//      }
//
//			    google.load("visualization", "1", {
//			        packages: ["imagebarchart"],
//			        callback: drawChart1
//			    });
// }
   
$scope.showmapdiv1 = function(user) {
		document.getElementById("mapframe").src = "map?vehicleno="+user.vehicleid;
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
}catch(e){alert(e);}
	});

	
	scotchApp.controller('dasboardctrlnew', function($scope,$http, $compile, $filter)
			{
				$scope.loginid = sptstr[2];	
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
				
				$scope.loginid = sptstr[2];
				clearInterval(interval);
				var over = '<div id="overlay"></div>';
			    $(over).appendTo('body');
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
				.success(
						function(data, status, headers, config) {
							$scope.users = data;
							$scope.alldata = data;
							 $('#overlay').remove();
						}).error(function(data, status, headers, config) {
							 $('#overlay').remove();
							console.log('error: data = ', data);
						
						});
				
			});