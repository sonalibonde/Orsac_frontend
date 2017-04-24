/**
 * 
 */

scotchApp.controller('dashController', function($scope,$http, $compile, $filter) {
			
			
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
			
			$scope.graphhide = function graphhide()
			 {
				 document.getElementById('graphrow').hidden=true;
			}
			
			$scope.showgraph = function showgraph()
			{
				 document.getElementById('graphrow').hidden=false;
			}
			
			
	$("#exportexcel").click(function(){
			try
			{
			$('#livesumm').tableExport({
				type:'csv',escape:'false',separator: ',',
				//ignoreColumn: [2,3],
				tableName:'Company',
				
				pdfFontSize:10,
				//pdfLeftMargin:20,
				htmlContent:'false',
				consoleLog:'false',
					}
			
			);
		
			}catch(e){alert(e);}
		});
				
		   mydate = new Date();

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
			
///first time dash
			try {
				
				
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
				
				$scope.usersd = []; //declare an empty array
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData = function(pageno){ // This would fetch the data on page change.
					//In practice this should be in a factory.
					$scope.usersd = [];
					alert('http://elocator.in/webservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint);
					$http.get('http://elocator.in/webservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint).success(function(response){ 
//						alert(response.total_count);
						$scope.users = response.data;  //ajax request to fetch data into vm.data
						$scope.total_count = response.total_count;
						$scope.alldata = response.data;;

		
									$http.get('http://elocator.in/webservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2])
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
														$scope.temper = data.temper;
														$scope.ac = data.ac;
														$scope.overspeed = data.overspeed;
														
												
														
														
	$(function () {
	    function drawChart() {
	   
	        var data = google.visualization.arrayToDataTable([
	            ['task', 'percentage'],
	            ['Halt Vehicles', $scope.yellow],
	            ['Running Vehicles', $scope.green],
	            ['Stopped Vehicles', $scope.red],
	           
	        ]);

	        var options = {
	            title: '',
	            colors: ["orange",
				"Green", "red" ],
				 is3D: true,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	        
	        chart.draw(data, options);
	    }

	    google.load("visualization", "1", {
	        packages: ["corechart"],
	        callback: drawChart
	    });
	});


	$(function () {
	function drawChart() {

	  var data = google.visualization.arrayToDataTable([
	    ['task', '', { role: 'style' }],
	    ['Working Devices', $scope.working_devices,'Green'],
	    ['Non Working Devices', $scope.not_working_devices,'Red']
	 ]);

	  var options = {
	    title: "",
	    bar: {groupWidth: '25%'},
	    isStacked: true,
	    legend: {position:'none'}
	  };

	  var chart_div = document.getElementById('barchart');
	  var chart = new google.visualization.ColumnChart(chart_div);

	  
	  
	  chart.draw(data, options);

	}

	google.load("visualization", "1", {
	    packages: ["corechart"],
	    callback: drawChart
	});
	});

									}).error(
													function(data, status, headers,
															config) {
														console.log(
																'error: data = ',
																data);
													});
									
		}).error(function(data, status, headers, config) {

							console.log('error: data = ', data);
						});
				}
				$scope.getData($scope.pageno); 
			}
			catch (e) {
	}

			

			//time nterval
//			try {
//				interval = setInterval(function(){ 
//				$http.get('http://elocator.in/webservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//						.success(
//								function(data, status, headers, config) {
//									$scope.alldata = data;
//									getData($scope.keyc);
//
//										
//									$http.get('http://elocator.in/webservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//											.success(
//													function(data, status, headers,
//															config) {
////	 													alert(data);
//														$scope.ignitionoff = data.ignitionoff;
//														$scope.ignitionon = data.ignitionon;
//														$scope.validgps = data.validgps;
//														$scope.invalidgps = data.invalidgps;
//														$scope.totald = data.totalVehicles;
//														$scope.working_devices = data.working_devices;
//														$scope.not_working_devices = data.not_working_devices;
//														$scope.red = data.red;
//														$scope.green = data.green;
//														$scope.yellow = data.yellow;
//														$scope.temper = data.temper;
//														$scope.ac = data.ac;
//														$scope.overspeed = data.overspeed;
//														
//													
//														
//														
//														
//	$(function () {
//	    function drawChart() {
//	   
//	        var data = google.visualization.arrayToDataTable([
//	            ['task', 'percentage'],
//	            ['Halt Vehicles', $scope.yellow],
//	            ['Running Vehicles', $scope.green],
//	            ['Stopped Vehicles', $scope.red],
//	           
//	        ]);
//
//	        var options = {
//	            title: '',
//	            colors: ["orange",
//				"Green", "red" ],
//				 is3D: true,
//	        };
//
//	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
//	        
//	        chart.draw(data, options);
//	    }
//
//	    google.load("visualization", "1", {
//	        packages: ["corechart"],
//	        callback: drawChart
//	    });
//	});
//
//
//	$(function () {
//	function drawChart() {
//
//	  var data = google.visualization.arrayToDataTable([
//	    ['task', '', { role: 'style' }],
//	    ['Working Devices', $scope.working_devices,'Green'],
//	    ['Non Working Devices', $scope.not_working_devices,'Red']
//	 ]);
//
//	  var options = {
//	    title: "",
//	    bar: {groupWidth: '45%'},
//	    isStacked: true,
//	    legend: {position:'none'}
//	  };
//
//	  var chart_div = document.getElementById('barchart');
//	  var chart = new google.visualization.ColumnChart(chart_div);
//
//	  
//	  
//	  chart.draw(data, options);
//
//	}
//
//	google.load("visualization", "1", {
//	    packages: ["corechart"],
//	    callback: drawChart
//	});
//	});					}).error(function(data, status, headers,config) {
//														console.log(
//																'error: data = ',
//																data);
//													});
//									
//		}).error(function(data, status, headers, config) {
//
//							console.log('error: data = ', data);
//						});
//				}, 5000);
//			}
//			catch (e) {
//	}
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

		});
		