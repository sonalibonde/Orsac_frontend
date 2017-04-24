/**
 * 
 */


scotchApp.controller('iginitonCtrl', function($scope,$http, $compile, $filter)
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
			
	
				
//	exelexport			
	
				$("#table1").click(function(){
					
					try
					{
					$('#idlehoursdatewise').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'History Log',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
						
						}
					
					);

					}catch(e){}
				});
				
	
				
				
				
$("#table2").click(function(){
					
					try
					{
					$('#idlehouresdaterange').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'History Log',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
						
						}
					
					);

					}catch(e){}
				});
				
				
				


$("#table3").click(function(){
					
					try
					{
					$('#idlehoursparticularDay').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'History Log',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
						
						}
					
					);

					}catch(e){}
				});
				
				


$("#table4").click(function(){
	
	try
	{
	$('#idlehoursparticularrangewise').tableExport({
		type:'excel',escape:'false',separator: ',',
		tableName:'History Log',
		
		pdfFontSize:10,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);

	}catch(e){}
});

				
				
	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
		$scope.reportvehicledetails = data;
	
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	

$("#reportallvehicles").change(function () {
		
        var name = this.value;
       
        if(name=='For All vehicles By Date')
        {
        	document.getElementById('idelhoursallday').hidden=false;
        	
        	document.getElementById('idelhoursallrangewise').hidden=true;
        	document.getElementById('idlehoursparticulardate').hidden=true;	
        	document.getElementById('idlehoursparticulaRange').hidden=true;
			
	    }
        else if(name=='For All Vehicles  By Date Range'){
        	document.getElementById('idelhoursallrangewise').hidden=false;	
	    
        	document.getElementById('idelhoursallday').hidden=true;
        	document.getElementById('idlehoursparticulardate').hidden=true;
        	document.getElementById('idlehoursparticulaRange').hidden=true;
	    }
        else if(name=='For Particular vehicles By Date')
	    {
        	document.getElementById('idlehoursparticulardate').hidden=false;

        	
        	document.getElementById('idelhoursallday').hidden=true;
        	
        	document.getElementById('idelhoursallrangewise').hidden=true;
        	document.getElementById('idlehoursparticulaRange').hidden=true;
        	
	    	
	    }
	    else if(name=='For Particular Vehicle By Date Range')
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
	
	//paginatio
	$scope.ignitiondetailsdaterangenew = [];
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
//	$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
	
	$scope.getData33 = function(pageno){ 
		$scope.ignitiondetailsdaterangenew = [];
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
				$scope.ignitiondetailsdaterangenew.push($scope.idelhoursdetailsdaterange[i-1]);
			}else{
				break;
			}
		}
			
			$scope.total_count = $scope.idelhoursdetailsdaterange.length;
		
	};
	
	
	
	
	
$scope.getIgnitiondaterange=function()
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
//// '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
'</div>';
$(over).appendTo('body');

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionReportDetails?vehicleno='+document.getElementById('datewisevehicleno').value+'&fdate='+document.getElementById('particularvehicledate1').value+'&tdate='+document.getElementById('particularvehicledate2').value+'&loginid1='+sptstr[2])
	.success(function(data, status, headers, config) {
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionreport')
		.success(function(data, status, headers, config) {
		 $scope.idelhoursdetailsdaterange=data;
		 $scope.getData33($scope.pageno); 
		document.getElementById('idlehoursparticularrangewise').hidden=false;
		document.getElementById('idlehourstable4').hidden=false;
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
	$scope.getData33 = function(pageno){ 
		$scope.ignitiondetailsdatenew = [];
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
				$scope.ignitiondetailsdatenew.push($scope.idelhoursdetailsdate[i-1]);
			}else{
				break;
			}
		}
			
			$scope.total_count = $scope.idelhoursdetailsdate.length;
		
	};
	
$scope.getigmitiondatewise=function() 
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
//// '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
'</div>';
$(over).appendTo('body');
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionReportDetails?vehicleno='+document.getElementById('daywisevehicleno').value+'&fdate='+document.getElementById('particularvehicleday').value+'&tdate=&loginid1='+sptstr[2])
	.success(function(data, status, headers, config) {
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionreport')
		.success(function(data, status, headers, config) {
		 $scope.idelhoursdetailsdate=data;
		 $scope.getData33($scope.pageno); 
		 document.getElementById('idlehoursparticularDay').hidden=false;
			document.getElementById('idlehourstable3').hidden=false;
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
	$scope.ignitiondetailsdaterangeAllnew = [];
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
//	$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
	
	$scope.getData33 = function(pageno){ 
		$scope.ignitiondetailsdaterangeAllnew = [];
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
				$scope.ignitiondetailsdaterangeAllnew.push($scope.idelhoursdetailsAll[i-1]);
			}else{
				break;
			}
		}
			
			$scope.total_count = $scope.idelhoursdetailsAll.length;
		
	};
	
	
	
	
	
	
$scope.getignitionrangewiseall=function()
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
//// '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
'</div>';
$(over).appendTo('body');
	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionReportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesdate1').value+'&tdate='+document.getElementById('allvehiclesdate2').value+'&loginid1='+sptstr[2])
	.success(function(data, status, headers, config) {

		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionreport')
			.success(function(data, status, headers, config) {
			 $scope.idelhoursdetailsAll=data;
			 $scope.getData33($scope.pageno); 
			 document.getElementById('idlehouresdaterange').hidden=false;
			 document.getElementById('idlehourstable2').hidden=false;
		 	});
		$('#overlay').remove();
		}).error(function(data, status, headers, config) {
			 $('#overlay').remove();
			 jAlert('No Data Found','Information');
			console.log('error: data = ', data);
			
		});

}
}	
}catch(e){};







$scope.ignitiondetailsdaterAllnew = [];
$scope.pageno = 1; // initialize page no to 1
$scope.total_count = 0;
//$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down

$scope.getData33 = function(pageno){ 
	$scope.ignitiondetailsdaterAllnew = [];
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
			$scope.ignitiondetailsdaterAllnew.push($scope.idelhoursdetailsAlldate[i-1]);
		}else{
			break;
		}
	}
		
		$scope.total_count = $scope.idelhoursdetailsAlldate.length;
	
};


$scope.getignitionAlldate=function()
{
	
	var myform2 = document.daywisallform;
      if (myform2.allvehiclesDay.value== "")
      {
    	  myform2.allvehiclesDay.focus();
      }
      else
    	  {
	 var over = '<div id="overlay">' +
//// '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
'</div>';
$(over).appendTo('body');
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionReportDetails?vehicleno=&fdate='+document.getElementById('allvehiclesDay').value+'&tdate=&loginid1='+sptstr[2])
.success(function(data, status, headers, config) {

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/ignitionreport')
		.success(function(data, status, headers, config) {
			alert(data);
		 $scope.idelhoursdetailsAlldate=data;
		 $scope.getData33($scope.pageno); 
		 document.getElementById('idlehoursdatewise').hidden=false;
		 document.getElementById('idlehourstable1').hidden=false;
		});
	$('#overlay').remove();
	}).error(function(data, status, headers, config) {
		 $('#overlay').remove();
		 jAlert('No Data Found','Information');
		console.log('error: data = ', data);
		
	});


}

}










	
		});