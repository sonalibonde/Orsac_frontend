/**
 * 
 */
//


scotchApp.controller('routetimectrl', function($scope,$http, $compile, $filter) {
			
			
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
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circledetails')
							.success(function(data, status, headers, config) {
								//alert(data);
								$scope.circledetails = data;
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/shelterdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.overspeedvehdeatils = data;
								
								if(sptstr[6]=='1012')
								{
								document.getElementById("NameCircle").hidden=true;
								$scope.circlewisename=sptstr[0];
								
								}
								
								
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
							$scope.shomap = function(cmp) {

								var randomnumber = Math.floor((Math.random()*100)+1); 
								 window.open('http://209.190.15.26/tripmap?vehicleno='+cmp.vehicleno+
										 '&fromtime='+cmp.outtime+'&totime='+cmp.intime,"_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=300');

						}
						
							  try{
									$("#overspeedexcel").click(function() {
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>ETP No</font></td>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Source</font></td>"+
								"<td><font>Destination</font></td>"+
								"<td><font>Rout Name</font></td>"+
								"<td><font>No.of Trips</font></td>"+
								"<td><font>Rout Deviation Count</font></td>"+
								"<td><font>Trip StartTime</font></td>"+
								"<td><font>Trip EndTime</font></td>"+
								"</tr>";
								//alert(htmlString);
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.etpno+"</font></td>"+
									"<td><font>"+data.vehicleno+"</font></td>"+
									"<td><font>"+data.source+"</font></td>"+
									"<td><font>"+data.destination+"</font></td>"+
									"<td><font>"+data.routename+"</font></td>"+
									"<td><font>"+data.trips+"</font></td>"+
									"<td><font>"+data.rdev+"</font></td>"+
									"<td><font>"+data.starttime+"</font></td>"+
									"<td><font>"+data.endtime+"</font></td>"+
									"</tr>";
						    		}
											}catch(e){}
										table_html = table_html + "</table></body></html>";
								        a.href = data_type + ', ' + table_html;
								        //setting the file name
								        a.download = 'Truck Movement Report' + postfix +'Vehicle No:'+document.getElementById('overspeedVehicleno').value+'.xls';
								        a.click();
								        //just in case, prevent default behaviour
								       e.preventDefault(); 
								    });}catch(e){}	
								
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getDatatruckmov = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							 $scope.limit=50;
							
							$scope.getoverspeedReport=function()
							{
								try{
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							    document.getElementById('overspeedtable1').hidden=true;
								document.getElementById('overspeedtable').hidden=true;
								document.getElementById('overspeedtable2').hidden=true;
								
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getroutetime?route='+document.getElementById('overspeedVehicleno').value+'&fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value)
							.success(function(data, status, headers, config) {
								$scope.overspeeddetails = data;
								$scope.getDatatruckmov($scope.pageno); 
							if(data=="")
									{
										$('#overlay').remove();
										jAlert('No Data Found','Information');
									}else
										{
											$scope.tripcount = data[0].tripcount;
											$scope.ttime = data[0].ttime;
											document.getElementById('overspeedtable1').hidden=false;
											document.getElementById('overspeedtable').hidden=false;
											document.getElementById('overspeedtable2').hidden=false;

										}
								$('#overlay').remove();
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								}catch(e){
									alert(e);
								}
							}
							
				
				
			});




scotchApp.controller('routedevCtrl', function($scope,$http, $compile, $filter) {
			
			
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
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circledetails')
							.success(function(data, status, headers, config) {
								//alert(data);
								$scope.circledetails = data;
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/shelterdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.overspeedvehdeatils = data;
								
								
								if(sptstr[6]=='1012')
								{
								document.getElementById("NameCircle").hidden=true;
								$scope.circlewisename=sptstr[0];
								
								}
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
						
						
							  try{
									$("#overspeedexcel").click(function() {
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>ETP No</font></td>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Source</font></td>"+
								"<td><font>Destination</font></td>"+
								"<td><font>Rout Name</font></td>"+
								"<td><font>No.of Trips</font></td>"+
//								"<td><font>Rout Deviation Count</font></td>"+
								"<td><font>Trip StartTime</font></td>"+
								"<td><font>Trip EndTime</font></td>"+
								"<td><font>Route Deviation Time</font></td>"+
								"</tr>";
//								alert(htmlString);
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.etpno+"</font></td>"+
									"<td><font>"+data.vehicleno+"</font></td>"+
									"<td><font>"+data.source+"</font></td>"+
									"<td><font>"+data.destination+"</font></td>"+
									"<td><font>"+data.routename+"</font></td>"+
									"<td><font>"+data.trips+"</font></td>"+
//									"<td><font>"+data.rdev+"</font></td>"+
									"<td><font>"+data.starttime+"</font></td>"+
									"<td><font>"+data.endtime+"</font></td>"+
									"<td><font>"+data.rdevtime+"</font></td>"+
									"</tr>";
						    		}
								}catch(e){}
								
								table_html = table_html + "</table></body></html>";
						        a.href = data_type + ', ' + table_html;
						        //setting the file name
						        a.download = 'Route Deviation Report' + postfix +'Mine :'+document.getElementById('overspeedVehicleno').value+'.xls';
						        a.click();
						        //just in case, prevent default behaviour
						       e.preventDefault(); 
						    });}catch(e){alert(e);}	
								
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getDatatruckmov = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							
							
							
							$scope.shomap = function(cmp) {
								
								
								var randomnumber = Math.floor((Math.random()*100)+1); 
								 window.open('http://209.190.15.26/tripmaprdev?vehicleno='+cmp.vehicleno+
										 '&fromtime='+cmp.starttime+'&totime='+cmp.endtime+'&rtime='+cmp.rdevtime,"_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=300');

						}
							
							 $scope.limit=50;
							
							$scope.getoverspeedReport=function()
							{
								try{
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							    document.getElementById('overspeedtable1').hidden=true;
								document.getElementById('overspeedtable').hidden=true;
								document.getElementById('overspeedtable2').hidden=true;
								
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/minereportrdev?mine='+document.getElementById('overspeedVehicleno').value+'&fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value)
							.success(function(data, status, headers, config) {
								$scope.overspeeddetails = data;
								$scope.getDatatruckmov($scope.pageno); 
							if(data=="")
									{
										$('#overlay').remove();
										jAlert('No Data Found','Information');
									}else
										{
											$scope.sumtrip = data[0].tripcount;
											$scope.vehcount = data[0].vehcount;
											document.getElementById('overspeedtable1').hidden=false;
											document.getElementById('overspeedtable').hidden=false;
											document.getElementById('overspeedtable2').hidden=false;

										}
								$('#overlay').remove();
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								}catch(e){
									alert(e);
								}
							}
		});

scotchApp.controller('truckmovCtrl', function($scope,$http, $compile, $filter) {
			
			
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
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/shelterdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.overspeedvehdeatils = data;
								
								if(sptstr[6]=='1012')
									{
									document.getElementById("NameCircle").hidden=true;
									$scope.circlewisename=sptstr[0];
									
									}
								
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							//alert('http://localhost:8080/indtrackwebservice/rest/CallService/circledetails')
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circledetails')
							.success(function(data, status, headers, config) {
								//alert(data);
								$scope.circledetails = data;
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							
							
							
						
$scope.shomap = function(cmp) {
								
								
								var randomnumber = Math.floor((Math.random()*100)+1); 
								 window.open('http://209.190.15.26/tripmap?vehicleno='+cmp.vehicleno+
										 '&fromtime='+cmp.starttime+'&totime='+cmp.endtime,"_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=300');

						}
						
							  try{
									$("#overspeedexcel").click(function() {
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>ETP No</font></td>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Source</font></td>"+
								"<td><font>Destination</font></td>"+
								"<td><font>Rout Name</font></td>"+
								"<td><font>No.of Trips</font></td>"+
								"<td><font>Rout Deviation Count</font></td>"+
								"<td><font>Trip StartTime</font></td>"+
								"<td><font>Trip EndTime</font></td>"+
								"</tr>";
								//alert(htmlString);
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.etpno+"</font></td>"+
									"<td><font>"+data.vehicleno+"</font></td>"+
									"<td><font>"+data.source+"</font></td>"+
									"<td><font>"+data.destination+"</font></td>"+
									"<td><font>"+data.routename+"</font></td>"+
									"<td><font>"+data.trips+"</font></td>"+
									"<td><font>"+data.rdev+"</font></td>"+
									"<td><font>"+data.starttime+"</font></td>"+
									"<td><font>"+data.endtime+"</font></td>"+
									"</tr>";
						    		}
											}catch(e){}
										table_html = table_html + "</table></body></html>";
								        a.href = data_type + ', ' + table_html;
								        //setting the file name
								        a.download = 'Truck Movement Report' + postfix +'Vehicle No:'+document.getElementById('overspeedVehicleno').value+'.xls';
								        a.click();
								        //just in case, prevent default behaviour
								       e.preventDefault(); 
								    });}catch(e){}	
								
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getDatatruckmov = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							 $scope.limit=50;
							
							$scope.getoverspeedReport=function()
							{
								try{
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							    document.getElementById('overspeedtable1').hidden=true;
								document.getElementById('overspeedtable').hidden=true;
								document.getElementById('overspeedtable2').hidden=true;
								
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/minereporttruck?mine='+document.getElementById('overspeedVehicleno').value+'&fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value)
							.success(function(data, status, headers, config) {
								$scope.overspeeddetails = data;
								$scope.getDatatruckmov($scope.pageno); 
							if(data=="")
									{
										$('#overlay').remove();
										jAlert('No Data Found','Information');
									}else
										{
											$scope.sumtrip = data[0].tripcount;
											$scope.vehcount = data[0].vehcount;
											document.getElementById('overspeedtable1').hidden=false;
											document.getElementById('overspeedtable').hidden=false;
											document.getElementById('overspeedtable2').hidden=false;

										}
								$('#overlay').remove();
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								}catch(e){
									alert(e);
								}
							}
							
				
				
			});




scotchApp.controller('mineCtrl', function($scope, $http, $compile, $filter){
			
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
					   		$scope.pagesno = [20,50,80,100,120,240, 'All'];
							$scope.pagesint=20;
							$scope.onpagechange = function(page){
								$scope.pagesint=page;
								
								if(page=='All'){
									$scope.pagesint = $scope.total_count;
								}
							}
							
							
							
						
						
						
							  try{
								  $("#overspeedexcel").click(function() {
									  //alert("in excel");
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>ETP No</font></td>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Source</font></td>"+
								"<td><font>Destination</font></td>"+
								"<td><font>Rout Name</font></td>"+
								"<td><font>Trip StartTime</font></td>"+
								"<td><font>Trip EndTime</font></td>"+
								"<td><font>Recieved Time</font></td>"+
								"</tr>";
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.etpno+"</font></td>"+
									"<td><font>"+data.vehicleno+"</font></td>"+
									"<td><font>"+data.source+"</font></td>"+
									"<td><font>"+data.destination+"</font></td>"+
									"<td><font>"+data.routename+"</font></td>"+
									"<td><font>"+data.starttime+"</font></td>"+
									"<td><font>"+data.endtime+"</font></td>"+
									"<td><font>"+data.rectime+"</font></td>"+
									"</tr>";
						    		}
									}catch(e){alert(e);}
										table_html = table_html + "</table></body></html>";
								        a.href = data_type + ', ' + table_html;
								        //setting the file name
								        a.download = 'ETP Trip Details' + postfix +'.xls';
								        a.click();
								        //just in case, prevent default behaviour
								       e.preventDefault(); 
								    });}catch(e){alert(e);}	
								
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getDatadev = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							 $scope.limit=50;
							
							$scope.getoverspeedReport=function()
							{
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/etptripdet?fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value)
							.success(function(data, status, headers, config) {
								$scope.overspeeddetails = data;
								$scope.getDatadev($scope.pageno); 
							if(data.length==0)
									{
								$('#overlay').remove();
									jAlert('No Data Found','Information');
									}else
										{
									
											document.getElementById('overspeedtable1').hidden=false;
											document.getElementById('overspeedtable').hidden=false;


//								$scope.fromdate=document.getElementById('overspeedfromndate').value;
//								$scope.todate=document.getElementById('overspeedtodate').value;
//								$scope.speed=data[0].vehiclespeed;
										}
								$('#overlay').remove();
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								
							}
							
				
				
			});
		


scotchApp.controller('dealerreportCtrl', function($scope,$http, $compile, $filter) {
			
			
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
							
							
							
						
						
							  try{
									$("#overspeedexcel").click(function() {
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Date/Time</font></td>"+
								"<td><font>Location</font></td>"+
								"<td><font>Speed</font></td>"+
								"</tr>";
								//alert(htmlString);
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.vehicleregno+"</font></td>"+
									"<td><font>"+data.datatimestamp+"</font></td>"+
									"<td><font>"+data.location+"</font></td>"+
									"<td><font>"+data.vehiclespeed+"</font></td>"+
									"</tr>";
						    		}
											}catch(e){}
										table_html = table_html + "</table></body></html>";
								        a.href = data_type + ', ' + table_html;
								        //setting the file name
								        a.download = 'Overspeed_Report' + postfix +'Vehicle No:'+document.getElementById('overspeedVehicleno').value+'.xls';
								        a.click();
								        //just in case, prevent default behaviour
								       e.preventDefault(); 
								    });}catch(e){}	
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getDatadealer = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							 $scope.limit=50;
							 
							 var over = '<div id="overlay">' +
//						     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
						     '</div>';
						    $(over).appendTo('body');
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getdealerreport?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								
											$scope.overspeeddetails = data;
											$scope.getDatadealer($scope.pageno);
											$('#overlay').remove();
										}).error(function(data, status, headers, config) {
											$('#overlay').remove();
											console.log('error: data = ', data);
										});
						
							
				
				
			});
		


scotchApp.controller('DeviceCtrl', function($scope,$http, $compile, $filter, fileUpload) {
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
	$scope.roleid=sptstr[6];
		$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
		$scope.pagesno = [20,50,80,100,120,360,450,'All'];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
		
		if($scope.pagesint=='All')
			{
			$scope.pagesint=$scope.device.length;
		
			}

	}
	function printData()
	{  
    var divToPrint=document.getElementById("printTable");
	var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
	  var newWin = window.open('','',popup_win);
	   newWin.document.open();
	   
	   var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #000;' +
        'padding;0.5em;' +
        '}' +
        'tr:nth-child(even) {' +
        'background:#bdbdbd; ' +
         '}' +
         'tr:nth-child(odd) {' +
	        'background:#d3d3d3; ' +
	         '}'+ 
        '</style>';
        htmlToPrint += divToPrint.outerHTML;
        newWin = window.open("");
        newWin.document.write(htmlToPrint);
        newWin.print();
        newWin.close();
	}

	$('#printbutton').on('click',function(){
	printData();
	})
	
	$scope.loginid=sptstr[2];
	$scope.roleid=sptstr[6];
	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslistvehass = data;
	try
			{	
				if($scope.loginid!='10001')
				{
					if(sptstr[6]=='1003'){
						document.getElementById('dealersassDetails').hidden=true;
						document.getElementById('maindealer').hidden=true;
						document.getElementById('dealerasscustomerdetails').hidden=true;
						$scope.customerassign=sptstr[0];
					}else if($scope.dealerdetailslistvehass.length==0){
					
						document.getElementById('dealersassDetails').hidden=true;
						document.getElementById('maindealer').hidden=true;
						$scope.dealervehassdetails1=sptstr[0];
						
					}else{
					document.getElementById('maindealer').hidden=true;
					$scope.parentDealer=sptstr[0];
					}
				}
			}catch(e){}
			
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});

    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {
			//alert("cus"+data);
			$scope.customerdetailsvehass = data;
			
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});

	$scope.uploadexcel = function(){
		var i=0;var k=0;
		for(i=0;i<$scope.customerdetailsvehass.length;i++)
		{
			if($scope.customerdetailsvehass[i].customername==document.getElementById('vehasscustdealerdetails').value)
			{
				$scope.customerid=$scope.customerdetailsvehass[i].customerid;
				k++;
				break;
			}
		}
		
		for(i=0;i<$scope.devicemakenamelist.length;i++){
			if($scope.devicemakenamelist[i].makename == document.getElementById('deviceinsertMakeName').value)
			{
				$scope.deviceinsertmakid=$scope.devicemakenamelist[i].makeid;
				k++;
				break;
			}
		}
		for(i=0;i<$scope.devicemodeldetails.length;i++){
			if($scope.devicemodeldetails[i].modelname==document.getElementById('deviceinsertModelName').value)
			{
				$scope.deviceinsertmodelid=$scope.devicemodeldetails[i].modelid;
				k++;
				break;
			}
		}
		if(sptstr[6]=='1003'){
			$scope.customerid = sptstr[2];
			k++;
		}
		var mydeviceinsert = document.deviceindert;
		if(mydeviceinsert.vehasscustdealerdetails.value== "")
		{
		mydeviceinsert.vehasscustdealerdetails.focus();
		}
		else if(mydeviceinsert.deviceinsertMakeName.value== "")
		{
		mydeviceinsert.insertMakeName.focus();
		}
		else if(mydeviceinsert.deviceinsertModelName.value== "")
		{
		mydeviceinsert.deviceinsertModelName.focus();
		}else{
		
		//alert(k+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
		if(k==3){
			var file = $scope.myFiledevice;
            var uploadUrl = "http://209.190.15.26/imageupload/rest/file/fileuploadExcel";
            fileUpload.uploadFileToUrlExcel(file, uploadUrl, sptstr[2], $scope.customerid, $scope.deviceinsertmakid, $scope.deviceinsertmodelid);
		}else{
			jAlert('Please Fill Valid details','Information');
		}
	  }
	}
	//, $scope.customerid, $scope.cloginid
	
	$scope.dataget = function (comp){
		
		
		$scope.vehicleno = comp.vehicleno;
		$scope.ndate = comp.datetimestamp;
		$scope.receipt = comp.receiptno;
		$scope. customername=comp.customername;
		//$scope.uniqueid = comp.uniqueid;
		$scope.dealername =comp.dealername
		//alert("values copied");
	}
	
	
	$scope.print_this = function(comp){
		var vehicleno = comp.vehicleregno;
		var randomnumber = Math.floor((Math.random()*100)+1); 
		var my_window = window.open('http://209.190.15.26:8686/receipt/receipt.aspx?loginid='+comp.cloginid+'&vehicleno='+comp.vehicleno, "_blank", 'PopUp', randomnumber, 'scrollbars=1,menubar=0,resizable=1,width=600,height=300');
	}
	
//	$scope.print_this = function(comp){
//		var vehicleno = comp.vehicleno;
//		var ndate = comp.datetimestamp;
//		var receipt = comp.receiptno;
//		var customername=comp.customername;
//		var uniqueid = comp.uniqueid;
//		var dealername =comp.dealername
//		//var html = document.getElementById(container).innerHTML;
////		var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
////		var print_form = window.open('','',popup_win);
////		print_form.document.open();
//		var html = '' +
//		 '<html><head>'+'<title>'+'ORSAC RECEIPT'+'</title></head>'+
//	        '<body><table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt NO.';html = html + receipt+
//	         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
//	         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No      :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
//	         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
//	         '</td>'+'<td>'+'Dealer Name   :'+dealername;html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                        :';html = html + comp.uniqueid+
//	         '</td>'+'<td>'+'Customer Name :'+customername+'</td></tr>'+'<tr><td>'+'Sim No                                 :';html = html + comp.simno+
//	         '</td></tr>'+'</table>'+'<div>'+'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'+'</div>'+'<table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt No:';html = html + receipt+
//	         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
//	         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No     :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
//	         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
//	         '</td>'+'<td>'+'Dealer Name  :';html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                         :';html = html + comp.uniqueid+
//	         '</td>'+'<td>'+'Customer Name:'+customername+'</td></tr>'+'<tr><td>'+'Sim No                                   :';html = html + comp.simno+
//	         '</td></tr>'+'</table>'+'</body></html>';
//	       
////        print_form.document.write(html);
////		print_form.document.close();
////		print_form.print();
//	         try{
//		         var doc = new jsPDF();
//		         var specialElementHandlers = {
//		         '#editor': function (element, renderer) {
//		         return true;
//		         }
//	         };
//		         doc.fromHTML(html, 15, 15, {
//		        	 'width': 170,
//		        	 'elementHandlers': specialElementHandlers
//		        	 });
//		         doc.save('receipt.pdf');
//	         }catch(e){
//	        	 alert(e);
//	         }
//		//return false;
//		}
	
	
	
	
	
			

	
//$('#exportpdf').click(function () {
//	var doc = new jsPDF('landscape','pt');
//		doc.fromHTML($scope.htmlString,100,100,{});
//     doc.output("dataurlnewwindow");
// });

	  
	$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO","Device NO.","Customer Name","Dealer Name","Vehicle NO.","Sim Status","Vehicle Status","Polling"];
						var i=0;
				      	var data1=[];
						for(i=0;i<$scope.device.length;i++){
				    		
				        var data  = $scope.device[i];
				    		 data1.push([data.rowno,data.uniqueid,data.customername,data.dealername,data.vehicleno,data.statussim,data.statusvehicle,data.polling_status]);
				    	}
				    
				    	 var doc = new jsPDF('landscape','pt');
				      
				    	 doc.autoTable(columns, data1);
				         doc.save("DeviceDetails.pdf");
				     }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });


//try{
//$("#exportexcel").click(function() {
//    //getting values of current time for generating the file name
//    var dt = new Date();
//    var day = dt.getDate();
//    var month = dt.getMonth() + 1;
//    var year = dt.getFullYear();
//    var hour = dt.getHours();
//    var mins = dt.getMinutes();
//    var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
//    var a = document.createElement('a');
//    var data_type = 'data:application/vnd.ms-excel';//base64,' 
//    var table_div = document.getElementById('deviceDiv');
//    var i=0;
//    var table_html = table_div.outerHTML.replace(/ /g, '%20');
//    a.href = data_type + ', ' + table_html;
//    a.download = 'Device_Details' + postfix +'.xls';
//    a.click();
//   e.preventDefault(); 
//});}catch(e){alert("sss"+e);}



try{
	$("#exportexcel").click(function() {
	//getting values of current time for generating the file name
	var dt = new Date();
	var day = dt.getDate();
	var month = dt.getMonth() + 1;
	var year = dt.getFullYear();
	var hour = dt.getHours();
	var mins = dt.getMinutes();
	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
	//creating a temporary HTML link element (they support setting file names)
	var a = document.createElement('a');
	//getting data from our div that contains the HTML table
	var data_type = 'data:application/vnd.ms-excel';//base64,' 
	var table_div = document.getElementById('deviceDiv');
	//alert("table_div"+table_div);
	var i=0;
	var table_html = "";
	table_html = table_html +"<html><body><table><tr>"+
	"<td><font>Sr. No</font></td>"+
	"<td><font>Device No</font></td>"+
	"<td><font>Customer Name</font></td>"+
	"<td><font>Dealer Name</font></td>"+
	"<td><font>Sim Status</font></td>"+
	"<td><font>Vehicle Status</font></td>"+
	"<td><font>Poling</font></td>"+
	"</tr>";
	//alert(htmlString);
	try{
		//alert($scope.device.length);
	for(i=0;i<$scope.device.length;i++){
		
	data  = $scope.device[i];
	table_html = table_html + "<tr>"+
	"<td><font>"+data.rowno+"</font></td>"+
	"<td><font>"+data.uniqueid+"</font></td>"+
	"<td><font>"+data.customername+"</font></td>"+
	"<td><font>"+data.dealername+"</font></td>"+
	"<td><font>"+data.statussim+"</font></td>"+
	"<td><font>"+data.statusvehicle+"</font></td>"+
	"<td><font>"+data.polling_status+"</font></td>"+
	"</tr>";
			}
	}catch(e){}
	table_html = table_html + "</table></body></html>";
	a.href = data_type + ', ' + table_html;
	//setting the file name
	a.download = 'Device_Details' + postfix + '.xls';
	a.click();
	//just in case, prevent default behaviour
	e.preventDefault(); 
	});}catch(e){alert(e);}




$("#assignsim").click(function()
{
document.getElementById("assignsimFieldset").hidden=false;
});
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
$scope.simdetails = data;
}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
.success(function(data, status, headers, config) {
$scope.userclist = data;
//	data[0].companyname = 'All';
//	$scope.userclist.push(data[0]);
}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});


$scope.searcbydeviceno='';
try
	{
	$scope.devicenew = []; //declare an empty array
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBydeviceno='+$scope.searcbydeviceno)
	.success(function(data, status, headers, config) {
		$scope.device = data;
		$scope.devdata = data;
		$scope.getData12($scope.pageno); 

	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	$scope.searchdevice = function(){
//			alert("in search");
		if($scope.compsearch == 'All'){
			$scope.device = $scope.devdata;
		}else{
		var data = $scope.devdata;
		$scope.device = [];
		for(var i = 0; i<data.length;i++){
			if($scope.compsearch==data[i].cid){
				$scope.device.push(data[i]);
			}
		}
	   }
		$scope.getData12(1);
	}
	$scope.searchdealerdevice = function(){
			
		if($scope.dealersearch == 'All'){
			$scope.device = $scope.deldata;
		}else{
		var data = $scope.devdata;
		$scope.device = [];
		for(var i = 0; i<data.length;i++){
			if($scope.dealersearch==data[i].dealername){
				$scope.device.push(data[i]);
			}
		}
	   }
		$scope.getData12(1);
	}
	
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
	$scope.getData12 = function(pageno){ 
	$scope.devicenew = [];
	var start=0, end=0;
		if(pageno!=1){
			start = $scope.pagesint * (pageno-1);
			end = start + $scope.pagesint;
			start++;
		}else{
			start = 0;
			end = start + $scope.pagesint;
			start++;
		}
		
		for(var i=start;i<=end;i++){
			if(i<=$scope.device.length){
				if($scope.searcbydeviceno!='')
					{
					if($scope.device[i].includes($scope.searcbydeviceno))
						{
					$scope.devicenew.push($scope.device[i-1]);
						}
					}
				else
					{
					$scope.devicenew.push($scope.device[i-1]);
					}
			}else{
				break;
			}
		}	
		$scope.total_count = $scope.device.length-1;
			};
	
	}catch(e){};
	$scope.orderProp = "vehicleN0";
	$scope.deviceData = function deviceData(edit) {
		$scope.editdevice = edit;
	}
	
	$("#devicesearch").keypress(function(){
		try
		{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBydeviceno='+$scope.searcbydeviceno)
			.success(function(data, status, headers, config) {
				$scope.devicenew = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBydeviceno='+$scope.searcbydeviceno)
				.success(function(data, status, headers, config) {
					$scope.devicenew = data;
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});

		}catch(e){
			
		}
	});
	$scope.sendcommand=function(imei){
		try
		{	var over = '<div id="overlay">' +
		     '</div>';
		    $(over).appendTo('body');
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/sendcommand?imeino='+imei)
			.success(function(data, status, headers, config) {
					jAlert(data,'Success Dialog');	
					 $('#overlay').remove();
				}).error(function(data, status, headers, config) {
					jAlert(data,'Information');
				console.log('error: data = ', data);
			});

		}catch(e){	}	}
	
$scope.deletedevice = function(deletedeviceid){
	if(deletedeviceid.flag=='true'){
		jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
			if(r){ 
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedelete?id='+deletedeviceid.deviceid)
		.success(function(data, status, headers, config) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.device = data;
					$scope.getData12($scope.pageno);
					jAlert('Record Deleted Successfully', 'Confirmation Results');
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
		}).error(function(data, status, headers, config) {
			jAlert('Record Not Deleted','Information');
		console.log('error: data = ', data);
		});		}
		});
	}
}
	//activate Devicce   activateDevice
	$scope.activatedevice = function(deletedeviceid){
			jConfirm('Do you want to Activate?', 'Confirmation Dialog', function(r) { 
			if(r){ 
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/activateDevice?id='+deletedeviceid.deviceid)
		.success(function(data, status, headers, config) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.device = data;
					$scope.getData12($scope.pageno);
					jAlert('Record Activated Successfully', 'Confirmation Results');
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
		}).error(function(data, status, headers, config) {
			jAlert('Record Not Activated','Information');
				console.log('error: data = ', data);
		});
			}
		});
	}
				
//	makkename vbind modeldetails
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.devicemakenamelist = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
					//	MODEL BIN
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.devicemodeldetails = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});		
				$("#deviceinsertdeviceid").blur(function(){
					var i=0;chk=0;
							for(i=0;i<$scope.device.length;i++)
							{
							if($scope.device[i].deviceid==document.getElementById('deviceinsertdeviceid').value)
								{
								chk++;
								}
							
							}
							if(chk>0)
								{
								jAlert('Problem in Saving Records!Device Id Already Exists','Information');
								}
						});
			$("#deviceinsertdeviceno").blur(function(){
				var i=0;chk=0,chk1=0;
						for(i=0;i<$scope.device.length;i++)
						{
						if($scope.device[i].uniqueid==document.getElementById('deviceinsertdeviceno').value)
							{
							chk++;
							}
						}
						if(chk>0)
							{
							jAlert('Problem in Saving Records!Device No. Already Exists','Information');
							}
					});
			$scope.jsonArrayDevice=[];
			try
			{
			$("#addtolist").click(function(){
 				   var table = document.getElementById("myDeviceTable");
				    var row = table.insertRow(1);
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(0);
				    cell1.innerHTML = document.getElementById("deviceinsertdeviceid").value;
				    cell2.innerHTML =document.getElementById("deviceinsertdeviceno").value;
				   	 $scope.devceid=cell1.innerHTML;
   					$scope.deviceno=cell2.innerHTML;
					try
						{		
						$scope.jsonArrayDevice.push({
							deviceid: $scope.devceid,
					       deviceno: $scope.deviceno
					    });
						}catch(e){alert(e);}				
					});
		
			}catch(e){}
			$scope.jsonArraysim=[];
			try
			{
			$("#addsimtolist").click(function(){
 				   var table = document.getElementById("myDevicesimTable");
				    var row = table.insertRow(1);
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(0);
				    cell1.innerHTML = document.getElementById("assingdevicenumber").value;
				    cell2.innerHTML =document.getElementById("assignsimnumber").value;
				   		$scope.assdeviceo=cell1.innerHTML;
   						$scope.assignsimno=cell2.innerHTML;
					var i=0;
					for(i=0;i<$scope.jsonArrayDevice.length;i++)
						{
						if($scope.jsonArrayDevice[i].deviceno==document.getElementById("assingdevicenumber").value)
							{
							$scope.deviceassignid=$scope.jsonArrayDevice[i].deviceid;
							}
						}
					for(i=0;i<$scope.simdetails.length;i++)
   							{
   							if($scope.simdetails[i].simnumber==document.getElementById("assignsimnumber").value)
   							{
   								$scope.simassignid=$scope.simdetails[i].simid;
   							}	}
   						
   						try
						{		
						$scope.jsonArraysim.push({
						deviceid:  $scope.deviceassignid,
					    simid: $scope.simassignid
					    });
							}catch(e){}				
					});
		
			}catch(e){}
				
				//	insertdevice
			$scope.devieinsert = function devieinsert() {
				try
				{	$scope.deviceinsertvendordetails=null;
					$scope.deviceinsertmakid=null;
					$scope.deviceinsertmodelid=null;
				
				var i=0;
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
			else 
				{	var i=0;chk=0,chk1=0;
					for(i=0;i<$scope.device.length;i++)
					{
					if($scope.device[i].uniqueid==document.getElementById('deviceinsertdeviceno').value)
						{
						chk++;
						}
					if($scope.device[i].deviceid==document.getElementById('deviceinsertdeviceid').value)
					{
					chk1++;
					}
						}
					if(chk>0)
						{
						jAlert('Problem in Saving Records!Device No. Already Exists','Information');
						}
					if(chk1>0)
					{
					jAlert('Problem in Saving Records!Device Id. Already Exists','Information');
					}
					else
						{
					var k=0;
					if($scope.deviceinsertmakid==null){
						jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
						mydeviceinsert.deviceinsertMakeName.focus();
						k++;
					}
					if($scope.deviceinsertmodelid==null){
						jAlert('Problem in Saving Records! Model Name Does Not Exist!','Information');
						mydeviceinsert.deviceinsertModelName.focus();
						k++;
					}
				if(k==0){
					var response=$http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getMultipeDeviceInsert?makeid='+$scope.deviceinsertmakid+'&modelid='+$scope.deviceinsertmodelid+'&uniqueid='+document.getElementById('deviceinsertdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceinsertRemarkd').value+'&deviceid='+document.getElementById('deviceinsertdeviceid').value,$scope.jsonArrayDevice);
					response.success(function(data, status, headers, config) {
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.device = data;
							$scope.getData12($scope.pageno);
		}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						jAlert('Record Inserted Successfully', 'Success Dialog'); 
					});
					response.error(function(data, status, headers, config) {
						jAlert('Unable to  Proceed Your Request','Information');
						$scope.error=data;
						console.log('error: data = ', data);
						var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DeviceFormInsert',data);
						response.success(function(data, status, headers, config) {
						});
						response.error(function(data, status, headers, config) {
						}); 
						});}
						}}
				}catch(e){}
				}
				
				
			$scope.multipleSimass =function multipleSimass()
			{try
				{
					var i=0;
					 for(i=0;i<$scope.simdetails.length;i++)
			    		  {
			    		  if($scope.simdetails[i].simnumber==document.getElementById("assignsimnumber").value)
							 {
			    			  $scope.assignSimid=$scope.simdetails[i].simid;
							 }
			    		  }
						var res=$http.post('http://localhost:8080/indtrackwebservice/rest/CallService/mutileplesimassstodevice?'+
								'deviceid='+document.getElementById('deviceinsertdeviceid').value+'&simid='+ $scope.assignSimid+'&loginid='+sptstr[2]+
								'&remarks=OK',$scope.jsonArraysim);
					res.success(function(data, status, headers, config) {
							jAlert('Sim Assign to Device Successfully', 'Success Dialog'); 
						});res.error(function(data, status, headers, config) {
							console.log('error: data = ', data);
							
						});
					
				}
				catch(e)
				{}
			}	
				//deviceupdate
				try
				{
				$scope.devieupdate = function devieupdate() 
				{
					
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
				else
				{var i=0;
					$scope.deviceeditvendordetails=null;
					$scope.deviceeditmakid=null;
					$scope.deviceeditmodelid=null;
					
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

					
					var k=0;
					if($scope.deviceeditmakid==null){
						jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
						mydeviceedit.deviceditmake.focus();
						k++;
					}
					if($scope.deviceeditmodelid==null){
						jAlert('Problem in Saving Records! Model Name Does Not Exist!','Information');
						mydeviceedit.deviceeditmodel.focus();
						k++;
					}
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceupdate?deviceid='+$scope.editdevice.deviceid+'&makeid='+$scope.deviceeditmakid+'&modelid='+$scope.deviceeditmodelid+'&uniqueid='+document.getElementById('editdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceeditRemarkd1').value)
					.success(function(data, status, headers, config) {
					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status,	headers, config) {
						$scope.device = data;
						$scope.getData12($scope.pageno);
						document.getElementById("devicemain").hidden = false;
						document.getElementById("deviceedit").hidden = true;
						jAlert('Record Updated Successfully', 'Success Dialog'); 
						document.getElementById('deviceEdit').reset(); 
					})
					.error(function(data, status,headers, config) {
						console.log('error: data = ',data);
		
					});
					}).error(function(data, status, headers, config) {
						jAlert('Unable to  Proceed Your Request','Information');
						$scope.error=data;
						console.log('error: data = ', data);
						var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DeviceFormUpdate',data);
						response.success(function(data, status, headers, config) {
						});
						response.error(function(data, status, headers, config) {
						}); 
					});
				 // }
				}	
				}
				}
				}catch(e){}
				
				$scope.showdevicediv1 = function() {
				document.getElementById("deviceedit").hidden = false;
				document.getElementById("devicemain").hidden = true;
				}
				$scope.back = function() {
				document.getElementById("devicemain").hidden = false;
				document.getElementById("deviceedit").hidden = true;
				}
});



scotchApp.controller('livestatusCtrl', function($scope,$http, $compile, $filter) {
	try {
		
			
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
			$scope.query = {}
		   	$scope.queryBy = '$';
			
//			$scope.pagesno = [20,50,80,100,120,360,450,'All'];
//			$scope.pagesint=20;
//			$scope.onpagechange = function(page){
//				$scope.pagesint=page;
//				
//				if($scope.pagesint=='All')
//					{
//					$scope.pagesint=$scope.device.length;
//				
//					}
//		
//			}
//			
			$scope.pagesno = [20,50,80,100,120,360,450,'All'];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
				if($scope.pagesint=='All')
				{
				$scope.pagesint=$scope.total_count.length;
                }
			}
			
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
			$scope.usersd = []; //declare an empty array
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
			$scope.pagesint = 20; //this could be a dynamic value from a drop down
			$scope.limit=60;
			//interval = setInterval(function(){
			$scope.getDatalived = function(pageno){ // This would fetch the data on page change.
				//In practice this should be in a factory.
				$scope.usersd = [];
				$scope.page=pageno;

//				alert('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit);
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&compname=All').success(function(response){
					
					//alert(response.total_count);
					$scope.users = response.data;  //ajax request to fetch data into vm.data
					$scope.total_count = response.total_count;
					$scope.alldata = response.data;
			});
				
				 try{
				    	$("#exportexcel").click(function() {
				    	
				    		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&compname=All').success(function(response){
								
								//alert(response.total_count);
								$scope.users = response.data;  //ajax request to fetch data into vm.data
								
						});
				    		
				    	//getting values of current time for generating the file name
				    	var dt = new Date();
				    	var day = dt.getDate();
				    	var month = dt.getMonth() + 1;
				    	var year = dt.getFullYear();
				    	var hour = dt.getHours();
				    	var mins = dt.getMinutes();
				    	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
				    	//creating a temporary HTML link element (they support setting file names)
				    	var a = document.createElement('a');
				    	//getting data from our div that contains the HTML table
				    	var data_type = 'data:application/vnd.ms-excel';//base64,' 
				    	var table_div = document.getElementById('uprintlTable');
				    	//alert("table_div"+table_div);
				    	var i=0;
				    	var table_html = "";
				    	table_html = table_html +"<html><body><table><tr>"+
				    	"<td><font>Sr. No</font></td>"+
				    	"<td><font>Customer Name</font></td>"+
				    	"<td><font>Vehicle No.</font></td>"+
				    	"<td><font>Device No.</font></td>"+
				    	"<td><font>Polling Time</font></td>"+
				    	"<td><font>Speed</font></td>"+
				    	"<td><font>Location</font></td>"+
				    	"</tr>";
				    	//alert(htmlString);
				    	try{
				    		//alert($scope.device.length);
				    	for(i=0;i<$scope.users.length;i++){
				    		
				    	data  = $scope.users[i];
				    	table_html = table_html + "<tr>"+
				    	"<td><font>"+data.rowno+"</font></td>"+
				    	"<td><font>"+data.customername+"</font></td>"+
				    	"<td><font>"+data.vehicleid+"</font></td>"+
				    	"<td><font>"+data.imeino+"</font></td>"+
				    	"<td><font>"+data.datatimestamp+"</font></td>"+
				    	"<td><font>"+data.vehiclespeed+"</font></td>"+
				    	"<td><font>"+data.location+"</font></td>"+
				    	"</tr>";
				    			}
				    	}catch(e){}
				    	table_html = table_html + "</table></body></html>";
				    	a.href = data_type + ', ' + table_html;
				    	//setting the file name
				    	a.download = 'Live_Details' + postfix + '.xls';
				    	a.click();
				    	//just in case, prevent default behaviour
				    	e.preventDefault(); 
				    	});}catch(e){alert(e);}
		}
	//	alert("hello");
		$scope.getDatalived(1);
	}catch(e)
	{alert(e);}
	});



scotchApp.controller('minesdashboardctrl', function($scope,$http, $compile, $filter) {
		try {
			
			
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
			try{
			$scope.circlenamenew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
			 $scope.pagesint=5;
				$scope.getDatamine = function(pageno){ 
				
				$scope.circlenamenew = [];
			var start=0, end=0;
				if(pageno!=1){
					start = $scope.pagesint * (pageno-1);
					end = start + $scope.pagesint;
					start++;
				}else{
					start = 0;
					end = start + $scope.pagesint;
					start++;
				}
				for(var i=start;i<=end;i++){
					if(i<=$scope.circlenamedt.length){
						
							$scope.circlenamenew.push($scope.circlenamedt[i-1]);
						
					}else{
						break;
					}
				}		$scope.total_count = $scope.circlenamedt.length;
				
			};
			
			}catch(e){alert(e);}
			
			$scope.shomap = function(cmp) {
				var randomnumber = Math.floor((Math.random()*100)+1); 
				 window.open('http://209.190.15.26/tripmap?vehicleno='+cmp.vehicleno+
						 '&fromtime='+cmp.starttime+'&totime='+cmp.passvalid,"_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=300');

		}
			
			
//		try{
//			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/minedetails').success(function(data, status, headers, config){ 
//				 $('#overlay').remove();
//				$scope.shelterdetails = data; 
//					$scope.getDatamine($scope.pageno); 
//				}).error(function(data, status, headers, config) {
//					 $('#overlay').remove();
//					
//						console.log('error: data = ', data);
//				});
//				}catch(e)
//				{alert(e);}
		}catch(e){}
	
		try{
			
				$scope.getcirclename=function(circle){    	
						document.getElementById('deviceDiv').hidden = false;
						//alert(circle);
						//alert('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetripdetails?circlename='+circle);
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetripdetails?circlename='+circle)
						.success(function(data, status, headers, config) {
							//alert(data);
							$scope.circlenamedt = data;
							$scope.getDatamine($scope.pageno); 
			
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}
			}
			catch(e){}
		
		try{
			
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetrip')
			.success(function(data, status, headers, config) {
				$scope.circlenew = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			}
			catch(e){}
			
			
		});
		
		
		
		

scotchApp.controller('circledashCtrl', function($scope,$http, $compile, $filter) {
	try {
		
		
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
		try{
		$scope.circlenamenew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
		$scope.pagesno = [20,50,80,100,120,360,450,'All'];
		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
			if($scope.pagesint=='All')
			{
			$scope.pagesint=$scope.total_count.length;
            }
		}
	$scope.getDataminedash = function(pageno){ 
			
			$scope.circlenamenew = [];
		var start=0, end=0;
			if(pageno!=1){
				start = $scope.pagesint * (pageno-1);
				end = start + $scope.pagesint;
				start++;
			}else{
				start = 0;
				end = start + $scope.pagesint;
				start++;
			}
			for(var i=start;i<=end;i++){
				if(i<=$scope.circlenamedt.length){
					
						$scope.circlenamenew.push($scope.circlenamedt[i-1]);
					
				}else{
					break;
				}
			}		$scope.total_count = $scope.circlenamedt.length;
			
		};
		
		}catch(e){alert(e);}
		
		$scope.shomap = function(cmp) {
			var randomnumber = Math.floor((Math.random()*100)+1); 
			 window.open('http://209.190.15.26/tripall?circle='+sptstr[0], "_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=300');

	}
		
		
//	try{
//		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/minedetails').success(function(data, status, headers, config){ 
//			 $('#overlay').remove();
//			$scope.shelterdetails = data; 
//				$scope.getDatamine($scope.pageno); 
//			}).error(function(data, status, headers, config) {
//				 $('#overlay').remove();
//				
//					console.log('error: data = ', data);
//			});
//			}catch(e)
//			{alert(e);}
	}catch(e){}

	try{
		
//			$scope.getcirclename=function(circle){    	
//					document.getElementById('deviceDiv').hidden = false;
					//alert(circle);
					//alert('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetripdetails?circlename='+circle);
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetripdetails?circlename='+sptstr[0])
					.success(function(data, status, headers, config) {
						//alert(data);
						$scope.circlenamedt = data;
						$scope.getDataminedash($scope.pageno); 
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehiclewisetripdetails?circlename='+sptstr[0])
						.success(function(data, status, headers, config) {
							//alert(data);
							var pdata = [];
							for(var k = 0; k<data.length; k++){
								pdata.push({
				                    "label": data[k].vehicleno,
				                    "value": data[k].rowno,
				                    //Using color attribute to specifically add color to each data plot
				                    "color": data[k].code
				                });
							}
							//alert(pdata);
						FusionCharts.ready(function() {
						    var revenueChart = new FusionCharts({
						        type: 'column2d',
						        renderAt: 'chart-container',
						        width: '500',
						        height: '300',
						        dataFormat: 'json',
						        dataSource: {
						            "chart": {
						                "caption": "Mine wise total Trips",
//						                "subCaption": "Last year",
						                "xAxisName": "Mine Name",
						                "yAxisName": "No Of trips",
//						                "numberPrefix": "$",
						                "theme": "fint",
						                "showplotborder": "0"
						            },
						            "data": pdata
						        }
						    }).render();

						});
						
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/mineralwisetripdetails?circlename='+sptstr[0])
					.success(function(data, status, headers, config) {
						
						var ddata = [];
						for(var k = 0; k<data.length; k++){
							ddata.push({
			                    "label": data[k].minename,
			                    "value": data[k].tonnage
			                });
						}
						FusionCharts.ready(function () {
						    var revenueChart = new FusionCharts({
						        type: 'doughnut2d',
						        renderAt: 'tonnage',
						        width: '500',
						        height: '300',
						        dataFormat: 'json',
						        dataSource: {
						            "chart": {
						                "caption": "Mineral wise total tonnage",
//						                "subCaption": "Last year",
//						                "numberPrefix": "$",
						                "startingAngle": "20",
						                "showPercentValues": "0",
						                "showPercentInTooltip": "0",
						                "enableSmartLabels": "0",
						                "enableMultiSlicing": "0",
						                "decimals": "1",
						                //Theme
						                "theme": "fint"
						            },
						            "data": ddata
						        }
						    }).render();
						    
						});
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
//				}
		}
		catch(e){}
	
	
		
		
	});
		
		


scotchApp.controller('menuassignController', function($scope,$http, $compile, $filter) {
		try {
			
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
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [20,50,80,100,'All'];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
					if($scope.pagesint=='All')
   					{
   					$scope.pagesint=$scope.menuassigndet.length;
   	                        }
				}
				function printData()
				{
				var divToPrint=document.getElementById("printTablemenuass");
				 var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
				  var newWin = window.open('','',popup_win);
				   newWin.document.open();
				   var htmlToPrint = '' +
			        '<style type="text/css">' +
			        'table th, table td {' +
			        'border:1px solid #000;' +
			        'padding;0.5em;' +
			        '}' +
			        'tr:nth-child(even) {' +
			        'background:#bdbdbd; ' +
			         '}' +
			         'tr:nth-child(odd) {' +
				        'background:#d3d3d3; ' +
				         '}'+ 
			        '</style>';
			        htmlToPrint += divToPrint.outerHTML;
			        newWin = window.open("");
			        newWin.document.write(htmlToPrint);
			        newWin.print();
			        newWin.close();
				}
				$('#printbutton').on('click',function(){
				printData();
				})		
		   
					   $('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Main Menu Name", "Sub Menu Name","RoleName"];
						var i=0;
				       	var data1=[];
						for(i=0;i<$scope.menuassigndet.length;i++){
				    	  var data  = $scope.menuassigndet[i];
				    		 data1.push([data.rowno,data.parentname ,data.menutext,data.rolename]);
				    		}
				   var doc = new jsPDF('landscape','pt');
					 doc.autoTable(columns, data1);
				         doc.save("MenuAssignForm.pdf");
				       }
				    catch(e)
				    {	alert(e.message);
				    }  });	
				
				
				try{
					
				    $("#exportexcel").click(function() {
				    	
				        //getting values of current time for generating the file name
				        var dt = new Date();
				        var day = dt.getDate();
				        var month = dt.getMonth() + 1;
				        var year = dt.getFullYear();
				        var hour = dt.getHours();
				        var mins = dt.getMinutes();
				        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
				        //creating a temporary HTML link element (they support setting file names)
				        var a = document.createElement('a');
				        //getting data from our div that contains the HTML table
				        var data_type = 'data:application/vnd.ms-excel';//base64,' 
				        var table_div = document.getElementById('menuAssignctrl');
				        //alert("table_div"+table_div);
				        var i=0;
				        var table_html = "";
				         table_html = table_html +" <html><body><table><tr>"+
				 		"<td><font>Row No</font></td>"+
						"<td><font>Main Menu Name</font></td>"+
						"<td><font>Sub Menu Name</font></td>"+
						"<td><font>Role Name</font></td>"
						"</tr>";
						try{
				    	for(i=0;i<$scope.menuassigndet.length;i++){
				    		data  = $scope.menuassigndet[i];
				    		table_html = table_html + "<tr>"+
							"<td><font>"+data.rowno+"</font></td>"+
							"<td><font>"+data.parentname+"</font></td>"+
							"<td><font>"+data.menutext+"</font></td>"+
							"<td><font>"+data.rolename+"</font></td>"
							"</tr>";
				}
		}catch(e){
							//alert(e);
						}
						table_html = table_html + "</table></body></html>";
						//table_html = table_div.outerHTML.replace(/ /g, '%20');
				        a.href = data_type + ', ' + table_html;
				        //setting the file name
				        a.download = 'MenuAssign_Details' + postfix + '.xls';
				        //triggering the function
				        a.click();
				        //just in case, prevent default behaviour
				       e.preventDefault(); 
				    });
				
				}catch(e){}
				
					
				
				
				
				
				
				
				
				
			$scope.SearchBySubmenu='';
		   		
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchBySubmenu)
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;
							$scope.getData16($scope.pageno); 
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$scope.menuassigndetnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
					$scope.getData16 = function(pageno){ 
					$scope.menuassigndetnew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					for(var i=start;i<=end;i++){
						if(i<=$scope.menuassigndet.length){
							if($scope.SearchBySubmenu!='')
								{
								if($scope.menuassigndet[i].includes($scope.SearchBySubmenu))
									{
							$scope.menuassigndetnew.push($scope.menuassigndet[i-1]);
									}
								}
							else
								{
								$scope.menuassigndetnew.push($scope.menuassigndet[i-1]);
								}
						}else{
							break;
						}
					}		$scope.total_count = $scope.menuassigndet.length;
					
				};
				
				$("#serachbySubmenu").keypress(function(){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchBySubmenu)
					.success(function(data, status, headers, config) {
						$scope.menuassigndet = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchBySubmenu)
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;
							}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					});
				$scope.deletemenuassign = function(menuasignid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassigndelete?id='+menuasignid.mid)
					.success(function(data, status, headers, config) {
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;
							$scope.getData16($scope.pageno);
								jAlert('Record Deleted Successfully', 'Confirmation Results');

							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						}).error(function(data, status, headers, config) {
						jAlert('Record Not Deleted','Information');
						console.log('error: data = ', data);
					});	}
					});
				}
					
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
							$scope.roledetails = data;
						})
				.error(function(data, status, headers, config) {
							console.log('error: data = ',data);
						});
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[6]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menudetails = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
					$scope.showmenurolediv1 = function() {
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
				    	 myForm.insertmenuassmenuname.focus();
				      }else if (myForm.insertmenuassrolename.value== "")
				      {
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
						var k=0
						if($scope.menuid==null){ 
							jAlert('Problem in Saving Records! Menu Name Does Not Exist!','Information');
							 myForm.insertmenuassmenuname.focus(); 
							k++; 
						} 
						if($scope.menuroleid==null){ 
							
							jAlert('Problem in Saving Records! Role Name Does Not Exist!','Information');
							 myForm.insertmenuassrolename.focus();
							k++;  
						} 
						if(k==0)
							{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassigninsert?'+
							'menuid='+$scope.menuid+
							'&roleid='+$scope.menuroleid+'&loginid='+sptstr[2]).success(
									function(data, status, headers, config) {
										jAlert('Record Inserted Successfully', 'Success Dialog'); 
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1])
												.success(function(data, status, headers, config) {
													$scope.menuassigndet = data;
													$scope.getData16($scope.pageno);
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
									}).error(
									function(data, status, headers, config) {
										jAlert('Unable to  Proceed Your Request','Information');
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MenuassignFormInsert',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
										}); 
										console.log('error: data = ', data);
									});
							}
					   }
				}
				$scope.menuroleupdateform = function menuroleupdateform() {
					var myForm = document.menuassignUpdate;
				      if (myForm.editmenuassmenuname.value== "")
				      {	 myForm.editmenuassmenuname.focus();
				      }else if (myForm.editmenuassrolename.value== "")
				      {   	 myForm.editmenuassrolename.focus();
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
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassignupdate?'+
							'menuid='+$scope.menuidedit+'&id='+$scope.menuroleeditdet.mid+
							'&roleid='+$scope.menuroleidedit+'&loginid='+sptstr[2]).success(
									function(data, status, headers, config) {
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?companyid='+sptstr[1])
												.success(function(data, status, headers, config) {
															$scope.menuassigndet = data;
															$scope.getData16($scope.pageno);
															document.getElementById("menurolemain").hidden = false;
															document.getElementById("menuroleedit").hidden = true;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('menuassignUpdate').reset(); 
									}).error(function(data, status, headers, config) {
										jAlert('Unable to  Proceed Your Request','Information');
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MenuassignFormUpdate',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
										}); 
									});
					   }
				}			} catch (e) {
				//alert(e);
			}
		});
scotchApp.controller('ApprovalFormCtrl', function($scope,$http, $compile, $filter) {
	try {
		
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
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		
	   		
	   		$scope.pagesno = [20,50,80,100,120,'All'];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
				if($scope.pagesint=='All')
					{
					$scope.pagesint=$scope.company.length;
	                        }
			}
			
			
		
			function printData()
			{
			   var divToPrint=document.getElementById("printTable");
			   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
				  var newWin = window.open('','',popup_win);
				   newWin.document.open();
			   var htmlToPrint = '' +
		        '<style type="text/css">' +
		        'table th, table td {' +
		        'border:1px solid #000;' +
		        'padding;0.5em;' +
		        '}' +
		        'tr:nth-child(even) {' +
		        'background:#bdbdbd; ' +
		         '}' +
		         'tr:nth-child(odd) {' +
			        'background:#d3d3d3; ' +
			         '}'+ 
		        '</style>';
		        htmlToPrint += divToPrint.outerHTML;
		        newWin = window.open("");
		        newWin.document.write(htmlToPrint);
		        newWin.print();
		        newWin.close();
			}

			$('#printbutton').on('click',function(){
			printData();
			})
			
			
//		$("#exportpdf").click(function(){
//		try
// 			{
//			
//			
//			
//			$('#printTable').tableExport({
// 				type:'pdf',escape:'false',
// 				tableName:'Company',
// 				pdfFontSize:8,
// 				orientation:'landscape',
// 				formate:'a4',
// 				htmlContent:'false',
// 				consoleLog:'false',
//				}
//			);
// 			}catch(e){}
//			
//	});
//			
			
//$('#exportpdf').click(function () {
//var htmlString = '' +
//'<style type="text/css">' +
//'table th, table td {' +
//'border:1px solid #000;' +
//'padding;0.5em;' +
//'}' +
//'tr:nth-child(even) {' +
//'background:#bdbdbd; ' +
//'}' +
//'tr:nth-child(odd) {' +
//'background:#d3d3d3; ' +
// '}'+ 
//'</style>';
//htmlString = htmlString + "<html><body><table>";
//var doc = new jsPDF('landscape','pt');
//var i=0;
//
//htmlString = htmlString + "<tr>"+
//"<td><font>Row No</font></td>"+
//"<td><font>Company Name</font></td>"+
//"<td><font>Short Name</font></td>"+
//"<td><font>Contact Person</font></td>"+
//"<td><font>Company Address</font></td>"
//"<td><font>Mobile No</font></td>"+
//"<td><font>Email Id</font></td>"+
//"<td><font>Reg. Address</font></td>"+
//"</tr>";
////alert(htmlString);
//try{
//for(i=0;i<$scope.company.length;i++){
//data  = $scope.company[i];
//htmlString = htmlString + "<tr>"+
//"<td><font>"+data.rowno+"</font></td>"+
//"<td><font>"+data.companyname+"</font></td>"+
//"<td><font>"+data.shortname+"</font></td>"+
//"<td><font>"+data.contactpersonname+"</font></td>"+
//"<td><font>"+data.companyaddress+"</font></td>"
//"<td><font>"+data.lanldlinenumber1+"</font></td>"+
//"<td><font>"+data.emailid+"</font></td>"+
//"<td><font>"+data.registeredaddress+"</font></td>"+
//
//"</tr>";
//}
//}catch(e){
////alert(e);
//}
////alert(htmlString);
//htmlString = htmlString + "</table></body></html>";
////alert(htmlString);
//doc.fromHTML(htmlString,100,100,{});
//doc.output("dataurlnewwindow");
//});		
	
			
	$('#exportpdf').click(function () {
     try{
			
			var columns = ["Row NO", "Company Name", "Dealer Name", "Customer Name","Vehicle No.","Status"];
			var i=0;
	        
	      	var data1=[];
				//alert($scope.company.length);

	    	for(i=0;i<$scope.company.length;i++){
	    		
	        var data  = $scope.company[i];
	    		 data1.push([data.rowno,data.companyname ,data.dealername,data.customername,data.vehicleno,data.status]);
	     	}
	    //	alert(data1);
	    	 var doc = new jsPDF('landscape','pt');
	         doc.autoTable(columns, data1);
	         doc.save("ApprovalDetails.pdf");
	    
	        }
	    catch(e)
	    {
	    	alert(e.message);
	    }
	    
	      });
			
			
try{
	
	    $("#exportexcel").click(function() {
	    	
	        //getting values of current time for generating the file name
	        var dt = new Date();
	        var day = dt.getDate();
	        var month = dt.getMonth() + 1;
	        var year = dt.getFullYear();
	        var hour = dt.getHours();
	        var mins = dt.getMinutes();
	        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
	        //creating a temporary HTML link element (they support setting file names)
	        var a = document.createElement('a');
	        //getting data from our div that contains the HTML table
	        var data_type = 'data:application/vnd.ms-excel';//base64,' 
	        var table_div = document.getElementById('uprintlTable');
	        //alert("table_div"+table_div);
	        var i=0;
	        var table_html = "";
	         table_html = table_html +" <html><body><table><tr>"+
	     	"<td><font>Row No</font></td>"+
			"<td><font>Company Name</font></td>"+
			"<td><font>Short Name</font></td>"+
			"<td><font>Contact Person</font></td>"+
			"<td><font>Company Address</font></td>"
			"<td><font>Mobile No</font></td>"+
			"<td><font>Email Id</font></td>"+
			"<td><font>Reg. Address</font></td>"+
			"</tr>";
			//alert(htmlString);
			try{
	    	for(i=0;i<$scope.company.length;i++){
	    		data1  = $scope.company[i];
	    		table_html = table_html + "<tr>"+
	    		"<td><font>"+data1.rowno+"</font></td>"+
				"<td><font>"+data1.companyname+"</font></td>"+
				"<td><font>"+data1.shortname+"</font></td>"+
				"<td><font>"+data1.contactpersonname+"</font></td>"+
				"<td><font>"+data1.companyaddress+"</font></td>"
				"<td><font>"+data1.lanldlinenumber1+"</font></td>"+
				"<td><font>"+data1.emailid+"</font></td>"+
				"<td><font>"+data1.registeredaddress+"</font></td>"+
				
	    		"</tr>";
	    	}
			}catch(e){
				//alert(e);
			}
			table_html = table_html + "</table></body></html>";
			//table_html = table_div.outerHTML.replace(/ /g, '%20');
	        a.href = data_type + ', ' + table_html;
	        //setting the file name
	        a.download = 'Company_table' + postfix + '.xls';
	        //triggering the function
	        a.click();
	        //just in case, prevent default behaviour
	       e.preventDefault(); 
	    });
	
	}catch(e){alert("sss"+e);}
////	
	
			try{
			$scope.companynew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
// 			Page.setTitle("Welcome");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/Approvaldetails?companyid='+sptstr[7]+'&controlid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.company = data;
						$scope.getData13($scope.pageno); 
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
			
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData13 = function(pageno){ 
//				alert("in")
				$scope.companynew = [];
			var start=0, end=0;
				if(pageno!=1){
					start = $scope.pagesint * (pageno-1);
					end = start + $scope.pagesint;
					start++;
				}else{
					start = 0;
					end = start + $scope.pagesint;
					start++;
				}
				
				for(var i=start;i<=end;i++){
					if(i<=$scope.company.length){
						$scope.companynew.push($scope.company[i-1]);
					}else{
						break;
					}
				}
					//alert($scope.company.length);
					$scope.total_count = $scope.company.length;
				
			};
			}catch(e){
				alert(e);
			}
			try{
				
			$scope.print_this = function(comp){
				//alert("in this");
				//var ndate = new Date();
				var vehicleno = comp.vehicleno;
				var ndate = comp.date;
				//var html = document.getElementById(container).innerHTML;
				var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
				var print_form = window.open('','',popup_win);
				print_form.document.open();
				var html = '' +
		        '<style type="text/css">' +
		        'table th, table td {' +
		        'border:1px solid #000;' +
		        'padding;0.5em;' +
		        '}' +
		        'tr:nth-child(even) {' +
		        'background:#bdbdbd; ' +
		         '}' +
		         'tr:nth-child(odd) {' +
			        'background:#d3d3d3; ' +
			         '}'+ 	
		        '</style>'+'<head><title>'+'ORSAC RECEIPT'+'</title></head>'+
		        '<body><div style="text-align:center;"><b>ORSAC  RECEIPT</b></div>'+
		        '<br><div>Receipt NO.:45451545451545</div><div style="text-align:right;">'+
		        'Date:';
				html = html + ndate +' </div></br>'+
		        '<div>Received RS.5000.00 from ST. PAUL SCHOOL on account of ORSAC fee for GPS '+
		        'tracking based services for temp vehicle No. ';
				html = html +vehicleno+' and '+
		        'CHasis NO.MBUTX54XDX0194059.THis fee is valid for 2 year from the date of vehicle '+
		        'fitment.</div>'
		        +'<div><br>GPS/GPRS details found compatible with ORSAC</br></div>'+
		        '<br><div style="text-align:center;"><b>GPS/GPRS Device Activation</b></div></br>'+
		        '<br><div>Activation No. &nbsp&nbsp&nbsp:RCPT/2014/7/24-62235&nbsp&nbsp&nbsp&nbsp&nbsp'+
		        '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTemp Vehicle No.&nbsp&nbsp&nbsp&nbsp:';
				html = html +vehicleno+
		        '</div>'+'<div>Activation Date.        :';
				html = html + ndate +'&nbsp&nbsp&nbsp'+
		        '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+
		        '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspVehicle Category.                                                                                                                            &nbsp&nbsp&nbsp :NA</div>'+
		        '<div>IMEI No.               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:';
				html = html + comp.imeino+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMeter Sr No.                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:454545542235</div>'+'<div>Sim No.          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:';
				html = html + comp.simno+'</div></br>'+'<div>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</div>'+'</br></br><div style="text-align:center;"><b>ORSAC RECEIPT</b></div>'+'<br><div class="col-md-12"><div class="col-md-6">Receipt NO.:45451545451545</div><div class="col-md-6" style="text-align:right">Date:';
				html = html + ndate +'</div></div></br>'+'<br><div>Received RS.5000.00 from ST. PAUL SCHOOL on account of ORSAC fee for GPS tracking based services for temp vehicle No. OR-12GA4515 and CHasis NO.MBUTX54XDX0194059.THis fee is valid for 2 year from the date of vehicle fitment.</div></br>'
		        +'<div><br>GPS/GPRS details found compatible with ORSAC</br></div>'+'<br><div style="text-align:center;"><b>GPS/GPRS Device Activation</b></div></br>'+'<br><div>Activation No.    :RCPT/2014/7/24-62235 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTemp Vehicle No.    :';
				html = html +vehicleno+'</div>'+'<div>Activation Date.    :';
				html = html + ndate +'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspVehicle Category.    :NA</div>'+'<div>IMEI No.    :';
				html = html + comp.imeino+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMeter Sr No.    :454545542235</div>'+'<div>Sim No.    :';
				html = html + comp.simno+'</div></br></br>'+'</body>'					        
		        ;
//				var html = "hello";
				
				print_form.document.write(html);
				print_form.document.close();
				print_form.print();
				return false;
				}
			
			
			
			

			$("#apprsearch").keypress(function(){
				try
				{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/Approvaldetails?companyid='+sptstr[7]+'&controlid='+sptstr[7]+'&searchid='+document.getElementById('apprsearch').value)
					.success(function(data, status, headers, config) {
						$scope.company = data;
						$scope.getData13($scope.pageno);
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/Approvaldetails?companyid='+sptstr[7]+'&controlid='+sptstr[7]+'&searchid='+document.getElementById('apprsearch').value)
						.success(function(data, status, headers, config) {
							$scope.company = data;
							$scope.getData13($scope.pageno); 
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});	
						
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});	
				
//				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBydeviceno='+$scope.searcbydeviceno)
//					.success(function(data, status, headers, config) {
//						$scope.devicenew = data;
//						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBydeviceno='+$scope.searcbydeviceno)
//						.success(function(data, status, headers, config) {
//							$scope.devicenew = data;
//							}).error(function(data, status, headers, config) {
//							console.log('error: data = ', data);
//						});
//						}).error(function(data, status, headers, config) {
//						console.log('error: data = ', data);
//					});

				}catch(e){
					
				}
			});

			$scope.approve = function(){
				var  comp = $scope.val;
				var vehicleno = comp.vehicleno;
				var ndate = comp.date;
	
				
				
				
				jConfirm('Approve Vehicle No: '+comp.vehicleno+' ?', 'Confirmation Dialog', function(r) { 
					if(r){
						
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/insertFlagDet?vehicleid='+comp.vehicleno)
				
				.success(function(data, status, headers, config) {
					
				
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/Approvaldetails?companyid='+sptstr[7]+'&controlid='+sptstr[7])
						.success(function(data, status, headers, config) {
							jAlert('Vehicle Approved', 'Confirmation Results');
//							$scope.print_this(comp);
							$scope.company = data;
							$scope.getData13($scope.pageno); 
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
//					
//					}).error(function(data, status, headers, config) {
//						console.log('error: data = ', data);
//					});
					
					}).error(function(data, status, headers, config) {
					
					jAlert('Vehicle Not Approved','Information');
					console.log('error: data = ', data);
				});
					}
				});
			}
			$scope.val = [];
			$scope.getdet = function(comp){
				$scope.val = comp;
				$scope.companyname = comp.companyname;
				$scope.customername=comp.customername;
				$scope.dealername=comp.dealername;
				$scope.chasisno=comp.chasisno;
				$scope.imeino=comp.imeino;
				$scope.simno=comp.simno;
				$scope.deviceid=comp.deviceid;
				$scope.engineno=comp.engineno;
				$scope.getData13($scope.pageno);
				$scope.vehicleno = comp.vehicleno;
				$scope.ndate = comp.date;
				$scope.receiptno=comp.receiptno;	
				$scope.urlimage1 = "http://209.190.15.26/images/"+comp.vehicleno+"/image1.png";
				$scope.urlimage2 = "http://209.190.15.26/images/"+comp.vehicleno+"/image2.png";
			}
			
			$scope.disapprove = function(comp){
				jConfirm('Unauthorize Vehicle No: '+comp.vehicleno+' ?', 'Confirmation Dialog', function(r) { 
					if(r){
						
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/insertFlagDetu?vehicleid='+comp.vehicleno)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/Approvaldetails?companyid='+sptstr[7]+'&controlid='+sptstr[7])
						.success(function(data, status, headers, config) {
							jAlert('Vehicle Unauthorized', 'Confirmation Results');
							
							$scope.company = data;
							$scope.getData13($scope.pageno); 
							
					
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}).error(function(data, status, headers, config) {
					
					jAlert('Vehicle Not Approved','Information');
					console.log('error: data = ', data);
				});
					}
				});
			}
			
			
			}
			catch(e)
			{
				alert(e);
			}
			
			
			
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
			    
			    	 myForm.cname1.focus();
			      }
			      else if (myForm.person1.value== "")
			      { myForm.person1.focus();
			      }
			      else if (myForm.mobile1.value== "")
			      {
			    	
			    	 myForm.mobile1.focus();
			    	
			      }
			      
			      else if (myForm.cadd1.value== "")
			      {
			    	
			    	 myForm.cadd1.focus();
			    	
			      }
			    
			     else if (myForm.radd1.value== "")
			      {
			    	
			    	 myForm.radd1.focus();
			    	
			      }
			     else if (myForm.email1.value== "")
			      {
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
										+ document.getElementById('mobile1').value
										+ '&landlin2='
										+ document.getElementById('landline1').value
										+ '&faxnumber='
										+ document.getElementById('fax1').value
										+ '&regisraddress='
										+ document.getElementById('radd1').value
										+ '&emailid='
										+ document.getElementById('email1').value
										+ '&remark='
										+ document.getElementById('rem1').value
										+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&city='+document.getElementById('insertcompcity').value+'&state='+document.getElementById('insertcompstate').value+'&zip='+document.getElementById('insertcompzip').value).success(
								function(data, status, headers, config) {
// 									
								jAlert('Record Inserted Successfully', 'Success Dialog'); 
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
											.success(function(data, status,
															headers, config) {
														$scope.company = data;
														$scope.getData13($scope.pageno); 
													})
											.error(
													function(data, status,
															headers, config) {
														console.log('error: data = ',data);

													});
								}).error(
								function(data, status, headers, config) {
								
									var i=0;
									for(i=0;i<$scope.company.length;i++)
										{
										if($scope.company[i].companyname==document.getElementById('cname1').value)
											{
											jAlert('Problem in Saving Records! Company Name Already Exists','Information');
											}
										else if($scope.company[i].shortname==document.getElementById('sname1').value)
										{
											jAlert('Problem in Saving Records! Short Name Already Exists','Information');
										}
										else if($scope.company[i].lanldlinenumber1==document.getElementById('mobile1').value)
										{
										jAlert('Problem in Saving Records! Mobile no Already Exists','Information');
										}
										else if($scope.company[i].emailid==document.getElementById('email1').value)
										{
										jAlert('Problem in Saving Records! Email Id  Already Exists','Information');
										}
										}
								
									console.log('error: data = ', data);
								});
				   }
			}
		$scope.companyedit = function companyedit() {
					try
					{
				
					$scope.companydetails=$scope.company;
					var i=0;
					
					}catch(e){}
					var myForm1 = document.form2;
				      if (myForm1.compname.value== "")
				      {
				    	
				    	 myForm1.compname.focus();
				      }
				      else if (myForm1.personname.value== "")
				      {
				    
				    	 myForm1.personname.focus();
				      }
				      else if (myForm1.mobileno.value== "")
				      {
				    
				    	 myForm1.mobileno.focus();
				    	
				      }
				      
				      else if (myForm1.caddress.value== "")
				      {
				    	
				    	 myForm1.caddress.focus();
				    	
				      }
				    
				     else if (myForm1.raddress.value== "")
				      {
				    	
				    	 myForm1.raddress.focus();
				    	
				      }
				     else if (myForm1.emailID.value== "")
				      {
				    	
				    	 myForm1.emailID.focus();
				    	
				      }
				   else
				   {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companyedit?companyid='+$scope.editcompanyy.companyid+'&companyname='+ document.getElementById('compname').value
					+ '&shortname='+ document.getElementById('shortname').value+ '&caddress='+ document.getElementById('caddress').value+ '&personname='+ document.getElementById('personname').value+ '&landlin1='+ document.getElementById('mobileno').value+ '&faxnumber='+ document.getElementById('faxno').value+ '&regisraddress='+ document.getElementById('raddress').value+ '&emailid='+ document.getElementById('emailID').value+ '&remark='+ document.getElementById('remark').value
					+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&state='+document.getElementById('editcompstate').value+'&city='+document.getElementById('editcompCity').value+'&zip='+document.getElementById('editcompzip').value)
					.success(function(data, status, headers, config) {
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
												.success(function(data, status,	headers, config) {
														$scope.company = data;
														$scope.getData13($scope.pageno); 
															document.getElementById("maincom").hidden = false;
															document.getElementById("showedit").hidden = true;
															//alert("in afetr");
														})
												.error(function(data, status,headers, config) {
															console.log('error: data = ',data);
														});
// 										
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('form2').reset(); 
									})
									.error(function(data, status, headers, config) {
										
										console.log('error: data = ', data);
									});
				}

	}
		} catch(e){
			
		}
	});

scotchApp.controller('MapCtrl', function($scope,$http, $compile, $filter) {
		
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
		document.getElementById('mapTrackFrame').src="maptrack?ownersid="+sptstr[2];
		clearInterval(interval);
		var ONE_HOUR = 60 * 60 * 1000;
		var time=(new Date).getTime();
		$scope.query = {}
	   		$scope.queryBy = '$'
		$scope.sort = function(keyname) {
			$scope.sortKey = keyname; //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
	});

scotchApp.controller('nonpollingCtrl', function($scope,$http, $compile, $filter) {
	
	
	$scope.pagesno = [20,50,80,100,120];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
	}
	try
	{
	$scope.nonPollingDetails = []; //declare an empty array
	$scope.pollingpageno = 1; // initialize page no to 1
	$scope.pollingtotal_count = 0;
//	$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
	//alert('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint);
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint).success(function(response){ 
			//alert(response);
			$scope.nonPollingDetailsall=response;
			$scope.getDatapol($scope.pollingpageno); 
		});
		
	
	$scope.getDatapol = function(pageno){ 
		$scope.nonPollingDetails = [];
	var start=0, end=0;
		if(pageno!=1){
			start = $scope.pagesint * (pageno-1);
			end = start + $scope.pagesint;
			start++;
		}else{
			start = 0;
			end = start + $scope.pagesint;
			start++;
		}
		
		for(var i=start;i<=end;i++){
			if(i<=$scope.nonPollingDetailsall.length){
					$scope.nonPollingDetails.push($scope.nonPollingDetailsall[i-1]);
			}else{
				break;
			}
		}
			
			$scope.pollingtotal_count = $scope.nonPollingDetailsall.length;
		
	};
	
	}catch(e){alert(e);}
	
		try{
	
$("#popdanger").click(function(){
document.getElementById('main').hidden=true;
document.getElementById('nonpollingTable').hidden=false;
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2])
.success(function(data, status, headers, config) {
	$scope.nonPollingDetails=data;
}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});	

});			
	}catch(e){alert(e);}	
	
	
	
$scope.backToLive= function backToLive()
{
	document.getElementById('main').hidden=false;
	document.getElementById('nonpollingTable').hidden=true;
}
	


$("#nonpollingsearchbyDeviceid").keypress(function(){
//	alert('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint+'&nonpollinDevices='+document.getElementById('nonpollingsearchbyDeviceid').value);
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint+'&nonpollinDevices='+document.getElementById('nonpollingsearchbyDeviceid').value).success(function(response){ 
		//alert(response.length);
		$scope.nonPollingDetailsall=response;
		$scope.getDatapol($scope.pollingpageno); 
	}).error(function(data, status, headers, config) {
		//alert(data);
		console.log('error: data = ', data);
	});
	
});


	
});


scotchApp.controller('dealermapctrl', function($scope,$http, $compile, $filter) {
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
	document.getElementById('mapframe').src="maptrack?ownersid="+sptstr[2];
	clearInterval(interval);
	var ONE_HOUR = 60 * 60 * 1000;
	var time=(new Date).getTime();
	$scope.query = {}
   		$scope.queryBy = '$'
	$scope.sort = function(keyname) {
		$scope.sortKey = keyname; //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
});




scotchApp.controller('vehiclesummaryCtrl', function($scope,$http, $compile, $filter) {
	var time = new Date();
	$scope.limit = 50;
	var diffMs = (time-mydate); // milliseconds between now & Christmas
	var diffDays = Math.round(diffMs / 86400000); // days
	var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
	var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
	if(diffMins>20){
		jAlert('Session Expired Please Login Again','Information');
		window.location.replace("/");
	}
	
	$scope.getmodal = function(comp){
//		alert(comp.tripid+" "+comp.mindatereceived+" "+comp.latitude+" "+comp.longitude);
		document.getElementById("vehicleframesingle").src = "vehiclesummarysingle?vehicleno="+document.getElementById('vehiclenosummaryreport').value
			+"&tripid="+comp.tripid+"&date="+comp.mindatereceived+"&latitude="+comp.latitude+"&longitude="+comp.longitude;
		var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");
try{
//		$('a[data-modal-id]').click(function(e) {
//			e.preventDefault();
	    $("#summarytable2").append(appendthis);
	    $(".modal-overlay").fadeTo(500, 0.7);
	    //$(".js-modalbox").fadeIn(500);
			var modalBox = $("#summarytable2").attr('data-modal-id');
			$('#popup1').fadeIn($("#summarytable2").data());
//		});  
	  
	$(".js-modal-close, .modal-overlay").click(function() {
	    $(".modal-box, .modal-overlay").fadeOut(500, function() {
	        $(".modal-overlay").remove();
	    });
	 
	});
	 
	$(window).resize(function() {
	    $(".modal-box").css({
	        top: ($(window).height() /4),
	        left: ($(window).width() - $(".modal-box").outerWidth()) /4
	    });
	});
	 
	$(window).resize();
}catch(e){}
	}
	
	
	$scope.pagesno = [20,50,80,100,120];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
	}
	clearInterval(interval);
			
			function formatAMPM() {
				
	            var hours = new Date().getHours();
	            var minutes = new Date().getMinutes();
	            var ampm = hours >= 12 ? 'PM' : 'AM';
	            hours = hours % 12;
	            hours = hours ? hours : 12; // the hour '0' should be '12'
	            hours = hours < 10 ? '0' + hours : hours;
	            minutes = minutes < 10 ? '0' + minutes : minutes;
//	            if(hours.length==1){hours='0'+hours;}
	            var strTime = hours + ' : ' + minutes + ' : ' + ampm;
	            return strTime;
	        }
			
			$('#timepicker1').timepicki();
			$('#timepicker2').timepicki();
			$('#timepicker1').val("12 : 00 : AM");
			$('#timepicker2').val("11 : 59 : PM");
		
	
			
			try{
				$("#historyexcel").click(function() {
			        //getting values of current time for generating the file name
			        var dt = new Date();
			        var day = dt.getDate();
			        var month = dt.getMonth() + 1;
			        var year = dt.getFullYear();
			        var hour = dt.getHours();
			        var mins = dt.getMinutes();
			        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
			        //creating a temporary HTML link element (they support setting file names)
			        var a = document.createElement('a');
			        //getting data from our div that contains the HTML table
			        var data_type = 'data:application/vnd.ms-excel';//base64,' 
			      //  var table_div = document.getElementById('historyDiv');
			        //alert("table_div"+table_div);
			        var i=0;
			        var table_html = "";
			table_html = table_html +"<html><body><table><tr>"+
			"<td><font>Start Date</font></td>"+
			"<td><font>End Date</font></td>"+
			"<td><font>Stoppage/speed</font></td>"+
			"<td><font>Location</font></td>"+
		"</tr>";
			//alert(htmlString);
			try{
	    	for(i=0;i<$scope.vehiclesummarydetails.length;i++){
	    		data  = $scope.vehiclesummarydetails[i];
	    		table_html = table_html + "<tr>"+
				"<td><font>"+data.mindatereceived+"</font></td>"+
				"<td><font>"+data.maxdatereceived+"</font></td>"+
				"<td><font color='green' ng-if='data.tripid>0 && data.tripid<=limit'>Speed"+data.tripid+" KM/Hr</font>"+
				"<font color='red' ng-if='data.tripid>=limit'>OverSpeed "+data.tripid+" KM/Hr</font>"+
				"<font color='blue' ng-if='data.tripid=='0''>Stoppage "+data.stop+" min</font>"+
				"</td>"+
				"<td><font>"+data.location+"</font></td>"+
				"</tr>";
								}
						}catch(e){}
					table_html = table_html + "</table></body></html>";
			        a.href = data_type + ', ' + table_html;
			        //setting the file name
			        a.download = 'Vehicle Summary_Details_Report' + postfix +'Vehicle No:'+document.getElementById('vehiclenosummaryreport').value+'.xls';
			        a.click();
			        //just in case, prevent default behaviour
			       e.preventDefault(); 
			    });}catch(e){}
			
			
			var ONE_HOUR = 60 * 60 * 1000;
			var time=(new Date).getTime();
			
			$scope.query = {}
		   		$scope.queryBy = '$'
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
			
			$scope.BYVehicleno='';
			
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyvehicleno='+$scope.BYVehicleno)
			.success(function(data, status, headers, config) {
				$scope.vehicledetailssummary = data;
				//alert(data);
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			try{
			
				$scope.vehiclesummarydetailsnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData26 = function(pageno){ 
					$scope.vehiclesummarydetailsnew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					for(var i=start;i<=end;i++){
						if(i<=$scope.vehiclesummarydetails.length){
//							if($scope.BYVehicleno!='')
//							{
//								if($scope.vehiclesummarydetails[i].includes($scope.BYVehicleno))
//									{
//										$scope.vehiclesummarydetailsnew.push($scope.vehiclesummarydetails[i-1]);
//									}
//							}
//							else
//								{
								$scope.vehiclesummarydetailsnew.push($scope.vehiclesummarydetails[i-1]);
//								}
						}else{
							break;
						}
					}
						
						$scope.total_count = $scope.vehiclesummarydetails.length;
					
				};
//				
				
//				$("#vehiclenosummaryreport").keypress(function(){
//					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyvehicleno='+$scope.BYVehicleno)
//					.success(function(data, status, headers, config) {
//						$scope.vehiclesummarydetailsnew = data;
//						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyvehicleno='+$scope.BYVehicleno)
//						.success(function(data, status, headers, config) {
//							$scope.vehiclesummarydetailsnew = data;
//
//						}).error(function(data, status, headers, config) {
//							console.log('error: data = ', data);
//						});
//					}).error(function(data, status, headers, config) {
//						console.log('error: data = ', data);
//					});
//				});
						
//			
			$scope.getRec = function(){ 

				
				var myform = document.vehiclesumrp;
			      if (myform.vehiclenosummaryreport.value== "")
			      {
			    	  myform.vehiclenosummaryreport.focus();
			      }
			      else  if (myform.datesummaryreport.value== "")
			      {
			    	  myform.datesummaryreport.focus();
//			    	  
			      }
			      else  if (myform.timepicker1.value== "")
			      {
			    	  myform.timepicker1.focus();
			    	  
			      }
			      else  if (myform.timepicker2.value== "")
			      {
			    	  myform.timepicker2.focus();
			    	  
			      }
			      else
			   {
				
				 var over = '<div id="overlay">' +
//			     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
			     '</div>';
			    $(over).appendTo('body');
			    
			    
				document.getElementById('summarytable1').hidden=true;
				document.getElementById('summarytable2').hidden=true;
				document.getElementById('searchtbl').hidden=true;
				document.getElementById("vehicleframe").src = "";
				document.getElementById("vehicletrack").hidden = true;


				var mytime11 = document.getElementById("timepicker1").value;
				var mytime1 = mytime11.charAt(0) + mytime11.charAt(1) + mytime11.charAt(3) + mytime11.charAt(5) + mytime11.charAt(6) + " " + mytime11.charAt(10) + mytime11.charAt(11);
				var mytime12 = document.getElementById("timepicker2").value;
				var mytime2 = mytime12.charAt(0) + mytime12.charAt(1) + mytime12.charAt(3) + mytime12.charAt(5) + mytime12.charAt(6) + " " + mytime12.charAt(10) + mytime12.charAt(11);
				 var i=0;var k=[];
				 $scope.summaryvehicleid = 0;
				 $scope.vehiclesummarydetails=k;
					for(i=0;i<$scope.vehicledetailssummary.length;i++){
						if($scope.vehicledetailssummary[i].vehicleregno == document.getElementById('vehiclenosummaryreport').value)
						{
							$scope.summaryvehicleid=$scope.vehicledetailssummary[i].vehicleid;
						}
					}
					
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehiclesummarydetails?deviceid='
						+$scope.summaryvehicleid+
						'&todate='+document.getElementById("datesummaryreport").value+
						'&fromdate='+document.getElementById("datesummaryreport").value+
						'&totime='+mytime2+'&fromtime='+mytime1)
				.success(function(data, status, headers, config) {
					//alert("in first succ");
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehiclesummaryreport')
					.success(function(data, status, headers, config) {
						try{
						//alert($scope.pageno);
						
						$scope.vehiclesummarydetails = data;
						$scope.getData26($scope.pageno); 
						if(data.length==0){
							//alert("if");
					    	 $('#overlay').remove();
								jAlert('No Data Found','Information');	
					    }
						 else
							 {
							// alert("in sec succ");
						var i=0,speedviolation=0,maxspeed=0;
						var dist = 0;
						var lat,longi;
						var stoppagemins=0;
						for(i=0;i<data.length;i++){
//							if(i!=0){ 
//								if(!((Number(lat)==Number(data[i].latitude)) && (Number(longi)==Number(data[i].longitude)))){
//									dist = dist + distance(Number(lat),Number(longi),Number(data[i].latitude),Number(data[i].longitude),"K");
//								}
//								
//							}
//							lat = data[i].latitude;
//							longi = data[i].longitude;
							dist = data[i].distance;
							if(data[i].tripid==0){
								stoppagemins = stoppagemins + Number(data[i].stop);
							}else{
								if(Number(data[i].tripid)>$scope.limit){
									speedviolation = speedviolation+1;
								}
								if(maxspeed<Number(data[i].tripid)){
									maxspeed=data[i].tripid;
								}
							}
						}
						dist = Math.round(dist * 100) / 100
						$scope.distance = dist;
						$scope.stoppmins = stoppagemins;
						$scope.speedviolation=speedviolation;
						$scope.maxspeed=maxspeed;
						document.getElementById('summarytable1').hidden=false;
						document.getElementById('summarytable2').hidden=false;
						document.getElementById('searchtbl').hidden=false;
						//alert("in summary");
						var response = $http.post('SummaryService', $scope.vehiclesummarydetails);
						response.success(function(data, status, headers, config) {
							document.getElementById("vehicleframe").src = "vehiclesummary?vehicleno="+document.getElementById('vehiclenosummaryreport').value;
							document.getElementById("vehicletrack").hidden = false;
						});
						response.error(function(data, status, headers, config) {
							//alert( "Exception details: " + JSON.stringify({data: data}));
						});
						
						
						
						 $('#overlay').remove();
							 }
						}catch(e){
							//alert(e);
						}
					}).error(function(data, status, headers, config) {
					
						 $('#overlay').remove();
						jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					});
						// }
				}).error(function(data, status, headers, config) {
					
					 $('#overlay').remove();
					jAlert('No Data Found','Information');
					console.log('error: data = ', data);
				});
			}
			      }
			}catch(e){
				//alert(e);
			}
			
		});


scotchApp.controller('geofencesummaryCtrl', function($scope,$http, $compile, $filter) {
	
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
	
	$scope.pagesno = [20,50,80,100,120];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
	}
	clearInterval(interval);
//	alert("hello");
	$('#timepicker1geo').timepicki();
	$('#timepicker2geo').timepicki();
	
	
	$('#timepicker1geo').val("12 : 00 : AM");
	$('#timepicker2geo').val("11 : 59 : PM");

	
	
	$scope.rname='Name';
	var ONE_HOUR = 60 * 60 * 1000;
	var time=(new Date).getTime();
	
	 $("#geofencereportselect").change(function () {
	        var name = this.value;
	        $scope.tname = name;
	        var x = document.getElementById("geofencenosummaryreport");
	        if(name=='geofence_wise'){
		    	$scope.rname='Geofence Name';
		    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/geofencedetails?companyid=61011&loginid=10001')
				.success(function(data, status, headers, config) {

					$scope.geofencedetailssummary = data;
					x.setAttribute("list", "geofencesummarylistgeoname"); 
					
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
		    }else if(name=='vehicle_wise'){
		    	$scope.rname='Vehicle No.';
		    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		    	.success(function(data, status, headers, config) {
		    		$scope.geofencedetailssummary = data;
		    		x.setAttribute("list", "geofencesummarylist"); 

		    	}).error(function(data, status, headers, config) {
		    		console.log('error: data = ', data);
		    	});
		    }
	        
	    });
	$scope.query = {}
   		$scope.queryBy = '$'
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
	
	
	
	
	
	 try{
			$("#GeoFenceExcel").click(function() {
				
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		          var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Vehicle No</font></td>"+
		"<td><font>Geofence Name</font></td>"+
		"<td><font>In Datetime</font></td>"+
		"<td><font>Out Datetime</font></td>"+
		"<td><font>Total Stoppage(Min)</font></td>"+
		"</tr>";
		//alert(htmlString);
		try{
 	for(i=0;i<$scope.geofencesummarydetails.length;i++){
 		data  =$scope.geofencesummarydetails[i];
 		table_html = table_html + "<tr>"+
 		"<td><font>"+data.vehicleno+"</font></td>"+
		"<td><font>"+data.geofencename+"</font></td>"+
		"<td><font>"+data.intime+"</font></td>"+
		"<td><font>"+data.outtime+"</font></td>"+
		"<td><font>"+data.stoppage+"</font></td>"+
	"</tr>";
 		}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'GeoFence_Report' + postfix +'.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){}	
	
	
	
	
	try{
		
		$scope.geofencesummarydetailsnew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
//		$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
		
		$scope.getData27 = function(pageno){ 
			$scope.geofencesummarydetailsnew = [];
		var start=0, end=0;
			if(pageno!=1){
				start = $scope.pagesint * (pageno-1);
				end = start + $scope.pagesint;
				start++;
			}else{
				start = 0;
				end = start + $scope.pagesint;
				start++;
			}
			
			for(var i=start;i<=end;i++){
				if(i<=$scope.geofencesummarydetails.length){
					$scope.geofencesummarydetailsnew.push($scope.geofencesummarydetails[i-1]);
				}else{
					break;
				}
			}
				
				$scope.total_count = $scope.geofencesummarydetails.length;
			
		};
		
	$scope.getRec = function(){
		
//		
		var myform1 = document.geofencesumrp;
	      if (myform1.geofencenosummaryreport.value== "")
	      {
	    	  myform1.geofencenosummaryreport.focus();
	      }
	      else  if (myform1.fdategeosummaryreport.value== "")
	      {
	    	  myform1.fdategeosummaryreport.focus();
	      }
	      else  if (myform1.timepicker1geo.value== "")
	      {
	    	  myform1.timepicker1geo.focus();
	      }
	      else  if (myform1.tdategeosummaryreport.value== "")
	      {
	    	  myform1.tdategeosummaryreport.focus();
	      }
	      else  if (myform1.timepicker2geo.value== "")
	      {
	    	  myform1.timepicker2geo.focus();
	      }
	      else
	    	  {
		
		
		 var over = '<div id="overlay">' +
//	     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
	     '</div>';
	    $(over).appendTo('body');
	document.getElementById('geosummarytable1').hidden=true;


		var mytime11 = document.getElementById("timepicker1geo").value;
		var mytime1 = mytime11.charAt(0) + mytime11.charAt(1) + mytime11.charAt(3) + mytime11.charAt(5) + mytime11.charAt(6) + " " + mytime11.charAt(10) + mytime11.charAt(11);
		var mytime12 = document.getElementById("timepicker2geo").value;
		var mytime2 = mytime12.charAt(0) + mytime12.charAt(1) + mytime12.charAt(3) + mytime12.charAt(5) + mytime12.charAt(6) + " " + mytime12.charAt(10) + mytime12.charAt(11);
		
		var fdate = document.getElementById("fdategeosummaryreport").value+" "+mytime1;
		var tdate = document.getElementById("tdategeosummaryreport").value+" "+mytime2;
//		alert(fdate+" "+tdate);
		 var i=0;
		 try{
		 $scope.summaryvehicleid = 0;
		 if($scope.tname=='vehicle_wise'){
			for(i=0;i<$scope.geofencedetailssummary.length;i++){
				if($scope.geofencedetailssummary[i].vehicleregno == document.getElementById('geofencenosummaryreport').value)
				{
					$scope.summaryvehicleid=$scope.geofencedetailssummary[i].vehicleid;
				}
			}
		 }else{
			 $scope.summaryvehicleid = document.getElementById('geofencenosummaryreport').value;
		 }
//			alert('geofencereport?vehicleno='
//					+$scope.summaryvehicleid+
//					'&tdate='+tdate+
//					'&fdate='+fdate);
		 }catch(e){
			// alert(e);
		 }
		 
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/geofencereport?vehicleno='
				+$scope.summaryvehicleid+
				'&tdate='+tdate+
				'&fdate='+fdate+'&type='+$scope.tname)
		.success(function(data, status, headers, config) {
			    if(data.length==0){
			    	 $('#overlay').remove();
						jAlert('No Data Found','Information');	
			    }
			    else{
					$scope.geofencesummarydetails = data;
					$scope.getData27($scope.pageno); 
					document.getElementById('geosummarytable1').hidden=false;
					document.getElementById('searchtbl').hidden=false;
					$('#overlay').remove();
			    }
		}).error(function(data, status, headers, config) {
			 $('#overlay').remove();
			jAlert('No Data Found','Information');
			console.log('error: data = ', data);
		});
	}
	    	}
	}catch(e){
		alert(e);
	}
	
});
		
		
scotchApp.controller('vendorCtrl', function($scope,$http, $compile, $filter) {
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
		
		$scope.pagesno = [20,50,80,100,120,240];
		$scope.pagesint=20; 
		$scope.onpagechange = function(page){ 
			$scope.pagesint=page; 
		} 
		
		$scope.maketypevendor;
		function printData()
		{
		   var divToPrint=document.getElementById("printTablevendor");
		   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
			  var newWin = window.open('','',popup_win);
			   newWin.document.open();
		  
		   
		   var htmlToPrint = '' +
	        '<style type="text/css">' +
	        'table th, table td {' +
	        'border:1px solid #000;' +
	        'padding;0.5em;' +
	        '}' +
	        'tr:nth-child(even) {' +
	        'background:#bdbdbd; ' +
	         '}' +
	         'tr:nth-child(odd) {' +
		        'background:#d3d3d3; ' +
		         '}'+ 
	        '</style>';
	        htmlToPrint += divToPrint.outerHTML;
	        newWin = window.open("");
	        newWin.document.write(htmlToPrint);
	        newWin.print();
	        newWin.close();
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Make Name","Vendor Name","ContactPerson","Address","Mobile NO","Email ID"];
						var i=0;
				      	var data1=[];
						for(i=0;i<$scope.vendordetailslist.length;i++){
				    		
				        var data  = $scope.vendordetailslist[i];
				    		 data1.push([data.rowno,data.makename ,data.vendorfirmname,data.contactperson,data.vendoraddress,data.mobilenumber,data.mobilenumber,data.emailid]);
				      	}
				    	var doc = new jsPDF('landscape','pt');
				       doc.autoTable(columns, data1);
				         doc.save("VendorDetails.pdf");
				           }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
	
		
		
	$("#exportexcel").click(function(){

	try
	{
	$('#printTablevendor').tableExport({
		type:'excel',escape:'false',separator: ',',
		tableName:'Vendor',
		pdfFontSize:10,
		htmlContent:'false',
		consoleLog:'false',
		
		}

	);

	}catch(e){}
	});

	
	//select for make type
	
	try{
//		var searchTerm = null;
//	      // Remote data example
//	      var remoteDataConfig = {
//	          placeholder: "Search for an option...",
//	          minimumInputLength: 0,
//	          ajax: {
//	              url: 'menudetails?roleid=30002&parentid=0',
//	              dataType: 'json',
//	              data: function (term, page) {
//	                  // Nothing sent to server side. Mock example setup.
//	                  searchTerm = term.toUpperCase();
//	              },
//	              results: function (data, page) {
//	                  // Normally server side logic would parse your JSON string from your data returned above then return results here that match your search term. In this case just returning 2 mock options.
//	                  return {
//	                      results: getMockData()
//	                  };
//	              }
//	          },
//	          formatResult: function (option) {
//	              return "<div>" + option.assetname + "</div>";
//	          },
//	          formatSelection: function (option) {
//	              return option.assetname;
//	          }
//	      };
//
//	      function getMockData() {
//	          var foundOptions = [];
//	        //  alert("in vendor "+$scope.vendorassetdetails);
//	          for (var key in $scope.vendorassetdetails) {
//	              if ($scope.vendorassetdetails[key].assetname.toUpperCase().indexOf(searchTerm) >= 0) {
//	                  foundOptions.push($scope.vendorassetdetails[key]);
//	              }
//	          }
//      return foundOptions;
//	      };
//	      $("#maketypenamevendorlist").select2(remoteDataConfig);
}catch(e)
{ 
	}   

	
	//select make name


try{
//	var searchTerm1 = null;
//      // Remote data example
//      var remoteDataConfig1 = {
//          placeholder: "Search for an option...",
//          minimumInputLength: 0,
//          ajax: {
//              url: 'menudetails?roleid=30002&parentid=0',
//              dataType: 'json',
//              data: function (term, page) {
//                  // Nothing sent to server side. Mock example setup.
//                  searchTerm1 = term.toUpperCase();
//              },
//              results: function (data, page) {
//                  // Normally server side logic would parse your JSON string from your data returned above then return results here that match your search term. In this case just returning 2 mock options.
//                  return {
//                      results: getMockData1()
//                  };
//              }
//          },
//          formatResult: function (option) {
//              return "<div>" + option.makename + "</div>";
//          },
//          formatSelection: function (option) {
//              return option.makename;
//          }
//      };
//
//      function getMockData1() {
//          var foundOptions = [];
//          for (var key in $scope.vendormakenamelist) {
//        	  alert("maketype doc "+$scope.maketypevendor);
//        	//  alert("maketype"+$scope.vendorassetdetails[key].assetname+" makname"+$scope.vendormakenamelist[key].assetname);
//        	
//        	  if ($scope.vendormakenamelist[key].makename.toUpperCase().indexOf(searchTerm1) >= 0) {
//        		  alert("in if first");
//        		  if($scope.vendormakenamelist[key].assetname==$scope.maketypevendor)
//        		  {
//        		  
//        		  alert("in if sec");
//        		  foundOptions.push($scope.vendormakenamelist[key]);
//        		  }	
//              
//    		  }
//          }
//  return foundOptions;
//      };
//      $("#makenamevendorlist").select2(remoteDataConfig1);
}catch(e)
{ 
	//alert("err"+e);
}   
$scope.ByVendorname='';
		try
		{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyVendorname='+$scope.ByVendorname)
		.success(function(data, status, headers, config) {
			$scope.vendordetailslist = data;
			$scope.getData18($scope.pageno); 
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		$scope.vendordetailslistnew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
//		$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
		
		$scope.getData18 = function(pageno){ 
			$scope.vendordetailslistnew = [];
		var start=0, end=0;
			if(pageno!=1){
				start = $scope.pagesint * (pageno-1);
				end = start + $scope.pagesint;
				start++;
			}else{
				start = 0;
				end = start + $scope.pagesint;
				start++;
			}
			
			for(var i=start;i<=end;i++){
				if(i<=$scope.vendordetailslist.length){
					if($scope.ByVendorname!='')
						{
						if($scope.vendordetailslist[i].includes($scope.searchbyVendorname))
							{
					$scope.vendordetailslistnew.push($scope.vendordetailslist[i-1]);
							}
						}
					else
						{
						$scope.vendordetailslistnew.push($scope.vendordetailslist[i-1]);
						}
				}else{
					break;
				}
			}
				
				$scope.total_count = $scope.vendordetailslist.length;
			
		};
		$("#searchbyVendorname").keypress(function(){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyVendorname='+$scope.ByVendorname)
			.success(function(data, status, headers, config) {
				$scope.vendordetailslistnew = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyVendorname='+$scope.ByVendorname)
				.success(function(data, status, headers, config) {
					$scope.vendordetailslistnew = data;
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
		});
		
		
		
		
		
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			$scope.vendorassetdetails = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
			
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.vendormakenamelist = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
	}catch(e)
		{
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
		
		
		
		$scope.deletevendor = function(deletevendorid){
			jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
				if(r){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordelete?id='+deletevendorid.vendorid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.vendordetailslist = data;
			$scope.getData18($scope.pageno);
				jAlert('Record Deleted Successfully', 'Confirmation Results');
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				

			}).error(function(data, status, headers, config) {
				jAlert('Record Not Deleted','Information');
				console.log('error: data = ', data);
			});
				}
			});
		}
		
		$scope.vendorInsert=function vendorInsert()
		{	try
			{
				var i=0;
				for(i=0;i<$scope.vendorassetdetails.length;i++){
					if($scope.vendorassetdetails[i].assetname==document.getElementById("insertvendorassetname").value){
						$scope.vendorassetid = $scope.vendorassetdetails[i].assettypeid;
					}
				}
				
				for(i=0;i<$scope.vendormakenamelist.length;i++){
					if($scope.vendormakenamelist[i].makename==document.getElementById("insertvendormakename").value){
						$scope.vendormakeid = $scope.vendormakenamelist[i].makeid;
					}
				}
					
				var myvendorinsert = document.vendorforminsert; 
			      if (myvendorinsert.insertvendorname.value== "") 
			      { 
			    	 myvendorinsert.insertvendorname.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendorcontactperson.value== "") 
				      { 
				    	 myvendorinsert.insertvendorcontactperson.focus(); 
				      } 
			      else	if (myvendorinsert.insertvendordesignation.value== "") 
			      { 
			    	 myvendorinsert.insertvendordesignation.focus(); 
			      } 
			      
			      else	if (myvendorinsert.insertvendormakename.value== "") 
			      {
			    	 myvendorinsert.insertvendormakename.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendormobileno.value== "") 
			      { 
			    	 myvendorinsert.insertvendormobileno.focus(); 
			      } 
			      
			      else	if (myvendorinsert.insertvendoremailid.value== "") 
			      { 
			    	 myvendorinsert.insertvendoremailid.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendorserstationcontactno.value== "") 
			      { 
			    	 myvendorinsert.insertvendorserstationcontactno.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendoraddress.value== "") 
			      { 
			    	 myvendorinsert.insertvendoraddress.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendorcreditdays.value== "") 
			      { 
			    	 myvendorinsert.insertvendorcreditdays.focus(); 
			      } 
			      else	if (myvendorinsert.insertvendorassetname.value== "") 
			      { 
			    	 myvendorinsert.insertvendorassetname.focus(); 
			      }
			      else
			    	  {
			    	 	  
			    	  var i=0;chk=0;
			    	  for(i=0;i<$scope.vendordetailslist.length;i++)
			    		  {
			    		  
			    		  if($scope.vendordetailslist[i].vendorfirmname==document.getElementById('insertvendorname').value)
							{
							chk++;
							}
			    		  
			    		  }
			    	  if(chk>0)
						{
						jAlert('Problem in Saving Records!Vendor Name Already Exists','Information');
						
						}
					else
						{
			    	  
			    	  
			    	  var k=0;
			    	  if($scope.vendorassetid==null){ 
			    		  jAlert('Problem in Saving Records! Make Type Does Not Exist!','Information');
							 myvendorinsert.insertvendorassetname.focus(); 
							k++; 
						}
			    	  if($scope.vendormakeid==null){ 
			    		  jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
							 myvendorinsert.insertvendorassetname.focus(); 
							k++; 
						}
						if(k==0)
							{
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
						'&loginid='+sptstr[2]+'&paymentdate=2016-03-13'+
						'&remarks='+document.getElementById('insertvendorremark').value+
						'&makeid='+$scope.vendormakeid)
					.success(function(data, status, headers, config) {
					jAlert('Record Inserted Successfully', 'Success Dialog');
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.vendordetailslist = data;
						$scope.getData18($scope.pageno); 
					}).error(function(data, status, headers, config) {
						jAlert('Unable to  Proceed Your Request','Information');
						console.log('error: data = ', data);
						var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=VendorFormInsert',data);
						response.success(function(data, status, headers, config) {
						});
						response.error(function(data, status, headers, config) {
							//alert( "Exception details: " + JSON.stringify({data: data}));
						}); 
						
					});

				}).error(function(data, status, headers, config) {
					jAlert('Unable To Proceed Your Request!','Information');
					console.log('error: data = ', data);
				});
			    	  }
			    	  }
			    	  }
			}
			catch(e)
			{
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
				for(i=0;i<$scope.vendormakenamelist.length;i++){
					if($scope.vendormakenamelist[i].makename==document.getElementById("updatevendormakename").value){
						$scope.vendormakeidedit = $scope.vendormakenamelist[i].makeid;
					}
				}
				
				var myvendoredit = document.vendorformupdate; 
			      if (myvendoredit.updatevendorname.value== "") 
			      { 	 myvendoredit.updatevendorname.focus(); 
			      } 
			      else  if (myvendoredit.updatevendorcontactperson.value== "") 
			      { 
				    	 myvendoredit.updatevendorcontactperson.focus(); 
				      } 
			      else  if (myvendoredit.updatevendordesignation.value== "") 
			      { 	 myvendoredit.updatevendordesignation.focus(); 
				      } 
			      else  if (myvendoredit.updatevendormobileno.value== "") 
			      {  	 myvendoredit.updatevendormobileno.focus(); 
				    } 
			      
			      else  if (myvendoredit.updatevendoremailid.value== "") 
			      { 	 myvendoredit.updatevendoremailid.focus(); 
				    } 
			      else  if (myvendoredit.updatevendorserstationcontactno.value== "") 
			      { 	 myvendoredit.updatevendorserstationcontactno.focus(); 
				    } 
			      else  if (myvendoredit.updatevendoraddress.value== "") 
			      { 	 myvendoredit.updatevendoraddress.focus(); 
				    } 
			      
			      else  if (myvendoredit.updatevendorcreditdays.value== "") 
			      { 
				    	 myvendoredit.updatevendorcreditdays.focus(); 
				    } 
			      
			      else  if (myvendoredit.updatevendormakename.value== "") 
			      {   	 myvendoredit.updatevendormakename.focus(); 
				    } 
			      
			      else  if (myvendoredit.updatevendorassetname.value== "") 
			      { 
				    	 myvendoredit.updatevendorassetname.focus(); 
				    } 
			      else
			    	  {
			    	  
			    	  var k=0; 
						if($scope.vendorassetidedit==null){ 
							jAlert('Problem in Saving Records! Asset Name Does Not Exist!','Information');
							myvendoredit.updatevendorassetname.focus(); 
							k++; 
						}
						if(k==0)
							{
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
						'&loginid='+sptstr[2]+'&paymentdate=2016-03-13'+
						'&remarks='+document.getElementById('updatevendorremark').value+
						'&makeid='+$scope.vendormakeidedit)
					.success(function(data, status, headers, config) {

					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.vendordetailslist = data;
						$scope.getData18($scope.pageno); 
						document.getElementById("mainvendor").hidden = false;
						document.getElementById("showeditvendor").hidden = true;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				jAlert('Record Updated Successfully', 'Success Dialog'); 
				document.getElementById('vendorformupdate').reset(); 
					}).error(function(data, status, headers, config) {
					jAlert('Unable to  Proceed Your Request','Information');
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=VendorFormUpdate',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
					}); 
// 					alert(data);
					
				});
						}	  }
			}
			catch(e)
			{	//alert(e);	
			}
		}
		
		
	});

		/**
		 * 
		 */

scotchApp.controller('VehicleCtrl', function($scope,$http, $compile, $filter, fileUpload) {
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
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
		
		function getBase64Image(imgElem) {
			// imgElem must be on the same server otherwise a cross-origin error will be thrown "SECURITY_ERR: DOM Exception 18"
			    var canvas = document.createElement("canvas");
			    canvas.width = imgElem.clientWidth;
			    canvas.height = imgElem.clientHeight;
			    var ctx = canvas.getContext("2d");
			    ctx.drawImage(imgElem, 0, 0);
			    var dataURL = canvas.toDataURL("image/png");
			    return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		}
		
		 var readURL = function(input) {
		        if (input.files && input.files[0]) {
		            var reader = new FileReader();

		            reader.onload = function (e) {
		                $('.profile-pic').attr('src', e.target.result);
		            }
		            
		            reader.readAsDataURL(input.files[0]);
		        }
		    }
		    

		    $(".file-upload").on('change', function(){
		        readURL(this);
		    });
		    
		    
			 var readURL2 = function(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();

			            reader.onload = function (e) {
			                $('.profile-pic2').attr('src', e.target.result);
			            }
			            
			            reader.readAsDataURL(input.files[0]);
			        }
			    }
			    

			    $(".file-upload2").on('change', function(){
			        readURL2(this);
			    });
		    
		    $(".upload-button").on('click', function() {
		       $(".file-upload").click();
		    });
		    
//		    $scope.uploadFile = function(){
//	           
//	         };
		    

		$(function() {
			$('.datepick').datepicker({
			    format: "dd-M-yyyy",
			    endDate: '+0d',
			    autoclose: true
			});  
			 $('.datepick').datepicker('setDate', '+0d');
		});
		$("#vehinsertpurchasedate").blur(function () {
			 var max = $(this).datepicker('getDate'); // Get selected date
		     $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M');
			 var start = $("#vehinsertpurchasedate").datepicker("getDate");
		     var end = $("#vehinsertinsurancevaliddate").datepicker("getDate");
		//alert("start"+start+"end"+end);
		if(start>end)
			{
			jAlert('Purchase Date should be Greater Than InsuranceDate', 'Information');
			 document.getElementById("vehinsertpurchasedate").value = "";
			}
		
		});
		
		
	//regdate and reg valid date	
	$("#vehinsertregvaliddate").blur(function () {
		var max = $(this).datepicker('getDate'); // Get selected date
	     $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M');
			var start = document.getElementById("vehinsertregdate").value;
		    var end = document.getElementById("vehinsertregvaliddate").value;
		 
		    if (start>end) {
				jAlert('Registration Date should be Greater Than Registration Valid Date', 'Confirmation Results');
	//  alert("End date should be greater than Start date");
		        document.getElementById("vehinsertregdate").value = "";
		    }
		});
		
		
		
		//regdate and purchase
			$("#vehinsertpurchasedate").change(function () {
		 
			var start = document.getElementById("vehinsertregdate").value;
		    var end = document.getElementById("vehinsertpurchasedate").value;
		 
		    if (start<end) {
				jAlert('Purchase Date should be Greater Than Registration Date', 'Confirmation Results');

		      //  alert("End date should be greater than Start date");
		        document.getElementById("vehinsertregdate").value = "";
		    }
		});
		
		
		


		
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		
	   		$scope.pagesno = [20,50,80,100,120,240,'All'];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
				if($scope.pagesint=='All')
					{
					$scope.pagesint=$scope.vehicledetails.length;
	                        }
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
			
			function printData()
			{
			   var divToPrint=document.getElementById("printTableveh");
			   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
				  var newWin = window.open('','',popup_win);
				   newWin.document.open();
			   
			   var htmlToPrint = '' +
		        '<style type="text/css">' +
		        'table th, table td {' +
		        'border:1px solid #000;' +
		        'padding;0.5em;' +
		        '}' +
		        'tr:nth-child(even) {' +
		        'background:#bdbdbd; ' +
		         '}' +
		         'tr:nth-child(odd) {' +
			        'background:#d3d3d3; ' +
			         '}'+ 
		        '</style>';
		        htmlToPrint += divToPrint.outerHTML;
		        newWin = window.open("");
		        newWin.document.write(htmlToPrint);
		        newWin.print();
		        newWin.close();
//				   newWin.document.write(divToPrint.outerHTML);
//				   newWin.print();
//				   newWin.close();
			}
	$('#printbutton').on('click',function(){
			printData();
			})
			
			
			$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO","Vehicle No","Vehicle Type","Fitness Validity","Insurance Validity","Tank Capacity","status"];
						var i=0;
				        
				      	var data1=[];
							
				    	for(i=0;i<$scope.vehicledetails.length;i++){
				    		
				        var data  = $scope.vehicledetails[i];
				    		 data1.push([data.rowno,data.vehicleregno,data.vehicletypename,data.fitnessvalidity,data.insurancevalidity,data.tankcapacity,data.status]);
				    		
				    	}
				    
				    	 var doc = new jsPDF('landscape','pt');
				      
				    	 doc.autoTable(columns, data1);
				         doc.save("VehicleDetails.pdf");
				        
				        }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
					  
	try{
	$("#exportexcel").click(function() {
	//getting values of current time for generating the file name
	var dt = new Date();
	var day = dt.getDate();
	var month = dt.getMonth() + 1;
	var year = dt.getFullYear();
	var hour = dt.getHours();
	var mins = dt.getMinutes();
	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
	//creating a temporary HTML link element (they support setting file names)
	var a = document.createElement('a');
	//getting data from our div that contains the HTML table
	var data_type = 'data:application/vnd.ms-excel';//base64,' 
	var table_div = document.getElementById('makeDiv');
	//alert("table_div"+table_div);
	var i=0;
	var table_html = "";
	table_html = table_html +"<html><body><table><tr>"+
	"<td><font>Row No</font></td>"+
	"<td><font>Vehicle No</font></td>"+
	"<td><font>Vehicle Type</font></td>"+
	"<td><font>Fitness Validity</font></td>"+
	"<td><font>Insurance Validity</font></td>"+
	"<td><font>Tank Capacity</font></td>"+
	"<td><font>Status</font></td>"+
	"</tr>";
	//alert(htmlString);
	try{
	for(i=0;i<$scope.vehicledetails.length;i++){
	data  = $scope.vehicledetails[i];
	table_html = table_html + "<tr>"+
	"<td><font>"+data.rowno+"</font></td>"+
	"<td><font>"+data.vehicleregno+"</font></td>"+
	"<td><font>"+data.vehicletypename+"</font></td>"+
	"<td><font>"+data.fitnessvalidity+"</font></td>"+
	"<td><font>"+data.insurancevalidity+"</font></td>"+
	"<td><font>"+data.tankcapacity+"</font></td>"+
	"<td><font>"+data.status+"</font></td>"+
	"</tr>";
	 }
	}catch(e){}
	table_html = table_html + "</table></body></html>";
	a.href = data_type + ', ' + table_html;
	//setting the file name
	a.download = 'Vehicle_Details' + postfix + '.xls';
	a.click();
	//just in case, prevent default behaviour
	e.preventDefault(); 
	});}catch(e){}

			

	$('#deviceAssignvehicle').click(function(){
		document.getElementById("deviceassignFieldset").hidden=false;
	});

	$('#vehicleinsertvehno').blur(function(){
		document.getElementById("vehicleassignvehicle").value=document.getElementById("vehicleinsertvehno").value;
	})




	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {
		$scope.customerdetailsveh = data;
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});


	$("#vehcustdealerdetails").blur( function() {
	try
	{		
	var i=0;
	for(i=0;i<$scope.customerdetailsveh.length;i++)
	{
	if($scope.customerdetailsveh[i].customername==document.getElementById('vehcustdealerdetails').value)
	{
		$scope.customerid=$scope.customerdetailsvehass[i].customerid;
	}	
	}
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
	$scope.customerwisedevice = data;

	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});
	}catch(e){}

	});  


					



	try
	{
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {

		$scope.dealerdetailslistveh = data;
		$scope.loginid=sptstr[2];
		//$scope.dealervehdetails=sptstr[0];
		$scope.roleid=sptstr[6];
		
		
		try
		{
			if($scope.loginid!='10001')
			{
				if(sptstr[6]=='1003'){
					document.getElementById('dealersDetails').hidden=true;
					document.getElementById('maindealer').hidden=true;
					document.getElementById('dealercustomerdetails').hidden=true;
					
				}else if($scope.dealerdetailslistveh.length==0){
				
					document.getElementById('dealersDetails').hidden=true;
					document.getElementById('maindealer').hidden=true;
					$scope.dealervehdetails1=sptstr[0];
					
				}else{
					document.getElementById('maindealer').hidden=true;
					$scope.parentDealer=sptstr[0];
					
				}
			
			}
		}catch(e){}
		//$scope.parentDealer='Banglore Dealers';
		
		
		
		//alert(data);
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
		
		
	}catch(e){}	
		
	$scope.ByVehicleno='';

		try
		{
			
			var over = '<div id="overlay">' +
//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
		    $(over).appendTo('body');
		
//			alert('vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]);
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.ByVehicleno)
			.success(function(data, status, headers, config) {
				
				$scope.vehicledetails = data;
				
				$scope.getData40($scope.pageno); 
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid=10001&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.ByVehicleno)
				.success(function(data, status, headers, config) {
					$scope.vehicledetailsall = data;
					 $('#overlay').remove();
				}).error(function(data, status, headers, config) {
					$('#overlay').remove();
					console.log('error: data = ', data);
				});
				
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			
			$scope.vehicledetailsnew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData40 = function(pageno){ 
				$scope.vehicledetailsnew = [];
			var start=0, end=0;
				if(pageno!=1){
					start = $scope.pagesint * (pageno-1);
					end = start + $scope.pagesint;
					start++;
				}else{
					start = 0;
					end = start + $scope.pagesint;
					start++;
				}
				
				for(var i=start;i<=end;i++){
					if(i<=$scope.vehicledetails.length){
						if($scope.ByVehicleno!='')
							{
							if($scope.vehicledetails[i].includes($scope.ByVehicleno))
								{
						$scope.vehicledetailsnew.push($scope.vehicledetails[i-1]);
								}
							}
						else
							{
							$scope.vehicledetailsnew.push($scope.vehicledetails[i-1]);
							}
					}else{
						break;
					}
				}
					
					$scope.total_count = $scope.vehicledetails.length;
				
			};
			
			
			$("#searchbyVehicleNo").keypress(function(){
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.ByVehicleno)
				.success(function(data, status, headers, config) {
					$scope.vehicledetailsnew = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.ByVehicleno)
					.success(function(data, status, headers, config) {
						$scope.vehicledetailsnew = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
			});
			
			
			$scope.dataget = function (comp){
				$scope.vehicleno = comp.vehicleregno;
				$scope.ndate = comp.datetimestamp;
				$scope.receipt = comp.receiptno;
				$scope. customername=comp.customername;
				$scope.uniqueid = comp.imeino;
				$scope.dealername =comp.dealername
				//alert("values copied");
			}
			
			$scope.print_this = function(comp){
				var vehicleno = comp.vehicleregno;
				var randomnumber = Math.floor((Math.random()*100)+1); 
				var my_window = window.open('http://209.190.15.26:8686/receipt/receipt.aspx?loginid='+comp.companyid+'&vehicleno='+comp.vehicleregno, "_blank", 'PopUp', randomnumber, 'scrollbars=1,menubar=0,resizable=1,width=600,height=300');
			}
			
			
//$scope.print_this = function(comp){
//				
//				var vehicleno = comp.vehicleregno;
//				var ndate = comp.datetimestamp;
//				var receipt = comp.receiptno;
//				var customername=comp.customername;
//				var dealername=comp.dealername;
//				var uniqueid = comp.imeino;
//				//var dealername =comp.dealername
//				//var html = document.getElementById(container).innerHTML;
////				var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
////				var print_form = window.open('','',popup_win);
////				print_form.document.open();
//				var html = '' +
//				 '<head><title>'+'ORSAC RECEIPT'+'</title></head>'+
//			        '<body><table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt NO.';html = html + receipt+
//			         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
//			         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No      :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
//			         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
//			         '</td>'+'<td>'+'Dealer Name   :'+dealername+'';html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                        :';html = html + comp.imeino+
//			         '</td>'+'<td>'+'Customer Name :'+customername+'</td></tr>'+'<tr><td>'+'Sim No                                 :';html = html + comp.simno+
//			         '</td>'+'<td>'+'Vehicle Category:'+comp.vehicletypename+
//			         '</td></tr>'+'</table>'+'<div>'+'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'+'</div>'+'<table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt No:';html = html + receipt+
//			         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
//			         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No     :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
//			         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
//			         '</td>'+'<td>'+'Dealer Name  :'+dealername+'';html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                         :';html = html + comp.imeino+
//			         '</td>'+'<td>'+'Customer Name:'+customername+'</td></tr>'+'<tr><td>'+'Sim No                                   :';html = html + comp.simno+
//			         '</td>'+'<td>'+'Vehicle Category:'+comp.vehicletypename+
//			         '</td></tr>'+'</table>'+'</body>'
//			        ;
//			       
//			         try{
//				         var doc = new jsPDF();
//				         var specialElementHandlers = {
//				         '#editor': function (element, renderer) {
//				         return true;
//				         }
//			         };
//				         doc.fromHTML(html, 15, 15, {
//				        	 'width': 170,
//				        	 'elementHandlers': specialElementHandlers
//				        	 });
//				         doc.save('receipt.pdf');
//			         }catch(e){
//			        	 alert(e);
//			         }
//				return false;
//				}
			

			
			
			
			
			
			
			
//			$scope.print_this = function(comp){
//				
//				$scope.vehicleno = comp.vehicleregno;
//				$scope.ndate = comp.datetimestamp;
//				$scope.receipt = comp.receiptno;
//				$scope.customername=comp.customername;
//			    $scope.uniqueid = comp.imeino;
//				//var dealername =comp.dealername
//				//var html = document.getElementById(container).innerHTML;
////				var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
////				var print_form = window.open('','',popup_win);
////				print_form.document.open();
////				var html = '' +
////				 '<head><title>'+'ORSAC RECEIPT'+'</title></head>'+
////			        '<body><table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt NO.';html = html + receipt+
////			         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
////			         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No      :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
////			         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
////			         '</td>'+'<td>'+'Dealer Name   :';html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                        :';html = html + comp.imeino+
////			         '</td>'+'<td>'+'Customer Name :RAPLCustomer'+'</td></tr>'+'<tr><td>'+'Sim No                                 :';html = html + comp.simno+
////			         '</td>'+'<td>'+'Vehicle Category:NA'+
////			         '</td></tr>'+'</table>'+'<div>'+'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'+'</div>'+'<table><tr><th colspan="2" style="text-align:center">'+'Directorate Of Steel & Mines Department'+'</th></tr>'+'<tr><td style="text-align:left">'+'Receipt No:';html = html + receipt+
////			         '</td><td style="text-align:right">'+'Date:';html = html + ndate+
////			         '</td></tr>'+'<tr><th colspan="2" style="text-align:center">'+'GPS/GPRS Device Activation'+'</th></tr>'+'<tr><td>'+'Activation No     :RCPT/2014/7/24-62235'+'</td><td>'+'Vehicle No:';html = html +vehicleno+
////			         '</td></tr>'+'<tr><td>'+'Activation Date   :';html = html + ndate+
////			         '</td>'+'<td>'+'Dealer Name  :';html = html + '</td></tr>'+'<tr><td>'+'IMEI No                                         :';html = html + comp.imeino+
////			         '</td>'+'<td>'+'Customer Name:RAPLCustomer'+'</td></tr>'+'<tr><td>'+'Sim No                                   :';html = html + comp.simno+
////			         '</td>'+'<td>'+'Vehicle Category:NA'+
////			         '</td></tr>'+'</table>'+'</body>'
////			        ;
////			       
//			   
//			         try{
//			        	
//				         var doc = new jsPDF();
//				         var specialElementHandlers = {
//				         '#editor': function (element, renderer) {
//				         return true;
//				         }
//			         };
//				         doc.fromHTML($('#receipt').html(), 15, 15, {
//				        	 'width': 170,
//				        	 'elementHandlers': specialElementHandlers
//				        	 });
//				         doc.save('receipt.pdf');
//			         }catch(e){
//			        	 alert(e);
//			         }
//				return false;
//				}
//			
			
			$scope.vehicleeditdata=function vehicleeditdata(vehicledata)
			{
				$scope.editvehicledata=vehicledata;
				$scope.url1 = "http://209.190.15.26/images/"+vehicledata.vehicleregno+"/image1.png";
				$scope.url2 = "http://209.190.15.26/images/"+vehicledata.vehicleregno+"/image2.png";
			}
			
//			makkename vbind modeldetails
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
				$scope.vehcilemakenamelist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
//	 		MODEL BIN
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
			
				$scope.vehiclemodeldetails = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			/// vcehicletypeiddtails  
			
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicletypedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.vehicletype = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			

	    	$("#vehcustdealerdetails").blur( function() {
			try
			{
				//alert("in try");
	    	var i=0;
	    	for(i=0;i<$scope.customerdetailsveh.length;i++)
	    		{
	    		if($scope.customerdetailsveh[i].customername==document.getElementById('vehcustdealerdetails').value)
	    		{
	    			$scope.asscustomerid=$scope.customerdetailsveh[i].customerid;
	    		}	
	    	}
	    $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/custoerwisedevice?customerid='+$scope.asscustomerid)
	    	.success(function(data, status, headers, config) {
	    	//alert("in success"+data);
	    		$scope.customerwisedeviceforVehicle = data;
	       }).error(function(data, status, headers, config) {
	    		console.log('error: data = ', data);
	    	});
			}catch(e){}

	    	});  
			
			
			
			
			$scope.deletevehicle = function(deletevehicleid){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledelete?id='+deletevehicleid.vehicleid)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.vehicledetails = data;
				$scope.getData40($scope.pageno); 
					jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				}).error(function(data, status, headers, config) {
					
					jAlert('Records Not Deleted','Information');
					console.log('error: data = ', data);
				});
					}
				});
			}
	   		
			
			
			try{
			
	$scope.VehicleInsert=function VehicleInsert()
			{
//		alert("in vehicleinsert");
		try
				{	
					var myvehicleInsertForm = document.vehicleinsertform;
				      if (myvehicleInsertForm.vehicleinsertvehno.value== "")
				      {
				    	 myvehicleInsertForm.vehicleinsertvehno.focus();
				      }
				      else if (myvehicleInsertForm.vehinsertchassis.value== "")
				      {
				    	 myvehicleInsertForm.vehinsertchassis.focus();
				      }
				      else if (myvehicleInsertForm.vehiinsertfitnesscomp.value=="")
				      {
				    	  myvehicleInsertForm.vehiinsertfitnesscomp.focus();
				      }
				      else if (myvehicleInsertForm.vehiinsertinsvalcomp.value=="")
				      {
				    	  myvehicleInsertForm.vehiinsertinsvalcomp.focus();
				      }
//				      else if (myvehicleInsertForm.vehiinsertmake1.value== "")
//			          {
//				    	 myvehicleInsertForm.vehiinsertmake1.focus();
//				      }
//			      else if (myvehicleInsertForm.vehicleinsertmodel.value== "")
//				      {
//				    	 myvehicleInsertForm.vehicleinsertmodel.focus();
//				      }
				      
				      else if (myvehicleInsertForm.insertvehicletype.value== "")
				      {
				    	 myvehicleInsertForm.insertvehicletype.focus();
				      }
				      else if (myvehicleInsertForm.vehinsertengineno.value== "")
				      {
				    	 myvehicleInsertForm.vehinsertengineno.focus();
				      }
//				      else if (myvehicleInsertForm.vehinsertregdate.value== "")
//				      {
//				    	 myvehicleInsertForm.vehinsertregdate.focus();
//				      }
//				      else if (myvehicleInsertForm.vehinsertregvaliddate.value== "")
//				      {
//				    	 myvehicleInsertForm.vehinsertregvaliddate.focus();
//				      }
////				      else if (myvehicleInsertForm.vehinsertinsurancevaliddate.value== "")
//				      {
//				    	 myvehicleInsertForm.vehinsertinsurancevaliddate.focus();
//				      }
//				      else if (myvehicleInsertForm.vehinsertpurchasedate.value== "")
//				      {
//				    	 myvehicleInsertForm.vehinsertpurchasedate.focus();
//				      }
//				      
				      else
				    	  {
				    	 
					var i=0;
//					
//					for(i=0;i<$scope.vehcilemakenamelist.length;i++)
//					{
	//
//						if($scope.vehcilemakenamelist[i].makename==document.getElementById('vehiinsertmake1').value)
//							{
//							$scope.insertvehiclemakeid=$scope.vehcilemakenamelist[i].makeid;
//							}
//					}
//					for(i=0;i<$scope.vehiclemodeldetails.length;i++)
//					{
	//
//						if($scope.vehiclemodeldetails[i].modelname==document.getElementById('vehicleinsertmodel').value)
//							{
//							$scope.insertvehiclemodelid=$scope.vehiclemodeldetails[i].modelid;
//							}
//					}
					for(i=0;i<$scope.vehicletype.length;i++)
					{
						if($scope.vehicletype[i].vehicletypename==document.getElementById('insertvehicletype').value)
							{
								$scope.insertvehicleinserttypeid=$scope.vehicletype[i].vehicletypeid;
							}
					}
					
					
					for(i=0;i<$scope.customerdetailsveh.length;i++)
						{
						//alert("in for loop"+$scope.customerdetailsveh[i].customername+"  input value  "+document.getElementById('vehcustdealerdetails').value);
						if($scope.customerdetailsveh[i].customername==document.getElementById('vehcustdealerdetails').value)
						{
							$scope.customerid=$scope.customerdetailsveh[i].customerid;
						}
					}
					
					 
//					 if($scope.customerid=='')
//						{
//						$$scope.customerid =sptstr[7];
//						}
//					 
						//$scope.dealer=document.getElementById('vehdealerdetails').value;
					 
					 
					 var i=0;chk=0,chk1=0,chk2=0;
//					 alert(document.getElementById('vehicleinsertvehno').value);
					 for(i=0;i<$scope.vehicledetailsall.length;i++)
						 {
						 
						 if($scope.vehicledetailsall[i].vehicleregno==document.getElementById('vehicleinsertvehno').value)
							{
							chk++;
							}	
						 else if($scope.vehicledetailsall[i].chasisnumber==document.getElementById('vehinsertchassis').value)
							{
								chk1++;
							}
						 else if($scope.vehicledetailsall[i].enginenumber==document.getElementById('vehinsertengineno').value)
							{
								chk2++;
							}
						 
						 }
//					 alert(chk);
					 if(chk>0)
						{
						jAlert('Problem in Saving Records!VehicleNo. Already Exists','Information');
						document.getElementById('vehicleinsertvehno').value="";
						 myvehicleInsertForm.vehicleinsertvehno.focus();
						}
					 else if(chk1>0)
						{
							jAlert('Problem in Saving Records!Chasis No Already Exists','Information');
							document.getElementById('vehinsertchassis').value="";
					    	 myvehicleInsertForm.vehinsertchassis.focus();
						}
					 else if(chk2>0)
						{
							jAlert('Problem in Saving Records!Engine No Already Exists','Information');
							document.getElementById('vehinsertengineno').value="";
					    	 myvehicleInsertForm.vehinsertengineno.focus();
						}
					else
						{
					 
						  var k=0;
//								if($scope.insertvehiclemakeid==null){
//									jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
	//
//									  myvehicleInsertForm.vehicleinsertmodel.focus();
//									k++;
//								} 
//								if($scope.insertvehiclemodelid==null){
//									jAlert('Problem in Saving Records! Model Name Does Not Exist!','Information');
	//
//									myvehicleForm1.insertvehiclemodelid.focus();
//									k++;
//								} 
								if($scope.insertvehicleinserttypeid==null){
									jAlert('Problem in Saving Records! Vehicle Type Does Not Exist!','Information');

									 myvehicleInsertForm.insertvehicletype.focus();
									k++;
								} 
								if(k==0){
								if($scope.customerid == " ")
									{
									
									$scope.customerid=sptstr[7];
									}
								
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
//								alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.insertvehiclemakeid+'&modelid='+$scope.insertvehiclemodelid+'&vehicletypeid='+$scope.insertvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=170001&regdate='+document.getElementById('vehinsertregdate').value+'&regvaliddate='+document.getElementById('vehinsertregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehinsertinsurancevaliddate').value+'&pucdate='+document.getElementById('vehinsertpurchasedate').value+'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[2]+
//										'&remarks='+document.getElementById('vehinsertremark').value+'&inusrancecompanyname='+document.getElementById('vehiinsertinsurancecomp').value+'&customerid='+$scope.customerid);
								//alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.vehcilemakenamelist[0].makeid+'&modelid='+$scope.vehiclemodeldetails[0].modelid+'&vehicletypeid='+$scope.insertvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=170001&regdate='+document.getElementById('vehinsertregdate').value+'&regvaliddate='+document.getElementById('vehinsertregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehinsertinsurancevaliddate').value+'&pucdate='+document.getElementById('vehinsertpurchasedate').value+'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[2]+
										//'&remarks='+document.getElementById('vehinsertremark').value+'&inusrancecompanyname='+document.getElementById('vehiinsertinsurancecomp').value+'&customerid='+$scope.customerid+'&fitnessvalidity='+document.getElementById('vehiinsertfitnesscomp').value+'&insurancevalidity='+document.getElementById('vehiinsertinsvalcomp').value)
//								alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.vehcilemakenamelist[0].makeid+'&modelid='+$scope.vehiclemodeldetails[0].modelid+'&vehicletypeid='+$scope.insertvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=170001&regdate='+document.getElementById('vehinsertregdate').value+'&regvaliddate='+document.getElementById('vehinsertregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehinsertinsurancevaliddate').value+'&pucdate='+document.getElementById('vehinsertpurchasedate').value+'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[2]+
//										'&remarks='+document.getElementById('vehinsertremark').value+'&inusrancecompanyname='+document.getElementById('vehiinsertinsurancecomp').value+'&customerid='+$scope.customerid+'&fitnessvalidity='+document.getElementById('vehiinsertfitnesscomp').value+'&insurancevalidity='+document.getElementById('vehiinsertinsvalcomp').value+'&circle='+document.getElementById('vehinsertmine').value+'&district='+document.getElementById('vehinsertdistrict').value);	
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.vehcilemakenamelist[0].makeid+'&modelid='+$scope.vehiclemodeldetails[0].modelid+'&vehicletypeid='+$scope.insertvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=170001&regdate='+document.getElementById('vehinsertregdate').value+'&regvaliddate='+document.getElementById('vehinsertregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehinsertinsurancevaliddate').value+'&pucdate='+document.getElementById('vehinsertpurchasedate').value+'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[2]+
							'&remarks='+document.getElementById('vehinsertremark').value+'&inusrancecompanyname='+document.getElementById('vehiinsertinsurancecomp').value+'&customerid='+$scope.customerid+'&fitnessvalidity='+document.getElementById('vehiinsertfitnesscomp').value+'&insurancevalidity='+document.getElementById('vehiinsertinsvalcomp').value+'&circle='+document.getElementById('vehinsertmine').value+'&district='+document.getElementById('vehinsertdistrict').value)
								.success(function(data, status, headers, config) {
									try{
										
										var file = $scope.myFile;
//							            var uploadUrl = "http://209.190.15.26/imageupload/rest/file/upload";
							            var uploadUrl = "http://209.190.15.26/imageupload/rest/file/upload";
							            fileUpload.uploadFileToUrl(file, uploadUrl, document.getElementById('vehicleinsertvehno').value);
							            
							            
							            file = $scope.myFile2;
//							            var uploadUrl = "http://209.190.15.26/imageupload/rest/file/upload";
							            uploadUrl = "http://209.190.15.26/imageupload/rest/file/upload";
							            fileUpload.uploadFileToUrl(file, uploadUrl, document.getElementById('vehicleinsertvehno').value);
							            $('#overlay').remove();
							            jAlert('Record Inserted Successfully', 'Success Dialog'); 
									}catch(e){
										alert(e);
									}
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.vehicledetails = data;
								$scope.deviceassignVeh(data);
								$scope.getData40($scope.pageno);
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
					
								}).error(function(data, status, headers, config) {
									//alert(data);
									$('#overlay').remove();
									jAlert('Unable to  Proceed Your Request','Information');
									$scope.error=data;
									console.log('error: data = ', data);
									var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=VehicleFormInsert',data);
									response.success(function(data, status, headers, config) {
									});
									response.error(function(data, status, headers, config) {
										//alert( "Exception details: " + JSON.stringify({data: data}));
									}); 

								});
					    	  }
				    	  }	
				}
				}
				catch(e)
				{
					alert(e);
				}
				
			}

			}catch(e){
				alert(e);
			}

			$scope.deviceassignVeh=function deviceassignVeh(data)
			{	try
				{
//					try{
				$scope.vehicledetails = data;
					var i=0;
					for(i=0;i<$scope.vehicledetails.length;i++)
						{
						//alert($scope.vehicledetails[i].vehicleregno+" "+document.getElementById("vehicleinsertvehno").value);
						if($scope.vehicledetails[i].vehicleregno==document.getElementById("vehicleinsertvehno").value)
							{
							//alert("in if");
							$scope.assignVehicleid=$scope.vehicledetails[i].vehicleid;
							//alert("vehicleid "+$scope.assignVehicleid);
							}
						
						}
					for(i=0;i<$scope.customerdetailsveh.length;i++)
						{
						if($scope.customerdetailsveh[i].customername==document.getElementById("vehcustdealerdetails").value)
							{
							$scope.assVehcustomerid=$scope.customerdetailsveh[i].customerid;
							//alert("customerid "+$scope.assVehcustomerid);
							}
						}
					//alert($scope.customerwisedeviceforVehicle.length);
					for(i=0;i<$scope.customerwisedeviceforVehicle.length;i++)
						{
						//alert($scope.customerwisedeviceforVehicle[i].uniqueid+" "+document.getElementById("Vehicleassigndevice").value);
						if($scope.customerwisedeviceforVehicle[i].uniqueid==document.getElementById("Vehicleassigndevice").value)
							{
							//alert("in Device imei");
							$scope.assDeviceid=$scope.customerwisedeviceforVehicle[i].deviceid;
							//alert("deviceid"+$scope.assDeviceid);
							}
						}
					
//					}catch(e){alert("jjjjj"+e);}
					//alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigninsert?vehicleid='+$scope.assignVehicleid+'&deviceid='+$scope.assDeviceid+'&status=1&assigndate='+document.getElementById("Vehicleassigndate").value+'&loginid='+sptstr[2]+'&remarks=assigned&customerid='+$scope.assVehcustomerid);
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigninsert?vehicleid='+$scope.assignVehicleid+'&deviceid='+$scope.assDeviceid+'&status=1&assigndate='+document.getElementById("vehinsertregdate").value+'&loginid='+sptstr[2]+'&remarks=assigned&customerid='+$scope.assVehcustomerid)
					.success(function(data, status, headers, config) {
						jAlert('Vehicle Assign Successfully', 'Success Dialog'); 		
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
						
					});
				}catch(e){
					//alert(e);
				}
			}


	$scope.VehicleUpdate=function VehicleUpdate()
	{
		try
		{
			
			var myvehicleForm = document.vehicleeditform;
		      if (myvehicleForm.vehicleditvehicleno.value== "")
		      {
		    	 myvehicleForm.vehicleditvehicleno.focus();
		      }
		      else if (myvehicleForm.veheditchassis.value== "")
		      {
		    	 myvehicleForm.veheditchassis.focus();
		      }
		      else if (myvehicleForm.veheditfitnessval.value=="")
		      {
		    	  myvehicleForm.veheditfitnessval.focus();
		      }
		      else if (myvehicleForm.veheditinsuranceval.value=="")
		      {
		    	  myvehicleForm.veheditinsuranceval.focus();
		      }
//		      else if (myvehicleForm.veheditmake.value== "")
//		      {
//		    	 myvehicleForm.veheditmake.focus();
//		      }
//		      else if (myvehicleForm.vehicleeditmodel.value== "")
//		      {
//		    	 myvehicleForm.vehicleeditmodel.focus();
//		      }
		      else if (myvehicleForm.editvehicletype.value== "")
		      {
		    	 myvehicleForm.editvehicletype.focus();
		      }
		      else if (myvehicleForm.veheditengineno.value== "")
		      {
		    	 myvehicleForm.veheditengineno.focus();
		      }
		      else if (myvehicleForm.veheditregdate.value== "")
		      {
		    	 myvehicleForm.veheditregdate.focus();
		      }
		      else if (myvehicleForm.veheditregvaliddate.value== "")
		      {
		    	 myvehicleForm.veheditregvaliddate.focus();
		      }
		      else if (myvehicleForm.vehieditinsurancevaliddate.value== "")
		      {
		    	 myvehicleForm.vehieditinsurancevaliddate.focus();
		      }
		      else if (myvehicleForm.veheditpurchasedate.value== "")
		      {
		    	 myvehicleForm.veheditpurchasedate.focus();
		      }
		      else
		    	  {
		    	  
			$scope.vehicleEditid=$scope.editvehicledata.vehicleid;
			var i=0;
//			for(i=0;i<$scope.vehcilemakenamelist.length;i++)
//			{	
//				if($scope.vehcilemakenamelist[i].makename==document.getElementById('veheditmake').value)
//					{
//					$scope.vehicleEditmakeid=$scope.vehcilemakenamelist[i].makeid;
//					}
//			}
//			for(i=0;i<$scope.vehiclemodeldetails.length;i++)
//			{
//				if($scope.vehiclemodeldetails[i].modelname==document.getElementById('vehicleeditmodel').value)
//					{
//					$scope.vehicleEditmodelid=$scope.vehiclemodeldetails[i].modelid;
//					}
//			}
//			
				
			
			for(i=0;i<$scope.vehicletype.length;i++)
			{
				if($scope.vehicletype[i].vehicletypename==document.getElementById('editvehicletype').value)
					{
						$scope.editvehicleinserttypeid=$scope.vehicletype[i].vehicletypeid;
					}
			}
		      var k=0;
//				if($scope.vehicleEditmakeid==null){
//					jAlert('Problem in Saving Records!Make Name Does Not Exist!','Information');
	//
//				 myvehicleForm.veheditmake.focus();
//					k++;
//				} 
//				if($scope.vehicleEditmodelid==null){
//					jAlert('Problem in Saving Records!Model Name Does Not Exist!','Information');
	//
//					 myvehicleForm.vehicleeditmodel.focus();
//					k++;
//				} 
				if($scope.editvehicleinserttypeid==null){
					jAlert('Problem in Saving Records! Vehicle Type Does Not Exist!','Information');

				 myvehicleForm.editvehicletype.focus();
					k++;
				} 
				if(k==0){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleupdate?vehicleid='+$scope.vehicleEditid+'&makeid='+$scope.vehcilemakenamelist[0].makeid+'&modelid='+$scope.vehiclemodeldetails[0].modelid+'&vehicletypeid='+$scope.editvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleditvehicleno').value+'&chasisnumber='+document.getElementById('veheditchassis').value+'&enginenumber='+document.getElementById('veheditengineno').value+'&bodycolor='+document.getElementById('veheditbodycolor').value+'&fueltypeid=170001&regdate='+document.getElementById('veheditregdate').value+'&regvaliddate='+document.getElementById('veheditregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehieditinsurancevaliddate').value+'&pucdate='+document.getElementById('veheditpurchasedate').value+'&tankcapacity='+document.getElementById('vehedittank').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('veheditremark').value+'&inusrancecompanyname='+document.getElementById('veheditinsurancecompname').value+'&fitnessvalidity='+document.getElementById('veheditfitnessval').value+'&insurancevalidity='+document.getElementById('veheditinsuranceval').value)
				.success(function(data, status, headers, config) {
					document.getElementById("mainvehicle").hidden = false;
					document.getElementById("showeditvehicle").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.vehicledetails = data;
						$scope.getData40($scope.pageno); 
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					jAlert('Record Updated Successfully', 'Success Dialog'); 
					document.getElementById('vehicleeditform').reset(); 
							
						}).error(function(data, status, headers, config) {
							//alert(data);
							jAlert('Unable to  Proceed Your Request','Information');
							$scope.error=data;
							console.log('error: data = ', data);
							var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=VehicleFormUpdate',data);
							response.success(function(data, status, headers, config) {
							});
							response.error(function(data, status, headers, config) {
								//alert( "Exception details: " + JSON.stringify({data: data}));
							}); 
						});
				}
		    	  }
		}
		catch(e)
		{
			//alert(e);
		}
	}
				}
		catch(e)
		{}
		
		
		

		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/shelterdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.overspeedvehdeatils = data;
					}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		
					});
	
	
		
	});


/**
* 
*/






		scotchApp.controller('overspeedctrl', function($scope,$http, $compile, $filter) {
			
			
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
							
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.overspeedvehdeatils = data;
										}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
							
						
//							$("#overspeedexcel").click(function(){
//								
//								try
//								{
//								$('#overspeedtable').tableExport({
//									type:'excel',escape:'false',separator: ',',
//									tableName:'History Log',
//									
//									pdfFontSize:10,
//									
//									htmlContent:'false',
//									consoleLog:'false',
//									
//									}
//								
//								);
//
//								}catch(e){}
//							});
							
							
							
						
							  try{
									$("#overspeedexcel").click(function() {
								        //getting values of current time for generating the file name
								        var dt = new Date();
								        var day = dt.getDate();
								        var month = dt.getMonth() + 1;
								        var year = dt.getFullYear();
								        var hour = dt.getHours();
								        var mins = dt.getMinutes();
								        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								        //creating a temporary HTML link element (they support setting file names)
								        var a = document.createElement('a');
								        //getting data from our div that contains the HTML table
								        var data_type = 'data:application/vnd.ms-excel';//base64,' 
								          var i=0;
								        var table_html = "";
								table_html = table_html +"<html><body><table><tr>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>Date/Time</font></td>"+
								"<td><font>Location</font></td>"+
								"<td><font>Speed</font></td>"+
								"</tr>";
								//alert(htmlString);
								try{
						    	for(i=0;i<$scope.overspeeddetails.length;i++){
						    		data  = $scope.overspeeddetails[i];
						    		table_html = table_html + "<tr>"+
						    		"<td><font>"+data.vehicleregno+"</font></td>"+
									"<td><font>"+data.datatimestamp+"</font></td>"+
									"<td><font>"+data.location+"</font></td>"+
									"<td><font>"+data.vehiclespeed+"</font></td>"+
									"</tr>";
						    		}
											}catch(e){}
										table_html = table_html + "</table></body></html>";
								        a.href = data_type + ', ' + table_html;
								        //setting the file name
								        a.download = 'Overspeed_Report' + postfix +'Vehicle No:'+document.getElementById('overspeedVehicleno').value+'.xls';
								        a.click();
								        //just in case, prevent default behaviour
								       e.preventDefault(); 
								    });}catch(e){}	
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							$scope.overspeeddetailsnew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
//							$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
							
							$scope.getData37 = function(pageno){ 
								$scope.overspeeddetailsnew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								
								for(var i=start;i<=end;i++){
									if(i<=$scope.overspeeddetails.length){
										$scope.overspeeddetailsnew.push($scope.overspeeddetails[i-1]);
									}else{
										break;
									}
								}
									
									$scope.total_count = $scope.overspeeddetails.length;
								
							};
							
							 $scope.limit=50;
							
							$scope.getoverspeedReport=function()
							{
								var over = '<div id="overlay">' +
//							     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/overspeedReport?vehicleno='+document.getElementById('overspeedVehicleno').value+'&fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value+'&overspeedlimit='+$scope.limit)
							.success(function(data, status, headers, config) {
								$scope.overspeeddetails = data;
								$scope.getData37($scope.pageno); 
							if(data.length==0)
									{
								$('#overlay').remove();
									jAlert('No Data Found','Information');
									}else
										{
									
											document.getElementById('overspeedtable1').hidden=false;
											document.getElementById('overspeedtable').hidden=false;


//								$scope.fromdate=document.getElementById('overspeedfromndate').value;
//								$scope.todate=document.getElementById('overspeedtodate').value;
//								$scope.speed=data[0].vehiclespeed;
										}
								$('#overlay').remove();
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								
							}
							
				
				
			});
		
		/**
		 * 
		 */


		scotchApp.controller('modelCtrl', function($scope,$http, $compile, $filter) {
			
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
			
			$scope.query = {};
				$scope.queryBy = '$';
				$scope.pagesno = [20,50,80,100,120,240,360];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}

			$scope.ByModelname='';
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbymodelname='+$scope.ByModelname)
			.success(function(data, status, headers, config) {

				$scope.modeldetailslist = data;
				$scope.getData20($scope.pageno); 

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData20 = function(pageno){ 
				$scope.modeldetailslistnew = [];
			var start=0, end=0;
				if(pageno!=1){
					start = $scope.pagesint * (pageno-1);
					end = start + $scope.pagesint;
					start++;
				}else{
					start = 0;
					end = start + $scope.pagesint;
					start++;
				}
				
				for(var i=start;i<=end;i++){
					if(i<=$scope.modeldetailslist.length){
						if($scope.ByModelname!='')
							{
							if($scope.modeldetailslist[i].includes($scope.ByModelname))
								{
						$scope.modeldetailslistnew.push($scope.modeldetailslist[i-1]);
								}
							}
						else
							{
							$scope.modeldetailslistnew.push($scope.modeldetailslist[i-1]);
							}
					}else{
						break;
					}
				}
					
					$scope.total_count = $scope.modeldetailslist.length;
				
			};
			
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
				$scope.modelassetnamelist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			
			$("#searchbyModelname").keypress(function(){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbymodelname='+$scope.ByModelname)
				.success(function(data, status, headers, config) {
					$scope.modeldetailslistnew = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbymodelname='+$scope.ByModelname)
					.success(function(data, status, headers, config) {
						$scope.modeldetailslistnew = data;
						}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				
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
			
			
			
			function printData()
			{
			   var divToPrint=document.getElementById("printTablemodel");
			   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
				  var newWin = window.open('','',popup_win);
				   newWin.document.open();
			   
			   var htmlToPrint = '' +
		        '<style type="text/css">' +
		        'table th, table td {' +
		        'border:1px solid #000;' +
		        'padding;0.5em;' +
		        '}' +
		        'tr:nth-child(even) {' +
		        'background:#bdbdbd; ' +
		         '}' +
		         'tr:nth-child(odd) {' +
			        'background:#d3d3d3; ' +
			         '}'+ 
		        '</style>';
		        htmlToPrint += divToPrint.outerHTML;
		        newWin = window.open("");
		        newWin.document.write(htmlToPrint);
		        newWin.print();
		        newWin.close();
			}

			$('#printbutton').on('click',function(){
			printData();
			})
				
	$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Model Name", "Make Name","Make Type","remark"];
						var i=0;
				       	var data1=[];
							for(i=0;i<$scope.modeldetailslist.length;i++){
				    		
				        var data  = $scope.modeldetailslist[i];
				    		 data1.push([data.rowno,data.modelname,data.makename ,data.assetname,data.remarks]);
				    		}
				    
				    	 var doc = new jsPDF('landscape','pt');
				      
				    	 doc.autoTable(columns, data1);
				         doc.save("ModelDetails.pdf");
				     }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
		try{
			$("#exportexcel").click(function() {
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		        var table_div = document.getElementById('modelTable1');
		        //alert("table_div"+table_div);
		        var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Row No</font></td>"+
		"<td><font>Model Name</font></td>"+
		"<td><font>Make Name</font></td>"+
		"<td><font>Make Type</font></td>"
		"<td><font>Remark</font></td>"+
			"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.modelmakenamelist.length;i++){
    		data  = $scope.modelmakenamelist[i];
    		table_html = table_html + "<tr>"+
			"<td><font>"+data.rowno+"</font></td>"+
			"<td><font>"+data.modelname+"</font></td>"+
			"<td><font>"+data.makename+"</font></td>"+
			"<td><font>"+data.assetname+"</font></td>"
			"<td><font>"+data.remarks+"</font></td>"+
				"</tr>";
							}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Model_Details' + postfix + '.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){}
		

				
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.modelmakenamelist = data;
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
			
			
			$scope.deletemodel = function(deletemodelid){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldelete?id='+deletemodelid.modelid)
				.success(function(data, status, headers, config) {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {

				$scope.modeldetailslist = data;
				$scope.getData20($scope.pageno);
					jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					

				}).error(function(data, status, headers, config) {
					
					jAlert('Record Not Deleted','Information');
					console.log('error: data = ', data);
				});
					}
				});
			}
			
			
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
				    	 mymodelinsert.insertmodelname.focus();
				      }
				      else  if (mymodelinsert.insertmodelmakename.value== "")
				      	{
					    	 mymodelinsert.insertmodelmakename.focus();
					      }
				      else  {
				    	  var j=0,chk=0;
				    	  for(j=0;j<$scope.modeldetailslist.length;j++)
							{
				    		
							if($scope.modeldetailslist[j].modelname == document.getElementById('insertmodelname').value)
								{
								chk++;
							
								}
							}
				    	  if(chk >0)
				    		  {
								jAlert('Problem in Saving Records!Model Name Already Exists','Information');

				    		  }
				    	  else
				    		  {
				    	  var k=0;
				    	  if($scope.insertmodelmakeid==null){
				    		  jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
								mymodelinsert.insertmodelmakename.focus();
								k++;
							} 
				    	  if(k==0)
				    		  {
				    	  
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelinsert?modelname='+document.getElementById('insertmodelname').value+'&makeid='+$scope.insertmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmodelremark').value)
				.success(function(data, status, headers, config) {
					jAlert('Record Inserted Successfully', 'Success Dialog'); 
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {

						$scope.modeldetailslist = data;
						$scope.getData20($scope.pageno);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				}).error(function(data, status, headers, config) {
					
					jAlert('Unable to  Proceed Your Request','Information');
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=ModelFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
						//alert( "Exception details: " + JSON.stringify({data: data}));
					}); 
							
					
					console.log('error: data = ', data);
				});
				}
				    		  }   } 
				}
				catch(e)
				{
					//alert(e);
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
				    	 mymodeledit.editmodelname.focus();
				      }
				      else  if (mymodeledit.modeleditmakename.value== "")
				      {
				    	 mymodeledit.modeleditmakename.focus();
				      }
				      else 
				    	  {
				    	  
				    	  var k=0;
				    	  if($scope.editmodelmakeid==null){
				    		  jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
								 mymodeledit.modeleditmakename.focus();
								k++;
							} 
				    	  if(k==0)
				    		  {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelUpdate?modelid='+$scope.eidtmodelid+'&modelname='+document.getElementById('editmodelname').value+'&makeid='+$scope.editmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editmodelremark').value)
					.success(function(data, status, headers, config) {
						document.getElementById("mainmodel").hidden = false;
						document.getElementById("showeditmodel").hidden = true;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.modeldetailslist = data;
							$scope.getData20($scope.pageno);
			}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						jAlert('Record Updated Successfully', 'Success Dialog'); 
						document.getElementById('modeleditForm').reset(); 
						}).error(function(data, status, headers, config) {
							
							jAlert('Unable to  Proceed Your Request','Information');
							console.log('error: data = ', data);
							var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=ModelFormUpdate',data);
							response.success(function(data, status, headers, config) {
							});
							response.error(function(data, status, headers, config) {
								//alert( "Exception details: " + JSON.stringify({data: data}));
							}); 
						console.log('error: data = ', data);
					});
				    	  }
				}
				}
				catch(e)
				{
					//alert(e);
					
				}
			}
			
			
		});

		
			
		scotchApp.controller('MakeCtrl', function($scope,$http, $compile, $filter) {
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
			
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		$scope.pagesno = [20,50,80,100,120,240,360];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.showmakediv1 = function() {
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
				
				function printData()
				{
				   var divToPrint=document.getElementById("printTablemake");
				   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
					  var newWin = window.open('','',popup_win);
					   newWin.document.open();
				   
				   var htmlToPrint = '' +
			        '<style type="text/css">' +
			        'table th, table td {' +
			        'border:1px solid #000;' +
			        'padding;0.5em;' +
			        '}' +
			        'tr:nth-child(even) {' +
			        'background:#bdbdbd; ' +
			         '}' +
			         'tr:nth-child(odd) {' +
				        'background:#d3d3d3; ' +
				         '}'+ 
			        '</style>';
			        htmlToPrint += divToPrint.outerHTML;
			        newWin = window.open("");
			        newWin.document.write(htmlToPrint);
			        newWin.print();
			        newWin.close();
				}

				$('#printbutton').on('click',function(){
				printData();
				})
	
		$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Make Name","Make Type","remark"];
						var i=0;
				        	var data1=[];
							for(i=0;i<$scope.makenamelist.length;i++){
				    		
				        var data  = $scope.makenamelist[i];
				    		 data1.push([data.rowno,data.makename ,data.assetname,data.remarks]);
				    	
				    	}
				    
				    	 var doc = new jsPDF('landscape','pt');
				      
				    	 doc.autoTable(columns, data1);
				         doc.save("MakeDetails.pdf");
				         }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
	
				
		try{
			$("#exportexcel").click(function() {
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		        var table_div = document.getElementById('makeDiv');
		        //alert("table_div"+table_div);
		        var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Row No</font></td>"+
		"<td><font>Make Name</font></td>"+
		"<td><font>Make Type</font></td>"+
		"<td><font>Remark</font></td>"
		"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.makenamelist.length;i++){
    		data  = $scope.makenamelist[i];
    		table_html = table_html + "<tr>"+
			"<td><font>"+data.rowno+"</font></td>"+
			"<td><font>"+data.makename+"</font></td>"+
			"<td><font>"+data.assetname+"</font></td>"+
			"<td><font>"+data.remarks+"</font></td>"
			"</tr>";
							}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Make_Details' + postfix + '.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){}
		
		
		$scope.BYmakename='';
				
				try
				{
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchByMakename='+$scope.BYmakename)
					.success(function(data, status, headers, config) {
//		 				alert(data);
						$scope.makenamelist = data;
						$scope.getData19($scope.pageno); 

					}).error(function(data, status, headers, config) {
						//alert("error"+data);
						console.log('error: data = ', data);
					});
					$scope.makenamelistnew = [];
					$scope.pageno = 1; // initialize page no to 1
					$scope.total_count = 0;
//					$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
					
					$scope.getData19 = function(pageno){ 
						$scope.makenamelistnew = [];
					var start=0, end=0;
						if(pageno!=1){
							start = $scope.pagesint * (pageno-1);
							end = start + $scope.pagesint;
							start++;
						}else{
							start = 0;
							end = start + $scope.pagesint;
							start++;
						}
						
						for(var i=start;i<=end;i++){
							if(i<=$scope.makenamelist.length){
								if($scope.BYmakename!='')
									{
									if($scope.makenamelist[i].includes($scope.BYmakename))
									{
								$scope.makenamelistnew.push($scope.makenamelist[i-1]);
									}
									}
								else
									{
									$scope.makenamelistnew.push($scope.makenamelist[i-1]);
									}
							}else{
								break;
							}
						}
							
							$scope.total_count = $scope.makenamelist.length;
						
					};
					
				try
				{
					$("#searchBYmakename").keypress(function(){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchByMakename='+$scope.BYmakename)
						.success(function(data, status, headers, config) {
//			 				alert(data);
							$scope.makenamelistnew  = data;
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchByMakename='+$scope.BYmakename)
							.success(function(data, status, headers, config) {
//				 				alert(data);
								$scope.makenamelistnew  = data;
							}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
							});
						
						}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
						});
						
						
					});
					
				}catch(e){}
					
					
					
					
					
					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {
						$scope.assetnamelist = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				
					
					$scope.deletemake = function(deletemakeid){
						jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
							if(r){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedelete?id='+deletemakeid.makeid)
						.success(function(data, status, headers, config) {

							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {

						$scope.makenamelist = data;
						$scope.getData19($scope.pageno);
							jAlert('Record Deleted Successfully', 'Confirmation Results');
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
							

						}).error(function(data, status, headers, config) {
							jAlert('Record Not Deleted','Information');
						
							console.log('error: data = ', data);
						});
							}
						});
					}
					
					
					
					$scope.makeInsert= function makeInsert()
					{
						
						try
						{
							var i=0;
							for(i=0;i<$scope.assetnamelist.length;i++)
							{
								
								if($scope.assetnamelist[i].assetname==document.getElementById('insertmakeassetname').value)
								{
									$scope.insertassetid=$scope.assetnamelist[i].assettypeid;
								}
							}
							
							var mymakeinsert = document.makeforminsert;
				      if (mymakeinsert.insertmakename.value== "")
				      {
				    	 mymakeinsert.insertmakename.focus();
				      }
				      
				      else  if (mymakeinsert.insertmakeassetname.value== "")
				      {
				    	 mymakeinsert.insertmakeassetname.focus();
				      }
				      else
				    	  {
				    	  
				    	  var i=0;chk=0;
				    	  for(i=0;i<$scope.makenamelist.length;i++)
				    		  {
				    		  
				    		  if($scope.makenamelist[i].makename==document.getElementById('insertmakename').value)
				    			  {
				    			 chk++
				    			  }
				    		  }
				    		  if(chk>0)
				    			  {
				    			  jAlert('Problem in Saving Records! Make Name Already Exist!','Information');
				    			  }
				    		  else
				    			  {
				       var k=0;
				    	  
				    	  if($scope.insertassetid==null){
				    		  jAlert('Problem in Saving Records! Make Type Does Not Exist!','Information');
								 mymakeinsert.insertmakeassetname.focus();
								k++;
							} 
							if(k==0){
				      		
				      	
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeinsert?makename='+document.getElementById('insertmakename').value+
									'&assetid='+$scope.insertassetid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmakeremark').value)
							.success(function(data, status, headers, config) {

								jAlert('Record Inserted Successfully', 'Success Dialog'); 
							
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?companyid='+sptstr[1])
								.success(function(data, status, headers, config) {

									$scope.makenamelist = data;
									$scope.getData19($scope.pageno); 
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
	}).error(function(data, status, headers, config) {
								jAlert('Unable to  Proceed Your Request','Information');
								console.log('error: data = ', data);
								var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MakeFormInsert',data);
								response.success(function(data, status, headers, config) {
								});
								response.error(function(data, status, headers, config) {
									//alert( "Exception details: " + JSON.stringify({data: data}));
								}); 
										
								console.log('error: data = ', data);
							});
				    	  }	
				    			  }	
				    	  }		
						}
						catch(e)
						{
							//alert(e);
						}
						
					}
					
					
					
					$scope.makeupdate=function makeupdate()
					{
						
						try{
							
							
							//
				var mymakeEdit = document.makeedit;
				      if (mymakeEdit.editMakeName.value== "")
				      {
				    	 mymakeEdit.editMakeName.focus();
				      }
				      else  if (mymakeEdit.editmakeassetname.value== "")
				      {
				    	 mymakeEdit.editmakeassetname.focus();
				      }	
				      else
				    	  {
				    	  $scope.makeEditid=$scope.editmakedetails.makeid;
							var i=0;
							
							for(i=0;i<$scope.assetnamelist.length;i++)
							{
								if($scope.assetnamelist[i].assetname==document.getElementById('editmakeassetname').value)
								{
									$scope.editassetid=$scope.assetnamelist[i].assettypeid;
								}
							}
				    	  
				    	  var k=0;
				    	 
				    	  if($scope.editassetid==null){
				    		  jAlert('Problem in Saving Records! Make Type Does Not Exist!','Information');
								 mymakeEdit.editmakeassetname.focus();
								k++;
							} 
							if(k==0){
								
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeupdate?makeid='+$scope.makeEditid+
							'&makename='+document.getElementById('editMakeName').value+'&assetid='+$scope.editassetid+'&loginid='+sptstr[2]+
							'&remarks='+document.getElementById('editmakeremark').value)
							.success(function(data, status, headers, config) {
								document.getElementById("mainmake").hidden = false;
								document.getElementById("showeditmake").hidden = true;
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
								.success(function(data, status, headers, config) {

									$scope.makenamelist = data;
									$scope.getData19($scope.pageno); 

								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
								//document.getElementById('makeedit').reset(); 
								jAlert('Record Updated Successfully', 'Success Dialog'); 
								document.getElementById('makeedit').reset(); 
								
							}).error(function(data, status, headers, config) {
								jAlert('Unable to  Proceed Your Request','Information');
								console.log('error: data = ', data);
								var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MakeFormUpdate',data);
								response.success(function(data, status, headers, config) {
								});
								response.error(function(data, status, headers, config) {
									//alert( "Exception details: " + JSON.stringify({data: data}));
								}); 
								//console.log('error: data = ', data);
							});
				    	  }	
							
						}
						}
						catch(e)
						{
							//alert(e);
						}
						
						
					}
					
				}
				catch(e)
				{
					
				};
			});
		
		
		/**
		 * 
		 */

		scotchApp.controller('idlehoursCtrl', function($scope,$http, $compile, $filter)
				{
			 
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
					
			
					
//						var change1 = $('#ddldepot'+1+'')
//						
						
						 $("#ddldepot").select2();
						
				
//			exelexport			
			
						$("#idelhoursdateallexcel").click(function(){
							
							try
							{
							$('#idelhoursDateallwise').tableExport({
								type:'excel',escape:'false',separator: ',',
								tableName:'History Log',
								
								pdfFontSize:10,
								
								htmlContent:'false',
								consoleLog:'false',
								
								}
							
							);

							}catch(e){}
						});
						
			
						
						
						
		$("#idelhoursrangeallexcel").click(function(){
							
							try
							{
							$('#idlehoursrangeall').tableExport({
								type:'excel',escape:'false',separator: ',',
								tableName:'History Log',
								
								pdfFontSize:10,
								
								htmlContent:'false',
								consoleLog:'false',
								
								}
							
							);

							}catch(e){}
						});
						
						
						


//		$("#idlehoursparticulardateexcel").click(function(){
//							
//							try
//							{
//							$('#idlehousparticulardatewise').tableExport({
//								type:'excel',escape:'false',separator: ',',
//								tableName:'History Log',
//								
//								pdfFontSize:10,
//								
//								htmlContent:'false',
//								consoleLog:'false',
//								
//								}
//							
//							);
//
//							}catch(e){}
//						});
						
		try{
			$("#idlehoursparticulardateexcel").click(function() {
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		          var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Vehicle No</font></td>"+
		"<td><font>Date</font></td>"+
		"<td><font>Total Hours</font></td>"+
	"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.idelhoursdetailsdate.length;i++){
    		data  = $scope.idelhoursdetailsdate[i];
    		table_html = table_html + "<tr>"+
    		"<td><font>"+data.vehicleno+"</font></td>"+
			"<td><font>"+data.todate+"</font></td>"+
			"<td><font>"+data.totalhours+"</font></td>"+
			"</tr>";
    		}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'IdleHours_Report_DayWise' + postfix +'Vehicle No:'+document.getElementById('daywisevehicleno').value+'.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){alert("sss"+e);}	
		
		
		
//		$("#idlehoursparticularrangeexcel").click(function(){
//			
//			try
//			{
//			$('#idlehoursdaterangearticular').tableExport({
//				type:'excel',escape:'false',separator: ',',
//				tableName:'History Log',
//				pdfFontSize:10,
//				htmlContent:'false',
//				consoleLog:'false',
//				}
//				);
//	}catch(e){}
//		});

		    try{
				$("#idlehoursparticularrangeexcel").click(function() {
			        //getting values of current time for generating the file name
			        var dt = new Date();
			        var day = dt.getDate();
			        var month = dt.getMonth() + 1;
			        var year = dt.getFullYear();
			        var hour = dt.getHours();
			        var mins = dt.getMinutes();
			        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
			        //creating a temporary HTML link element (they support setting file names)
			        var a = document.createElement('a');
			        //getting data from our div that contains the HTML table
			        var data_type = 'data:application/vnd.ms-excel';//base64,' 
			          var i=0;
			        var table_html = "";
			table_html = table_html +"<html><body><table><tr>"+
			"<td><font>Vehicle No</font></td>"+
			"<td><font>Date</font></td>"+
			"<td><font>Hours</font></td>"+
			"<td><font>Total Hours</font></td>"+
		"</tr>";
			//alert(htmlString);
			try{
	    	for(i=0;i<$scope.idelhoursdetailsdaterange.length;i++){
	    		data  = $scope.idelhoursdetailsdaterange[i];
	    		table_html = table_html + "<tr>"+
	    		"<td><font>"+data.vehicleno+"</font></td>"+
				"<td><font>"+data.todate+"</font></td>"+
				"<td><font>"+data.hours+"</font></td>"+
				"<td><font>"+data.totalhours+"</font></td>"+
				"</tr>";
	    		}
						}catch(e){}
					table_html = table_html + "</table></body></html>";
			        a.href = data_type + ', ' + table_html;
			        //setting the file name
			        a.download = 'IdleHours_Report_DayRangeWise' + postfix +'Vehicle No:'+document.getElementById('datewisevehicleno').value+'.xls';
			        a.click();
			        //just in case, prevent default behaviour
			       e.preventDefault(); 
			    });}catch(e){}	
			
			
				
		$("#particularvehicledate1,#particularvehicledate2").change(function () {
			var max = $(this).datepicker('getDate'); // Get selected date
		    $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M');
			 var start = $("#particularvehicledate1").datepicker("getDate");
		     var end = $("#particularvehicledate2").datepicker("getDate");
		     var days = (end - start) / (1000 * 60 * 60 * 24);
		     if (days > 7) {
			   document.getElementById("reportmsg").hidden=false;
				jAlert('You can see Report within seven days', 'Confirmation Results');
		       document.getElementById("datewisevehicleno").disabled=true;
		       document.getElementById("showidlerep").disabled=true;
		    }
		   else
			   {
			   document.getElementById("datewisevehicleno").disabled=false;
		       document.getElementById("showidlerep").disabled=false;
			   
			   }
		});

		
		
						
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.reportvehicledetails = data;
			
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
			
			
			$("#reportallvehicles").change(function () {
				
		        var name = this.value;
		       
		        if(name=='Idle Hours For All vehicles By Date')
		        {
		        	document.getElementById('idelhoursallday').hidden=false;
		        	
		        	document.getElementById('idelhoursallrangewise').hidden=true;
		        	document.getElementById('idlehoursparticulardate').hidden=true;	
		        	document.getElementById('idlehoursparticulaRange').hidden=true;
					
			    }
		        else if(name=='Idle Hours For All Vehicles  By Date Range'){
		        	document.getElementById('idelhoursallrangewise').hidden=false;	
			    
		        	document.getElementById('idelhoursallday').hidden=true;
		        	document.getElementById('idlehoursparticulardate').hidden=true;
		        	document.getElementById('idlehoursparticulaRange').hidden=true;
			    }
		        else if(name=='Idle Hours ForParticular vehicles By Date')
			    {
		        	document.getElementById('idlehoursparticulardate').hidden=false;

		        	
		        	document.getElementById('idelhoursallday').hidden=true;
		        	
		        	document.getElementById('idelhoursallrangewise').hidden=true;
		        	document.getElementById('idlehoursparticulaRange').hidden=true;
		        	
			    	
			    }
			    else if(name=='Idle Hours For Particular Vehicle By Date Range')
			    {
			    	document.getElementById('idlehoursparticulaRange').hidden=false;
			    	
			    	
			    	document.getElementById('idlehoursparticulardate').hidden=true;

		        	
		        	document.getElementById('idelhoursallday').hidden=true;
		        	
		        	document.getElementById('idelhoursallrangewise').hidden=true;
		       
			    }
			
			
			});
			
			
			//vehiclewise
			
			try
			{
				$scope.idelhoursdetailsdaterangenew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData33 = function(pageno){ 
					$scope.idelhoursdetailsdaterangenew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					
					for(var i=start;i<=end;i++){
						if(i<=$scope.idelhoursdetailsdaterange.length){
							$scope.idelhoursdetailsdaterangenew.push($scope.idelhoursdetailsdaterange[i-1]);
						}else{
							break;
						}
					}
						
						$scope.total_count = $scope.idelhoursdetailsdaterange.length;
					
				};
				
			$scope.getidlehoursdaterange=function()
			{
				
				var myform = document.particulardaterangeForm;
			      if (myform.particularvehicledate1.value== "")
			      {
			    	  myform.particularvehicledate1.focus();
			      }	
			      else if (myform.particularvehicledate2.value== "")
			      {
			    	  myform.particularvehicledate2.focus();
			      }	
			      else if (myform.datewisevehicleno.value== "")
			      {
			    	  myform.datewisevehicleno.focus();
			      }	
			      else
			    	  {
			    	  
				 var over = '<div id="overlay">' +
////		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		 '</div>';
		    $(over).appendTo('body');
		    
		    
//		    var one_day=1000*60*60*24; // Convert both dates to milliseconds
//			//var date1_ms = date1.getTime();
//			var date1_ms=document.getElementById('particularvehicledate1').value;
//			//alert("d1"+d1);
//			
//			//var k = Date.parse( d.created );
//			//alert("dae1"+date1_ms);
//			var date2_ms =document.getElementById('particularvehicledate2').value;
//			//alert("dae2"+date2_ms);
//			//var date2_ms = date2.getTime(); // Calculate the difference in milliseconds
//			var difference_ms = (date2_ms.getTime()) - (date1_ms.getTime()); // Convert back to days and returnalert(
//			//alert("in diff"+difference_ms);
//			var data= Math.round(difference_ms/one_day); 
			
		    //alert(data);
		    
			
		 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereportDetails?vehicleno='+document.getElementById('datewisevehicleno').value+'&fdate='+document.getElementById('particularvehicledate1').value+'&tdate='+document.getElementById('particularvehicledate2').value+'&loginid1='+sptstr[2])
				.success(function(data, status, headers, config) {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereport')
					.success(function(data, status, headers, config) {
					 $scope.idelhoursdetailsdaterange=data;
					 $scope.getData33($scope.pageno); 
					 
					 document.getElementById('table4').hidden=false;
					 document.getElementById('idlehoursdaterangearticular').hidden=false;
					 
					 
					});
				$('#overlay').remove();
				}).error(function(data, status, headers, config) {
					 $('#overlay').remove();
					 jAlert('No Data Found','Information');
					console.log('error: data = ', data);
					
				});			
			}
			}	
			}catch(e){}
			
			
			
			
			try
			{
				$scope.idelhoursdetailsdatenew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData34 = function(pageno){ 
					$scope.idelhoursdetailsdatenew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					
					for(var i=start;i<=end;i++){
						if(i<=$scope.idelhoursdetailsdate.length){
							$scope.idelhoursdetailsdatenew.push($scope.idelhoursdetailsdate[i-1]);
						}else{
							break;
						}
					}
						
						$scope.total_count = $scope.idelhoursdetailsdate.length;
					
				};
				
				
			$scope.getidlehoursdatewise=function() 
			{
				
				var myform1 = document.particulardateform;
			      if (myform1.particularvehicleday.value== "")
			      {
			    	  myform1.particularvehicleday.focus();
			      }	
			      else if(myform1.daywisevehicleno.value== "")
			    	  {
			    	  myform1.daywisevehicleno.focus();
			    	  }
			      else
			    	  {
			    	
				 var over = '<div id="overlay">' +
////		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		 '</div>';
		    $(over).appendTo('body');
		    
//		    var x = document.getElementById("daywisevehicleno").selectedIndex;
//		    alert(document.getElementsById("daywisevehicleno")[x].value);
//		    $scope.vehicleno=document.getElementsById("daywisevehicleno")[x].value;
		    
		 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereportDetails?vehicleno='+document.getElementById('daywisevehicleno').value+'&fdate='+document.getElementById('particularvehicleday').value+'&tdate=&loginid1='+sptstr[2])
				.success(function(data, status, headers, config) {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereport')
					.success(function(data, status, headers, config) {
					 $scope.idelhoursdetailsdate=data;
					 $scope.getData34($scope.pageno); 
					 document.getElementById('table3').hidden=false;
					 document.getElementById('idlehousparticulardatewise').hidden=false;
					});
				$('#overlay').remove();
				}).error(function(data, status, headers, config) {
					 $('#overlay').remove();
					 jAlert('No Data Found','Information');
					console.log('error: data = ', data);
					
				});
			    	  }	
			}
				
			}catch(e){alert(e);}
			
			
			
			
			//all
			try
			{
				$scope.idelhoursdetailsAllnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData35 = function(pageno){ 
					$scope.idelhoursdetailsAllnew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					
					for(var i=start;i<=end;i++){
						if(i<=$scope.idelhoursdetailsAll.length){
							$scope.idelhoursdetailsAllnew.push($scope.idelhoursdetailsAll[i-1]);
						}else{
							break;
						}
					}
						
						$scope.total_count = $scope.idelhoursdetailsAll.length;
					
				};
				
				
			$scope.getidlehoursrangewiseall=function()
			{
				
				
				var myform3 = document.allvehdaterangeform;
			      if (myform3.allvehiclesdate1.value== "")
			      {
			    	  myform3.allvehiclesdate1.focus();
			      }
			      else if (myform3.allvehiclesdate2.value== "")
			      {
			    	  myform3.allvehiclesdate2.focus();
			      }
			      else
			    	  {
				
				
			     	  
			 		 var over = '<div id="overlay">' +
////			      '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
			  '</div>';
			     $(over).appendTo('body');
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesdate1').value+'&tdate='+document.getElementById('allvehiclesdate2').value+'&loginid1='+sptstr[2])
				.success(function(data, status, headers, config) {
			
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereport')
						.success(function(data, status, headers, config) {
						 $scope.idelhoursdetailsAll=data;
						 $scope.getData35($scope.pageno); 
						 document.getElementById('table2').hidden=false;
						 document.getElementById('idlehoursrangeall').hidden=false;
						 $('#overlay').remove();
						
				}).error(function(data, status, headers, config) {
					//alert("in err");
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
			}catch(e){};
			
			
			$scope.idelhoursdetailsAlldatenew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData36 = function(pageno){ 
				$scope.idelhoursdetailsAlldatenew = [];
			var start=0, end=0;
				if(pageno!=1){
					start = $scope.pagesint * (pageno-1);
					end = start + $scope.pagesint;
					start++;
				}else{
					start = 0;
					end = start + $scope.pagesint;
					start++;
				}
				
				for(var i=start;i<=end;i++){
					if(i<=$scope.idelhoursdetailsAlldate.length){
						$scope.idelhoursdetailsAlldatenew.push($scope.idelhoursdetailsAlldate[i-1]);
					}else{
						break;
					}
				}
					
					$scope.total_count = $scope.idelhoursdetailsAlldate.length;
				
			};
			
			$scope.getidlehoursAlldate=function()
			{
				
				var myform2 = document.daywisallform;
			      if (myform2.allvehiclesDay.value== "")
			      {
			    	  myform2.allvehiclesDay.focus();
			      }
			      else
			    	  {
				 var over = '<div id="overlay">' +
////		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
		 '</div>';
		    $(over).appendTo('body');
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesDay').value+'&tdate=&loginid1='+sptstr[2])
			.success(function(data, status, headers, config) {
			//	alert("in succ");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/idlereport')
					.success(function(data, status, headers, config) {
					//	alert("in succ");
						
					 $scope.idelhoursdetailsAlldate=data;
					 $scope.getData36($scope.pageno); 
					 document.getElementById('table1').hidden=false;
					 document.getElementById('idelhoursDateallwise').hidden=false;
					 $('#overlay').remove();
					}).error(function(data, status, headers, config) {
						//alert("in err");
						 $('#overlay').remove();
						 jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					});
				
				}).error(function(data, status, headers, config) {
					//alert("in err");
					 $('#overlay').remove();
					 jAlert('No Data Found','Information');
					console.log('error: data = ', data);
					
				});
			
			
			}
			
			}
			
			
			
				})





		scotchApp.controller('changepasswordctrl', function($scope,$http, $compile, $filter)
				{
			 $scope.loginname=sptstr[8];
			document.getElementById('changeuserloginname').value= $scope.loginname;
			$scope.changePass= function changePass()
			{
				var myForm = document.insertchangeuserform;
			      if (myForm.changeuserloginname.value== "")
			      {
			    	 myForm.changeuserloginname.focus();
				
			      }
			      else if(myForm.changeolduserpassword.value=="")
			     {
			     myForm.changeolduserpassword.focus();
			     }
			      else if(myForm.changenewuserpassword.value=="")
		    	  {
		    	  myForm.changenewuserpassword.focus();
		    	  }
			      else if(myForm.confirmuserpassword.value=="")
		    	  {
		    	  myForm.confirmuserpassword.focus();
		    	  }
			      else
			    	  {
				if(document.getElementById("changenewuserpassword").value==document.getElementById("confirmuserpassword").value)
					{
				
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userupdate?loginid='+sptstr[2]+
					'&loginname='+document.getElementById('changeuserloginname').value+
					'&password='+document.getElementById('changenewuserpassword').value+
					'&controlid='+sptstr[4]+'&roleid='+sptstr[6]+
					'&ownersid='+sptstr[7]+'&companyid='+sptstr[1])
			.success(function(data, status, headers,config) {
				jAlert('Password Change Successfully','Information');
						}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					
					});
					}
				else
					{
					jAlert('New password and confirm password not match','Information');
					}
			}
			}
				
				});
			
				
		/**
		 * 
		 */

		scotchApp.controller('historyCtrl', function($scope,$http, $compile, $filter) {
			
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
					   		$scope.pagesno = [20,50,80,100,120,240,'All'];
							$scope.pagesint=20;
							$scope.onpagechange = function(page){
								$scope.pagesint=page;
								if($scope.pagesint=='All')
								{
								$scope.pagesint=$scope.historylogreport.length;
							
								}
					
							}
							
			
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								//alert(data);
								$scope.historyvehicledetails = data;
								
							}).error(function(data, status, headers, config) {
								//alert(data);
								console.log('error: data = ', data);
							});
						
//				$("#historyexcel").click(function(){
//					
//					try
//					{
//					$('#historytable').tableExport({
//						type:'excel',escape:'false',separator: ',',
//						tableName:'History Log',
//						
//						pdfFontSize:10,
//						
//						htmlContent:'false',
//						consoleLog:'false',
//						
//						}
//					
//					);
//
//					}catch(e){}
//				});
				
				try{
					$("#historyexcel").click(function() {
				        //getting values of current time for generating the file name
				        var dt = new Date();
				        var day = dt.getDate();
				        var month = dt.getMonth() + 1;
				        var year = dt.getFullYear();
				        var hour = dt.getHours();
				        var mins = dt.getMinutes();
				        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
				        //creating a temporary HTML link element (they support setting file names)
				        var a = document.createElement('a');
				        //getting data from our div that contains the HTML table
				        var data_type = 'data:application/vnd.ms-excel';//base64,' 
				        var table_div = document.getElementById('historyDiv');
				        //alert("table_div"+table_div);
				        var i=0;
				        var table_html = "";
				table_html = table_html +"<html><body><table><tr>"+
				"<td><font>IMEI NO</font></td>"+
				"<td><font>Polling Time</font></td>"+
				"<td><font>Latitude</font></td>"+
				"<td><font>Longitude</font></td>"+
				"<td><font>GPS Status</font></td>"
				"</tr>";
				//alert(htmlString);
				try{
		    	for(i=0;i<$scope.historylogreport.length;i++){
		    		data  = $scope.historylogreport[i];
		    		table_html = table_html + "<tr>"+
					"<td><font>"+data.imeino+"</font></td>"+
					"<td><font>"+data.datatimestamp+"</font></td>"+
					"<td><font>"+data.latitude+"</font></td>"+
					"<td><font>"+data.longitude+"</font></td>"+
					"<td><font>"+data.gpsstatus+"</font></td>"+
					"</tr>";
									}
							}catch(e){}
						table_html = table_html + "</table></body></html>";
				        a.href = data_type + ', ' + table_html;
				        //setting the file name
				        a.download = 'HistoryLog_Details' + postfix +'Vehicle No:'+document.getElementById('historyvehicleno').value+'.xls';
				        a.click();
				        //just in case, prevent default behaviour
				       e.preventDefault(); 
				    });}catch(e){alert("sss"+e);}
				
				
				$scope.getdatahist = function(){
					
					document.getElementById("historytableback").hidden = true;
					document.getElementById("loghistorydiv").hidden = false;
					document.getElementById("historytable").hidden = false;
					document.getElementById("historytable1").hidden = false;
					
					document.getElementById("historymapframefr").src = "";
					document.getElementById("historymapframe").hidden = true;
				}
				
				$scope.getAllMap = function(){
					
					
//					alert($scope.historylogreport);
					var response = $http.post('PostService', $scope.historylogreport);
					response.success(function(data, status, headers, config) {
						
						document.getElementById("historytableback").hidden = false;
						document.getElementById("loghistorydiv").hidden = true;
						document.getElementById("historytable").hidden = true;
						document.getElementById("historytable1").hidden = true;
						
						
						document.getElementById("historymapframefr").src = "historymap";
						document.getElementById("historymapframe").hidden = false;
					});
					response.error(function(data, status, headers, config) {
					});
	
				}
				
				
				$scope.getmodal = function(comp){
					try{
						document.getElementById("historytableback").hidden = true;
//					alert(comp.tripid+" "+comp.mindatereceived+" "+comp.latitude+" "+comp.longitude);
					document.getElementById("vehicleframehistory").src = "vehiclesummarysingle?vehicleno="+document.getElementById('historyvehicleno').value
						+"&tripid="+comp.vehiclespeed+"&date="+comp.datatimestamp+"&latitude="+comp.latitude+"&longitude="+comp.longitude;
					var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");

//					$('a[data-modal-id]').click(function(e) {
//						e.preventDefault();
				    $("#historytable").append(appendthis);
				    $(".modal-overlay").fadeTo(500, 0.7);
				    //$(".js-modalbox").fadeIn(500);
						var modalBox = $("#historytable").attr('data-modal-id');
						$('#popup2').fadeIn($("#historytable").data());
//					});  
				  
				$(".js-modal-close, .modal-overlay").click(function() {
				    $(".modal-box, .modal-overlay").fadeOut(500, function() {
				        $(".modal-overlay").remove();
				    });
				 
				});
				 
				$(window).resize(function() {
				    $(".modal-box").css({
				        top: ($(window).height() - $(".modal-box").outerHeight()) /4,
				        left: ($(window).width() - $(".modal-box").outerWidth()) /4
				    });
				});
				 
				$(window).resize();
			}catch(e){}
				}

				
				
				
				$("#historyfromndate,#historytodate").change(function () {
					var max = $(this).datepicker('getDate'); // Get selected date
				    $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M');
					 var start = $("#historyfromndate").datepicker("getDate");
				     var end = $("#historytodate").datepicker("getDate");
				     var days = (end - start) / (1000 * 60 * 60 * 24);
				     if (days > 7) {
					   document.getElementById("reportmsg").hidden=false;
						jAlert('You can see Report within seven days', 'Confirmation Results');
				       document.getElementById("historyvehicleno").disabled=true;
				       document.getElementById("showrep").disabled=true;
				    }
				   else
					   {
					   document.getElementById("historyvehicleno").disabled=false;
				       document.getElementById("showrep").disabled=false;
					   
					   }
				});
	
				
				$scope.historylogreportnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData32 = function(pageno){ 
					$scope.historylogreportnew = [];
				var start=0, end=0;
					if(pageno!=1){
						start = $scope.pagesint * (pageno-1);
						end = start + $scope.pagesint;
						start++;
					}else{
						start = 0;
						end = start + $scope.pagesint;
						start++;
					}
					
					for(var i=start;i<=end;i++){
						if(i<=$scope.historylogreport.length){
							$scope.historylogreportnew.push($scope.historylogreport[i-1]);
						}else{
							break;
						}
					}
						
						$scope.total_count = $scope.historylogreport.length;
					
				};
				
				$scope.getLogs=function()
				 {
					var myform = document.history;
				      if(myform.historyfromndate.value== "")
				      {
				    	  myform.historyfromndate.focus();
				      }
				      else  if(myform.historytodate.value== "")
				      {
				    	  myform.historytodate.focus();
				      }
				      else if (myform.historyvehicleno.value== "")
				      {
				    	  myform.historyvehicleno.focus();
				      }
				      else
				    	{
				    	 
					 var over = '<div id="overlay">' +
//				     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
				     '</div>';
				    $(over).appendTo('body');
				    document.getElementById("loghistorydiv").hidden = true;
					document.getElementById("historytable").hidden = true;
					document.getElementById("historytable1").hidden = true;
					
				try
				{
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/historylogdetails?fromdate='+document.getElementById('historyfromndate').value+'&todate='+document.getElementById('historytodate').value+'&vehicleno='+document.getElementById('historyvehicleno').value)
				.success(function(data, status, headers, config) {
					
					$scope.historylogreport = data;
					$scope.getData32($scope.pageno); 
					if(data.length==0){
						document.getElementById("loghistorydiv").hidden = true;
						document.getElementById("historytable").hidden = true;
						document.getElementById("historytable1").hidden = true;
						jAlert('No Data Found','Information');
					}else{
						
						document.getElementById("loghistorydiv").hidden = false;
						document.getElementById("historytable").hidden = false;
						document.getElementById("historytable1").hidden = false;
					}
					$('#overlay').remove();
				}).error(function(data, status, headers, config) {
					$('#overlay').remove();
					document.getElementById("loghistorydiv").hidden = true;
					document.getElementById("historytable").hidden = true;
					document.getElementById("historytable1").hidden = true;
					jAlert('No Data Found','Information');
					console.log('error: data = ', data);
				});
				}
				catch(e){}
				 }
			    	  }
			});

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
						window.location.replace("/");
					}
					mydate = new Date();
					
					$scope.loginid = sptstr[2];
					clearInterval(interval);
					
//					$(document).ready(function(){
//						//alert("in");
//						  $('#popdanger').popover({ 
//						    html : true,
//						    content: function() {
//						      return $('#popover_content_wrapper').html();
//						    }
//						  }).click(function(){
//							  $(this).popover('show');
//						  })
//						});
//					
					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisecount?companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
//						alert(data);
						$scope.totaldevicesdet= data;
						$scope.ros=data[0].companyName;
						
						$scope.at=data[1].companyName;
					});
					
					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed=50')
					.success(
							function(data, status, headers,
									config) {
//							alert(data);
								$scope.ignitionoff = data.ignitionoff;
								$scope.ignitionon = data.ignitionon;
								$scope.validgps = data.validgps;
								$scope.invalidgps = data.invalidgps;
								$scope.totald = data.totalVehicles;
								$scope.working_devices = data.working_devices;
								$scope.not_working_devices = Number(data.not_working_devices)+Number($scope.totaldevicesdet[0].nonPolllingDevices);
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

			}).error(function(data, status, headers,
									config) {
								console.log(
										'error: data = ',
										data);
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
					
					
					

					$("#Summaryexcel").click(function(){

						try
						{
						$('#livesumm').tableExport({
							type:'excel',escape:'false',separator: ',',
							tableName:'Summary',
							
							pdfFontSize:10,
							
							htmlContent:'false',
							consoleLog:'false',
							
							}

						);

						}catch(e){alert(e);}
						});

					
					
					$("#exportpdf").click(function(){
						
						try
						{
						$('#livesumm').tableExport({
							type:'pdf',escape:'false',separator: ',',
							tableName:'livesumary',
							pdfFontSize:10,
							htmlContent:'false',
							consoleLog:'false',
									}
								);
						}catch(e){}
					});
					try{
					$(function () {
					    function drawChart() {
					   
					        var data = google.visualization.arrayToDataTable([
					            ['task', 'percentage'],
					            ['Halt Vehicles',"20"],
					            ['Running Vehicles',"30"],
					            ['Stopped Vehicles',"40"],
					           
					        ]);

					        var options = {
					            title: '',
					            colors: ["orange",
								"Green", "red" ],
								 is3D: true,
					        };

					        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
					        
					        chart.draw(data, options);
					    }

					    google.load("visualization", "1", {
					        packages: ["corechart"],
					        callback: drawChart
					    });
					});

					}catch(e){
						
					}
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
				   		//$scope.orderProp = "Device No";
				   		$scope.pagesno = [20,50,100,150,200,300];
						$scope.pagesint=20;
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
									 
//						 			 width: 400,
						
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
				
					$scope.limit=60;	
					try{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getSubdealerssolddeatils?loginid='+sptstr[2])
							.success(function(data, status, headers, config) {
								$scope.solddetailslist1 = data;
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						}catch(e){
							//alert(e);
						}
						
						//

						try{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/getdealercustdetailsList?loginid='+sptstr[2])
							.success(function(data, status, headers, config) {
								$scope.customerDetailslist = data;
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						}catch(e){
							//alert(e);
						}
						
						
						
						$scope.getDevicesList = function(obj){
							try{
								//alert(obj);
								$http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getsoldimeis', obj)
								.success(function(data, status, headers, config) {
									$scope.devicedetails = data;
									//alert(data.length);
									$('#myModal2').modal('show'); 
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
							}catch(e){
								//alert(e);
							}
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
															//alert(e);
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
//											    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
												      data.addRows([
												        [String($scope.jsonArr[m].dealername), Number($scope.jsonArr[m].count)]
												      ]);
											      }
										    	}catch(e){
										    		//alert(e);
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
													 
//										 			 width: 400,
													
									 			
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
											
											
											
											
											$("#livesearchbyDeviceid").keypress(function(){
												try
												{
													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
													.success(function(response){ 
														$scope.users = response.data; 
														//ajax request to fetch data into vm.data
														$scope.alldata = response.data; 
														$scope.total_count = response.total_count;
														$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
														.success(function(response){ 
															$scope.users = response.data; 
															//ajax request to fetch data into vm.data
															$scope.alldata = response.data; 
															$scope.total_count = response.total_count;
														});
													});
												}catch(e){}
											});
											
														
											
											$scope.users = []; //declare an empty array
											$scope.pageno = 1; // initialize page no to 1
											$scope.total_count = 0;
//											$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
											
											$scope.getData = function(pageno){ // This would fetch the data on page change.
												//In practice this should be in a factory.
												$scope.page=pageno;
												$scope.users = [];
												
//												alert('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.itemsPerPage);
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//													alert(response.total_count);
													$scope.users = response.data; 
													//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
												});
												
											};
											//$scope.getData($scope.pageno); 
										}catch(e){
											//alert(e);
											}
										
										
										try
										{
											$("#livevehiclesumspeedlimit").change(function () {
												$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
												$scope.users = [];
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//													alert(response.total_count);
													$scope.users = response.data; 
													//alert(response.data);//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
												});
												$scope.getData($scope.page); 
												
												
												//gps
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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
												
											});
											
										}
										catch(e)
										{
											//alert(e);
										}
										
										
										
										$scope.keyc;
										$scope.getsorted = function(key){
											try{
												
												$scope.keyc = key;
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type='+$scope.keyc)
												.success(function(response){ 
														$scope.users = response.data; 
													//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
//													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type='+$scope.keyc)
//													.success(function(response){ 
//														$scope.users = response.data; 
//														//ajax request to fetch data into vm.data
//														$scope.alldata = response.data; 
//														$scope.total_count = response.total_count;
//													});
												});
												
												
												//getData(key);
											}catch(e){
												
											}
										}
										
//										
//										function getData(key){
//											if(key=='all'){
//												$scope.users = $scope.alldata;
//											}
//											
//											if(key=='ac'){
//												$scope.users = [];
//											}
//											
//											if(key=='temper'){
//												$scope.users = [];
//											}
//												
//												
//											if(key=='ignnumberoff'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].ignumber=='resources/images/IGINOff.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											
//											if(key=='ignnumberon'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].ignumber=='resources/images/IGINIOn.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											
//											if(key=='gpsoff'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].gpsstatus=='resources/images/GPSOFF.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											if(key=='gpson'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].gpsstatus=='resources/images/GPSON.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											if(key=='hault'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].vehiclestatus=='resources/images/hand.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											if(key=='running'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].vehiclestatus=='resources/images/run.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											
//											if(key=='stop'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].vehiclestatus=='resources/imagenew/stop.png'){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//											
//											
//											if(key=='overspeed'){
//												var i=0,j=1;
//												$scope.users = [];
//												
//												for(i=0;i<$scope.alldata.length;i++){
//													if($scope.alldata[i].vehiclespeed>35){
//														$scope.alldata[i].rowno=j;
//														$scope.users.push($scope.alldata[i]);
//														j++;
//													}
//												}
//											}
//										}
							

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
														 
//													        var data = google.visualization.arrayToDataTable([
//													         ['Month', 'SimAssigned', 'SimnotAssigned', 'VehicleAssigned', 'VehiclenotAssigned'],
////													         [$scope.dealername,Number($scope.simassign),Number($scope.simnotassin),Number($scope.vehassigned),Number($scope.vehnotass)]
//													         ['B',  135, 1120, 599, 1268],
//													         ['C',  157, 1167, 587, 807],
//													         ['D', 139,1110,615,968],
//													         ['C',136,691,  629, 1026]
//													      ]);

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
												
										
//										interval = setInterval(function(){
////											$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
////											.success(
////													function(data, status, headers, config) {
////														$scope.alldata = data;
////														getData($scope.keyc);
////													}).error(function(data, status, headers, config) {
////														console.log('error: data = ', data);
////													
////													});
//										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
//												.success(
//														function(data, status, headers,config) {
//															
//															$scope.ignitionoff = data.ignitionoff;
//															$scope.ignitionon = data.ignitionon;
//															$scope.validgps = data.validgps;
//															$scope.invalidgps = data.invalidgps;
//															$scope.totald = data.totalVehicles;
//															$scope.working_devices = data.working_devices;
//															$scope.not_working_devices = data.not_working_devices;
//															$scope.red = data.red;
//															$scope.green = data.green;
//															$scope.yellow = data.yellow;
//															$scope.temper = data.temper;
//															$scope.ac = data.ac;
//															$scope.overspeed = data.overspeed;
//															
//														}).error(function(data, status, headers, config) {
//															console.log('error: data = ', data);
//														
//														});
//								
//										}, 50000);
											
			try
			{
				
				
				
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
			
		
		
		
		
		scotchApp.controller('dealerdasboardLivectrl', function($scope,$http, $compile, $filter)
				{
					$scope.loginid = sptstr[2];	
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
					
					$scope.loginid = sptstr[2];
					clearInterval(interval);
	
					
					try{
						$("#Summaryexcel").click(function() {
					        //getting values of current time for generating the file name
					        var dt = new Date();
					        var day = dt.getDate();
					        var month = dt.getMonth() + 1;
					        var year = dt.getFullYear();
					        var hour = dt.getHours();
					        var mins = dt.getMinutes();
					        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
					        //creating a temporary HTML link element (they support setting file names)
					        var a = document.createElement('a');
					        //getting data from our div that contains the HTML table
					        var data_type = 'data:application/vnd.ms-excel';//base64,' 
					        var table_div = document.getElementById('menuDiv');
					        //alert("table_div"+table_div);
					        var i=0;
					        var table_html = "";
					         table_html = table_html +" <html><body><table><tr>"+
						    	"<td ><font>Row No</font></td>"+
								"<td><font>Vehicle No</font></td>"+
								"<td><font>IMEI No </font></td>"+
								"<td><font>Device No</font></td>"+
								"<td><font>Customer Name</font></td>"
								"<td><font>Polling Time</font></td>"+
								"<td><font>Speed</font></td>"+
								"</tr>";
								try{
						    	for(i=0;i<$scope.users.length;i++){
						    		data  = $scope.users[i];
						    		table_html = table_html + "<tr>"+
									"<td ><font>"+data.rowno+"</font></td>"+
									"<td ><font>"+data.vehicleid+"</font></td>"+
									"<td ><font>"+data.imeino+"</font></td>"+
									"<td><font>"+data.deviceid+"</font></td>"+
									"<td><font>"+data.customername+"</font></td>"+
									"<td><font>"+data.datatimestamp+"</font></td>"+
									"<td><font>"+data.vehiclespeed+"</font></td>"+
									"</tr>";
										}
								}catch(e){}
							table_html = table_html + "</table></body></html>";
					        a.href = data_type + ', ' + table_html;
					        //setting the file name
					        a.download = 'LiveSummary_Details' + postfix + '.xls';
					        a.click();
					        //just in case, prevent default behaviour
					       e.preventDefault(); 
					    });}catch(e){alert("sss"+e);}
					
					
//					
					try
					{
					$scope.nonPollingDetails = []; //declare an empty array
					$scope.pollingpageno = 1; // initialize page no to 1
					$scope.pollingtotal_count = 0;
//					$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
					
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint).success(function(response){ 
							//alert(response);
							$scope.nonPollingDetailsall=response;
							$scope.getDatapol($scope.pollingpageno); 
						});
						
					
					$scope.getDatapol = function(pageno){ 
						$scope.nonPollingDetails = [];
					var start=0, end=0;
						if(pageno!=1){
							start = $scope.pagesint * (pageno-1);
							end = start + $scope.pagesint;
							start++;
						}else{
							start = 0;
							end = start + $scope.pagesint;
							start++;
						}
						
						for(var i=start;i<=end;i++){
							if(i<=$scope.nonPollingDetailsall.length){
									$scope.nonPollingDetails.push($scope.nonPollingDetailsall[i-1]);
							}else{
								break;
							}
						}
							
							$scope.pollingtotal_count = $scope.nonPollingDetailsall.length;
						
					};
					
					}catch(e){alert(e);}
					
					
					
					
					
					
					try{
					
			$("#popdanger").click(function(){
				document.getElementById('main').hidden=true;
				document.getElementById('nonpollingTable').hidden=false;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
					$scope.nonPollingDetails=data;
				}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});	
				
				});			
					}catch(e){alert(e);}	
					
					
					
				$scope.backToLive= function backToLive()
				{
					document.getElementById('main').hidden=false;
					document.getElementById('nonpollingTable').hidden=true;
				}
					
				
				
				$("#nonpollingsearchbyDeviceid").keypress(function(){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2]+'&pageno='+$scope.pollingpageno+'&itemsPerPage='+$scope.pagesint+'&nonpollinDevices='+document.getElementById('nonpollingsearchbyDeviceid').value).success(function(response){ 
						//alert(response);
						$scope.nonPollingDetailsall=response;
						$scope.getDatapol($scope.pollingpageno); 
					});
					
				});
				
				
				
				
					
					function printData()
					{
					   var divToPrint=document.getElementById("livesumm");
					   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
						  var newWin = window.open('','',popup_win);
						   newWin.document.open();
					   var htmlToPrint = '' +
				        '<style type="text/css">' +
				        'table th, table td {' +
				        'border:1px solid #000;' +
				        'padding;0.5em;' +
				        '}' +
				        'tr:nth-child(even) {' +
				        'background:#bdbdbd; ' +
				         '}' +
				         'tr:nth-child(odd) {' +
					        'background:#d3d3d3; ' +
					         '}'+ 
				        '</style>';
				        htmlToPrint += divToPrint.outerHTML;
				        newWin = window.open("");
				        newWin.document.write(htmlToPrint);
				        newWin.print();
				        newWin.close();
					}
					$('#printbutton').on('click',function(){
					printData();
					})
					
					
					
			$('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Type", "IMEI NO", "Device NO","Mobile No","Customer Name","Polling Time","Speed","Location"];
						var i=0;
				       	var data1=[];
						//	alert($scope.users.length);
				      	for(i=0;i<$scope.users.length;i++){
				    		
				        var data  = $scope.users[i];
				    		 data1.push([data.rowno,data.vehicleid,data.imeino,data.deviceid,data.mobileno,data.customername,data.datatimestamp,data.vehiclespeed,data.location]);
				    	
				    	}
				    var doc = new jsPDF('landscape','pt');
				       	 doc.autoTable(columns, data1);
				         doc.save("VehicleSummary.pdf");
				         }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
					  
					
					
					
					
					
					$scope.sort = function(keyname){
						$scope.sortKey = keyname;   //set the sortKey to the param passed
						$scope.reverse = !$scope.reverse; //if true make it false and vice versa
					}
						$scope.query = {};
				   		$scope.queryBy = '$';
				   		//$scope.orderProp = "Device No";
				   		$scope.pagesno = [20,50,100,150,200,300];
						$scope.pagesint=20;
						$scope.onpagechange = function(page){
						$scope.pagesint=page;
						}
						
				
				
					$scope.limit=60;	
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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
							try{
//											
											
											$("#livesearchbyDeviceid").keypress(function(){
												try
												{
													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type=all')
													.success(function(response){ 
														$scope.users = response.data; 
														//ajax request to fetch data into vm.data
														$scope.alldata = response.data; 
														$scope.total_count = response.total_count;
														$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type=all')
														.success(function(response){ 
															$scope.users = response.data; 
															//ajax request to fetch data into vm.data
															$scope.alldata = response.data; 
															$scope.total_count = response.total_count;
														});
													});
												}catch(e){}
											});
											
														
											
											$scope.users = []; //declare an empty array
											$scope.pageno = 1; // initialize page no to 1
											$scope.total_count = 0;
//											$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
											$scope.users = [];
											$scope.getData = function(pageno){ // This would fetch the data on page change.
												//In practice this should be in a factory.
												$scope.page=pageno;
												//$scope.users = [];
												
												//alert('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.itemsPerPage);
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
												$scope.users = response.data; 
													//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
												});
												
											};
											$scope.getData($scope.pageno); 
										}catch(e){
											//alert(e);
											}
										
										
										
										$scope.set_color = function (vehicles) 
										{
											  if (vehicles.color=="red") {
											    return {background: "#C77D8C " }
											  }
										}
										
										
										
										
										try
										{
											$("#livevehiclesumspeedlimit").change(function () {
												$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
												$scope.users = [];
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
												
													$scope.users = response.data; 
													//alert(response.data);//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
												});
												$scope.getData($scope.page); 
												
												
												//gps
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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
												
											});
											
										}
										catch(e)
										{
											//alert(e);
										}
										
										
										
										$scope.keyc = "all";
										$scope.getsorted = function(key){
											try{
												$scope.keyc = key;
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type='+$scope.keyc)
												.success(function(response){ 
														$scope.users = response.data; 
													//ajax request to fetch data into vm.data
													$scope.alldata = response.data; 
													$scope.total_count = response.total_count;
//													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value+'&type='+$scope.keyc)
//													.success(function(response){ 
//														$scope.users = response.data; 
//														//ajax request to fetch data into vm.data
//														$scope.alldata = response.data; 
//														$scope.total_count = response.total_count;
//													});
												});
												
												
												//getData(key);
											}catch(e){
												
											}
										}
										
										
								interval = setInterval(function(){
								
										$scope.getsorted($scope.keyc); 
											
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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
								
										}, 40000);
											
			try
			{
				
				
				
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
							window.location.replace("/");
						}
						mydate = new Date();
						
						$scope.sort = function(keyname){
							$scope.sortKey = keyname;   //set the sortKey to the param passed
							$scope.reverse = !$scope.reverse; //if true make it false and vice versa
						}
							$scope.query = {};
					   		$scope.queryBy = '$';
					   		$scope.pagesno = [10,50,100,150,200,300];
							$scope.pagesint=20;
							$scope.onpagechange = function(page){
							$scope.pagesint=page;
							}
						
								
							$("#Summaryexcel").click(function(){
								try
								{
								$('#livesumm').tableExport({
									type:'excel',escape:'false',separator: ',',
									tableName:'Summary',
									pdfFontSize:10,
									width:500,
									Orientation:'landscape',
									htmlContent:'false',
									consoleLog:'false',
										}

								);

								}catch(e){alert(e);}
								});

							
							
//							var doc = new jsPDF("landscape");
//							var specialElementHandlers = {
//							    '#editor': function (element, renderer) {
//							        return true;
//							    }
//							};
//
//							$('#exportpdf').click(function () {
//							    doc.fromHTML($('#livesumary').html(), 10, 10, {
//							        'width':170,
//							            'elementHandlers': specialElementHandlers
//							    });
//							    doc.save('sample-file.pdf');
//							});
//							
							
								
							$("#exportpdf").click(function(){
								
								try
								{
								$('#livesumm').tableExport({
									type:'pdf',escape:'false',separator: ',',
								tableName:'livesumary',
									pdfFontSize:10,
								htmlContent:'false',
									consoleLog:'false',
											}
										);
								}catch(e){}
							});
							
							
							
							
							
							
						$scope.loginid = sptstr[2];
						clearInterval(interval);
						var over = '<div id="overlay"></div>';
					    $(over).appendTo('body');
					    
					    $scope.users = []; //declare an empty array
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						$scope.limit=60;
						$scope.getData43 = function(pageno){ // This would fetch the data on page change.
							//In practice this should be in a factory.
							$scope.page=pageno;
							$scope.users = [];
//							alert('livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.itemsPerPage);
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//								alert(response.total_count);
								$scope.users = response.data;  //ajax request to fetch data into vm.data
								$scope.total_count = response.total_count;
								$('#overlay').remove();
							}).error(function(data, status, headers, config) {
								 $('#overlay').remove();
									console.log('error: data = ', data);
								
								});
							
						};
						$scope.getData43($scope.pageno); 
						
						
						$("#livevehiclesumspeedlimit").change(function () {
							$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
							$scope.users = [];
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//								alert(response.total_count);
								$scope.users = response.data; 
								//alert(response.data);//ajax request to fetch data into vm.data
								$scope.alldata = response.data; 
								$scope.total_count = response.total_count;
							});
						
						});
						
						
						
						
						
						
						
					});
			
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
			

$("#particularvehicledate2,#particularvehicledate1").change(function () {
	 var max = $(this).datepicker('getDate'); // Get selected date
     $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M');
	 var start = $("#particularvehicledate1").datepicker("getDate");
     var end = $("#particularvehicledate2").datepicker("getDate");
     var days = (end - start) / (1000 * 60 * 60 * 24);
     if (days > 7) {
	   document.getElementById("reportmsg").hidden=false;
		jAlert('You can see Report within seven days', 'Confirmation Results');
       document.getElementById("datewisevehicleno").disabled=true;
       document.getElementById("viewbutton").disabled=true;
    }
   else
	   {
	   document.getElementById("datewisevehicleno").disabled=false;
       document.getElementById("viewbutton").disabled=false;
	   
	   }
});


				
				
				
					$scope.sort = function(keyname){
						$scope.sortKey = keyname;   //set the sortKey to the param passed
						$scope.reverse = !$scope.reverse; //if true make it false and vice versa
					}
						$scope.query = {};
				   		$scope.queryBy = '$';
				   		$scope.pagesno = [20,50,80,100,120,240,360];
						$scope.pagesint=20;
						$scope.onpagechange = function(page){
							$scope.pagesint=page;
						}
						
						$scope.DaywiseVehicleno='';
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.DaywiseVehicleno)
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
						
						
						
						
//						
//		$("#daywiseallexcel").click(function(){
//							
//							try
//							{
//							$('#daywisereport').tableExport({
//								type:'excel',escape:'false',separator: ',',
//								tableName:'History Log',
//								
//								pdfFontSize:10,
//								
//								htmlContent:'false',
//								consoleLog:'false',
//								
//								}
//							
//							);
//
//							}catch(e){}
//						});
						
			
		try{
			$("#particulardayexcel").click(function() {
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		          var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Vehicle No</font></td>"+
		"<td><font>Date</font></td>"+
		"<td><font>Distance Travel-KM</font></td>"+
	"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.reportvehicledetails.length;i++){
    		data  = $scope.reportvehicledetails[i];
    		table_html = table_html + "<tr>"+
    		"<td><font>"+data.vehicleno+"</font></td>"+
			"<td><font>"+data.todate+"</font></td>"+
			"<td><font>"+data.distance+"</font></td>"+
			"</tr>";
							}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Distance_Travelled_Report_DayWise' + postfix +'Vehicle No:'+document.getElementById('daywisevehicleno').value+'.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){alert("sss"+e);}
		
		
		    $('#datewiseparticularpdf').click(function () {
//			    
			    try{
					//alert("hhhhhhhhhi");
					var columns = ["Vehicle Number","Date","Distance Travelled-km/hr"];
					var i=0;
			        
			      	var data1=[];
						
			    	for(i=0;i<$scope.reportvehicledetails[i].length;i++){
			    		
			        var data0  = $scope.reportvehicledetails[i];
			    		 data1.push([data0.vehicleno,data0.todate,data0.distance]);
			     	}
			    	 var doc = new jsPDF('landscape','pt');
			      
			    	 doc.autoTable(columns, data1);
			         doc.save("Date_Wise_Distanced_Travelled.pdf");
			        
			    
			        }
			    catch(e)
			    {
			    	alert(e.message);
			    }
			    
			      });
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    


		$("#datewiseallexcel").click(function(){
			
			try
			{
			$('#daterangeall').tableExport({
				type:'excel',escape:'false',separator: ',',
				tableName:'History Log',
				
				pdfFontSize:10,
				
				htmlContent:'false',
				consoleLog:'false',
				
				}
			
			);

			}catch(e){}
		});
						
				


//
//
//		$("#particulardayexcel").click(function(){
//			
//			try
//			{
//			$('#dateiwsevehi').tableExport({
//				type:'excel',escape:'false',separator: ',',
//				tableName:'History Log',
//				
//				pdfFontSize:10,
//				
//				htmlContent:'false',
//				consoleLog:'false',
//				
//				}
//			
//			);
//
//			}catch(e){}
//		});
						
						
//			
//
//
//
//		$("#raneparticularexcel").click(function(){
//			
//			try
//			{
//			$('#daterangewisevehi').tableExport({
//				type:'excel',escape:'false',separator: ',',
//				tableName:'History Log',
//				
//				pdfFontSize:10,
//				
//				htmlContent:'false',
//				consoleLog:'false',
//				
//				}
//			
//			);
//
//			}catch(e){}
//		});
		
		
		
		
		try{
			$("#raneparticularexcel").click(function() {
		        //getting values of current time for generating the file name
		        var dt = new Date();
		        var day = dt.getDate();
		        var month = dt.getMonth() + 1;
		        var year = dt.getFullYear();
		        var hour = dt.getHours();
		        var mins = dt.getMinutes();
		        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
		        //creating a temporary HTML link element (they support setting file names)
		        var a = document.createElement('a');
		        //getting data from our div that contains the HTML table
		        var data_type = 'data:application/vnd.ms-excel';//base64,' 
		          var i=0;
		        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Date</font></td>"+
		"<td><font>Vehicle No</font></td>"+
		"<td><font>Distance Travel-KM</font></td>"+
		"<td><font>Total Distance - KM</font></td>"+
	"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.rangewisevehicle.length;i++){
    		data  = $scope.rangewisevehicle[i];
    		table_html = table_html + "<tr>"+
    		"<td><font>"+data.todate+"</font></td>"+
			"<td><font>"+data.vehicleno+"</font></td>"+
			"<td><font>"+data.distance+"</font></td>"+
			"<td><font>"+data.total+"</font></td>"+
			"</tr>";
							}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Distance_Travelled_Report_DayRangeWise' + postfix +'Vehicle No:'+document.getElementById('datewisevehicleno').value+'.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){alert("sss"+e);}
		
		
		
		
		
		$scope.daywiseAllvehiclesListnew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
//		$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
		
		$scope.getData28 = function(pageno){ 
			$scope.daywiseAllvehiclesListnew = [];
		var start=0, end=0;
			if(pageno!=1){
				start = $scope.pagesint * (pageno-1);
				end = start + $scope.pagesint;
				start++;
			}else{
				start = 0;
				end = start + $scope.pagesint;
				start++;
			}
			
			for(var i=start;i<=end;i++){
				if(i<=$scope.daywiseAllvehiclesList.length){
					$scope.daywiseAllvehiclesListnew.push($scope.daywiseAllvehiclesList[i-1]);
				}else{
					break;
				}
			}
				
				$scope.total_count = $scope.daywiseAllvehiclesList.length;
			
		};
		
//		$("#daywisevehicleno").keypress(function () 
//		{
//			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.DaywiseVehicleno)
//			.success(function(data, status, headers, config) {
//				$scope.daywiseAllvehiclesListnew = data;
//				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyvehicleno='+$scope.DaywiseVehicleno)
//				.success(function(data, status, headers, config) {
//					$scope.daywiseAllvehiclesListnew = data;
//				
//				}).error(function(data, status, headers, config) {
//					console.log('error: data = ', data);
//				});
//			}).error(function(data, status, headers, config) {
//				console.log('error: data = ', data);
//			});
//			
//		});
		
		
		
		
		
						$scope.getReport=function getReport()
						{
							
							var myform = document.daywisallform;
						      if (myform.allvehiclesDay.value== "")
						      {
						    	  myform.allvehiclesDay.focus();
						      }	
						      else {
							
							
						 var over = '<div id="overlay">' +
////					     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
				     '</div>';
					    $(over).appendTo('body');
							try
							{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesDay').value+'&tdate=&loginid1='+sptstr[2])
							.success(function(data, status, headers, config) {
								
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
								.success(function(data, status, headers, config) {
									$scope.daywiseAllvehiclesList = data;
									$scope.getData28($scope.pageno); 
									
									document.getElementById('daywisereport').hidden=false;
									document.getElementById('dayallchart').hidden=false;
									document.getElementById('searchtable1').hidden=false;

									
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
												// alert(e);
												 
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
						
						
						

						
						$scope.daterangewiseAllvehiclesListnew = [];
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						
						$scope.getData29 = function(pageno){ 
							$scope.daterangewiseAllvehiclesListnew = [];
						var start=0, end=0;
							if(pageno!=1){
								start = $scope.pagesint * (pageno-1);
								end = start + $scope.pagesint;
								start++;
							}else{
								start = 0;
								end = start + $scope.pagesint;
								start++;
							}
							
							for(var i=start;i<=end;i++){
								if(i<=$scope.daterangewiseAllvehiclesList.length){
									$scope.daterangewiseAllvehiclesListnew.push($scope.daterangewiseAllvehiclesList[i-1]);
								}else{
									break;
								}
							}
								
								$scope.total_count = $scope.daterangewiseAllvehiclesList.length;
							
						};
						
						
						
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
////					     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
				     '</div>';
					    $(over).appendTo('body');
					    try{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesdate1').value+'&tdate='+document.getElementById('allvehiclesdate2').value+'&loginid1='+sptstr[2])
							.success(function(data, status, headers, config) {
								
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
								.success(function(data, status, headers, config) {
									$scope.daterangewiseAllvehiclesList = data;
									$scope.getData29($scope.pageno); 
								
									document.getElementById('daterangeall').hidden=false;
									document.getElementById('datrangeallchart').hidden=false;
									document.getElementById('searchtable2').hidden=false;

									
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
												// alert(e);
												 
											 }
										  }
										   google.load("visualization", "1", {
										        packages: ["corechart"],
										        callback: drawVisualization
										    });
									}
									catch(e)
									{
									 // alert(e);	
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
						
										
						
						
						
//						vehcilewis
						
						
						$scope.reportvehicledetailsnew = [];
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						
						$scope.getData30 = function(pageno){ 
							$scope.reportvehicledetailsnew = [];
						var start=0, end=0;
							if(pageno!=1){
								start = $scope.pagesint * (pageno-1);
								end = start + $scope.pagesint;
								start++;
							}else{
								start = 0;
								end = start + $scope.pagesint;
								start++;
							}
							
							for(var i=start;i<=end;i++){
								if(i<=$scope.reportvehicledetails.length){
									$scope.reportvehicledetailsnew.push($scope.reportvehicledetails[i-1]);
								}else{
									break;
								}
							}
								
								$scope.total_count = $scope.reportvehicledetails.length;
							
						};
						
						
						
						$scope.getDaywiseParticularvehiclereport=function()
						{
							try{
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
//			     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
				     '</div>';
				    $(over).appendTo('body');
								try
								{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno='+document.getElementById('daywisevehicleno').value+'&fdate='+document.getElementById('particularvehicleday').value+'&tdate=&loginid1='+sptstr[2])
							.success(function(data, status, headers, config) {
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
								.success(function(data, status, headers, config) {
									$scope.reportvehicledetails = data;
									$scope.getData30($scope.pageno); 
									document.getElementById('dateiwsevehi').hidden=false;
									document.getElementById('dayparticulart').hidden=false;
									document.getElementById('searchtable3').hidden=false;
									
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
									  	//alert(e);
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
								catch(e){
									//alert(e);
								}
							
						}
							}catch(e){
								//alert(e);
							}
					}
						
						$scope.rangewisevehiclenew = [];
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
						
						$scope.getData31 = function(pageno){ 
							$scope.rangewisevehiclenew = [];
						var start=0, end=0;
							if(pageno!=1){
								start = $scope.pagesint * (pageno-1);
								end = start + $scope.pagesint;
								start++;
							}else{
								start = 0;
								end = start + $scope.pagesint;
								start++;
							}
							
							for(var i=start;i<=end;i++){
								if(i<=$scope.rangewisevehicle.length){
									$scope.rangewisevehiclenew.push($scope.rangewisevehicle[i-1]);
								}else{
									break;
								}
							}
								
								$scope.total_count = $scope.rangewisevehicle.length;
							
						};
						
						
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
//						     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
							     '</div>';
							    $(over).appendTo('body');
							    
							    
							    $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreportDetails?vehicleno='+document.getElementById('datewisevehicleno').value+'&fdate='+document.getElementById('particularvehicledate1').value+'&tdate='+document.getElementById('particularvehicledate2').value+'&loginid1='+sptstr[2])
								.success(function(data, status, headers, config) {
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dailyreport')
									.success(function(data, status, headers, config) {
										$scope.rangewisevehicle = data;
										$scope.getData31($scope.pageno); 
										document.getElementById('daterangewisevehi').hidden=false;
										document.getElementById('daterangeparticulart').hidden=false;
										document.getElementById('searxhtable4').hidden=false;
										
										
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
						   		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
									$scope.userclist = data;
//								 	data[0].companyname = 'All';
//								 	$scope.userclist.push(data[0]);
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
								

						   		$scope.pagesno = [20,50,80,100,120,240,360,450,'All'];
								$scope.pagesint=20;
								$scope.onpagechange = function(page){
									$scope.pagesint=page;
									
									if($scope.pagesint=='All')
										{
										$scope.pagesint=$scope.total_count;
									
										}
								}
								
								
								

								
								
								 try{
									 $("#Summaryexcel").click(function() {
//									 alert('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
//												sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+
//												$scope.total_count+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch);
									 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
												sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+
												$scope.total_count+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch).success(function(response){ 
//											alert(response.data);
											$scope.users12 = response.data; 
											var data;
								    	//getting values of current time for generating the file name
								    	var dt = new Date();
								    	var day = dt.getDate();
								    	var month = dt.getMonth() + 1;
								    	var year = dt.getFullYear();
								    	var hour = dt.getHours();
								    	var mins = dt.getMinutes();
								    	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
								    	//creating a temporary HTML link element (they support setting file names)
								    	var a = document.createElement('a');
								    	//getting data from our div that contains the HTML table
								    	var data_type = 'data:application/vnd.ms-excel';//base64,' 
								    	var table_div = document.getElementById('deviceDiv');
								    	//alert("table_div"+table_div);
								    	var i=0;
								    	var table_html = "";
								    	table_html = table_html +"<html><body><table><tr>"+
								    	"<td><font>Sr. No</font></td>"+
								    	"<td><font>Vehicle No</font></td>"+
								    	"<td><font>Company</font></td>"+
								    	"<td><font>Location</font></td>"+
								    	"<td><font>Polling Time</font></td>"+
								    	"<td><font>Speed</font></td>"+
								    	"<td><font>Status</font></td>"+
								    	
								    	"<td><font>Ignition</font></td>"+
								    	"<td><font>Direction</font></td>"+
								    	"<td><font>GPS Valid</font></td>"+
								    	
								    	"</tr>";
								    	//alert(htmlString);
								    	try{
								    		//alert($scope.device.length);
								    	for(i=0;i<$scope.users12.length;i++){
								    		
								    	data  = $scope.users12[i];
								    	table_html = table_html + "<tr>"+
								    	"<td><font>"+data.rowno+"</font></td>"+
								    	"<td><font>"+data.vehicleid+"</font></td>"+
								    	"<td><font>"+data.cid+"</font></td>"+
								    	"<td><font>"+data.location+"</font></td>"+
								    	"<td><font>"+data.datatimestamp+"</font></td>"+
								    	"<td><font>"+data.vehiclespeed+"</font></td>"+
								    	"<td><font>"+data.vehiclestatus+"</font></td>"+
								    	
								    	"<td><font>"+data.ignumber+"</font></td>"+
								    	"<td><font>"+data.directionname+"</font></td>"+
								    	"<td><font>"+data.gpsstatus+"</font></td>"+
								    	
								    	"</tr>";
								    			}
								    	}catch(e){alert(e);}
								    	table_html = table_html + "</table></body></html>";
								    	a.href = data_type + ', ' + table_html;
								    	//setting the file name
								    	a.download = 'Live_Details' + postfix + '.xls';
								    	a.click();
								    	//just in case, prevent default behaviour
								    	e.preventDefault(); 
								    	}).error(function(response){ 
//								    		alert("error"+response);
								    	});
									 });
									 
								}catch(e){alert(e);}
								
								$(document).ready(function(){
									//alert("in");
									  $('#popdanger1').popover({ 
									    html : true,
									    content: function() {
									      return $('#popover_content_wrapper1').html();
									    }
									  }).click(function(){
										  $(this).popover('show');
									  })
									});
								
								
								
								try
								{
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2])
									.success(function(data, status, headers, config) {
										//alert("data"+data);
										$scope.nonPollingDetails=data;
									}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});	
								}
								catch(e)
								{
									//alert("errr nonoll"+e);
									
								}
								
								
								
								
								
								
//								
//								$("#exportpdf").click(function(){
//									
//									try
//									{
//									$('#livesumm').tableExport({
//										type:'pdf',escape:'false',separator: ',',
//										tableName:'livesumary',
//										pdfFontSize:10,
//										htmlContent:'false',
//										consoleLog:'false',
//												}
//											);
//									}catch(e){}
//								});
								
								
								function printData()
								{
								   var divToPrint=document.getElementById("livesumm");
								   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=600,left=100,top=100";
									  var newWin = window.open('','',popup_win);
									   newWin.document.open();
								   var htmlToPrint = '' +
							        '<style type="text/css">' +
							        'table th, table td {' +
							        'border:1px solid #000;' +
							        'padding;0.5em;' +
							        '}' +
							        'tr:nth-child(even) {' +
							        'background:#bdbdbd; ' +
							         '}' +
							         'tr:nth-child(odd) {' +
								        'background:#d3d3d3; ' +
								         '}'+ 
							        '</style>';
							        htmlToPrint += divToPrint.outerHTML;
							        newWin = window.open("");
							        newWin.document.write(htmlToPrint);
							        newWin.print();
							        newWin.close();
								}
								$('#printbutton').on('click',function(){
								printData();
								})
								
								
							   mydate = new Date();

								$scope.compname=sptstr[3];
								
								
								$scope.name = sptstr[0];
								$scope.logout = function() {
									window.location.replace("/");
								}
								
					///first time dash
								try {
									
									
									$scope.keyc;
									$scope.getsorted = function(key){
										try{
											$scope.keyc = key;
											getData(key);
										}catch(e){
											//alert(e);
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
									
									
									$scope.searchvehicle = function(){
//							 			alert($scope.compsearch);
										if($scope.compsearch == 'All'){
											$scope.users = $scope.alldata;
										}else{
											$scope.getData($scope.pageno);
									   }
									}
									
									$scope.usersd = []; //declare an empty array
									$scope.pageno = 1; // initialize page no to 1
									$scope.total_count = 0;
//									$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
									$scope.limit=60;
									//interval = setInterval(function(){
									$scope.compsearch = 'All';
									$scope.getData = function(pageno){ // This would fetch the data on page change.
										//In practice this should be in a factory.
										//alert("in data");
										$scope.usersd = [];
										$scope.page=pageno;
										//alert('livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint);
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
												sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+
												$scope.pagesint+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch).success(function(response){ 
//											alert(response.total_count);
											$scope.users = response.data;  //ajax request to fetch data into vm.data
											$scope.total_count = response.total_count;
											$scope.alldata = response.data;;
											
							
														$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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
																			$scope.active = Number(data.totalVehicles) - Number(data.nworking);
																			$scope.inactive = data.nworking;
																	
																			
																			
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

														}).error(function(data, status, headers,
																				config) {
																			console.log(
																					'error: data = ',
																					data);
																		});
														
							}).error(function(data, status, headers, config) {

												//console.log('error: data = ', data);
											});
									}
									
								//},5000);
									$scope.getData($scope.pageno); 
								}
								catch (e) {
						}
					
								
								$("#livevehiclesumspeedlimit").change(function () {
									$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
									$scope.users = [];
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//										alert(response.total_count);
										$scope.users = response.data; 
										//ajax request to fetch data into vm.data
										$scope.alldata = response.data; 
										$scope.total_count = response.total_count;
									});
									$scope.getData($scope.page); 
								});
								
								
								
								
								$("#livesearchbyDeviceid").keypress(function(){
									try
									{
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
										.success(function(response){ 
											$scope.users = response.data; 
											//ajax request to fetch data into vm.data
											$scope.alldata = response.data; 
											$scope.total_count = response.total_count;
											$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
											.success(function(response){ 
												$scope.users = response.data; 
												//ajax request to fetch data into vm.data
												$scope.alldata = response.data; 
												$scope.total_count = response.total_count;
											});
										});
									}catch(e){}
								});
//								
//								
//								
//								
								//alert("k")
								
								
								

								//time nterval
								try {
									interval = setInterval(function(){ 
										$scope.getData($scope.page);
//									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//											.success(
//													function(data, status, headers, config) {
//														$scope.alldata = data;
//														getData($scope.keyc);
					
															
														$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
																.success(
																		function(data, status, headers,
																				config) {
//						 													alert(data);
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
																			$scope.active = Number(data.totalVehicles) - Number(data.nworking);
																			$scope.inactive = data.nworking;
																			
																		
																			
																			
																			
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
					//
					//
						$(function () {
						function drawChart() {
					
						  var data = google.visualization.arrayToDataTable([
						    ['task', '', { role: 'style' }],
						    ['Working Devices', $scope.working_devices,'Green'],
						    ['Non Working Devices', $scope.not_working_devices,'Red']
						 ]);
					
						  var options = {
						    title: "",
						    bar: {groupWidth: '45%'},
						    isStacked: true,
						    legend: {position:'none'}
						  };
					//
						  var chart_div = document.getElementById('barchart');
						  var chart = new google.visualization.ColumnChart(chart_div);
					
						  
						  
						  chart.draw(data, options);
					
						}
					//
						google.load("visualization", "1", {
						    packages: ["corechart"],
						    callback: drawChart
						});
						});					}).error(function(data, status, headers,config) {
																			console.log(
																					'error: data = ',
																					data);
																		});
														
//							}).error(function(data, status, headers, config) {
//					//
//												console.log('error: data = ', data);
//											});
				}, 30000);
				}
								catch (e) {
						}
						
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

					

			


scotchApp.controller('customerdashcontroller', function($scope,$http, $compile, $filter) {
				
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
				
				$scope.graphhide = function graphhide()
				 {
					 document.getElementById('graphrow').hidden=true;
				}
				
				$scope.showgraph = function showgraph()
				{
					 document.getElementById('graphrow').hidden=false;
				}
				
				$("#Summaryexcel").click(function(){

					try
					{
					$('#livesumm').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'Summary',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
						
						}

					);

					}catch(e){alert(e);}
					});

				
				
				$("#exportpdf").click(function(){
					
					try
					{
					$('#livesumm').tableExport({
						type:'pdf',escape:'false',separator: ',',
						tableName:'livesumary',
						pdfFontSize:10,
						htmlContent:'false',
						consoleLog:'false',
								}
							);
					}catch(e){}
				});
				
				
			   mydate = new Date();

				$scope.compname=sptstr[3];
				$scope.query = {}
			   		$scope.queryBy = '$'
				$scope.sort = function(keyname) {
					$scope.sortKey = keyname; //set the sortKey to the param passed
					$scope.reverse = !$scope.reverse; //if true make it false and vice versa
				}
				
				$scope.pagesno = [20,50,80,100,120,240,360];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.name = sptstr[0];
				$scope.logout = function() {
					window.location.replace("/");
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
//					$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
					$scope.limit=60;
					//interval = setInterval(function(){
					$scope.getData = function(pageno){ // This would fetch the data on page change.
						//In practice this should be in a factory.
						$scope.usersd = [];
						$scope.page=pageno;
//						alert('livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint);
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//							alert(response.total_count);
							$scope.users = response.data;  //ajax request to fetch data into vm.data
							$scope.total_count = response.total_count;
							$scope.alldata = response.data;;
							
			
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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

								//console.log('error: data = ', data);
							});
					}
					
				//},5000);
					$scope.getData($scope.pageno); 
				}
				catch (e) {
		}
	
				
				$("#livevehiclesumspeedlimit").change(function () {
					$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
					$scope.users = [];
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//						alert(response.total_count);
						$scope.users = response.data; 
						//ajax request to fetch data into vm.data
						$scope.alldata = response.data; 
						$scope.total_count = response.total_count;
					});
					$scope.getData($scope.page); 
				});
				
				
				
				
//				$("#livesearchbyDeviceid").keypress(function(){
//					try
//					{
//						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
//						.success(function(response){ 
//							$scope.users = response.data; 
//							//ajax request to fetch data into vm.data
//							$scope.alldata = response.data; 
//							$scope.total_count = response.total_count;
//							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
//							.success(function(response){ 
//								$scope.users = response.data; 
//								//ajax request to fetch data into vm.data
//								$scope.alldata = response.data; 
//								$scope.total_count = response.total_count;
//							});
//						});
//					}catch(e){}
//				});
//				
//				
//				
//				
				
				
				
				

				//time nterval
//				try {
//					interval = setInterval(function(){ 
//					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//							.success(
//									function(data, status, headers, config) {
//										$scope.alldata = data;
//										getData($scope.keyc);
	//
//											
//										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//												.success(
//														function(data, status, headers,
//																config) {
////		 													alert(data);
//															$scope.ignitionoff = data.ignitionoff;
//															$scope.ignitionon = data.ignitionon;
//															$scope.validgps = data.validgps;
//															$scope.invalidgps = data.invalidgps;
//															$scope.totald = data.totalVehicles;
//															$scope.working_devices = data.working_devices;
//															$scope.not_working_devices = data.not_working_devices;
//															$scope.red = data.red;
//															$scope.green = data.green;
//															$scope.yellow = data.yellow;
//															$scope.temper = data.temper;
//															$scope.ac = data.ac;
//															$scope.overspeed = data.overspeed;
//															
//														
//															
//															
//															
//		$(function () {
//		    function drawChart() {
//		   
//		        var data = google.visualization.arrayToDataTable([
//		            ['task', 'percentage'],
//		            ['Halt Vehicles', $scope.yellow],
//		            ['Running Vehicles', $scope.green],
//		            ['Stopped Vehicles', $scope.red],
//		           
//		        ]);
	//
//		        var options = {
//		            title: '',
//		            colors: ["orange",
//					"Green", "red" ],
//					 is3D: true,
//		        };
	//
//		        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
//		        
//		        chart.draw(data, options);
//		    }
	//
//		    google.load("visualization", "1", {
//		        packages: ["corechart"],
//		        callback: drawChart
//		    });
//		});
	//
	//
//		$(function () {
//		function drawChart() {
	//
//		  var data = google.visualization.arrayToDataTable([
//		    ['task', '', { role: 'style' }],
//		    ['Working Devices', $scope.working_devices,'Green'],
//		    ['Non Working Devices', $scope.not_working_devices,'Red']
//		 ]);
	//
//		  var options = {
//		    title: "",
//		    bar: {groupWidth: '45%'},
//		    isStacked: true,
//		    legend: {position:'none'}
//		  };
	//
//		  var chart_div = document.getElementById('barchart');
//		  var chart = new google.visualization.ColumnChart(chart_div);
	//
//		  
//		  
//		  chart.draw(data, options);
	//
//		}
	//
//		google.load("visualization", "1", {
//		    packages: ["corechart"],
//		    callback: drawChart
//		});
//		});					}).error(function(data, status, headers,config) {
//															console.log(
//																	'error: data = ',
//																	data);
//														});
//										
//			}).error(function(data, status, headers, config) {
	//
//								console.log('error: data = ', data);
//							});
//					}, 5000);
//				}
//				catch (e) {
//		}
		
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






			/**
			 * 
			 */

			scotchApp.controller('companyController', function($scope,$http, $compile, $filter) {
				try {
					
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
					$scope.sort = function(keyname){
						$scope.sortKey = keyname;   //set the sortKey to the param passed
						$scope.reverse = !$scope.reverse; //if true make it false and vice versa
					}
						$scope.query = {};
				   		$scope.queryBy = '$';
				   		
				   		
				   		$scope.pagesno = [20,50,80,'All'];
						$scope.pagesint=20;
						$scope.onpagechange = function(page){
							$scope.pagesint=page;
							if($scope.pagesint=='All')
							{
							$scope.pagesint=$scope.company.length;
						
							}
				
						}
						
						
					
						function printData()
						{
						   var divToPrint=document.getElementById("printTable");
						   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
						  var newWin = window.open('','',popup_win);
						   newWin.document.open();
						   var htmlToPrint = '' +
					        '<style type="text/css">' +
					        'table th, table td {' +
					        'border:1px solid #000;' +
					        'padding;0.5em;' +
					        '}' +
					        'tr:nth-child(even) {' +
					        'background:#bdbdbd; ' +
					         '}' +
					         'tr:nth-child(odd) {' +
						        'background:#d3d3d3; ' +
						         '}'+ 
					        '</style>';
					        htmlToPrint += divToPrint.outerHTML;
					        newWin = window.open("");
					        newWin.document.write(htmlToPrint);
					        newWin.print();
					        newWin.close();
						}

						$('#printbutton').on('click',function(){
						printData();
						})
						
						
//					$("#exportpdf").click(function(){
//					try
//			 			{
//						
//						
//						
//						$('#printTable').tableExport({
//			 				type:'pdf',escape:'false',
//			 				tableName:'Company',
//			 				pdfFontSize:8,
//			 				orientation:'landscape',
//			 				formate:'a4',
//			 				htmlContent:'false',
//			 				consoleLog:'false',
//							}
//						);
//			 			}catch(e){}
//						
//				});
//						
						
//	$('#exportpdf').click(function () {
//    	var htmlString = '' +
//        '<style type="text/css">' +
//        'table th, table td {' +
//        'border:1px solid #000;' +
//        'padding;0.5em;' +
//        '}' +
//        'tr:nth-child(even) {' +
//        'background:#bdbdbd; ' +
//         '}' +
//         'tr:nth-child(odd) {' +
//	        'background:#d3d3d3; ' +
//	         '}'+ 
//        '</style>';
//    	htmlString = htmlString + "<html><body><table>";
//    	var doc = new jsPDF('landscape','pt');
//    	var i=0;
//    	
//    	htmlString = htmlString + "<tr>"+
//    	"<td><font>Row No</font></td>"+
//		"<td><font>Company Name</font></td>"+
//		"<td><font>Short Name</font></td>"+
//		"<td><font>Contact Person</font></td>"+
//		"<td><font>Company Address</font></td>"
//		"<td><font>Mobile No</font></td>"+
//		"<td><font>Email Id</font></td>"+
//		"<td><font>Reg. Address</font></td>"+
//		"</tr>";
//		//alert(htmlString);
//		try{
//    	for(i=0;i<$scope.company.length;i++){
//    		data  = $scope.company[i];
//    		htmlString = htmlString + "<tr>"+
//    		"<td><font>"+data.rowno+"</font></td>"+
//			"<td><font>"+data.companyname+"</font></td>"+
//			"<td><font>"+data.shortname+"</font></td>"+
//			"<td><font>"+data.contactpersonname+"</font></td>"+
//			"<td><font>"+data.companyaddress+"</font></td>"
//			"<td><font>"+data.lanldlinenumber1+"</font></td>"+
//			"<td><font>"+data.emailid+"</font></td>"+
//			"<td><font>"+data.registeredaddress+"</font></td>"+
//			
//    		"</tr>";
//    	}
//		}catch(e){
//			//alert(e);
//		}
//    	//alert(htmlString);
//    	htmlString = htmlString + "</table></body></html>";
//    	//alert(htmlString);
//    	doc.fromHTML(htmlString,100,100,{});
//        doc.output("dataurlnewwindow");
//    });		
				
						
				$('#exportpdf').click(function () {
			     try{
						
						var columns = ["Row NO", "Company Name","Company address","Mobile No","Email-id"];
						var i=0;
				        
				      	var data1=[];
							//alert($scope.company.length);

				    	for(i=0;i<$scope.company.length;i++){
				    		
				        var data  = $scope.company[i];
				    		 data1.push([data.rowno,data.companyname,data.companyaddress,data.lanldlinenumber1,data.emailid]);
				     	}
				    //	alert(data1);
				    	 var doc = new jsPDF('landscape','pt');
				         doc.autoTable(columns, data1);
				         doc.save("Companytable.pdf");
				    
				        }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
						
						
						
			try{
				
				    $("#exportexcel").click(function() {
				    	
				        //getting values of current time for generating the file name
				        var dt = new Date();
				        var day = dt.getDate();
				        var month = dt.getMonth() + 1;
				        var year = dt.getFullYear();
				        var hour = dt.getHours();
				        var mins = dt.getMinutes();
				        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
				        //creating a temporary HTML link element (they support setting file names)
				        var a = document.createElement('a');
				        //getting data from our div that contains the HTML table
				        var data_type = 'data:application/vnd.ms-excel';//base64,' 
				        var table_div = document.getElementById('uprintlTable');
				        //alert("table_div"+table_div);
				        var i=0;
				        var table_html = "";
				         table_html = table_html +" <html><body><table><tr>"+
				     	"<td><font>Row No</font></td>"+
						"<td><font>Company Name</font></td>"+
						"<td><font>Short Name</font></td>"+
						"<td><font>Contact Person</font></td>"+
						"<td><font>Company Address</font></td>"
						"<td><font>Mobile No</font></td>"+
						"<td><font>Email Id</font></td>"+
						"<td><font>Reg. Address</font></td>"+
						"</tr>";
						//alert(htmlString);
						try{
				    	for(i=0;i<$scope.company.length;i++){
				    		data1  = $scope.company[i];
				    		table_html = table_html + "<tr>"+
				    		"<td><font>"+data1.rowno+"</font></td>"+
							"<td><font>"+data1.companyname+"</font></td>"+
							"<td><font>"+data1.shortname+"</font></td>"+
							"<td><font>"+data1.contactpersonname+"</font></td>"+
							"<td><font>"+data1.companyaddress+"</font></td>"
							"<td><font>"+data1.lanldlinenumber1+"</font></td>"+
							"<td><font>"+data1.emailid+"</font></td>"+
							"<td><font>"+data1.registeredaddress+"</font></td>"+
							
				    		"</tr>";
				    	}
						}catch(e){
							//alert(e);
						}
						table_html = table_html + "</table></body></html>";
						//table_html = table_div.outerHTML.replace(/ /g, '%20');
				        a.href = data_type + ', ' + table_html;
				        //setting the file name
				        a.download = 'Company_table' + postfix + '.xls';
				        //triggering the function
				        a.click();
				        //just in case, prevent default behaviour
				       e.preventDefault(); 
				    });
				
				}catch(e){alert("sss"+e);}
////				
				
						try{
						$scope.companynew = [];
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//			 			Page.setTitle("Welcome");
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
									$scope.company = data;
									$scope.getData13($scope.pageno); 
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
						
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						
						$scope.getData13 = function(pageno){ 
							$scope.companynew = [];
						var start=0, end=0;
							if(pageno!=1){
								start = $scope.pagesint * (pageno-1);
								end = start + $scope.pagesint;
								start++;
							}else{
								start = 0;
								end = start + $scope.pagesint;
								start++;
							}
							
							for(var i=start;i<=end;i++){
								if(i<=$scope.company.length){
									$scope.companynew.push($scope.company[i-1]);
								}else{
									break;
								}
							}
								
								$scope.total_count = $scope.company.length;
							
						};
						}catch(e){
							//alert(e);
						}
						
						
						
						
						

						$scope.deletecom = function(comp){
							jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
								if(r){
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydelete?id='+comp.companyid)
							.success(function(data, status, headers, config) {
//				 				$scope.company = data;
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
									.success(function(data, status, headers, config) {
										$scope.company = data;
										$scope.getData13($scope.pageno); 
								jAlert('Record Deleted Successfully', 'Confirmation Results');
									}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									});
								}).error(function(data, status, headers, config) {
								
								jAlert('Records Not Deleted','Information');
								console.log('error: data = ', data);
							});
								}
							});
						}
						
						
						
						
						
						
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
						    
						    	 myForm.cname1.focus();
						      }
//						      else if (myForm.person1.value== "")
//						      { myForm.person1.focus();
//						      }
						      else if (myForm.mobile1.value== "")
						      {
						    	
						    	 myForm.mobile1.focus();
						    	
						      }
						      
						      else if (myForm.cadd1.value== "")
						      {
						    	
						    	 myForm.cadd1.focus();
						    	
						      }
//						     else if (myForm.radd1.value== "")
//						      {
//						    	
//						    	 myForm.radd1.focus();
//						    	
//						      }
						     else if (myForm.email1.value== "")
						      {
						    	 myForm.email1.focus();
						     }
						   else
						   {
							     
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companyinsert?companyname='
													+ document.getElementById('cname1').value
//													+ '&shortname='
//													+ document.getElementById('sname1').value
													+ '&caddress='
													+ document.getElementById('cadd1').value
//													+ '&personname='
//													+ document.getElementById('person1').value
													+ '&landlin1='
													+ document.getElementById('mobile1').value
													+ '&landlin2='
													+ document.getElementById('landline1').value
													+ '&faxnumber='
													+ document.getElementById('fax1').value
//													+ '&regisraddress='
//													+ document.getElementById('radd1').value
													+ '&emailid='
													+ document.getElementById('email1').value
													+ '&remark='
													+ document.getElementById('rem1').value
													+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&city='+document.getElementById('insertcompcity').value+'&state='+document.getElementById('insertcompstate').value+'&zip='+document.getElementById('insertcompzip').value).success(
											function(data, status, headers, config) {
//			 									
											jAlert('Record Inserted Successfully', 'Success Dialog'); 
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
														.success(function(data, status,
																		headers, config) {
																	$scope.company = data;
																	$scope.getData13($scope.pageno); 
																})
														.error(
																function(data, status,
																		headers, config) {
																	console.log('error: data = ',data);

																});
											}).error(
											function(data, status, headers, config) {
											
												var i=0;
												for(i=0;i<$scope.company.length;i++)
													{
													if($scope.company[i].companyname==document.getElementById('cname1').value)
														{
														jAlert('Problem in Saving Records! Company Name Already Exists','Information');
														}
//													else if($scope.company[i].shortname==document.getElementById('sname1').value)
//													{
//														jAlert('Problem in Saving Records! Short Name Already Exists','Information');
//													}
													else if($scope.company[i].lanldlinenumber1==document.getElementById('mobile1').value)
													{
													jAlert('Problem in Saving Records! Mobile no Already Exists','Information');
													}
													else if($scope.company[i].emailid==document.getElementById('email1').value)
													{
													jAlert('Problem in Saving Records! Email Id  Already Exists','Information');
													}
													}
											
												console.log('error: data = ', data);
											});
							   }
						}
					$scope.companyedit = function companyedit() {
								try
								{
							
								$scope.companydetails=$scope.company;
								var i=0;
								
								}catch(e){}
								var myForm1 = document.form2;
							      if (myForm1.compname.value== "")
							      {
							    	
							    	 myForm1.compname.focus();
							      }
//							      else if (myForm1.personname.value== "")
//							      {
//							    
//							    	 myForm1.personname.focus();
//							      }
							      else if (myForm1.mobileno.value== "")
							      {
							    
							    	 myForm1.mobileno.focus();
							    	
							      }
							      
							      else if (myForm1.caddress.value== "")
							      {
							    	
							    	 myForm1.caddress.focus();
							    	
							      }
							    
//							     else if (myForm1.raddress.value== "")
//							      {
//							    	
//							    	 myForm1.raddress.focus();
//							    	
//							      }
							     else if (myForm1.emailID.value== "")
							      {
							    	
							    	 myForm1.emailID.focus();
							    	
							      }
							   else
							   {
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companyedit?companyid='+$scope.editcompanyy.companyid+'&companyname='+ document.getElementById('compname').value
								+ '&shortname='+ document.getElementById('shortname').value+ '&caddress='+ document.getElementById('caddress').value+ '&personname='+ document.getElementById('personname').value+ '&landlin1='+ document.getElementById('mobileno').value+ '&faxnumber='+ document.getElementById('faxno').value+ '&regisraddress='+ document.getElementById('raddress').value+ '&emailid='+ document.getElementById('emailID').value+ '&remark='+ document.getElementById('remark').value
								+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&state='+document.getElementById('editcompstate').value+'&city='+document.getElementById('editcompCity').value+'&zip='+document.getElementById('editcompzip').value)
								.success(function(data, status, headers, config) {
													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
															.success(function(data, status,	headers, config) {
																	$scope.company = data;
																	$scope.getData13($scope.pageno); 
																		document.getElementById("maincom").hidden = false;
																		document.getElementById("showedit").hidden = true;
																		//alert("in afetr");
																	})
															.error(function(data, status,headers, config) {
																		console.log('error: data = ',data);
																	});
//			 										
													jAlert('Record Updated Successfully', 'Success Dialog'); 
													document.getElementById('form2').reset(); 
												})
												.error(function(data, status, headers, config) {
													
													console.log('error: data = ', data);
												});
							}

				}
					} catch (e) {
						
					}
				});
			
			/**
			 * 
			 */
			scotchApp.controller('bangalorectrl', function($scope,$http, $compile, $filter)
				{
				
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
				$scope.getRec=function ()
				{
					document.getElementById('userTable1').hidden=true;
					document.getElementById('userTable').hidden=true;
				try{
					var bangimei1 = document.bangimei;
				      if (bangimei1.imeibang.value== "")
				      {
				    	
				    	  bangimei1.imeibang.focus();
				      }
				      else
				    	  {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/bangimeidetails?imei='+document.getElementById('imeibang').value)
					.success(function(data, status, headers, config) {
					    if(data.length==0){
					    	jAlert('No Data Found','Information');
							document.getElementById('userTable1').hidden=true;
							document.getElementById('userTable').hidden=true;
					    }else{
						$scope.bangaloredetails = data;
						document.getElementById('userTable1').hidden=false;
						document.getElementById('userTable').hidden=false;
					    }
				}).error(function(data, status, headers, config) {
					jAlert('No Data Found','Information');
					document.getElementById('userTable1').hidden=true;
					document.getElementById('userTable').hidden=true;
						console.log('error: data = ', data);
					});
				    }
				}catch(e){alert(e);}
				
				}
				});
			
			
			
			
			scotchApp.controller('roleController', function($scope,$http, $compile, $filter) {
				try {
					
					
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
						
						function printData()
						{
						   var divToPrint=document.getElementById("printTablerole");
						   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
							  var newWin = window.open('','',popup_win);
							   newWin.document.open();
						  
						   
						   var htmlToPrint = '' +
					        '<style type="text/css">' +
					        'table th, table td {' +
					        'border:1px solid #000;' +
					        'padding;0.5em;' +
					        '}' +
					        'tr:nth-child(even) {' +
					        'background:#bdbdbd; ' +
					         '}' +
					         'tr:nth-child(odd) {' +
						        'background:#d3d3d3; ' +
						         '}'+ 
					        '</style>';
					        htmlToPrint += divToPrint.outerHTML;
					        newWin = window.open("");
					        newWin.document.write(htmlToPrint);
					        newWin.print();
					        newWin.close();
						}

						$('#printbutton').on('click',function(){
						printData();
						})

//						
//$('#exportpdf').click(function () {
//    	var htmlString = '' +
//        '<style type="text/css">' +
//        'table th, table td {' +
//        'border:1px solid #000;' +
//        'padding;0.5em;' +
//        '}' +
//        'tr:nth-child(even) {' +
//        'background:#bdbdbd; ' +
//         '}' +
//         'tr:nth-child(odd) {' +
//	        'background:#d3d3d3; ' +
//	         '}'+ 
//        '</style>';
//    	htmlString = htmlString + "<html><body><table>";
//    	var doc = new jsPDF('landscape','pt');
//    	var i=0;
//    	
//    	htmlString = htmlString + "<tr>"+
//    	"<td><font>Row No</font></td>"+
//		"<td><font>Role Name</font></td>"+
//		"<td><font>Remark</font></td>"+
//		"</tr>";
//		//alert(htmlString);
//		try{
//    	for(i=0;i<$scope.roledet.length;i++){
//    		data  = $scope.roledet[i];
//    		htmlString = htmlString + "<tr>"+
//			"<td><font>"+data.rowno+"</font></td>"+
//			"<td><font>"+data.rolename+"</font></td>"+
//			"<td><font>"+data.remarks+"</font></td>"+
//			 "</tr>";
//    	}
//		}catch(e){
//			//alert(e);
//		}
//    	//alert(htmlString);
//    	htmlString = htmlString + "</table></body></html>";
//    	//alert(htmlString);
//    	doc.fromHTML(htmlString,100,100,{});
//        doc.output("dataurlnewwindow");
//    });	
//				
			
						
						 $('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Role Name", "Remark"];
						var i=0;
				        
				      	var data1=[];
					//		alert($scope.roledet.length);

				    	for(i=0;i<$scope.roledet.length;i++){
				    		
				        var data  = $scope.roledet[i];
				    		 data1.push([data.rowno,data.rolename ,data.remarks]);
				    		

				    	}
				    //	alert(data1);
				    	 var doc = new jsPDF('landscape','pt');
				        debugger;
				    	 doc.autoTable(columns, data1);
				         doc.save("Roletable.pdf");
				        
				    
//							alert(e);
					
				        }
				    catch(e)
				    {
				    	alert(e.message);
				    }
				    
				      });
					  
						
						
						
						
					try{
						
					    $("#exportexcel").click(function() {
					    	
					        //getting values of current time for generating the file name
					        var dt = new Date();
					        var day = dt.getDate();
					        var month = dt.getMonth() + 1;
					        var year = dt.getFullYear();
					        var hour = dt.getHours();
					        var mins = dt.getMinutes();
					        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
					        //creating a temporary HTML link element (they support setting file names)
					        var a = document.createElement('a');
					        //getting data from our div that contains the HTML table
					        var data_type = 'data:application/vnd.ms-excel';//base64,' 
					        var table_div = document.getElementById('roleDiv');
					        //alert("table_div"+table_div);
					        var i=0;
					        var table_html = "";
					         table_html = table_html +" <html><body><table><tr>"+
    	"<td><font>Row No</font></td>"+
		"<td><font>Role Name</font></td>"+
		"<td><font>Remark</font></td>"+
		"</tr>";
		//alert(htmlString);
		try{
    	for(i=0;i<$scope.roledet.length;i++){
    		data1  = $scope.roledet[i];
    		table_html = table_html + "<tr>"+
			"<td><font>"+data1.rowno+"</font></td>"+
			"<td><font>"+data1.rolename+"</font></td>"+
			"<td><font>"+data1.remarks+"</font></td>"+
			 "</tr>";
					}
		}catch(e){
								//alert(e);
							}
							table_html = table_html + "</table></body></html>";
							//table_html = table_div.outerHTML.replace(/ /g, '%20');
					        a.href = data_type + ', ' + table_html;
					        //setting the file name
					        a.download = 'Role_table' + postfix + '.xls';
					        //triggering the function
					        a.click();
					        //just in case, prevent default behaviour
					       e.preventDefault(); 
					    });
					
					}catch(e){alert("sss"+e);}
							
					
					
				$scope.Rolenamesearch='';
							
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyrolename='+$scope.Rolenamesearch)
								.success(function(data, status, headers, config) {
									$scope.roledet = data;
									$scope.getData14($scope.pageno); 
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
						$scope.roledetnew = []
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						$scope.getData14 = function(pageno){ 
							$scope.roledetnew = [];
						var start=0, end=0;
							if(pageno!=1){
								start = $scope.pagesint * (pageno-1);
								end = start + $scope.pagesint;
								start++;
							}else{
								start = 0;
								end = start + $scope.pagesint;
								start++;
							}
							for(var i=start;i<=end;i++){
								if(i<=$scope.roledet.length){
									if($scope.Rolenamesearch!='')
										{
										if($scope.roledet[i].includes($scope.Rolenamesearch))
											{
									$scope.roledetnew.push($scope.roledet[i-1]);
											}
										}
									else
										{
										$scope.roledetnew.push($scope.roledet[i-1]);
										}
								}else{
									break;
								}
							}
								$scope.total_count = $scope.roledet.length;
							
						};
				
								
						
						$("#searchbyRolename").keypress(function(){
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyrolename='+$scope.Rolenamesearch)
							.success(function(data, status, headers, config) {
								$scope.roledetnew = data;
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbyrolename='+$scope.Rolenamesearch)
								.success(function(data, status, headers, config) {
									$scope.roledetnew = data;
								
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						});
//						
						
						$scope.deleterole = function(deleteroleid){
							jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
								if(r){ 
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledelete?id='+deleteroleid.roleid)
							.success(function(data, status, headers, config) {
//				 				$scope.company = data;
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
									$scope.roledet = data;
									$scope.getData14($scope.pageno);
							jAlert('Record Deleted Successfully', 'Confirmation Results');
									}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									});
							}).error(function(data, status, headers, config) {
								
								console.log('error: data = ', data);
							});
								}
							});
						}
						$scope.showrolediv1 = function() {
							document.getElementById("roleedit").hidden = false;
							document.getElementById("rolemain").hidden = true;
						}
						$scope.back = function() {
							document.getElementById("rolemain").hidden = false;
							document.getElementById("roleedit").hidden = true;
						}

							
						$scope.roleData = function roleData(editname) {
							$scope.roleeditdet = editname;
							
						}
						try
						{
					$scope.roleinsertform = function roleinsertform() {
							var myForm = document.roleinsert;
						      if (myForm.rolenameinsert.value== "")
						      {
						        	 myForm.rolenameinsert.focus();
						      }
						     
						   else
						   {
							   var i=0;chk=0;
							   for(i=0;i<$scope.roledet.length;i++)
							   {
								   if($scope.roledet[i].rolename==document.getElementById('rolenameinsert').value)
									{
									chk++;
									}
							   }
							   if(chk>0)
								{
								jAlert('Problem in Saving Records!Role Name Already Exists','Information');
								
								}
							else
								{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roleinsert?'+
									'rolename='+document.getElementById("rolenameinsert").value+
									'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+
									'&remarks='+document.getElementById("roleremarkinsert").value).success(
											function(data, status, headers, config) {
									jAlert('Record Inserted Successfully', 'Success Dialog'); 
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
														.success(function(data, status, headers, config) {
																	$scope.roledet = data;
																	$scope.getData14($scope.pageno);
																})
														.error(function(data, status, headers, config) {
																	console.log('error: data = ',data);
																});
											}).error(
											function(data, status, headers, config) {
												jAlert('Unable to  Proceed Your Request','Information');
												$scope.error=data;
												console.log('error: data = ', data);
												var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=RoleFormInsert',data);
												response.success(function(data, status, headers, config) {
												});
												response.error(function(data, status, headers, config) {
													//alert( "Exception details: " + JSON.stringify({data: data}));
												}); 
												
											});
							   }
						   }
						}
				}	
						catch(e){//alert("in err"+e);
						}
						
						try
						{
					$scope.roleupdate = function roleupdate() {
								
						var i=0;
													
								var myForm = document.roleeditform;
							      if (myForm.editrolename.value== "")
							      {
							    	
							    	 myForm.editrolename.focus();
							      }
							   else
							   {
								    
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roleedit?'+
										'roleid='+$scope.roleeditdet.roleid+'&rolename='+document.getElementById("editrolename").value+
										'&companyid='+sptstr[1]+'&loginid='+sptstr[2]+
										'&remarks='+document.getElementById("editroleremark").value)
								.success(function(data, status, headers, config) {
													$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
															.success(function(data, status,	headers, config) {
																	$scope.roledet = data;
																	$scope.getData14($scope.pageno);
																	document.getElementById("rolemain").hidden = false;
																	document.getElementById("roleedit").hidden = true;
																		//alert("in afetr");
																	})
															.error(function(data, status,headers, config) {
																		console.log('error: data = ',data);
																	});

													jAlert('Record Updated Successfully', 'Success Dialog'); 
													document.getElementById('roleeditform').reset();
												})
												.error(function(data, status, headers, config) {
													jAlert('Unable to  Proceed Your Request','Information');
													console.log('error: data = ', data);
													var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=RoleFormUpdate',data);
													response.success(function(data, status, headers, config) {
													});
													response.error(function(data, status, headers, config) {
														//alert( "Exception details: " + JSON.stringify({data: data}));
													}); 
					
												});
							}

				}
					
						}catch(e){}	
					
					} catch (e) {
						alert(e);
					}
				});
			
//			scotchApp.controller('UploadController', function($scope,$http, $compile, $filter) {
//				try{
//					$http.get()
//				}catch(e){
//					alert(e);
//				}
//			});
			
			
			scotchApp.controller('customerCtrl', function($scope,$http, $compile, $filter) {
				try
				{
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
					try{
						document.getElementById("vehdealerdetails1").style.display = "none";
						document.getElementById("custdealerdetails").style.display = "none";
					}catch(e){}
					 $scope.rname = 'Customer Name';
					 
					 jQuery('#insertcustomertype').on('input propertychange paste', function() {
						    // do your stuff
						    var name = '';
						    name = document.getElementById("insertcustomertype").value;
						    
						    if(name=='Individual'){
						    	$scope.rname='Customer Name';
						    	document.getElementById('cname').innerHTML = "Customer Name";
						    	
						    }else if(name=='Organization'){
						    	$scope.rname='Organization Name';
						    	document.getElementById('cname').innerHTML = "Organization Name";
						    	document.getElementById('cname').style.color="black";
						    	
						    }else{

						    }
						});
					  	 
					clearInterval(interval);
					$scope.showcustomerdiv1 = function() {
						document.getElementById("showeditcustomer").hidden = false;
						document.getElementById("maincustomer").hidden = true;
					}
					$scope.back = function() {
						document.getElementById("maincustomer").hidden = false;
						document.getElementById("showeditcustomer").hidden = true;
					}
					
					$scope.ByCustomername='';
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbycustomername='+$scope.ByCustomername)
					.success(function(data, status, headers, config) {
						//alert(data);
						$scope.customerdetails = data;
						$scope.getData41($scope.pageno); 
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					$scope.customerdetailsnew = [];
					$scope.pageno = 1; // initialize page no to 1
					$scope.total_count = 0;
					$scope.pagesno = [20,50,80,100,120,360,450,'All'];
					$scope.pagesint=20;
					$scope.onpagechange = function(page){
						$scope.pagesint=page;
						if($scope.pagesint=='All')
						{
						$scope.pagesint=$scope.total_count.length;
			            }
					}
//					$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
					
					$scope.getData41 = function(pageno){ 
						$scope.customerdetailsnew = [];
					var start=0, end=0;
						if(pageno!=1){
							start = $scope.pagesint * (pageno-1);
							end = start + $scope.pagesint;
							start++;
						}else{
							start = 0;
							end = start + $scope.pagesint;
							start++;
						}
						
						for(var i=start;i<=end;i++){
							if(i<=$scope.customerdetails.length){
								if($scope.ByCustomername!='')
									{
									if($scope.customerdetails[i].includes($scope.ByCustomername))
										{
								$scope.customerdetailsnew.push($scope.customerdetails[i-1]);
										}
									}
								else
									{
									$scope.customerdetailsnew.push($scope.customerdetails[i-1]);
									}
							}else{
								break;
							}
						}
							
							$scope.total_count = $scope.customerdetails.length;
						
					};
					
					$("#searchbyname").keypress(function(){
						try
						{
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbycustomername='+$scope.ByCustomername)
							.success(function(data, status, headers, config) {
									$scope.customerdetailsnew= data;
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbycustomername='+$scope.ByCustomername)
									.success(function(data, status, headers, config) {
											$scope.customerdetailsnew= data;
										//$scope.getData41($scope.pageno); 
									}).error(function(data, status, headers, config) {
										console.log('error: data = ', data);
									});
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
						}catch(e){alert(e);}
					});
					
					
					
					$scope.editcustdata=function editcustomer(editcustomer)
					{
						//try{
						$scope.customerdata=editcustomer;
						 if($scope.customerdata.paymentmode=='By Bank')
			    		  {
			    		  document.getElementById('editCustomernotBybank').checked=true;
			    		  document.getElementById('customerupdateBankDetails').hidden = false;
					      
			    		  }
			    	  else if($scope.customerdata.paymentmode=='By Cash')
			    		  {
			    		  document.getElementById('editCustomerBycash').checked=true;
			    		  document.getElementById('customerupdateBankDetails').hidden = true;
			    		  }
			    	  
			      	  if($scope.customerdata.iscredit=='Yes')
			    	  {
			    		  document.getElementById('editcustomercredit').checked=true;
			    		  document.getElementById('editcustomercreditdaysdiv').hidden = false;
			    		  document.getElementById('editcustomercreditamtdiv').hidden = false;
			    	  }
			    	  else if($scope.customerdata.iscredit=='No')
			    		  {
			    		  document.getElementById('editcustomernotcredit').checked=true;
			    		  document.getElementById('editcustomercreditamtdiv').hidden = true;
			    		  document.getElementById('editcustomercreditamtdiv').hidden = true;
			    		  }
			    	}
						function printData()
					{
					   var divToPrint=document.getElementById("printTablecust");
					   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
						  var newWin = window.open('','',popup_win);
						   newWin.document.open();
					  
					   
					   var htmlToPrint = '' +
				        '<style type="text/css">' +
				        'table th, table td {' +
				        'border:1px solid #000;' +
				        'padding;0.5em;' +
				        '}' +
				        'tr:nth-child(even) {' +
				        'background:#bdbdbd; ' +
				         '}' +
				         'tr:nth-child(odd) {' +
					        'background:#d3d3d3; ' +
					         '}'+ 
				        '</style>';
				        htmlToPrint += divToPrint.outerHTML;
				        newWin = window.open("");
				        newWin.document.write(htmlToPrint);
				        newWin.print();
				        newWin.close();
					}

					$('#printbutton').on('click',function(){
					printData();
					})
					
	  
	$('#exportpdf').click(function () {
//			    
			    try{
					//alert("hhhhhhhhhi");
					var columns = ["Row NO","Customer Name","Dealer Name","Customer Type","Contact Person","Mobile No.","Email Id"];
					var i=0;
			        
			      	var data1=[];
						
			    	for(i=0;i<$scope.customerdetails.length;i++){
			    		
			        var data  = $scope.customerdetails[i];
			    		 data1.push([data.rowno,data.customername,data.dealername,data.customertype,data.contactperson,data.mobilenumber,data.emailid]);
			    	}
			    
			    	 var doc = new jsPDF('landscape','pt');
			      
			    	 doc.autoTable(columns, data1);
			         doc.save("CustomerDetails.pdf");
			         }
			    catch(e)
			    {
			    	alert(e.message);
			    }
			    
			      });
			try{
				$("#exportexcel").click(function() {;
			        var dt = new Date();
			        var day = dt.getDate();
			        var month = dt.getMonth() + 1;
			        var year = dt.getFullYear();
			        var hour = dt.getHours();
			        var mins = dt.getMinutes();
			        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
			        var a = document.createElement('a');
			        var data_type = 'data:application/vnd.ms-excel';//base64,' 
			        //var table_div = document.getElementById('dealerassignDiv');
			        var i=0;
			        var table_html = "";
					table_html = table_html +"<html><body><table><tr>"+
					"<td><font>Row No</font></td>"+
					"<td><font>Customer Name</font></td>"+
					"<td><font>Dealer Name</font></td>"+
					"<td><font>Customer Type</font></td>"+
					"<td><font>Contact Person</font></td>"+
					"<td><font>Mobile NO</font></td>"+
					"<td><font>Email Id</font></td>"+
					"</tr>";
					//alert(htmlString);
					try{
			    	for(i=0;i<$scope.customerdetails.length;i++){
			    		data  = $scope.customerdetails[i];
			    		table_html = table_html + "<tr>"+
						"<td><font>"+data.rowno+"</font></td>"+
						"<td><font>"+data.customername+"</font></td>"+
						"<td><font>"+data.dealername+"</font></td>"+
						"<td><font>"+data.customertype+"</font></td>"+
						"<td><font>"+data.contactperson+"</font></td>"+
						"<td><font>"+data.mobilenumber+"</font></td>"+
						"<td><font>"+data.emailid+"</font></td>"+
						"</tr>";
						}
					}catch(e){}
					table_html = table_html + "</table></body></html>";
			        a.href = data_type + ', ' + table_html;
			        a.download = 'Customer_Details' + postfix +'.xls';
			        a.click();
			       e.preventDefault(); 
			    });}catch(e){alert("sss"+e);}
			
			    $(function() {
			    $('input[name="customerpaymentmode"]').on('click', function() {
			        if ($(this).val() == 'By Bank') {
			            $('#customerupdateBankDetails').show();
			           }
			        else if($(this).val() == 'By Cash') 
			        	{ $('#customerupdateBankDetails').hide();
			       }   else {
			        	 $('#customerupdateBankDetails').hide();
			           	           
			        }
			    });
			});
			
			$(function() {
			    $('input[name="editcustomermode"]').on('click', function() {
			        if ($(this).val() == 'Yes') {
			            $('#editcustomercreditdaysdiv').show();
			            $('#editcustomercreditamtdiv').show();
			            }
			        else if($(this).val() == 'No') 
			        	{
			        	 $('#editcustomercreditdaysdiv').hide();
			             $('#editcustomercreditamtdiv').hide();
			                	}
			        else {	 $('#editcustomercreditdaysdiv').hide();
			             $('#editcustomercreditamtdiv').hide();
			        	        }
			    });
			});
			
			$(function() {
			    $('input[name="insertcustpaymode"]').on('click', function() {
			        if ($(this).val() == 'By Bank') {
			            $('#insertbankFieldset').show();
			          
			        }
			        else if($(this).val() == 'By Cash') 
			        	{
			        	 $('#insertbankFieldset').hide();
			              	}
			            else {
			        	 $('#insertbankFieldset').hide();
			           	           
			        }
			    });
			});
			
			$(function() {
			    $('input[name="insertcustomermode"]').on('click', function() {
			        if ($(this).val() == 'Yes') {
			            $('#customercreditDays').show();
			            $('#customercreditAmt').show();
		          } else if($(this).val() == 'No') 
			        	{ $('#customercreditDays').hide();
				            $('#customercreditAmt').hide();
			              	}
			            else {   $('#customercreditDays').hide();
					            $('#customercreditAmt').hide();
			           	     }
			    });
			});
			
			$scope.getdealer = function(){
						if(document.getElementById("dealercheck").checked){
							document.getElementById("vehdealerdetails1").style.display = "inline";
						}else{
							document.getElementById("vehdealerdetails1").style.display = "none";
						}
					};
					$scope.getsubdealer = function(){
						if(document.getElementById("subdealercheck").checked){
							document.getElementById("custdealerdetails").style.display = "inline";
						}else{
							document.getElementById("custdealerdetails").style.display = "none";
						}
					};
			try
			{
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
				    //alert(data.length);
					$scope.dealerdetailslistcust= data;
					$scope.loginid=sptstr[2];
				$scope.roleid==sptstr[6];
			//$scope.parentDealer='Banglore Dealers';
					try
				{
					if($scope.loginid!='10001')
					{
						if(sptstr[6]=='1003'){
							
						}else if($scope.dealerdetailslistcust.length==0){
							document.getElementById('dealersDetails').hidden=true;
							document.getElementById('maindealer').hidden=true;
						}else{
							
							document.getElementById('maindealer').hidden=true;
							
							$scope.dealername=sptstr[0];
						}
					
					}
				}catch(e){}
			
		}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
				
				
			}catch(e){//alert(e);
			}	
					$scope.deletecustomer = function(deletecustomerid){
						jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
							if(r){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdelete?id='+deletecustomerid.customerid)
						.success(function(data, status, headers, config) {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
										$scope.customerdetails = data;
										$scope.getData41($scope.pageno);
							jAlert('Record Deleted Successfully', 'Confirmation Results');
								}).error(function(data, status, headers, config) {
									jAlert('Record Not deleted','Information');
									console.log('error: data = ', data);
								});$scope.showcustomerdiv1 = function() {
									document.getElementById("showeditcustomer").hidden = false;
									document.getElementById("maincustomer").hidden = true;
								}
								$scope.back = function() {
									document.getElementById("maincustomer").hidden = false;
									document.getElementById("showeditcustomer").hidden = true;
								}
								
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
								.success(function(data, status, headers, config) {
									
									$scope.customerdetails = data;
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
					
							}).error(function(data, status, headers, config) {
							document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
							console.log('error: data = ', data);
						});
							}
						});
					}
					$scope.customerInsert=function customerInsert()
					{	
						$scope.cid = sptstr[7];
						$scope.custdealerid="";
						try
						{
							var mycustomerinsert = document.inserdealerform; 
						
						      if (mycustomerinsert.insertcustomertype.value== "") 
						      { 	 mycustomerinsert.insertcustomertype.focus(); 
						      } 
						      else if(mycustomerinsert.insertcustomername.value== "")
							{
						    	  mycustomerinsert.insertcustomername.focus(); 
							} 
						   else if(mycustomerinsert.insertcustomercontactperson.value== "")
							{
						    	  mycustomerinsert.insertcustomercontactperson.focus(); 
							}
						   else if(mycustomerinsert.insertcustomermobileno.value== "")
							{
						    	  mycustomerinsert.insertcustomermobileno.focus(); 
							}
						   else if(mycustomerinsert.insertcustomeradd.value== "")
							{
						    	  mycustomerinsert.insertcustomeradd.focus(); 
							}
						   else if(mycustomerinsert.insertcustomeremailid.value== "")
							{
						    	  mycustomerinsert.insertcustomeremailid.focus(); 
							}
						   else
							   { 
							     var i=0;chk=0,chk1=0;
						    	  for(i=0;i<$scope.customerdetails.length;i++)
						    		  {
						    		  if($scope.customerdetails[i].mobilenumber==document.getElementById('insertcustomermobileno').value)
						    			 {
						    			  chk++;
						    			 }
						    		  else if($scope.customerdetails[i].emailid==document.getElementById('insertcustomeremailid').value)
						    		  	{		  chk1++;
						    		  	}
						    		  }
						    	  
						    		 if(chk>0)
						    			{ 
						    			  jAlert('Problem in Saving Records!Mobile Number Already Exist!','Information');
						    		 		document.getElementById('insertcustomermobileno').value="";
						    		 		mycustomerinsert.insertcustomermobileno.focus(); 
						    			}
						
								else if(chk1>0)
						    			{  
										jAlert('Problem in Saving Records! Email Id Already Exist!','Information');
						    		 	document.getElementById('insertcustomeremailid').value="";
						    		 	mycustomerinsert.insertcustomeremailid.focus(); 
						    			}
						    		  else{

			if(document.getElementById('insertcustomercredit').checked==true)
				{
				$scope.insertcreditvalue='Yes';
				}
			else if(document.getElementById('insertcustomernotcredit').checked==true)
			{
				$scope.insertcreditvalue='No';
			}
			
			if(document.getElementById('insertcustomerBycash').checked==true)
			{
			$scope.insertpaymentvalue='By Cash';
			}
			else if(document.getElementById('insertcustomernotBybank').checked==true)
			{
				$scope.insertpaymentvalue='By Bank';
				}
			
			
			if(document.getElementById("subdealercheck").checked){
				for(i=0;i<$scope.dealerdetailslistcust.length;i++)
					{
						
						if($scope.dealerdetailslistcust[i].dealername==document.getElementById('custdealerdetails').value)
							{
							$scope.custdealerid=$scope.dealerdetailslistcust[i].dealerid;
							$scope.cid = $scope.custdealerid;
							}
					}
			}
			
			if($scope.custdealerid=="")
				{ 
				if(document.getElementById("dealercheck").checked){
					
					for(i=0;i<$scope.dealerdetailslistcust.length;i++)
					{
						if($scope.dealerdetailslistcust[i].dealername==document.getElementById('vehdealerdetails1').value)
							{
							$scope.custdealerid=$scope.dealerdetailslistcust[i].dealerid;
							}
					}
				}
				}
				if($scope.custdealerid==""){
					$scope.custdealerid=sptstr[7];
				}
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerinsert?customername='+document.getElementById('insertcustomername').value+'&customertype='+document.getElementById('insertcustomertype').value+'&contactperson='+document.getElementById('insertcustomercontactperson').value+'&emailid='+document.getElementById('insertcustomeremailid').value+'&mobilenumber='+document.getElementById('insertcustomermobileno').value+'&alternatecontnumber='+document.getElementById('insertcustomeraltno').value+'&address='+document.getElementById('insertcustomeradd').value+'&city='+document.getElementById('insertcustomercity').value+'&pincode='+document.getElementById('insertcustomerpincode').value+'&iscredit='+$scope.insertcreditvalue+'&creditdays='+document.getElementById('insertcustomercreditdays').value+'&creditamount='+document.getElementById('insertcustomercreditamount').value+'&paymentmode='+$scope.insertpaymentvalue+'&bank_name='+document.getElementById('insertcustomerbankname').value+'&branch='+document.getElementById('insertcustomerbranch').value+'&accountno='+document.getElementById('insertcustomeraccountno').value+'&bankaddress='+document.getElementById('insertcustomerbankadd').value+'&ifscno='+document.getElementById('insertcustomerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertcustomerremark').value+'&dealerid='+$scope.custdealerid)
							.success(function(data, status, headers, config) {
								//jAlert('Record Inserted Successfully', 'Success Dialog');
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
										$scope.customerdetails = data;
										for(i=0;i<$scope.customerdetails.length;i++)
										{
											if($scope.customerdetails[i].customername==(document.getElementById('insertcustomername').value).toUpperCase())
												{
													$scope.usercomId=$scope.customerdetails[i].customerid;
													
												}
										}
										
//										alert($scope.cid);
										
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userinsert?'+
												'&loginname='+document.getElementById('insertCustomerLoginname').value+
												'&password='+document.getElementById('insertCustomerpassword').value+
												'&controlid='+$scope.cid+'&roleid=1003&ownersid='+$scope.usercomId+'&companyid='+sptstr[1])
										.success(function(data, status, headers, config) {
												jAlert('Record Inserted Successfully', 'Success Dialog');
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
										$scope.getData41($scope.pageno);
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
								
								$scope.custdealerid='';
							}).error(function(data, status, headers, config) {
								jAlert('Unable to  Proceed Your Request','Information');
								$scope.error=data;
								console.log('error: data = ', data);
								var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=CustomerFormInsert',data);
								response.success(function(data, status, headers, config) {
								});
								response.error(function(data, status, headers, config) {
									//alert( "Exception details: " + JSON.stringify({data: data}));
								}); 
								
								console.log('error: data = ', data);
								$scope.custdealerid='';
							});
						    		  }  }
						      
						}
						catch(e)
						{	}
										
					}
					
					$scope.showcustomerdiv1 = function() {
						document.getElementById("showeditcustomer").hidden = false;
						document.getElementById("maincustomer").hidden = true;
					}
					$scope.back = function() {
						document.getElementById("maincustomer").hidden = false;
						document.getElementById("showeditcustomer").hidden = true;
					}
					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						
						$scope.customerdetails = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					$scope.customerUpdate=function customerUpdate()
					{	try
						{
						
						var mycustomeredit = document.editcustomerform; 
						      if (mycustomeredit.editcustomertype.value== "") 
						      { 	
						    	  mycustomeredit.editcustomertype.focus(); 
						      } 
						      else  if (mycustomeredit.editCustomername.value== "") 
						      { 	 
						    	  mycustomeredit.editCustomername.focus(); 
						      }   else  if (mycustomeredit.editcustomercontactperson.value== "") 
						      { 	
						    	  mycustomeredit.editcustomercontactperson.focus(); 
						      } 
						      else  if (mycustomeredit.editcustomermobileno.value== "") 
						      { 	 mycustomeredit.editcustomermobileno.focus(); 
						      } else  if (mycustomeredit.editcustomeradd.value== "") 
						      { 	 mycustomeredit.editcustomeradd.focus(); 
						      } else  if (mycustomeredit.editcustomeremailid.value== "") 
						      { 	 mycustomeredit.editcustomeremailid.focus(); 
						      } 
						      else
						    	  {
						    	  $scope.editcustomerid=$scope.customerdata.customerid;
									
									if(document.getElementById('editcustomercredit').checked==true)
										{
										$scope.creditvalue='Yes';
										}
									else if(document.getElementById('editcustomernotcredit').checked==true)
									{		$scope.creditvalue='No';
									}
											
									if(document.getElementById('editCustomerBycash').checked==true)
									{	$scope.customerpaymentmode='By Cash';
									}
									else if(document.getElementById('editCustomernotBybank').checked==true)
									{
										$scope.customerpaymentmode='By Bank';	
									}
									
//		 							alert(document.getElementById('editCustomerremark').value);
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerupdate?customerid='+$scope.editcustomerid+'&customername='+document.getElementById('editCustomername').value+'&customertype='+document.getElementById('editcustomertype').value+'&contactperson='+document.getElementById('editcustomercontactperson').value+'&emailid='+document.getElementById('editcustomeremailid').value+'&mobilenumber='+document.getElementById('editcustomermobileno').value+'&alternatecontnumber='+document.getElementById('editcustomeraltno').value+'&address='+document.getElementById('editcustomeradd').value+'&city='+document.getElementById('editcustomercity').value+'&pincode='+document.getElementById('editcustomerpincode').value+'&iscredit='+$scope.creditvalue+'&creditdays='+document.getElementById('editCustomercreditdays').value+'&creditamount='+document.getElementById('editCustomercreditamt').value+'&paymentmode='+$scope.customerpaymentmode+'&bank_name='+document.getElementById('editCustomerbankname').value+'&branch='+document.getElementById('editcustomerbranch').value+'&accountno='+document.getElementById('editCustomeraccno').vlaue+'&bankaddress='+document.getElementById('editCustomerbankaddress').value+'&ifscno='+document.getElementById('editCustomerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editCustomerremark').value)
									.success(function(data, status, headers, config) {
										document.getElementById("maincustomer").hidden = false;
										document.getElementById("showeditcustomer").hidden = true;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
										.success(function(data, status, headers, config) {
												$scope.customerdetails = data;
												$scope.getData41($scope.pageno);
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
										jAlert('Record Updated Successfully', 'Success Dialog');
									document.getElementById('editcustomer').reset();
									}).error(function(data, status, headers, config) {
										jAlert('Unable to  Proceed Your Request','Information');
										$scope.error=data;
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=CustomerFormUpdate',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
											//alert( "Exception details: " + JSON.stringify({data: data}));
										}); 

									});
						    	 }
						}
						catch(e)
						{
						alert("err"+e)	;	
						}
					}
					}
				catch(e)
				{
					alert(e);
				}
				});
			
			scotchApp.directive('fileModel', ['$parse', function ($parse) {
	            return {
	               restrict: 'A',
	               link: function(scope, element, attrs) {
	                  var model = $parse(attrs.fileModel);
	                  var modelSetter = model.assign;
	                  
	                  element.bind('change', function(){
	                     scope.$apply(function(){
	                        modelSetter(scope, element[0].files[0]);
	                     });
	                  });
	               }
	            };

	         }]);
	      
			scotchApp.service('fileUpload', ['$http', function ($http) {
	            this.uploadFileToUrl = function(file, uploadUrl, vehicleno){
	               var fd = new FormData();
	               fd.append('file', file);
//	               alert(uploadUrl+"?vehicleno="+vehicleno);
	               $http.post(uploadUrl+"?vehicleno="+vehicleno, fd, {
	            	   transformRequest: angular.identity,
	            	   headers: {'Content-Type': undefined}
	            	})
	               .success(function(data){
//	            	   alert("in success "+data);
	               })
	            
	               .error(function(data){
//	            	   alert("in error "+data);
	               });
	            }
	            
	            this.uploadFileToUrlExcel = function(file, uploadUrl, loginid, customerid, makeid, modelid){
		               var fd = new FormData();
		               fd.append('file', file);
		               var over = '<div id="overlay">' +
//					     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
					     '</div>';
					    $(over).appendTo('body');
//		               alert(uploadUrl+"?vehicleno="+vehicleno);
		               $http.post(uploadUrl+"?loginid="+loginid+"&customerid="+customerid+"&makeid="+makeid+"&modelid="+modelid, fd, {
		            	   transformRequest: angular.identity,
		            	   headers: {'Content-Type': undefined}
		            	})
		               .success(function(data){
//		            	   alert("in success "+data);
		            	   $('#overlay').remove();
		            	   jAlert('File Uploadsed Successfully', 'Success Dialog'); 
		               })
		            
		               .error(function(data){
//		            	   alert("in error "+data);
		            	   $('#overlay').remove();
		            	   jAlert('File Not Uploaded','Information');
		               });
		            }
	            
	         }]);
			
			scotchApp.controller('adminDasBoardctrl', function($scope,$http, $compile, $filter)
					{
						$scope.loginid = sptstr[2];	
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
						
						$scope.loginid = sptstr[2];
						clearInterval(interval);
						try{
							$scope.companynamenew = [];
							$scope.pageno = 1; // initialize page no to 1
							$scope.total_count = 0;
							$scope.pagesint = 5;
						$scope.getDataadmin = function(pageno){ 
							
								$scope.companynamenew = [];
							var start=0, end=0;
								if(pageno!=1){
									start = $scope.pagesint * (pageno-1);
									end = start + $scope.pagesint;
									start++;
								}else{
									start = 0;
									end = start + $scope.pagesint;
									start++;
								}
								for(var i=start;i<=end;i++){
									if(i<=$scope.companynamedt.length){
										
											$scope.companynamenew.push($scope.companynamedt[i-1]);
										
									}else{
										break;
									}
								}		$scope.total_count = $scope.companynamedt.length;
								
							};
							
							}catch(e){alert(e);}
						
							$scope.shomap = function(cmp) {
								
								
								var randomnumber = Math.floor((Math.random()*100)+1); 
								 window.open('http://209.190.15.26/tripmap?vehicleno='+cmp.vehicleno+
										 '&fromtime='+cmp.starttime+'&totime='+cmp.passvalid,"_blank",'PopUp',randomnumber,'scrollbars=1,menubar=0,resizable=1,width=600,height=500');

						}
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.companycount = Number(data.length);
							//$scope.getData13($scope.pageno); 
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisedevicedetails')
						.success(function(data, status, headers, config) {
//							alert(data);
							$scope.totaldevicesdet= data;
							$scope.ros=data[0].companyName;
							
							$scope.at=data[1].companyName;
							$scope.solddevices = 0;
							$scope.totdevices=0,$scope.totpolling=0,$scope.totnonpolling=0,$scope.totinstalled=0,$scope.available=0,$scope.tottripcount=0,$scope.totactivedevices=0,$scope.totinactivedevices=0;
						for(i=0;i<$scope.totaldevicesdet.length;i++)
								{
								
								   $scope.totdevices=Number($scope.totdevices)+Number(data[i].totalDevices);
								   $scope.devicenew = $scope.totdevices;
								   $scope.totpolling=Number($scope.totpolling)+Number(data[i].pollingDevices);
								   $scope.totnonpolling=Number($scope.totnonpolling)+Number(data[i].nonPolllingDevices);	
								   $scope.totinstalled=Number($scope.totinstalled)+Number(data[i].installedDevices);
								   $scope.available=Number($scope.available)+Number(data[i].availabledevices);
								   $scope.tottripcount=Number($scope.tottripcount)+Number(data[i].tripcount);
								   $scope.totactivedevices=Number($scope.totactivedevices)+Number(data[i].pollingDevices);
								   $scope.totinactivedevices=Number($scope.totinactivedevices)+Number(data[i].nonPolllingDevices);
								   $scope.solddevices = Number($scope.solddevices)+Number(data[i].sold);
			

				}			

						Highcharts.chart('tripveh', {
						    chart: {
						        type: 'pie',
						        options3d: {
						            enabled: true,
						            alpha: 45,
						            beta: 0
						        }
						        
						    },
						    exporting: { enabled: false },
						    title: {
						        text: 'Companywise Installed Devices'
						    },
//						    tooltip: {
//						        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
//						    },
						    plotOptions: {
						        pie: {
						            allowPointSelect: true,
						            cursor: 'pointer',
						            depth: 35
//						            dataLabels: {
//						                enabled: true,
//						                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
//						                style: {
//						                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
//						                }
//						            }
						        }
						    },
						    credits: {
						        enabled: false
						    },
						    series: [{
						        name: 'Installed Count',
						        colorByPoint: true,
						        data: [{
						            name: $scope.totaldevicesdet[0].companyName,
						            y: Number($scope.totaldevicesdet[0].installedDevices)
						        }, {
						            name: $scope.totaldevicesdet[1].companyName,
						            y: Number($scope.totaldevicesdet[1].installedDevices)
						        },{
						            name: $scope.totaldevicesdet[2].companyName,
						            y: Number($scope.totaldevicesdet[2].installedDevices)
						        },{
						            name: $scope.totaldevicesdet[3].companyName,
						            y: Number($scope.totaldevicesdet[3].installedDevices)
						        },{
						            name: $scope.totaldevicesdet[4].companyName,
						            y: Number($scope.totaldevicesdet[4].installedDevices)
						        },{
						            name: $scope.totaldevicesdet[5].companyName,
						            y: Number($scope.totaldevicesdet[5].installedDevices)
						        }]
						    }]
						});
						
						
//						    	  try{
//						    	  google.charts.load('current', {'packages':['corechart']});
//						          google.charts.setOnLoadCallback(drawChart);
//
//						          function drawChart() {
//
//						            var data = google.visualization.arrayToDataTable([
//						              ['Company', 'No.of Installed Devices'],
//						              [$scope.totaldevicesdet[0].companyName,     Number($scope.totaldevicesdet[0].installedDevices)],
//						              [$scope.totaldevicesdet[1].companyName,      Number($scope.totaldevicesdet[1].installedDevices)],
//						              [$scope.totaldevicesdet[2].companyName,  Number($scope.totaldevicesdet[2].installedDevices)],
//						              [$scope.totaldevicesdet[3].companyName, Number($scope.totaldevicesdet[3].installedDevices)],
//						              [$scope.totaldevicesdet[4].companyName,    Number($scope.totaldevicesdet[4].installedDevices)],
//						              [$scope.totaldevicesdet[5].companyName,    Number($scope.totaldevicesdet[5].installedDevices)]
//						            ]);
//
//						            var options = {
//									          title: 'Companywise Installed Devices',
//									          pieSliceText: 'value'
//									        };
//
//						            var chart = new google.visualization.PieChart(document.getElementById('tripveh'));
//
//						            chart.draw(data, options);
//						          }
//							    	}catch(e){
//						    		alert(e);
//						    	}


								
						});
						
						setInterval(function(){
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisedevicedetails')
							.success(function(data, status, headers, config) {
					//				alert(data);
									$scope.totaldevicesdet= data;
									$scope.ros=data[0].companyName;
									
									$scope.at=data[1].companyName;
									$scope.solddevices = 0;
									$scope.totdevices=0,$scope.totpolling=0,$scope.totnonpolling=0,$scope.totinstalled=0,$scope.available=0,$scope.tottripcount=0,$scope.totactivedevices=0,$scope.totinactivedevices=0;
									for(i=0;i<$scope.totaldevicesdet.length;i++)
									{
									
									   $scope.totdevices=Number($scope.totdevices)+Number(data[i].totalDevices);
									   $scope.devicenew = $scope.totdevices;
									   $scope.totpolling=Number($scope.totpolling)+Number(data[i].pollingDevices);
									   $scope.totnonpolling=Number($scope.totnonpolling)+Number(data[i].nonPolllingDevices);	
									   $scope.totinstalled=Number($scope.totinstalled)+Number(data[i].installedDevices);
									   $scope.available=Number($scope.available)+Number(data[i].availabledevices);
									   $scope.tottripcount=Number($scope.tottripcount)+Number(data[i].tripcount);
									   $scope.totactivedevices=Number($scope.totactivedevices)+Number(data[i].pollingDevices);
									   $scope.totinactivedevices=Number($scope.totinactivedevices)+Number(data[i].nonPolllingDevices);
									   $scope.solddevices = Number($scope.solddevices)+Number(data[i].sold);

									}		
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});	
							
						}, 800000);

						
						
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
//							 try{
//								 
//								 
//								 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companiwisedevice?controlid='+sptstr[7])
//									.success(function(data, status, headers, config) {
//										
//									$scope.sumval=Number(data[(data.length)-1].totalcount);	
//								
//								google.charts.load("current", {packages:["corechart"]});
//							      google.charts.setOnLoadCallback(drawChart);
//							      function drawChart() {
////							        var data = google.visualization.arrayToDataTable([
////							        
////							        ]);
//
//							        try{
//								    	 var data1 = new google.visualization.DataTable();
//									      data1.addColumn('string', 'companyname');
//									      data1.addColumn('number', 'No.of Devices');
//									      for(var m = 0;m<data.length;m++){
//									    	   data1.addRows([
//										        [String(data[m].companyname), Number(data[m].devicecount)]
//										      ]);
//										      
//									      }
//								    	}catch(e){
//								    		alert(e);
//								    	}
//							        var options = {
//							          title: 'CompanyDeviceDetail',
//							          pieHole: 0.4,
//							          pieSliceText: 'value'
//							        };
//
//							        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
//							        chart.draw(data1, options);
//							      }
//							      
//							      
//									}).error(function(data, status,headers, config) {
//										console.log('error: data = ',data);
//						
//									}); 
//							 }
//							      catch(e){
//							    	  alert("err"+e);
//							    	  }
							      
							
						
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisedevicecount?controlid='+sptstr[7])
							.success(function(data, status, headers, config) {
							try{
								$(function () {
								    function drawChart() {
								    	try{
								    	 var data1 = new google.visualization.DataTable();
									      data1.addColumn('string', 'Company');
									      data1.addColumn('number', 'Available Devices');
									      data1.addColumn('number', 'Installed Devices');
									      for(var m = 0;m < data.length;m++){
//									    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
										      data1.addRows([
										        [String(data[m].companyname), Number(data[m].availdevices), Number(data[m].solddevices)]
										      ]);
									      }
								    	}catch(e){
								    		alert(e);
								    	}
								    	
							       var options = {
								            title: '',
								           // colors: ["blue", "red" ],
											 is3D: true,
											 bar: {groupWidth: '15%'},
											    isStacked: true,
											    hAxis: {
										            minValue: 0, format: '0'
										          },
											legend:'bottom',
											 width: 300,
											 pieSliceText: 'value'
								        };
							      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
								        
								        chart.draw(data1, options);
								    }

								    google.load("visualization", "1", {
								        packages: ["corechart"],
								        callback: drawChart
								    });
								});
							 
							}catch(e){
								alert(e);
							}
							});
							
//							Model Code
//							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
//							.success(function(data, status, headers, config) {
//								$scope.devicenew = data;
//
//							}).error(function(data, status, headers, config) {
//								console.log('error: data = ', data);
//							});
							
							// Get the modal
							var modal = document.getElementById('myModal');

							// Get the button that opens the modal
							var btn = document.getElementById("myBtn");

							// Get the <span> element that closes the modal
							var span = document.getElementsByClassName("close")[0];

							// When the user clicks the button, open the modal 
							btn.onclick = function() {
							    modal.style.display = "block";
							}

							// When the user clicks on <span> (x), close the modal
							span.onclick = function() {
							    modal.style.display = "none";
							}

							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
							    if (event.target == modal) {
							        modal.style.display = "none";
							    }
							}
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
							.success(function(data, status, headers, config) {
								$scope.company = data;
								//$scope.getData13($scope.pageno); 
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
							
							
//							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/tripveh')
//							.success(function(data, status, headers, config) {
//								$scope.tripveh = data;
//								
//								
//							      
//							      
//								//$scope.getData13($scope.pageno); 
//							}).error(function(data, status, headers, config) {
//								console.log('error: data = ', data);
//							});
							
							
							try{
								
								$scope.gettripdetails=function(companyName){    	
									$scope.compname = companyName;
									//alert(circle);
									//alert('http://localhost:8080/indtrackwebservice/rest/CallService/circlewisetripdetails?circlename='+circle);
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisetripdetails?companyname='+companyName)
								.success(function(data, status, headers, config) {
									//alert(data);
									$scope.companynamedt = data;
									$scope.getDataadmin($scope.pageno); 

								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
								}
								}
								catch(e){}
							
							
				});

			
			scotchApp.controller('lustatusctrl', function($scope,$http, $compile, $filter) {
				
				
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
								  
							    try{
							    	$("#exportexcel").click(function() {
							    	//getting values of current time for generating the file name
							    	var dt = new Date();
							    	var day = dt.getDate();
							    	var month = dt.getMonth() + 1;
							    	var year = dt.getFullYear();
							    	var hour = dt.getHours();
							    	var mins = dt.getMinutes();
							    	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
							    	//creating a temporary HTML link element (they support setting file names)
							    	var a = document.createElement('a');
							    	//getting data from our div that contains the HTML table
							    	var data_type = 'data:application/vnd.ms-excel';//base64,' 
							    	var table_div = document.getElementById('lustatustable');
							    	//alert("table_div"+table_div);
							    	var i=0;
							    	var table_html = "";
							    	table_html = table_html +"<html><body><table><tr>"+
							    	"<td><font>Vehicle No</font></td>"+
							    	"<td><font>IMEI No</font></td>"+
							    	"<td><font>Total LU</font></td>"+
							    	"<td><font>Total Live LU</font></td>"+
							    	"<td><font>Total History LU</font></td>"+
							    	"<td><font>LU On Primary</font></td>"+
							    	"<td><font>LU On Secondary</font></td>"+
							    	"<td><font>Date</font></td>"+
							    	"</tr>";
							    	//alert(htmlString);
							    	try{
							    		//alert($scope.lustatusdetails.length);
							    	for(i=0;i<$scope.lustatusdetails.length;i++){
							    		
							    	data  = $scope.lustatusdetails[i];
							    	table_html = table_html + "<tr>"+
							    	"<td><font>"+data.vehicleregno+"</font></td>"+
							    	"<td><font>"+data.imeino+"</font></td>"+
							    	"<td><font>"+data.totallu+"</font></td>"+
							    	"<td><font>"+data.totallivelu+"</font></td>"+
							    	"<td><font>"+data.totalhistorylu+"</font></td>"+
							    	"<td><font>"+data.luonprimary+"</font></td>"+
							    	"<td><font>"+data.luonsecondary+"</font></td>"+
							    	"<td><font>"+data.date+"</font></td>"+
							    	"</tr>";
							    			}
							    	}catch(e){}
							    	table_html = table_html + "</table></body></html>";
							    	a.href = data_type + ', ' + table_html;
							    	//setting the file name
							    	a.download = 'LUStatus_Details' + postfix + '.xls';
							    	a.click();
							    	//just in case, prevent default behaviour
							    	e.preventDefault(); 
							    	});}catch(e){alert(e);}


								
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
								.success(function(data, status, headers, config) {
									$scope.overspeedvehdeatils = data;
											}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
											
								
							
								$scope.lustatusdetailsnew = [];
								$scope.pageno = 1; // initialize page no to 1
								$scope.total_count = 0;
//								$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
								
								$scope.getData56 = function(pageno){ 
									$scope.lustatusdetailsnew = [];
								var start=0, end=0;
									if(pageno!=1){
										start = $scope.pagesint * (pageno-1);
										end = start + $scope.pagesint;
										start++;
									}else{
										start = 0;
										end = start + $scope.pagesint;
										start++;
									}
									
									for(var i=start;i<=end;i++){
										if(i<=$scope.lustatusdetails.length){
											$scope.lustatusdetailsnew.push($scope.lustatusdetails[i-1]);
										}else{
											break;
										}
									}
										
										$scope.total_count = $scope.lustatusdetails.length;
									
								};
								
								 $scope.limit=50;
								try{
								$scope.getlustatusReport=function()
								{
									//alert("in lustatus");
									var over = '<div id="overlay">' +
//								     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
								     '</div>';
								    $(over).appendTo('body');
								    
								//alert('http://localhost:8080/indtrackwebservice/rest/CallService/lustatusReport?fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value);
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/lustatusReport?fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value)
								.success(function(data, status, headers, config) {        
									//alert(data);
									$scope.lustatusdetails = data;
									$scope.getData56($scope.pageno); 
								if(data.length==0)
										{
									$('#overlay').remove();
										jAlert('No Data Found','Information');
										}else
											{
											//alert("in else");
											$('#overlay').remove();
											try{
												document.getElementById('loghistorydiv').hidden=false;
												//document.getElementById('lustatustable').hidden=false;
											}catch(e){alert(e);}
											}
									//$('#overlay').remove();
									
								try{
									google.charts.load('current', {'packages':['bar']});
								      google.charts.setOnLoadCallback(drawChart);
								      function drawChart() {
								    	  try{
										    	 var data1 = new google.visualization.DataTable();
										    	 data1.addColumn('string', 'Vehicle No');
	                                             data1.addColumn('number', 'Total LU');
	                                             data1.addColumn('number', 'Total Live LU');
	                                             data1.addColumn('number', 'Total History LU');
	                                             data1.addColumn('number', 'LU On Primary');
	                                             data1.addColumn('number', 'LU On Secondaryry');
	                                             //alert(data.length);
											      for(var m = 0;m < data.length;m++){
//											    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
											    	  data1.addRows([
												        [String(data[m].vehicleregno), Number(data[m].totallu), Number(data[m].totallivelu),Number(data[m].totalhistorylu),Number(data[m].luonprimary),Number(data[m].luonsecondary)]
												      ]);
											      }
										    	}catch(e){
										    		alert(e);
										    	}
//                                          alert("in bottom 2");
										    	var options = {
											            title: '',
											           // colors: ["rgb(212,174,7)" ],
														 is3D: true,
														 bar: {groupWidth: '30%'},
														    isStacked: true,
														    hAxis: {
													            minValue: 0, format: '0'
													          },
													          legend:'bottom',
																// width: 700,
																 pieSliceText: 'value'
										 			
											        };
										    	
								        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

								        chart.draw(data1, options);
								      }

							      
							      
							      
							      
//							      $(function () {
//									    function drawChart() {
//									    	try{
//									    	 var data1 = new google.visualization.DataTable();
//									    	 data1.addColumn('string', 'Vehicle No');
//                                             data1.addColumn('number', 'Total LU');
//                                             data1.addColumn('number', 'Total Live LU');
//                                             data1.addColumn('number', 'Total History LU');
//                                             data1.addColumn('number', 'LU On Primary');
//                                             data1.addColumn('number', 'LU On Secondaryry');
//                                             //alert(data.length);
//										      for(var m = 0;m < data.length;m++){
////										    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
//										    	  data1.addRows([
//											        [String(data[m].vehicleregno), Number(data[m].totallu), Number(data[m].totallivelu),Number(data[m].totalhistorylu),Number(data[m].luonprimary),Number(data[m].luonsecondary)]
//											      ]);
//										      }
//									    	}catch(e){
//									    		alert(e);
//									    	}
//									    	
//
//									        var options = {
//									          title: 'Motivation and Energy Level Throughout the Day',
//									          colors: ['#9575cd', '#33ac71'],
//									          hAxis: {
//									            title: 'Time of Day',
//									            format: 'h:mm a',
//									            viewWindow: {
//									              min: [7, 30, 0],
//									              max: [17, 30, 0]
//									            }
//									          },
//									          vAxis: {
//									            title: 'Rating (scale of 1-10)'
//									          }
//									        };
//								      var chart = new google.visualization.BarChart(document.getElementById('columnchart_material'));
//									        
//									        chart.draw(data1, options);
//									    }
//
//									    google.load("visualization", "0", {
//									        packages: ["corechart"],
//									        callback: drawChart
//									    });
//									});
//							      
							      
							      
								}catch(e)
								{alert(e);}
								}).error(function(data, status, headers, config) {
									 $('#overlay').remove();
										jAlert('No Data Found','Information');
									console.log('error: data = ', data);
								});
								
							}
							}catch(e){
								alert(e);
								
							}
					
				});
			
scotchApp.controller('DevicestatisticsCtrl', function($scope,$http, $compile, $filter) {
				
				
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
								
								
										
								
								try{
									
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisedevicecount?controlid='+sptstr[7])
									.success(function(data, status, headers, config) {
										$scope.AvialDevice=0;
										$scope.damagedDev=0;
										$scope.soldtotal=0;
										
										for(var i=0;i<data.length;i++){
											//alert(data[i].availdevices+" "+data[i].solddevices);
											$scope.AvialDevice=Number($scope.AvialDevice)+Number(data[i].availdevices);
											$scope.soldtotal=Number($scope.soldtotal)+Number(data[i].solddevices);
										}
										
										try{
									 google.charts.load("current", {packages:["corechart"]});
								     google.charts.setOnLoadCallback(drawChart);
								      function drawChart() {
								        var data = google.visualization.arrayToDataTable([
								          ['Device', 'Status'],
								         // ['Total Device', Number($scope.totalDevice)],
								          ['Available',Number($scope.AvialDevice)],
								          ['Sold', Number($scope.soldtotal)],
								          ['Dameged',Number($scope.damagedDev)],
//								          ['SN',    7]
								        ]);

								        var options = {
								          title: 'Device Details',
								          pieHole: 0.4,
								          pieSliceText: 'value'
								        };

								        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
								        chart.draw(data, options);
								      }
										}catch(e){
											alert(e);
										}
								     
									}).error(function(data, status,headers, config) {
											console.log('error: data = ',data);
							
										}); 

									}catch(e){
										alert(e);
									}

								
									
									try{
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed=50')
										.success(
												function(data, status, headers,
														config) {
														//alert(data);
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
													//alert($scope.green+" "+$scope.red+" "+$scope.yellow+" "+$scope.not_working_devices);
										FusionCharts.ready(function () {
											
										    var revenueChart = new FusionCharts({
										        type: 'doughnut3d',
										        renderAt: 'chart-container1',
										        width: '300',
										        height: '400',
										        dataFormat: 'json',
										        dataSource: {
										            "chart": {
										                "caption": "Vehicle Details",
										                "subCaption": "",
										                "numberPrefix": "",
										                "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
										                "bgColor": "#ffffff",
										                "showBorder": "0",
										                "use3DLighting": "0",
										                "showShadow": "0",
										                "enableSmartLabels": "0",
										                "startingAngle": "250",
										                "showLabels": "0",
										                "showPercentValues": "0",
										                "showLegend": "1",
										                "legendShadow": "0",
										                "legendBorderAlpha": "0",                                
										                "decimals": "0",
										                "captionFontSize": "16",
										                "subcaptionFontSize": "14",
										                "subcaptionFontBold": "0",
										                "toolTipColor": "#ffffff",
										                "toolTipBorderThickness": "0",
										                "toolTipBgColor": "#000000",
										                "toolTipBgAlpha": "80",
										                "toolTipBorderRadius": "2",
										                "toolTipPadding": "5",
										            },
										            "data": [
										                {
										                    "label": "Stop",
										                    "value": $scope.red
										                }, 
										                {
										                    "label": "Running",
										                    "value": $scope.green
										                }, 
										                {
										                    "label": "Halt",
										                    "value": $scope.yellow
										                },
										                {
										                    "label": "Not Working",
										                    "value": $scope.not_working_devices
										                }
										            ]
										        }
										    }).render();
										});
									});
									}
									catch(e){
										alert(e);
									}
									
									

									try{
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companywisedealercount?controlid='+sptstr[7])
										.success(function(data, status, headers, config) {
											
											$(function () {
											    function drawChart() {
											    	try{
											    	 var data1 = new google.visualization.DataTable();
												      data1.addColumn('string', 'Company');
												      data1.addColumn('number', 'Dealers');
												      for(var m = 0;m < data.length;m++){
//												    	  alert($scope.jsonArr[m].dealername+" "+$scope.jsonArr[m].count);
													      data1.addRows([
													        [String(data[m].companyname), Number(data[m].dealercount)]
													      ]);
												      }
											    	}catch(e){
											    		//alert(e);
											    	}
											    	
										       var options = {
											            title: '',
											           // colors: ["rgb(212,174,7)" ],
														 is3D: true,
														 bar: {groupWidth: '20%'},
														    isStacked: true,
														    hAxis: {
													            minValue: 0, format: '0'
													          },
														legend:'bottom',
														 width: 400,
														 pieSliceText: 'value'
										 			
											        };
										      var chart = new google.visualization.BarChart(document.getElementById('barchart_values'));
											        
											        chart.draw(data1, options);
											    }

											    google.load("visualization", "1", {
											        packages: ["corechart"],
											        callback: drawChart
											    });
											});
										 
										});
									}
									catch(e)
									{
										alert(e);
									}

							
					
				});
			
scotchApp.controller('VehiclelivedetailsCtrl', function($scope,$http, $compile, $filter) {
	
	
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
			   		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.userclist = data;
//					 	data[0].companyname = 'All';
//					 	$scope.userclist.push(data[0]);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					

			   		$scope.pagesno = [20,50,80,100,120,240,360,450,'All'];
					$scope.pagesint=20;
					$scope.onpagechange = function(page){
						$scope.pagesint=page;
						
						if($scope.pagesint=='All')
							{
							$scope.pagesint=$scope.total_count;
						
							}
					}
					
					
					

					
					
					 try{
						 $("#Summaryexcel").click(function() {
//						 alert('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
//									sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+
//									$scope.total_count+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch);
						 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
									sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+
									$scope.total_count+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch).success(function(response){ 
//								alert(response.data);
								$scope.users12 = response.data; 
								var data;
					    	//getting values of current time for generating the file name
					    	var dt = new Date();
					    	var day = dt.getDate();
					    	var month = dt.getMonth() + 1;
					    	var year = dt.getFullYear();
					    	var hour = dt.getHours();
					    	var mins = dt.getMinutes();
					    	var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
					    	//creating a temporary HTML link element (they support setting file names)
					    	var a = document.createElement('a');
					    	//getting data from our div that contains the HTML table
					    	var data_type = 'data:application/vnd.ms-excel';//base64,' 
					    	var table_div = document.getElementById('deviceDiv');
					    	//alert("table_div"+table_div);
					    	var i=0;
					    	var table_html = "";
					    	table_html = table_html +"<html><body><table><thead>"+
					    	"<th><font>Sr. No</font></th>"+
					    	"<th><font>Vehicle No</font></th>"+
					    	"<th><font>Company</font></th>"+
					    	"<th><font>Location</font></th>"+
					    	"<th><font>Polling Time</font></th>"+
					    	"<th><font>Speed</font></th>"+
//					    	"<td><font>Status</font></td>"+
//					    	"<td><font>Vehicle Type</font></td>"+
					    	"<th><font>Ignition</font></th>"+
//					    	"<td><font>Direction</font></td>"+
					    	"<th><font>GPS Valid</font></th>"+
//					    	"<td><font>Overspeed</font></td>"+
					    	"</thead>";
					    	//alert(htmlString);
					    	try{
					    		//alert($scope.device.length);
					    	for(i=0;i<$scope.users12.length;i++){
					    	
					    	data  = $scope.users12[i];
					    	if(data.ignumber=='resources/imagenew/IGINOff.png'){
					    		data.ignumber = 'OFF';
					    	}else{
					    		data.ignumber = 'ON';
					    	}
					    	
					    	if(data.gpsstatus=='resources/images/GPSOFF.png'){
					    		data.gpsstatus = 'INVALID';
					    	}else{
					    		data.gpsstatus = 'VALID';
					    	}
					    	table_html = table_html + "<tr>"+
					    	"<td><font>"+data.rowno+"</font></td>"+
					    	"<td><font>"+data.vehicleid+"</font></td>"+
					    	"<td><font>"+data.cid+"</font></td>"+
					    	"<td><font>"+data.location+"</font></td>"+
					    	"<td><font>"+data.datatimestamp+"</font></td>"+
					    	"<td><font>"+data.vehiclespeed+"</font></td>"+
//					    	"<td><font>"+data.vehiclestatus+"</font></td>"+
//					    	"<td><font>"+data.vehicletype+"</font></td>"+
					    	"<td><font>"+data.ignumber+"</font></td>"+
//					    	"<td><font>"+data.directionname+"</font></td>"+
					    	"<td><font>"+data.gpsstatus+"</font></td>"+
//					    	"<td><font>"+data.overspeed+"</font></td>"+
					    	"</tr>";
					    			}
					    	}catch(e){alert(e);}
					    	table_html = table_html + "</table></body></html>";
					    	a.href = data_type + ', ' + table_html;
					    	//setting the file name
					    	a.download = 'Live_Details' + postfix + '.xls';
					    	a.click();
					    	//just in case, prevent default behaviour
					    	e.preventDefault(); 
					    	}).error(function(response){ 
//					    		alert("error"+response);
					    	});
						 });
						 
					}catch(e){alert(e);}
					
					$(document).ready(function(){
						//alert("in");
						  $('#popdanger1').popover({ 
						    html : true,
						    content: function() {
						      return $('#popover_content_wrapper1').html();
						    }
						  }).click(function(){
							  $(this).popover('show');
						  })
						});
					
					
					
					try
					{
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/nonpollingdetails?loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							//alert("data"+data);
							$scope.nonPollingDetails=data;
						}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});	
					}
					catch(e)
					{
						//alert("errr nonoll"+e);
						
					}
					
					
					
					
					
					
//					
//					$("#exportpdf").click(function(){
//						
//						try
//						{
//						$('#livesumm').tableExport({
//							type:'pdf',escape:'false',separator: ',',
//							tableName:'livesumary',
//							pdfFontSize:10,
//							htmlContent:'false',
//							consoleLog:'false',
//									}
//								);
//						}catch(e){}
//					});
					
					
					function printData()
					{
					   var divToPrint=document.getElementById("livesumm");
					   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=300,left=100,top=100";
						  var newWin = window.open('','',popup_win);
						   newWin.document.open();
					   var htmlToPrint = '' +
				        '<style type="text/css">' +
				        'table th, table td {' +
				        'border:1px solid #000;' +
				        'padding;0.5em;' +
				        '}' +
				        'tr:nth-child(even) {' +
				        'background:#bdbdbd; ' +
				         '}' +
				         'tr:nth-child(odd) {' +
					        'background:#d3d3d3; ' +
					         '}'+ 
				        '</style>';
				        htmlToPrint += divToPrint.outerHTML;
				        newWin = window.open("");
				        newWin.document.write(htmlToPrint);
				        newWin.print();
				        newWin.close();
					}
					$('#printbutton').on('click',function(){
					printData();
					})
					
					
				   mydate = new Date();

					$scope.compname=sptstr[3];
					
					
					$scope.name = sptstr[0];
					$scope.logout = function() {
						window.location.replace("/");
					}
					
		///first time dash
					try {
						
						
						$scope.keyc;
						$scope.getsorted = function(key){
							try{
								$scope.keyc = key;
								getData(key);
							}catch(e){
								//alert(e);
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
						
						
						$scope.searchvehicle = function(){
//				 			alert($scope.compsearch);
							if($scope.compsearch == 'All'){
								$scope.users = $scope.alldata;
							}else{
								$scope.getData($scope.pageno);
						   }
						}
						
						$scope.usersd = []; //declare an empty array
						$scope.pageno = 1; // initialize page no to 1
						$scope.total_count = 0;
//						$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
						$scope.limit=60;
						//interval = setInterval(function(){
						$scope.compsearch = '';
						$scope.getData = function(pageno){ // This would fetch the data on page change.
							//In practice this should be in a factory.
							//alert("in data");
							$scope.usersd = [];
							$scope.page=pageno;
							//alert('livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.pagesint);
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+
									sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+
									$scope.pagesint+'&overspeedlimit='+$scope.limit+'&compname='+$scope.compsearch).success(function(response){ 
//								alert(response.total_count);
								$scope.users = response.data;  //ajax request to fetch data into vm.data
								$scope.total_count = response.total_count;
								$scope.alldata = response.data;;
								
				
											$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
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

			}).error(function(data, status, headers,
									config) {
								console.log(
										'error: data = ',
										data);
							});
											
				}).error(function(data, status, headers, config) {

									//console.log('error: data = ', data);
								});
						}
						
					//},5000);
						$scope.getData($scope.pageno); 
					}
					catch (e) {
			}
		
					
					$("#livevehiclesumspeedlimit").change(function () {
						$scope.limit=$( "#livevehiclesumspeedlimit option:selected" ).text();
						$scope.users = [];
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+$scope.page+'&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit).success(function(response){ 
//							alert(response.total_count);
							$scope.users = response.data; 
							//ajax request to fetch data into vm.data
							$scope.alldata = response.data; 
							$scope.total_count = response.total_count;
						});
						$scope.getData($scope.page); 
					});
					
					
					
					
//					$("#livesearchbyDeviceid").keypress(function(){
//						try
//						{
//							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
//							.success(function(response){ 
//								$scope.users = response.data; 
//								//ajax request to fetch data into vm.data
//								$scope.alldata = response.data; 
//								$scope.total_count = response.total_count;
//								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehiclebyname?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno=1&itemsPerPage='+$scope.pagesint+'&overspeedlimit='+$scope.limit+'&deviceid='+document.getElementById('livesearchbyDeviceid').value)
//								.success(function(response){ 
//									$scope.users = response.data; 
//									//ajax request to fetch data into vm.data
//									$scope.alldata = response.data; 
//									$scope.total_count = response.total_count;
//								});
//							});
//						}catch(e){}
//					});
//					
//					
//					
//					
					
					
					
					

					//time nterval
					try {
						interval = setInterval(function(){ 
							$scope.getData($scope.page);
//						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2])
//								.success(
//										function(data, status, headers, config) {
//											$scope.alldata = data;
//											getData($scope.keyc);
		
												
											$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gpsdetails?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&overspeed='+$scope.limit)
													.success(
															function(data, status, headers,
																	config) {
//			 													alert(data);
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
		//
		//
			$(function () {
			function drawChart() {
		
			  var data = google.visualization.arrayToDataTable([
			    ['task', '', { role: 'style' }],
			    ['Working Devices', $scope.working_devices,'Green'],
			    ['Non Working Devices', $scope.not_working_devices,'Red']
			 ]);
		
			  var options = {
			    title: "",
			    bar: {groupWidth: '45%'},
			    isStacked: true,
			    legend: {position:'none'}
			  };
		//
			  var chart_div = document.getElementById('barchart');
			  var chart = new google.visualization.ColumnChart(chart_div);
		
			  
			  
			  chart.draw(data, options);
		
			}
		//
			google.load("visualization", "1", {
			    packages: ["corechart"],
			    callback: drawChart
			});
			});					}).error(function(data, status, headers,config) {
																console.log(
																		'error: data = ',
																		data);
															});
											
//				}).error(function(data, status, headers, config) {
//		//
//									console.log('error: data = ', data);
//								});
	}, 30000);
	}
					catch (e) {
			}
			
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

		


scotchApp.controller('userCtrl', function($scope,$http, $compile, $filter) {
	var time = new Date();
	var diffMs = (time-mydate); // milliseconds between now & Christmas
	var diffDays = Math.round(diffMs / 86400000); // days
	var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
	var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
	if(diffMins>20){
		jAlert('Session Expired Please Login Again','Information');
		window.location.replace("/");
	}
	$scope.userdetailslistnew = []
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
	$scope.pagesno = [20,50,80,100,120,240];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
	}
	mydate = new Date();
	clearInterval(interval);
	$scope.searchbyusername='';
	try
	{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7]+'&searchusername='+$scope.searchbyusername)
			.success(function(data, status, headers, config) {
		$scope.userdetailslist = data;
		$scope.getData17($scope.pageno); 
		}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
		});
	}catch(e){//alert("e"+e);
	}
	
	try
	{
	$scope.getData17 = function(pageno){ 
		$scope.userdetailslistnew = [];
	var start=0, end=0;
		if(pageno!=1){
			start = $scope.pagesint * (pageno-1);
			end = start + $scope.pagesint;
			start++;
		}else{
			start = 0;
			end = start + $scope.pagesint;
			start++;
		}
		for(var i=start;i<=end;i++){
			if(i<=$scope.userdetailslist.length){
				if($scope.searchbyusername!='')
					{
					if($scope.userdetailslist[i].includes($scope.searchbyusername))
						{
				$scope.userdetailslistnew.push($scope.userdetailslist[i-1]);
						}
					}
				else
					{
					$scope.userdetailslistnew.push($scope.userdetailslist[i-1]);
					}
			}
			else{
				break;
			}
		}	
		$scope.total_count = $scope.userdetailslist.length;
		};
	}catch(e){//alert("errrr"+e);
	}
	
	$("#searchBYUser").keypress(function(){
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7]+'&searchusername='+$scope.searchbyusername)
		.success(function(data, status, headers, config) {
	$scope.userdetailslistnew = data;
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7]+'&searchusername='+$scope.searchbyusername)
	.success(function(data, status, headers, config) {
		$scope.userdetailslistnew = data;

}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
});
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
	});
	});
	
	jQuery('#insertuserrolename').on('input propertychange paste', function() {
	    // do your stuff
	    var name = '';
	    name = document.getElementById("insertuserrolename").value;
	   var x = document.getElementById("insertusercompany");
	    if(name=='Dealer'){
	    	$scope.rname='Dealer';
	    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {

				$scope.userdlist = data;
				
				x.setAttribute("list", "insertuserdealerbind"); 
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
	    }else if(name=='Company' || name=='rawdataadmin'){
	    	$scope.rname='Company';
	    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
				$scope.userclist = data;
				x.setAttribute("list", "insertusercomapnybind");
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
	    }else if(name=='Customer'){
	    	$scope.rname='Customer';
	    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
				$scope.usercustlist = data;
				x.setAttribute("list", "insertusercustomerbind");
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
	    }else if(name=='Circle Admin'){
	    	$scope.rname='Circle Admin';
	    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/circledetails')
			.success(function(data, status, headers, config) {
				$scope.usercirclelist = data;
				x.setAttribute("list", "insertusercirclebind");
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
	    }else{

	    	var k =[];
	    	$scope.userclist = k;
		    $scope.userdlist = k;
		    x.setAttribute("list", "");
	    }
	});
	$scope.showuserdiv1 = function() {
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
	
	function printData()
	{
	   var divToPrint=document.getElementById("printTableuser");
	   var popup_win = "toolbar=yes,location=no,directories=yes,menubar=yes,scrollbars=yes,width=600,height=600,left=100,top=100";
		  var newWin = window.open('','',popup_win);
		   newWin.document.open();
	   
	   var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #000;' +
        'padding;0.5em;' +
        '}' +
        'tr:nth-child(even) {' +
        'background:#bdbdbd; ' +
         '}' +
         'tr:nth-child(odd) {' +
	        'background:#d3d3d3; ' +
	         '}'+ 
        '</style>';
        htmlToPrint += divToPrint.outerHTML;
        newWin = window.open("");
        newWin.document.write(htmlToPrint);
        newWin.print();
        newWin.close();
	}
	$('#printbutton').on('click',function(){
	printData();
	})
	
   
					  $('#exportpdf').click(function () {
//				    
				    try{
						//alert("hhhhhhhhhi");
						var columns = ["Row NO", "Role Name","Login Name","Password","Company Name"];
						var i=0;
				        
				      	var data1=[];
						for(i=0;i<$scope.userdetailslist.length;i++){
				         var data  = $scope.userdetailslist[i];
				    		 data1.push([data.rowno,data.rolename ,data.loginname,data.password,data.dealername]);
				    		}
				     var doc = new jsPDF('landscape','pt');
				       doc.autoTable(columns, data1);
				         doc.save("Users.pdf");
			     }
				    catch(e)
				    { 	alert(e.message);
				    }
				    
				      });
	
try{
	$("#exportexcel").click(function() {
        var dt = new Date();
        var day = dt.getDate();
        var month = dt.getMonth() + 1;
        var year = dt.getFullYear();
        var hour = dt.getHours();
        var mins = dt.getMinutes();
        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
        var a = document.createElement('a');
        var data_type = 'data:application/vnd.ms-excel';//base64,' 
        var table_div = document.getElementById('userDiv');
        var i=0;
        var table_html = "";
         table_html = table_html +" <html><body><table><tr>"+
		"<td><font>Row No</font></td>"+
		"<td><font>Role Name</font></td>"+
		"<td><font>Login Name</font></td>"+
		"<td><font>Company Name</font></td>"
		"</tr>";
		try{
    	for(i=0;i<$scope.userdetailslist.length;i++){
    		data  = $scope.userdetailslist[i];
    		table_html = table_html + "<tr>"+
			"<td><font>"+data.rowno+"</font></td>"+
			"<td><font>"+data.rolename+"</font></td>"+
			"<td><font>"+data.loginname+"</font></td>"+
			"<td><font>"+data.dealername+"</font></td>"
			"</tr>";
					}
			}catch(e){}
		table_html = table_html + "</table></body></html>";
        a.href = data_type + ', ' + table_html;
        a.download = 'User_Details' + postfix + '.xls';
        a.click();
         e.preventDefault(); 
    });}catch(e){alert("sss"+e);}


$scope.deleteuser = function(deleteuserid){
		try
		{
		jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
			if(r){
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdelete?id='+deleteuserid.loginid)
		.success(function(data, status, headers, config) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7])
			.success(function(data, status, headers, config) {
			$scope.userdetailslist = data;
			$scope.getData17($scope.pageno);
			jAlert('Record Deleted Successfully', 'Confirmation Results');
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
}).error(function(data, status, headers, config) {
				jAlert('Record Not Deleted','Information');
			console.log('error: data = ', data);
		});	}
		});
		}
		catch(e)
		{}}
	
	//rolebind
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {
	$scope.insertroledetailslist = data;
}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	$("#insertuserrolename").blur(function(){
			
		if(document.getElementById("insertuserrolename").value=="company")
			{
			
			document.getElementById("insertusercompany").value="Rosmerta Technologies Ltd";
			}
		else
			{
			document.getElementById("insertusercompany").value="";

			}
		  });
	
	try{
$scope.userInsert=function userInsert()
	{   var i=0;
		$scope.cid = sptstr[2];
	    if($scope.rname=='Dealer'){
			for(i=0;i<$scope.userdlist.length;i++)
			{
				if($scope.userdlist[i].dealername==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.userdlist[i].dealerid;
					}
			}
		}
		if($scope.rname=='Company'){
			for(i=0;i<$scope.userclist.length;i++)
			{
				if($scope.userclist[i].companyname==document.getElementById('insertusercompany').value)
					{
					
					$scope.usercomId=$scope.userclist[i].companyid;
					}
			}
		}else if($scope.rname=='rawdataadmin'){

			for(i=0;i<$scope.userclist.length;i++)
			{
				if($scope.userclist[i].companyname==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.userclist[i].companyid;
					}
			}
		}
// 		if($scope.rname=='Company'){
// 			for(i=0;i<$scope.userclist.length;i++)
// 			{
// 				if($scope.userclist[i].companyname==document.getElementById('insertusercompany').value)
// 					{
// 					$scope.usercomId=$scope.userclist[i].companyid;
// 		}
// 			}
// 		}
		else if($scope.rname=='Customer'){

			for(i=0;i<$scope.usercustlist.length;i++)
			{
				if($scope.usercustlist[i].customername==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.usercustlist[i].customerid;
// 					alert($scope.usercustlist[i].customerid);
			}
			}
		}else if($scope.rname=='Circle Admin'){

			for(i=0;i<$scope.usercirclelist.length;i++)
			{
				if($scope.usercirclelist[i].circlename==document.getElementById('insertusercompany').value)
					{
						$scope.usercomId=$scope.usercirclelist[i].circlecode;
	// 					alert($scope.usercustlist[i].customerid);
					}
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
       if (myinsertuser.insertuserloginname.value== "")
	      {  	 myinsertuser.insertuserloginname.focus();
		      }
	        else  if (myinsertuser.insertuserpassword.value== "")
	      {	 myinsertuser.insertuserpassword.focus();
		      }
	        else  if (myinsertuser.insertusercompany.value== "")
	      {
			 myinsertuser.insertusercompany.focus();
		      }
	          else  if (myinsertuser.insertuserrolename.value== "")
	      {
		    	 myinsertuser.insertuserrolename.focus();
		      }
	      else
	    	  {
	    	  var k=0;
	    	  if($scope.usercomId==null){
	    		  jAlert('Problem in Saving Records! Dealer Name Does Not Exist!','Information');
					 myinsertuser.insertusercompany.focus();
					k++;
				} 
	    	  
	    	  if($scope.userroleId==null){
	    		  jAlert('Problem in Saving Records!Role Name Does Not Exist!','Information');
					 myinsertuser.insertuserrolename.focus();
					k++;
				} 
	    	  if(k==0)
	    		  {
	    	  	  var i=0
		 			for(i=0;i<$scope.userdetailslist.length;i++)
		 				{
		 				$scope.userdetailslist[i].loginname==document.getElementById('insertuserloginname').value
		 				if($scope.userdetailslist[i].loginname==document.getElementById('insertuserloginname').value)
		 					{
		 			jAlert('Login Name Already Exists','Information');
		 					}
		 				else if($scope.userdetailslist[i].password==document.getElementById('insertuserpassword').value)
		 					{
		 					jAlert('Password Already Exists','Information');
							}
		 				}
	  	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userinsert?'+
				'&loginname='+document.getElementById('insertuserloginname').value+
				'&password='+document.getElementById('insertuserpassword').value+
				'&controlid='+sptstr[7]+'&roleid='+$scope.userroleId+
				'&ownersid='+$scope.usercomId+'&companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			jAlert('Record Inserted Successfully', 'Success Dialog'); 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7])
			.success(function(data, status, headers, config) {
				//alert("after insert"+data);
				$scope.userdetailslist = data;
				$scope.getData17($scope.pageno);
			}).error(function(data, status, headers, config) {
				jAlert('Unable to  Proceed Your Request','Information');
				console.log('error: data = ', data);
				var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=UserFormInsert',data);
				response.success(function(data, status, headers, config) {
				});
				response.error(function(data, status, headers, config) {
					//alert( "Exception details: " + JSON.stringify({data: data}));
				}); 
				console.log('error: data = ', data);
			});
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});  }	
	    	  }}}catch(e){	}
	
	$scope.userUpdate=function userUpdate()
	{	$scope.updateuserid=$scope.userdata.loginid;
		var i=0;
		var myedituser = document.useredit;
		     if (myedituser.edituserloginname.value== "")
	      {
		    	
		    	 myedituser.edituserloginname.focus();
		      }
	      else if (myedituser.edituserrolename.value== "")
	      {
		    	
		    	 myedituser.edituserrolename.focus();
		      }
	      else if (myedituser.editusercompname.value== "")
	      {
		    	
		    	 myedituser.editusercompname.focus();
		      }
	      else if (myedituser.edituserpass.value== "")
	      {
		    	
		    	 myedituser.edituserpass.focus();
		      }
		else{
			var k=0;
    	  if(k==0)
    		  {
    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userupdate?loginid='+$scope.updateuserid+
				'&loginname='+document.getElementById('edituserloginname').value+
				'&password='+document.getElementById('edituserpass').value+
				'&controlid='+$scope.userdata.controlid+'&roleid='+$scope.userdata.roleid+
				'&ownersid='+$scope.userdata.ownersid+'&companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			document.getElementById("mainuser").hidden = false;
			document.getElementById("showedituser").hidden = true;
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.userdetailslist = data;
				$scope.getData17($scope.pageno);
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			jAlert('Record Updated Successfully', 'Success Dialog'); 
			document.getElementById('useredit').reset(); 
	}).error(function(data, status, headers, config) {
		jAlert('Unable to  Proceed Your Request','Information');
		console.log('error: data = ', data);
		var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=UserFormUpdate',data);
		response.success(function(data, status, headers, config) {
		});
		response.error(function(data, status, headers, config) {
		}); 
			console.log('error: data = ', data);
		});
   		  }}}
});
	
