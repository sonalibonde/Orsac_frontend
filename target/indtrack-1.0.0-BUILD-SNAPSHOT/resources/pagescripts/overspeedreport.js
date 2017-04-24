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
					$scope.overspeedvehdeatils = data;
							}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			
				
			
				$("#overspeedexcel").click(function(){
					
					try
					{
					$('#overspeedtable').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'History Log',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
						
						}
					
					);

					}catch(e){}
				});
				
				
				
				
				
				 $scope.limit=50;
				
				$scope.getoverspeedReport=function()
				{
					var myform3 = document.overspeedForm;
				      if (myform3.overspeedVehicleno.value== "")
				      {
				    	  myform3.overspeedVehicleno.focus();
				      }
				      else  if(myform3.overspeedfromndate.value== "")
				      {
				    	  myform3.overspeedfromndate.focus();
				      }
				      else  if(myform3.overspeedtodate.value== "")
				      {
				    	  myform3.overspeedtodate.focus();
				      }
				      else
				    	  {
					
					var over = '<div id="overlay">' +
//				     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
				     '</div>';
				    $(over).appendTo('body');
				    
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/overspeedReport?vehicleno='+document.getElementById('overspeedVehicleno').value+'&fromdate='+document.getElementById('overspeedfromndate').value+'&todate='+document.getElementById('overspeedtodate').value+'&overspeedlimit='+$scope.limit)
				.success(function(data, status, headers, config) {
					$scope.overspeeddetails = data;
				if(data.length==0)
						{
					$('#overlay').remove();
						jAlert('No Data Found','Information');
						}else
							{
						
								document.getElementById('overspeedtable1').hidden=false;
								document.getElementById('overspeedtable').hidden=false;


//					$scope.fromdate=document.getElementById('overspeedfromndate').value;
//					$scope.todate=document.getElementById('overspeedtodate').value;
//					$scope.speed=data[0].vehiclespeed;
							}
					$('#overlay').remove();
					}).error(function(data, status, headers, config) {
						 $('#overlay').remove();
							jAlert('No Data Found','Information');
						console.log('error: data = ', data);
					});
				    	  }
				}
				
	
	
});