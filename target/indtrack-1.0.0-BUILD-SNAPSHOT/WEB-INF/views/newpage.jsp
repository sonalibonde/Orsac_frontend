<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en" ng-app="scotchApp">
<head>
  <title>E-Locator Vehicle tracking system</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <script src="resources/assets/alertjs/js/jquery.js"></script> -->
<!--   <link rel="shortcut icon" href="resources/assets/images/logonew.png"> -->
<!--   <link rel="stylesheet" href="resources/assets/alertjs/jquery.alerts.css"> -->
<!--   <link rel="stylesheet" href="resources/assets/fonts/fonts.googleapis.com.css" > -->
<!--   <link rel="stylesheet" href="resources/assets/font-awesome/4.2.0/css/font-awesome.min.css"> -->
<!--   <link rel="stylesheet" href="resources/assets/css/ace.min.css"> -->
<!--   <link rel="stylesheet" type="text/css" href="resources/assets/navcssnew11.css"> -->
<!--   <link rel="stylesheet" type="text/css" href="resources/assets/style11.css"> -->
<!--   <link rel="stylesheet" type="text/css" href="resources/mainjavascript/font-awesome.css"> -->
<!--  <link rel="stylesheet" type="text/css" href="resources/mainjavascript/loginpagescript/bootstrap.min.css"> -->
<!--  <link rel="stylesheet" href="resources/mainjavascript/datepicker3.css"> -->
<!--  <link rel="stylesheet" href="resources/css/alert.css" /> -->
<!--  <link href="resources/timepicker/css/timepicki.css" rel="stylesheet"> -->
  
<!--  <script src="resources/assets/alertjs/js/jquery.ui.draggable.js"></script> -->
<!--  <script src="resources/assets/alertjs/js/jquery.alerts.js"></script> -->
 
 <script src="resources/mainjavascript/angular.min.js"></script>
 <script src="resources/mainjavascript/angular-route.js"></script>
<!--  <script src="resources/mainjavascript/dirPagination.js"></script> -->
<!--  <script src="resources/mainjavascript/jquery.min.js"></script> -->
<!--  <script src="resources/mainjavascript/bootstrap.min.js"></script> -->
<!--  <script src="resources/mainjavascript/jquery-ui.js"></script> -->
<!--  <script src="resources/mainjavascript/bootstrap-datepicker.js"></script> -->
<!--  <script src="resources/mainjavascript/ui-bootstrap-tpls.js"></script> -->
<!--  <script src="resources/mainjavascript/jsapi"></script> -->
<!--  <script src="resources/mainjavascript/loader.js"></script> -->
<!-- <script src="resources/mainjavascript/highcharts.js"></script> -->
<!-- <script src="resources/mainjavascript/highcharts-3d.js"></script> -->

<!-- <script src="resources/assets/js/ace-elements.min.js"></script> -->
<!-- <script src="resources/assets/js/ace.min.js"></script> -->
<!-- <script src="resources/script/timpicker.js" type="text/javascript"></script> -->
<!--  <script src="resources/assets/newpdf/jspdf.min.js"></script>  -->
<!-- <script src="resources/assets/Exportjs/jquery.base64.js"></script> -->
<!-- <script src="resources/assets/Exportjs/tableExport.js"></script> -->
 

   


<style>
	#load{
    width:100%;
    height:100%;
    position:fixed;
	background-color:white;
    background:url('resources/assets/images/Preloader_7.gif') no-repeat center center rgba(0,0,0,0.25)
}
tr:nth-child(even) {background: 
#D7D6DE;} 
  tr:nth-child(odd){backgroundr: #d3d3d3;}	
  
  
  
</style>
	
	
	
	 
	  <script>
	  
	  
	  document.onreadystatechange = function () {
		  var state = document.readyState
		  if (state == 'interactive') {
		       document.getElementById('contents').style.visibility="hidden";
		  } else if (state == 'complete') {
		      setTimeout(function(){
		         document.getElementById('interactive');
		         document.getElementById('load').style.visibility="hidden";
		         document.getElementById('contents').style.visibility="visible";
		      },1000);
		  }
		}
	
   $(document).ready(function() {
	  $('[data-toggle=offcanvas]').click(function() {
	    $('.row-offcanvas').toggleClass('active');
	  });
	});

    var key = "${key}";
	var sptstr = key.split("&&");
	var mydate = new Date(sptstr[5]);
	jQuery(function($) {
		 
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
	
	function distance(lat1, lon1, lat2, lon2, unit) {
		var radlat1 = Math.PI * lat1/180
		var radlat2 = Math.PI * lat2/180
		var theta = lon1-lon2
		var radtheta = Math.PI * theta/180
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
		dist = Math.acos(dist)
		dist = dist * 180/Math.PI
		dist = dist * 60 * 1.1515
		if (unit=="K") { dist = dist * 1.609344 }
		if (unit=="N") { dist = dist * 0.8684 }
		return dist;
	}
	
	function isNumberKey(evt)
       {
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;
  return true;
       }
	
	function PhoneValidation(ob) {
	  		var invalidChars = /[^0-9]/gi;
	 		 if(invalidChars.test(ob.value)) {
				document.getElementById('idmsg').hidden=false;
			 	ob.value = ob.value.replace(invalidChars,"");
			 	
			 	return false;
		  }
	 		 else
	 			 {	document.getElementById('idmsg').hidden=true;}
			}
	
	
	
	
	function alternateValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idmsg2').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	
		 	return false;
	  }
 		 else
 			 {	document.getElementById('idmsg2').hidden=true;}
		}

	
	
	
	function lengthValidation(obj)
	{	var number = (obj.value).length;
		if(number<10) {
	document.getElementById('length').hidden=false;
 		 	obj.value = ob.value.replace(number,"");
 	}	else	{	document.getElementById('length').hidden=true;}
		}
	
	
	
	
	function landlineValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idmsg1').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	
		 	return false;
	  }
 		 else
 			 {	document.getElementById('idmsg1').hidden=true;}
		}

	
	
	
	function simValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idsim').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 		 	return false;
	  }else
		{
		document.getElementById('idsim').hidden=true;}
		}
function simlengthValidation(obj)
{	var number = (obj.value).length;
	
	if(number<20) {

		document.getElementById('simnolength').hidden=false;
		 	obj.value = ob.value.replace(number,"");
	}else
	{
	document.getElementById('simnolength').hidden=true;}
	}
function deviceValidation(ob) {
		var invalidChars = /[^0-9]/gi;
		 if(invalidChars.test(ob.value)) {
		document.getElementById('iddeviceno').hidden=false;
	 	ob.value = ob.value.replace(invalidChars,"");
		 	return false;
  }	else
	{
	document.getElementById('iddeviceno').hidden=true;}
	}

function devicenolengthValidation(obj)
{	var number = (obj.value).length;

if(number<15) {
document.getElementById('devicenolength').hidden=false;
	 	obj.value = ob.value.replace(number,"");
}
else
{
document.getElementById('devicenolength').hidden=true;}
}	
function invoicecharvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('invoicechar').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	
		 	return false;
	  }else
 		{
 		document.getElementById('invoicechar').hidden=true;}
		}
	
	function invoicenolegth(obj)
	{
  		var number = (obj.value).length;
  		
  		 if(number<15) {
		document.getElementById('invoicelength').hidden=false;
		document.getElementById('insertdealerassinvoiceno').value="";
 		 obj.value = ob.value.replace(number,"");
	}
  		else
 		{
 		document.getElementById('invoicelength').hidden=true;}
		}
	
		function faxvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('faxdata').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 		 	return false;
	  }
 		else
 		{
 		document.getElementById('faxdata').hidden=true;}
		}
	
	
	function faxvalidlength(obj)
	{
  		var number = (obj.value).length;
  		
  		 if(number<10) {
		document.getElementById('faxval').hidden=false;
		document.getElementById('fax1').value="";
 		 obj.value = ob.value.replace(number,"");
	}
  		else
 		{
 		document.getElementById('faxval').hidden=true;}
	}

	function chqcharvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('cheqhar').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	
		 	return false;
	  }
 		else
 		{
 		document.getElementById('cheqhar').hidden=true;}
		}
			function chqnolegth(obj)
	{
  		var number = (obj.value).length;
  		
  		 if(number<6) {
		document.getElementById('chqlength').hidden=false;
		 obj.value = ob.value.replace(number,"");
	}
  		else
 		{
 		document.getElementById('chqlength').hidden=true;}
	
	}		
	function ponumber(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('ponu').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
			 	return false;
	  }else
 		{
 		document.getElementById('ponu').hidden=true;}
		}
	
		try
	{
	var iname = "iname";
	var h = 0;
	function changeIt()
	{	h++;
	var id= iname + h;
		var div = document.createElement('DIV');
  	    div.innerHTML = "<br> <label><font color='black'>Type Of Tax</font></label><input type='text' class='form-control' name='' placeholder='Type of tax'><br><label ><font color='black'>Value</font></label><input type='text' class='form-control' placeholder='Tax value' name='"+id+"' id='"+id+"'>";
		document.getElementById("my_div").appendChild(div);
		} 
	$(function() { 
		$('.datepick').datepicker({ 
		    format: "dd-M-yyyy", 
		    endDate: '+0d', 
		    autoclose: true 
		});   
		 $('.datepick').datepicker('setDate', '+0d'); 
	}); 
	}catch(e)
	{	alert(e);
	}
	
	
		
		var interval;
		var scotchApp = angular.module('scotchApp', ['ngRoute']);
	// configure our routes
	scotchApp.config(function($routeProvider) {
		$routeProvider
	// route for the home page
			.when('/home', {
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
			})
			.
			when('/report', {
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
// .otherwise({
// 				redirectTo : '/' 
// 			});
	});

	
	scotchApp.controller('MapCtrl', function($scope,$http, $compile, $filter) {
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
	

	function distance(lat1, lon1, lat2, lon2, unit) {
		var radlat1 = Math.PI * lat1/180
		var radlat2 = Math.PI * lat2/180
		var theta = lon1-lon2
		var radtheta = Math.PI * theta/180
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
		dist = Math.acos(dist)
		dist = dist * 180/Math.PI
		dist = dist * 60 * 1.1515
		if (unit=="K") { dist = dist * 1.609344 }
		if (unit=="N") { dist = dist * 0.8684 }
		return dist;
	}
	
	</script>
	
	<script src="resources/timepicker/js/timepicki.js"></script>
	<script src="resources/pagescripts/scripvendor.js"></script>
<!-- 	,Daywise1.js,makectrl.js,modelctrl.js,dealerdashboard2.js,compcontroller.js,bangaloreimei.js,historyctrl1.js,customerdashboard.js,vehiclecontrol.js,idelhourctrl.js,overspeedreport.js"></script> -->
	<script src="resources/pagescripts/Daywise1.js"></script>
	<script src="resources/pagescripts/makectrl.js"></script>
	<script src="resources/pagescripts/modelctrl.js"></script>
	<script src="resources/pagescripts/dealerdashboard2.js"></script>
	<script src="resources/pagescripts/compcontroller.js"></script>
	<script src="resources/pagescripts/bangaloreimei.js"></script>
	<script src="resources/pagescripts/historyctrl1.js"></script>
	<script src="resources/pagescripts/customerdashboard.js"></script>
	<script src="resources/pagescripts/vehiclecontrol.js"></script>
	<script src="resources/pagescripts/idelhourctrl.js"></script>
	<script src="resources/pagescripts/overspeedreport.js"></script>
	
	
	
	

	<script>
	
	
	scotchApp.controller('mainController', function($scope,$http, $compile, $filter,$location) {
		alert("in main");
		clearInterval(interval);
		$scope.loginid = sptstr[2];
		$scope.roleid = sptstr[6];
		if($scope.roleid=='1002'){
		 $location.path('/Dealerdashnew');
		}else if($scope.roleid=='1003'){
			 $location.path('/home');
		}else if($scope.roleid=='1004'){
			 $location.path('/admindash');
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
				
// 		    //mydate = new Date();

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

				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menus = data;
			}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
				});
			}
			else{

				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1]+'&roleid='+sptstr[sptstr.length-2])
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


	
	
	
	scotchApp.controller('roleController', function($scope,$http, $compile, $filter) {
		try {
			
			
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
				
				function printData()
				{
				   var divToPrint=document.getElementById("printTablerole");
				   newWin= window.open("");
				   
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
				
				
			$("#exportpdf").click(function(){
				
				try
				{
				$('#printTablerole').tableExport({
					type:'pdf',escape:'false',separator: ',',
					tableName:'Company',
					
					pdfFontSize:10,
					
					htmlContent:'false',
					consoleLog:'false',
					
					}
				
				);
				}catch(e){alert(e);}
			});
				
				


				
				
		$("#exportexcel").click(function(){
			
			try
			{
			$('#printTablerole').tableExport({
				type:'excel',escape:'false',separator: ',',
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

					
				
				
				
				$scope.deleterole = function(deleteroleid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){ 
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledelete?id='+deleteroleid.roleid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.roledet = data;
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
		   		
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.roledet = data;
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});

			
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

				$scope.roleinsertform = function roleinsertform() {
					var myForm = document.roleinsert;
				      if (myForm.rolenameinsert.value== "")
				      {
				    	
				    	 myForm.rolenameinsert.focus();
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
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);

														});
									}).error(
									function(data, status, headers, config) {
										
								var i=0;
						for(i=0;i<$scope.roledet.length;i++)
						{
						if($scope.roledet[i].rolename==document.getElementById('rolenameinsert').value)
						{
					jAlert('Problem in Saving Records!Role Name Already Exists', 'Information');
					}
				}
										console.log('error: data = ', data);
									});
					   }
				}
			$scope.roleupdate = function roleupdate() {
						try
						{
						var i=0;
					
						}catch(e){alert(e);}
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
											var i=0;
											for(i=0;i<$scope.roledet.length;i++)
											{
											if($scope.roledet[i].rolename==document.getElementById('editrolename').value)
											{
										jAlert('Problem in Saving Records!Role Name Already Exists', 'Information');
										}
									}
											console.log('error: data = ', data);
										});
					}

		}
			} catch (e) {
				alert(e);
			}
		});
	
	
	scotchApp.controller('menuCtrl', function($scope,$http, $compile, $filter) {
		try {
			
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
				
				
				function printData()
				{
				   var divToPrint=document.getElementById("menutable");
				   newWin= window.open("");
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
				
				
			$("#exportpdf").click(function(){
				try
	 			{
				$('#menutable').tableExport({
	 				type:'pdf',escape:'false',
	 				tableName:'Company',
	 				pdfFontSize:8,
	 				orientation:'landscape',
	 				formate:'a4',
	 				htmlContent:'false',
	 				consoleLog:'false',
					}
				);
	 			}catch(e){alert(e);}
				
		});
				
				
				
				$("#exportexcel").click(function(){
					
					try
					{
					$('#menutable').tableExport({
						type:'excel',escape:'false',separator: ',',
						tableName:'menu',
						
						pdfFontSize:10,
						
						htmlContent:'false',
						consoleLog:'false',
							}
					
					);
				
					}catch(e){alert(e);}
				});
				
				$scope.deletemenu = function(menuasignid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudelete?id='+menuasignid.menuid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
						.success(function(data, status, headers, config) {
							$scope.menusdetails = data;
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
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
					.success(function(data, status, headers, config) {
						$scope.menusdetails = data;
		//					alert(data);
		
					}).error(function(data, status, headers, config) {
		// 				alert(data);
						console.log('error: data = ', data);
					});
				
				$scope.showmenudiv1 = function() {
					//alert("in");
					document.getElementById("showeditmenu").hidden = false;
					document.getElementById("mainmenu").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("mainmenu").hidden = false;
					document.getElementById("showeditmenu").hidden = true;
				} 
				
				
				$scope.menuData = function menuData(editname) {
					$scope.menueditdet = editname;
					
				}

				$scope.menuinsert = function menuinsert() {
					var myForm = document.menuinsertform;
				      if (myForm.insertmenuname.value== "")
				      {
				    	 myForm.insertmenuname.focus();
				      }else if (myForm.insertnavigateurl.value== "")
				      {
					    	 myForm.insertnavigateurl.focus();
					    }
				      else if (myForm.insertorderno.value== "")
				      {
					    	 myForm.insertorderno.focus();
					    }
				     
					    else
						   {
							   var i=0;
							   
								for(i=0;i<$scope.menusdetails.length;i++){
									if($scope.menusdetails[i].menutext == document.getElementById('insertparentmenu').value)
									{
										$scope.menuparentidinsert=$scope.menusdetails[i].menuid;
									}
								}
								var url = document.getElementById("insertnavigateurl").value;
								url =  url.replace("#","");
								url =  url.replace("/","");
								if($scope.menuparentidinsert==null){
									$scope.menuparentidinsert='11';
								}
							
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuinsert?menutext='
									+document.getElementById("insertmenuname").value
									+'&description='+document.getElementById("insertdescription").value
									+'&navigateurl='+url
									+'&parentid='+$scope.menuparentidinsert+'&orderno='+document.getElementById("insertorderno").value
									).success(
											function(data, status, headers, config) {
//			 									
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
														.success(function(data, status, headers, config) {
																	$scope.menusdetails = data;
//		 															alert(data);
																})
														.error(function(data, status, headers, config) {
																	console.log('error: data = ',data);
//		 	 														
																});
												jAlert('Record Inserted Successfully', 'Success Dialog'); 
												document.getElementById("form2").reset(); 
											}).error(function(data, status, headers, config) {
											var i=0;
											for(i=0;i<$scope.menusdetails.length;i++)
												{
												if($scope.menusdetails[i].menutext==document.getElementById('insertmenuname').value)
										jAlert('Problem in Saving Records! Menu Name Already Exists','Information');
												}
												console.log('error: data = ', data);
											});
							   }
						   }
// 				}
				
				
// 				try{
				
				$scope.menueditform = function menueditform() {
// 			
					try{
					var myForm = document.menuupdateform;
				      if (myForm.updatemenuname.value== "")
				      {
				    	 myForm.updatemenuname.focus();
				      }else if (myForm.updatenavigateurl.value== "")
				      {
					    	 myForm.updatenavigateurl.focus();
					  }
				      else if (myForm.updateorderno.value== "")
				      {
					    	 myForm.updateorderno.focus();
					   }
				   else
				   {
					   var i=0;
					   
						for(i=0;i<$scope.menusdetails.length;i++){
							if($scope.menusdetails[i].menutext == document.getElementById('updateparentmenu').value)
							{
								$scope.menuparentidedit=$scope.menusdetails[i].menuid;
							}
						}
						
						
						var url = document.getElementById("updatenavigateurl").value;
						url =  url.replace("#","");
						url =  url.replace("/","");
						if($scope.menuparentidedit==null){
							$scope.menuparentidedit='11';
						}

					
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuupdate?menuid='
							+$scope.menueditdet.menuid+'&menutext='+document.getElementById("updatemenuname").value
							+'&description='+document.getElementById("updatedescription").value
							+'&navigateurl='+url
							+'&parentid='+$scope.menuparentidedit+'&orderno='+document.getElementById("updateorderno").value
							).success(
									function(data, status, headers, config) {
//	 									
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
												.success(function(data, status, headers, config) {
															$scope.menusdetails = data;
// 															alert(data);
															document.getElementById("mainmenu").hidden = false;
															document.getElementById("showeditmenu").hidden = true;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('menuupdateform').reset(); 
									}).error(function(data, status, headers, config) {
								jAlert('Record Not Inserted','Information');
										console.log('error: data = ', data);
									});
					   }
					}catch(e){alert(e);}
				}		
			} catch (e) {
				alert(e);
			}
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
				window.location.replace("Logout");
			}
			mydate = new Date();
			
			clearInterval(interval);
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
				
				function printData()
				{
				   var divToPrint=document.getElementById("printTablemenuass");
				   newWin= window.open("");
				   
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
				
				
			$("#exportpdf").click(function(){
				
				try
				{
				$('#printTablemenuass').tableExport({
					type:'pdf',escape:'false',separator: ',',
					tableName:'Company',
					
					pdfFontSize:10,
					
					htmlContent:'false',
					consoleLog:'false',
					
					}
				
				);
				}catch(e){alert(e);}
			});
				
				


				
				
			$("#exportexcel").click(function(){

			try
			{
			$('#printTablemenuass').tableExport({
				type:'excel',escape:'false',separator: ',',
				tableName:'Company',
				
				pdfFontSize:10,
				
				htmlContent:'false',
				consoleLog:'false',
				
				}

			);

			}catch(e){alert(e);}
			});

					
				$scope.deletemenuassign = function(menuasignid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuassigndelete?id='+menuasignid.mid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;
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
		   	
		   		
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
							$scope.menuassigndet = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
							$scope.roledetails = data;
						})
				.error(function(data, status, headers, config) {
							console.log('error: data = ',data);
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menudetails = data;
//						alert(data);

				}).error(function(data, status, headers, config) {
//	 				alert(data);
					console.log('error: data = ', data);
				});
			
				
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
// 										alert(data);
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1])
												.success(function(data, status, headers, config) {
// 															alert(data);
													$scope.menuassigndet = data;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
									}).error(
									function(data, status, headers, config) {
// 										alert(data);
										var i=0;
										for(i=0;i<$scope.menuassigndet.length;i++)
											{
											if(($scope.menuassigndet[i].menutext==document.getElementById('insertmenuassmenuname').value)&& $scope.menuassigndet[i].rolename==document.getElementById('insertmenuassrolename').value)
												{
										jAlert('Problem in Saving Records!Menu  Already Assigned ','Information');
												}
											
											}
										console.log('error: data = ', data);
									});
							}
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
//	 									
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
															//document.getElementById("errorsmsg").hidden = false;
														});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('menuassignUpdate').reset(); 
									}).error(function(data, status, headers, config) {
										jAlert('Record Not Inserted','Information');
// 										alert("error:"+data);
										//document.getElementById("errorsmsg").hidden = false;
										console.log('error: data = ', data);
									});
					   }
				}			} catch (e) {
				//alert(e);
			}
		});
	
	scotchApp.controller('DeviceCtrl', function($scope,$http, $compile, $filter) {
		
		
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
		
		$scope.pagesno = [20,50,80,100,120];
		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		

		function printData()
		{
		   var divToPrint=document.getElementById("printTable");
		   newWin= window.open("");
		   
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
//			   newWin.document.write(divToPrint.outerHTML);
//			   newWin.print();
//			   newWin.close();
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$("#exportpdf").click(function(){
		
		try
		{
		$('#printTabledevice').tableExport({
			type:'pdf',escape:'false',separator: ',',
			//ignoreColumn: [2,3],
			tableName:'Device',
			
			pdfFontSize:10,
			//pdfLeftMargin:20,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);
		}catch(e){alert(e);}
	});
		
		


		
		
$("#exportexcel").click(function(){
	
	try
	{
	$('#printTabledevice').tableExport({
		type:'excel',escape:'false',separator: ',',
		//ignoreColumn: [2,3],
		tableName:'Device',
		
		pdfFontSize:10,
		//pdfLeftMargin:20,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);

	}catch(e){alert(e);}
});

		
		
		$scope.deletedevice = function(deletedeviceid){
			jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
				if(r){ 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedelete?id='+deletedeviceid.deviceid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.device = data;
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
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
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
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.devicemakenamelist = data;
// 						alert($scope.devicemakenamelist);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					//	MODEL BIN
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.devicemodeldetails = data;
// 						alert($scope.devicemodeldetails);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
					
					
					//	vendordetails
					
					//	insertdevice
				$scope.devieinsert = function devieinsert() {
					try
					{
						$scope.deviceinsertvendordetails=null;
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
					{
						
				var i=0;chk=0;
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
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceinsert?makeid='+$scope.deviceinsertmakid+'&modelid='+$scope.deviceinsertmodelid+'&uniqueid='+document.getElementById('deviceinsertdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceinsertRemarkd').value+'&deviceid='+document.getElementById('deviceinsertdeviceid').value)
						.success(function(data, status, headers, config) {
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.device = data;
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
								jAlert('Record Inserted Successfully', 'Success Dialog'); 
						}).error(function(data, status, headers, config) {
							
									jAlert('Unable to  Proceed Your Request','Information');
									
							
							console.log('error: data = ', data);
						});
					}
							}}
					}catch(e){alert(e);}
					}
					
					//deviceupdate
					$scope.devieupdate = function devieupdate() 
					{
					
					var i=0;
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
					{
						
						var k=0;
						if($scope.deviceeditmakid==null){
							jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
// 							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Make Name Does Not Exist";
// 							//document.getElementById("errorsmsg").hidden = false;
							mydeviceedit.deviceditmake.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
						if($scope.deviceeditmodelid==null){
							jAlert('Problem in Saving Records! Model Name Does Not Exist!','Information');
// 							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Model Name Does Not Exist";
// 							//document.getElementById("errorsmsg").hidden = false;
							mydeviceedit.deviceeditmodel.focus();
							k++;
//								alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid);
						}
					
					//alert('http://localhost:8080/indtrackwebservice/rest/CallService/deviceupdate?deviceid='+$scope.deviceid1+'&makeid='+$scope.makid1+'&modelid='+$scope.modelid1+'&uniqueid='+document.getElementById('deviceno')+'&loginid=44001&remark='+document.getElementById('Remarkd1').value+'&companyid='+$scope.compyid1+'&assetid=110008&vendorid='+$scope.vendorid1);
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceupdate?deviceid='+$scope.editdevice.deviceid+'&makeid='+$scope.deviceeditmakid+'&modelid='+$scope.deviceeditmodelid+'&uniqueid='+document.getElementById('editdeviceno').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('deviceeditRemarkd1').value)
						.success(function(data, status, headers, config) {
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status,	headers, config) {
							$scope.device = data;
							document.getElementById("devicemain").hidden = false;
							document.getElementById("deviceedit").hidden = true;
	// 						alert("Updated SuccessFully");
							jAlert('Record Updated Successfully', 'Success Dialog'); 
							document.getElementById('deviceEdit').reset(); 
						})
						.error(function(data, status,headers, config) {
							console.log('error: data = ',data);
							
	// 						alert("Not Updated");
						});
						}).error(function(data, status, headers, config) {
							//document.getElementById("errorsmsg").hidden = false;
							jAlert('Record Not Updated','Information');
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
	   		$scope.pagesno = [20,50,80,100,120];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			}
			
			
			function printData()
			{
			   var divToPrint=document.getElementById("printTablesim");
			   newWin= window.open("");
			   
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
			
			
		$("#exportpdf").click(function(){
			
			try
			{
			$('#printTablesim').tableExport({
				type:'pdf',escape:'false',separator: ',',
				//ignoreColumn: [2,3],
				tableName:'Sim',
				
				pdfFontSize:10,
				//pdfLeftMargin:20,
				
				htmlContent:'false',
				consoleLog:'false',
				
				}
			
			);
			}catch(e){alert(e);}
		});
			
			


			
			
	$("#exportexcel").click(function(){
		
		try
		{
		$('#printTablesim').tableExport({
			type:'Excel',escape:'false',separator: ',',
			//ignoreColumn: [2,3],
			tableName:'Sim',
			
			pdfFontSize:10,
			//pdfLeftMargin:20,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);

		}catch(e){alert(e);}
	});

				
			
			
			
			
			
			$scope.deletesim = function(deletesimid){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){ 
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdelete?id='+deletesimid.simid)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.sim = data;
							jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				}).error(function(data, status, headers, config) {
					jAlert('Record Not Deleted','Information');
					//document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
					//document.getElementById("errorsmsg").hidden = false;
					console.log('error: data = ', data);
				});
					}
				});
			}
	   		
// 			Page.setTitle("Welcome");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
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
		// $('.datepick').datepicker('setDate','+0d');
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
		
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
// 						alert(data);
							$scope.simvendordetails = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						
						//network
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]).success
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
// 				
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
				var mysiminsert=document.siminsertform;
				
			      if (mysiminsert.insertsimno.value== "")
			      {
			    	
			    	 mysiminsert.insertsimno.focus();
			      }	
			      else if (mysiminsert.insertsimnetwork.value== "")
			      {
			    	
			    	 mysiminsert.insertsimnetwork.focus();
			      }	
			      else if (mysiminsert.insertsimmobileno.value== "")
			      {
			    	
			    	 mysiminsert.insertsimmobileno.focus();
			      }	
			      else if (mysiminsert.simvendorinsert.value== "")
			      {
			    	
			    	 mysiminsert.simvendorinsert.focus();
			      }	
			      else if (mysiminsert.insertsimactivedate.value== "")
			      {
			    	
			    	 mysiminsert.insertsimactivedate.focus();
			      }	
			      else
			    	  {
			    	  var i=0;chk=0;
			    	  for(i=0;i<$scope.sim.length;i++)
			    		  {
			    		  if($scope.sim[i].simnumber==document.getElementById('insertsimno').value)
			    			  {
			    			  chk++;
			    			  }
			    		  }
			    	  if(chk>0)
			    		  {
			    		  jAlert('Problem in Saving Records! Sim Number Already Exist!','Information');
			    		  }
			    	  else
			    		  {
			    	  var k=0;
						if($scope.simnetworkid==null){
							jAlert('Problem in Saving Records! Network Name Does Not Exist!','Information');

							 mysiminsert.insertsimnetwork.focus();
							k++;
						}
						if($scope.simvendorid==null){
							jAlert('Problem in Saving Records! Vendor Name Does Not Exist!','Information');
							mysiminsert.simvendorinsert.focus();
							k++;
						}
			    	  	if(k==0){
			    	  		
			    	  	alert("reciptdate"+document.getElementById('siminsertreciptdate').value);
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/siminsert?networkid='+$scope.simnetworkid+'&assettypeid=40002&simno='+document.getElementById('insertsimno').value+'&mobileno='+document.getElementById('insertsimmobileno').value+'&vendorid='+$scope.simvendorid+'&receiptdt='+document.getElementById('siminsertreciptdate').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('insertsimRemark1').value)
						 .success(function(data, status, headers, config) {
					 				jAlert('Record Inserted Successfully', 'Success Dialog');
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails')
											.success(function(data, status, headers, config) {
												$scope.sim = data;
											}).error(function(data, status, headers, config) {
												console.log('error: data = ', data);
												
											});
							
							      })
							      .error(function(data, status, headers, config) 
							     		 {
							       	jAlert('Unable to Procced  Your Request!','Information');
							        		
							             console.log('error: data = ' , data);
									   });
						}
			    		  }  }
				
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
			

			var mysimedit=document.simeditform;
			
		      if (mysimedit.editsimnumber.value== "")
		      {
		    	 mysimedit.editsimnumber.focus();
		      }	
		      else  if (mysimedit.editsimnetworkname.value== "")
		      { 	 mysimedit.editsimnetworkname.focus();
			      }	
		      else  if (mysimedit.editsimmobileno.value== "")
		      {
			    	
			    	 mysimedit.editsimmobileno.focus();
			      }	
		      else  if (mysimedit.editsimvendorname.value== "")
		      {
			    	// alert("company name not be empty");
			    	 mysimedit.editsimvendorname.focus();
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
						
						jAlert('Problem in Saving Records! Network Name Does Not Exist!','Information');
						 mysimedit.editsimnetworkname.focus();
						k++;
					}
					if($scope.simeditvendorid==null){
						jAlert('Problem in Saving Records! Vendor Name Does Not Exist!','Information');
						mysimedit.editsimvendorname.focus();
						k++;
					}

			if(k==0){
				
// 				alert(document.getElementById('editsimreceiptdate').value);
// 				alert('http://localhost:8080/indtrackwebservice/rest/CallService/simupdate?simid='+$scope.simdata.simid+'&networkid='+$scope.simeditnetworkid+'&assettypeid='+$scope.simeditassetid+'&simno='+document.getElementById('editsimnumber').value+'&mobileno='+document.getElementById('editsimmobileno').value+'&vendorid='+$scope.simeditvendorid+'&receiptdt='+document.getElementById('editsimreceiptdate').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('editsimRemark').value);
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simupdate?simid='
			+$scope.simdata.simid+'&networkid='+$scope.simeditnetworkid+
			'&assettypeid=40002&simno='+document.getElementById('editsimnumber').value+
			'&mobileno='+document.getElementById('editsimmobileno').value+
			'&vendorid='+$scope.simeditvendorid+'&receiptdt='+document.getElementById('editsimreceiptdate').value+
			'&loginid='+sptstr[2]+'&remark='+document.getElementById('editsimRemark').value)
			 .success(function(data, status, headers, config) {
				 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
			
				$scope.sim = data;
				document.getElementById("mainsim").hidden = false;
				document.getElementById("simedit").hidden = true;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
				
			});
					jAlert('Record Updated Successfully', 'Success Dialog'); 
					document.getElementById('simeditform').reset(); 

								      })
								      .error(function(data, status, headers, config) 
								     		 {
												 jAlert('Record Not Updated','Information');
								        console.log('error: data = ' , data);

								      });
			}
		   }
}
catch(e){alert(e);}
}
	});
	
	
	scotchApp.controller('SimAssignCtrl', function($scope,$http, $compile, $filter) {
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
			
		

		$scope.pagesno = [20,50,80,100,120];
		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		function printData()
		{
		   var divToPrint=document.getElementById("printTablesimass");
		   newWin= window.open("");
		   
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
//			   newWin.document.write(divToPrint.outerHTML);
//			   newWin.print();
//			   newWin.close();
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$("#exportpdf").click(function(){
		
		try
		{
		$('#printTablesimass').tableExport({
			type:'pdf',escape:'false',separator: ',',
			//ignoreColumn: [2,3],
			tableName:'Sim Assignment',
			
			pdfFontSize:10,
			//pdfLeftMargin:20,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);
		}catch(e){alert(e);}
	});
		
		


		
		
$("#exportexcel").click(function(){
	
	try
	{
	$('#printTablesimass').tableExport({
		type:'excel',escape:'false',separator: ',',
		//ignoreColumn: [2,3],
		tableName:'Sim Assignment',
		
		pdfFontSize:10,
		//pdfLeftMargin:20,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);

	}catch(e){alert(e);}
});

		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.simassign = data;
// 			alert(data);
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$scope.orderProp = "vehicleN0";
		$scope.simData = function simData(edit) {
			$scope.editsim = edit;
		}



		$scope.deletesimassign = function (deletesimid){
			try
		{
			
		
			jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
				if(r){ 
					try
					{
				
				//alert('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndelete?id='+deletesimid.devicesimid);
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndelete?id='+deletesimid.devicesimid)
			.success(function(data, status, headers, config) {
				//alert("after fun call");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.simassign = data;
					jAlert('Record Deleted Successfully', 'Confirmation Results');
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
			}).error(function(data, status, headers, config) {
				jAlert('Record Not Deleted','Information');
				console.log('error: data = ', data);
			});
					}
					catch(e)
					{
						//alert("in webservice"+e);
					}
				}
				
			});
		}
			catch(e){alert(e);}
		}
			
		
		
		
		
//	makkename vbind modeldetails
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {

	$scope.devicedetails = data;

}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});
//	MODEL BIN
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
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
	if($scope.simdetails[i].simnumber == document.getElementById('simnumberInsert').value)
	{
		$scope.simid=$scope.simdetails[i].simid;
	}
}




var mySimassignInsertForm = document.simassigninsert;
if (mySimassignInsertForm.devicenumber.value== "")
{
mySimassignInsertForm.devicenumber.focus();
}
else if(mySimassignInsertForm.simnumberInsert.value=="")
{
mySimassignInsertForm.simnumberInsert.focus();
}
else
{
	
	var k=0;
	if($scope.deviceid==null){
		jAlert('Problem in Saving Records! Device Number Does Not Exist!','Information');
		mySimassignInsertForm.devicenumber.focus();
		k++;
	}
	if($scope.simid==null){
		jAlert('Problem in Saving Records! Sim Number Does Not Exist!','Information');
		mySimassignInsertForm.simnumberInsert.focus();
		k++;
	}
		if(k==0){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigninsert?'+
					'deviceid='+$scope.deviceid+'&simid='+$scope.simid+'&loginid='+sptstr[2]+
					'&remarks='+document.getElementById("remark").value)
			.success(function(data, status, headers, config) {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
			
					$scope.simassign = data;
				
			
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				jAlert('Record Inserted Successfully', 'Success Dialog'); 
			}).error(function(data, status, headers, config) {
			jAlert('Record Not Inserted','Information');
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
mySimassigneditForm.devicename.focus();
}
else if(mySimassigneditForm.simname.value=="")
{
mySimassigneditForm.simname.focus();
}

else
{
	
	var k=0;
	if($scope.deviceid1==null){
		jAlert('Problem in Saving Records!\n Device Number Does Not Exist','Information');

		mySimassigneditForm.devicename.focus();
		k++;
	}
	if($scope.simid1==null){
		jAlert('Problem in Saving Records!\n Sim Number Does Not Exist','Information');


		mySimassigneditForm.simname.focus();
		k++;
	}
		if(k==0){
			
			
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassignupdate?'+
		'devicesimid='+$scope.devicesimid+'&deviceid='+$scope.deviceid1+
		'&simid='+$scope.simid1+'&loginid='+sptstr[2]+
		'&remarks='+document.getElementById("remarkname").value)
		.success(function(data, status, headers, config) {
			
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
			
					$scope.simassign = data;
					document.getElementById("simassignmain").hidden = false;
					document.getElementById("simassignedit").hidden = true;
			
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				jAlert('Record Updated Successfully', 'Success Dialog'); 
				document.getElementById('simassignedit').reset(); 
		}).error(function(data, status, headers, config) {
		jAlert('Sim already Assigned to Device','Information');
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

	
	scotchApp.controller('DeviceAssignCtrl', function($scope,$http, $compile, $filter) {
		try {
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
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
			
			$scope.flag='true';
			if(sptstr[6]=='1003'){
				$scope.flag='false';
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
		   		
		   		$scope.pagesno = [20,50,80,100,120];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				function printData()
				{
				   var divToPrint=document.getElementById("printTablevehass");
				   newWin= window.open("");
				   
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
//					   newWin.document.write(divToPrint.outerHTML);
//					   newWin.print();
//					   newWin.close();
				}

				$('#printbutton').on('click',function(){
				printData();
				})
				
				
			$("#exportpdf").click(function(){
				
				try
				{
				$('#printTablevehass').tableExport({
					type:'pdf',escape:'false',separator: ',',
					//ignoreColumn: [2,3],
					tableName:'Device Assignmnet',
					
					pdfFontSize:7,
					pdfLeftMargin:8,
					
					htmlContent:'false',
					consoleLog:'false',
					
					}
				
				);
				}catch(e){}
			});
				
				


				
				
			$("#exportexcel").click(function(){

			try
			{
			$('#printTablevehass').tableExport({
				type:'excel',escape:'false',separator: ',',
				//ignoreColumn: [2,3],
				tableName:'Device Assignment',
				
				pdfFontSize:10,
				//pdfLeftMargin:20,
				
				htmlContent:'false',
				consoleLog:'false',
				
				}

			);

			}catch(e){}
			});

				
			
			
			
			
			$scope.loginid=sptstr[2];
			$scope.roleid=sptstr[6];
			
			
			$scope.parentDealer='Banglore Dealers';
			
			try
			{
				if($scope.loginid!='10001')
				{
					document.getElementById('maindealer').hidden=true;
				}
			}catch(e){}
			
			
			try{
			if($scope.loginid=='10001' || $scope.loginid=='10002')
			{
				
				document.getElementById('dealersassDetails').hidden=false;
				document.getElementById('dealerasscustomerdetails').hidden=false;
			}
			else if($scope.roleid!='1003')
				{
				$scope.dealervehdetails1=sptstr[0];
				document.getElementById('dealersassDetails').hidden=true;
				}
			else
				{
				document.getElementById('dealersassDetails').hidden=true;
				document.getElementById('dealerasscustomerdetails').hidden=true;
				document.getElementById('vehasscustdealerdetails').value=sptstr[0];
				}
			}catch(e){}
			
			
			
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {

				$scope.dealerdetailslistvehass = data;
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
			
			
			
				
				$scope.deletevehicleassign = function(comp){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigndelete?id='+comp.id)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.deviceassign = data;
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
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							
							$scope.deviceassign = data;
							
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
					$scope.devicedetails = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
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

				
				
				$scope.vehicleassignData = function vehicleassignData(editname) {
					$scope.editvehicleassign = editname;
					
				}
try{
				$scope.vehicleassigninsert = function vehicleassigninsert() {
					var myForm = document.vehicleassigninsert1;
				      if (myForm.vehicleassignvehicleinsert.value== "")
				      {
				
				    	 myForm.vehicleassignvehicleinsert.focus();
				      }
				      else if (myForm.vehicleassigndeviceinsert.value== "")
				      {
				    	
				    	 myForm.vehicleassigndeviceinsert.focus();
				      }
				      else if (myForm.vehicleassigndateinsert.value== "")
				      {
				    	
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
						  
						  for(i=0;i<$scope.customerdetailsvehass.length;i++)
							{
							if($scope.customerdetailsvehass[i].customername==document.getElementById('vehasscustdealerdetails').value)
							{
								$scope.customerid=$scope.customerdetailsvehass[i].customerid;
							}
						}
						 
						  if($scope.roleid=='1003')
							 {
							 $scope.customerid=sptstr[7];
							 }
							
						  
						  var k=0;
							if($scope.vdeviceid1==null){
								jAlert('Problem in Saving Records! Device Number Does Not Exist!','Information');
								 myForm.vehicleassigndeviceinsert.focus();
								k++;
							}
							if($scope.vvehicleid1==null){
								jAlert('Problem in Saving Records! Vehicle Number Does Not Exist!','Information');
								myForm.vehicleassignvehicleinsert.focus();
								k++;
							}
						 if(k==0){
							
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassigninsert'+
								'?vehicleid='+$scope.vvehicleid1+'&deviceid='+$scope.vdeviceid1+'&status=1&assigndate='+document.getElementById("vehicleassigndateinsert").value
								+'&loginid='+sptstr[2]+'&remarks='+document.getElementById("vehicleassignremarksinsert").value+'&customerid='+$scope.customerid).success(
									function(data, status, headers, config) {
										jAlert('Record Inserted Successfully', 'Success Dialog'); 
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
										.success(function(data, status, headers, config) {
											$scope.deviceassign = data;
//				 							alert(data);
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
									}).error(
									function(data, status, headers, config) {
										jAlert('Record Not Inserted','Information');
										console.log('error: data = ', data);
									});
						 }
					   }
				}
}catch(e){}
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
								  $scope.vvehicleid = $scope.vehicledetails1[i].vehicleid;
							  }
						  }	
						  
						  
						  var k=0;
							if($scope.vdeviceid==null){
								jAlert('Problem in Saving Records! Device Number Does Not Exist!','Information');
								myForm1.vehicleassigndeviceedit.focus();
								k++;
							}
							if($scope.vvehicleid==null){
								jAlert('Problem in Saving Records!Vehicle Number Does Not Exist!','Information');
								 myForm1.vehicleassignvehicleedit.focus();
								k++;
							}
						if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleassignupdate'+
								'?id='+$scope.editvehicleassign.id+'&vehicleid='+$scope.vvehicleid
								+'&deviceid='+$scope.vdeviceid+'&status=1&assigndate='+document.getElementById("vehicleassigndateedit").value
								+'&loginid='+sptstr[2]+'&remarks='+document.getElementById("vehicleassignremarksedit").value)
						.success(function(data, status, headers, config) {
							document.getElementById("mainvehicleassign").hidden = false;
							document.getElementById("showeditvehicleassign").hidden = true;
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
										.success(function(data, status, headers, config) {
											$scope.deviceassign = data;
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										
						document.getElementById('formeditvehicle').reset();
						})
										.error(function(data, status, headers, config) {
											jAlert('Record Not Updated','Information');
											console.log('error: data = ', data);
										});
						}
					}
						}catch(e){}
		}
			} catch (e) {
				
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
		window.location.replace("Logout");
	}
	mydate = new Date();
	
	clearInterval(interval);
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7])
		.success(function(data, status, headers, config) {
	$scope.userdetailslist = data;
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
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
// 				alert(data);
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
	   newWin= window.open("");
	   
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
//		   newWin.document.write(divToPrint.outerHTML);
//		   newWin.print();
//		   newWin.close();
	}

	$('#printbutton').on('click',function(){
	printData();
	})
	
	
$("#exportpdf").click(function(){
	
	try
	{
	$('#printTableuser').tableExport({
		type:'pdf',escape:'false',separator: ',',
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
	
		
$("#exportexcel").click(function(){

try
{
$('#printTableuser').tableExport({
	type:'excel',escape:'false',separator: ',',
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
		catch(e)
		{
			alert(e);
			
		}
	}
		
	//rolebind
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/roledetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {

		$scope.insertroledetailslist = data;

	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	
	try{
$scope.userInsert=function userInsert()
	{
	    var i=0;
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
		}if($scope.rname=='Company'){
			for(i=0;i<$scope.userclist.length;i++)
			{
				if($scope.userclist[i].companyname==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.userclist[i].companyid;
		}
			}
		}else if($scope.rname=='Customer'){

			for(i=0;i<$scope.usercustlist.length;i++)
			{
				if($scope.usercustlist[i].customername==document.getElementById('insertusercompany').value)
					{
					$scope.usercomId=$scope.usercustlist[i].customerid;
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
	    		  jAlert('Problem in Saving Records! Company Name Does Not Exist!','Information');
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
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userinsert?'+
				'&loginname='+document.getElementById('insertuserloginname').value+
				'&password='+document.getElementById('insertuserpassword').value+
				'&controlid='+sptstr[7]+'&roleid='+$scope.userroleId+
				'&ownersid='+$scope.usercomId+'&companyid='+sptstr[1])
		.success(function(data, status, headers, config) {
			jAlert('Record Inserted Successfully', 'Success Dialog'); 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userdetails?companyid='+sptstr[1]+'&roleid='+sptstr[6]+'&ownersid='+sptstr[7])
			.success(function(data, status, headers, config) {

				$scope.userdetailslist = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			

		}).error(function(data, status, headers, config) {
			
			var i=0
			for(i=0;i<$scope.userdetailslist.length;i++)
				{
				if($scope.userdetailslist[i].loginname==document.getElementById('insertuserloginname').value)
					{
			jAlert('Problem in Saving Records!Login Name Already Exists','Information');
					}
				else if($scope.userdetailslist[i].password==document.getElementById('insertuserpassword').value)
					{
					jAlert('Problem in Saving Records!Password Already Exists','Information');
					
					}
				}
			console.log('error: data = ', data);
		});
	    	  }	
	    	  }
	}

	}catch(e){
		alert(e);
	}
	
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

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			jAlert('Record Updated Successfully', 'Success Dialog'); 
			document.getElementById('useredit').reset(); 
	}).error(function(data, status, headers, config) {
			jAlert('Record Not Updated','Information');
			console.log('error: data = ', data);
		});
   		  }
	}
	}
	
});
	
	scotchApp.controller('dealerCtrl', function($scope,$http, $compile, $filter) {
		
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
		
		$scope.rname = 'Dealer Name';
		 
		 jQuery('#insertdealertype').on('input propertychange paste', function() {
			    // do your stuff
			    var name = '';
			    name = document.getElementById("insertdealertype").value;
			    
			    if(name=='Individual'){
			    	$scope.rname='Dealer Name';
			    	document.getElementById('dname').innerHTML = "Dealer Name";
			    	
			    }else if(name=='Organization'){
			    	$scope.rname='Organization Name';
			    	document.getElementById('dname').innerHTML = "Organization Name";
			    	document.getElementById('dname').style.color="black";
			    	
			    }else{

			    }
			});
		 
		clearInterval(interval);
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslist = data;
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		

		function printData()
		{
		   var divToPrint=document.getElementById("printTabledealer");
		   newWin= window.open("");
		   
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
//			   newWin.document.write(divToPrint.outerHTML);
//			   newWin.print();
//			   newWin.close();
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$("#exportpdf").click(function(){
		
		try
		{
		$('#printTabledealer').tableExport({
			type:'pdf',escape:'false',separator: ',',
			//ignoreColumn: [2,3],
			tableName:'Dealer ',
			pdfFontSize:10,
			//pdfLeftMargin:20,
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);
		}catch(e){alert(e);}
	});
		
		
		
$("#exportexcel").click(function(){
	
	try
	{
	$('#printTabledealer').tableExport({
		type:'excel',escape:'false',separator: ',',
			tableName:'Dealer',
		pdfFontSize:10,
		//pdfLeftMargin:20,
		
		htmlContent:'false',
		consoleLog:'false',
		}
	
	);

	}catch(e){alert(e);}
});

	
$(function() {
    $('input[name="mode"]').on('click', function() {
        if ($(this).val() == 'Yes') {
            $('#dealercreditDays').show();
            $('#dealercreditAmt').show();
          }
        else if($(this).val() == 'No') 
        	{
        	 $('#dealercreditDays').hide();
             $('#dealercreditAmt').hide();
         	}
         else {
        	 $('#dealercreditDays').hide();
             $('#dealercreditAmt').hide();
         }
    });
});
$(function() {
    $('input[name="paymode"]').on('click', function() {
        if ($(this).val() == 'By Bank') {
            $('#bankFieldset').show();
      
        }
        else if($(this).val() == 'By Cash') 
        	{
        	 $('#bankFieldset').hide();
              	}
            else {
        	 $('#bankFieldset').hide();
           	           
        }
    });
});


$(function() {
    $('input[name="paymentmode"]').on('click', function() {
        if ($(this).val() == 'By Bank') {
            $('#updateBankDetails').show();
       
        }
        else if($(this).val() == 'By Cash') 
        	{
        	 $('#updateBankDetails').hide();
            	}
               else {
        	 $('#updateBankDetails').hide();
               }
    });
});



$(function() {
    $('input[name="editdealermode"]').on('click', function() {
        if ($(this).val() == 'Yes') {
            $('#editdealercreditdaysdiv').show();
               $('#editdealercreditamtdiv').show();
        }
        else if($(this).val() == 'No') 
        	{
        	 $('#editdealercreditamtdiv').hide();
        	 $('#editdealercreditdaysdiv').hide();
            	}
       
        else {
        	 $('#editdealercreditamtdiv').hide();
        	 $('#editdealercreditdaysdiv').hide();
          }
    });
});
	$scope.delaereditdetails=function delaereditdetails(editdealerdata)
		{
			$scope.dealereditdata=editdealerdata;
	    	  if($scope.dealereditdata.paymentmode=='By Bank')
	    		  {
	    		  document.getElementById('editdealernotBybank').checked=true;
	    		  document.getElementById('updateBankDetails').hidden = false;
			      
	    		  }
	    	  else if($scope.dealereditdata.paymentmode=='By Cash')
	    		  {
	    		  document.getElementById('editdealerBycash').checked=true;
	    		  document.getElementById('updateBankDetails').hidden = true;
	    		  }
	    	  
	    	  if($scope.dealereditdata.iscredit=='Yes')
	    	  {
	    		  document.getElementById('editdealercredit').checked=true;
	    		  document.getElementById('editdealercreditdaysdiv').hidden = false;
	    		  document.getElementById('editdealercreditamtdiv').hidden = false;
	    	  }
	    	  else if($scope.dealereditdata.iscredit=='No')
	    		  {
	    		  document.getElementById('editdealernotcredit').checked=true;
	    		  document.getElementById('editdealercreditdaysdiv').hidden = true;
	    		  document.getElementById('editdealercreditamtdiv').hidden = true;
	    		  }
	    	  
		}
		
		
		
		
		$scope.showdelaerdiv1 = function() {
		
			document.getElementById("showeditdealer").hidden = false;
			document.getElementById("maindealer").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("maindealer").hidden = false;
			document.getElementById("showeditdealer").hidden = true;
		}
		
		
		
		
		
		$scope.deletedealer = function(deletedealerid){
			try
			{
			jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
				if(r){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdelete?id='+deletedealerid.dealerid)
			.success(function(data, status, headers, config) {

				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslist = data;
				jAlert('Record Deleted Successfully', 'Confirmation Results');
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});


			}).error(function(data, status, headers, config) {
				jAlert('Record  Not Deleted ', 'Information');
				console.log('error: data = ', data);
			});
				}
			});
			}
			catch(e)
			{
				alert(e);
				
			}
		}
		
		$scope.dealerInsert=function dealerInsert()
		{
			
			
			var mydelaerinsert = document.inserdealerform;
		      if (mydelaerinsert.insertDealername.value== "")
		      {
		    	
		    	 mydelaerinsert.insertDealername.focus();
		      }
		      else if (mydelaerinsert.insertdealermobileno.value== "")
		      {
			    	
			    	 mydelaerinsert.insertdealermobileno.focus();
			      }
		      else if (mydelaerinsert.insertdealerperadd.value== "")
		      {
			    	
			    	 mydelaerinsert.insertdealerperadd.focus();
			      }
		     

		      else
		    	  {

	    	  if(document.getElementById('insertdealercredit').checked==true)
	    		  {
	    		  $scope.insertcreditdetail='Yes';
	    		  }
		    	  else if(document.getElementById('insertdealernotcredit').checked==true)
		    		  {
		    		  $scope.insertcreditdetail='No';
		    		  }
	    	  
	    	  
	    	  
	    	  if(document.getElementById('insertdealerBycash').checked==true)
    		  {
	    		  $scope.insertdealerpayment='By Cash';
    		  }
	    	  else if(document.getElementById('insertdealernotBybank').checked==true)
	    		  {
	    		  $scope.insertdealerpayment='By Bank';
	    		  }
	    	  
	    	  $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerinsert?dealername='+document.getElementById('insertDealername').value+'&dealertype='+document.getElementById('insertdealertype').value+'&address='+document.getElementById('insertdealerperadd').value+'&city='+document.getElementById('insertlocalcity').value+'&pincode='+document.getElementById('insertlocalpincode').value+'&mobilenumber='+document.getElementById('insertdealermobileno').value+'&alternatecontnumber='+document.getElementById('insertdealeraltno').value+'&bankname='+document.getElementById('insertDealerbankname').value+'&branch='+document.getElementById('insertDealerbranch').value+'&accountno='+document.getElementById('insertDealeraccountno').value+'&bankaddress='+document.getElementById('insertDealerbankadd').value+'&ifsc='+document.getElementById('insertDealerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertdealerremark').value+'&creditdays='+document.getElementById('insertDealercreditdays').value+'&creditamount='+document.getElementById('insertDealercreditamount').value+'&iscredit='+$scope.insertcreditdetail+'&paymentmode='+$scope.insertdealerpayment+'&contactperson='+document.getElementById('insertdealercontactperson').value+'&emailid='+document.getElementById('insertdealeremailid').value+'&state='+document.getElementById('insertstate').value)
			.success(function(data, status, headers, config) {
				jAlert('Record Inserted Successfully', 'Success Dialog'); 
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
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

			try
			{
				
			var mydelaerEdit = document.editdealerform;
		      if (mydelaerEdit.editDealername.value== "")
		      {
		    
		    	 mydelaerEdit.editDealername.focus();
		      }

		      else if (mydelaerEdit.editdealermobileno.value== "")
		      {
			    	
			    	 mydelaerEdit.editdealermobileno.focus();
			      }
		      else if (mydelaerEdit.editdealerperadd.value== "")
		      {
			    
			    	 mydelaerEdit.editdealerperadd.focus();
			      }
		      else if (mydelaerEdit.editdealerpercity.value== "")
		      {
			    	
			    	 mydelaerEdit.editdealerpercity.focus();
			      }
		      
 			      
		      else
		    	  {
		    	  
		    	  if(document.getElementById('editdealercredit').checked==true)
	    		  {
	    		  $scope.editcreditdetail='Yes';
	    		  }
		    	  else if(document.getElementById('editdealernotcredit').checked==true)
		    		  {
		    		  $scope.editcreditdetail='No';
		    		  }
	    	  
	    	  
	    	  
	    	  if(document.getElementById('editdealerBycash').checked==true)
    		  {
	    		  $scope.editdealerpayment='By Cash';
    		  }
	    	  else if(document.getElementById('editdealernotBybank').checked==true)
	    		  {
	    		  $scope.editdealerpayment='By Bank';
	    		  }
		    	  
	    	  $scope.updatedealerid=$scope.dealereditdata.dealerid;
	    	  
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerupdate?'+
					'dealerid='+$scope.updatedealerid+'&dealername='+document.getElementById('editDealername').value+
					'&dealertype='+document.getElementById('editdealertype').value+'&address='+document.getElementById('editdealerperadd').value+
					'&city='+document.getElementById('editdealerpercity').value+
					'&pincode='+document.getElementById('editlocalpincode').value+
					'&mobilenumber='+document.getElementById('editdealermobileno').value+
					'&alternatecontnumber='+document.getElementById('editdealeraltno').value+
					'&bankname='+document.getElementById('editDealerbankname').value+
					'&branch='+document.getElementById('editDealerbranch').value+
					'&accountno='+document.getElementById('editDealeraccno').value+
					'&bankaddress='+document.getElementById('editDealeraddress').value+
					'&ifsc='+document.getElementById('editDealerifsc').value+
					'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editdealerremark').value+
					'&creditdays='+document.getElementById('editDealercreditdays').value+'&creditamount='+document.getElementById('editDealercreditamt').value+'&iscredit='+$scope.editcreditdetail+'&paymentmode='+ $scope.editdealerpayment+'&contactperson='+document.getElementById('editdealercontactperson').value+'&emailid='+document.getElementById('editdealeremailid').value+'&state='+document.getElementById('editdealerperstate').value)
				.success(function(data, status, headers, config) {
					document.getElementById("maindealer").hidden = false;
					document.getElementById("showeditdealer").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.dealerdetailslist = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				
					jAlert('Record Updated Successfully', 'Success Dialog'); 
					document.getElementById('editdealerform').reset(); 

				}).error(function(data, status, headers, config) {
					jAlert('Record Not Updated','Information');
					console.log('error: data = ', data);
				});
		
		    		}
		}catch(e)
		{ 
			alert(e);
		}
		}
		
		
		
		
	});


	
// scotchApp.controller('forgotpassctrl', function($scope,$http, $compile, $filter)
// 			{
// 			 if(!(document.getElementById('password2').value == document.getElementById('confirmpassword').value))
// 				{	
// 					 jAlert('Password and Confirm Password Not Match','Information');  
// 				}
// 				 else {
// 					  $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/passwordinsert?ownersid='+$scope.ownerid+'&password='+document.getElementById('newpassword').value)
// 				        .success(function(data, status, headers, config) {
// 				      alert("success");
				   
// 					})
// 				       .error(function(data, status, headers, config) {
// 				    	   alert("error");
// 				   		console.log('error: data = ' , data);
// 			 })
// 				 }
// 			});
	
	

	scotchApp.controller('netCtrl', function($scope,$http, $compile, $filter) {
		try{
			
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
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
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
			
			function printData()
		{
		   var divToPrint=document.getElementById("printTablenet");
		   newWin= window.open("");
		   
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
//			   newWin.document.write(divToPrint.outerHTML);
//			   newWin.print();
//			   newWin.close();
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$("#exportpdf").click(function(){
		
		try
		{
		$('#printTablenet').tableExport({
			type:'pdf',escape:'false',separator: ',',
			//ignoreColumn: [2,3],
			tableName:'Network',
			
			pdfFontSize:10,
			//pdfLeftMargin:20,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);
		}catch(e){alert(e);}
	});
		
		


		
		
$("#exportexcel").click(function(){
	
	try
	{
	$('#printTablenet').tableExport({
		type:'excel',escape:'false',separator: ',',
		//ignoreColumn: [2,3],
		tableName:'Network',
		
		pdfFontSize:10,
		//pdfLeftMargin:20,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);

	}catch(e){alert(e);}
});

			
			
			$scope.deletenetwork = function(deletenetworkid){ 
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){ 
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdelete?id='+deletenetworkid.networkid) 
				.success(function(data, status, headers, config) { 
//	 				$scope.company = data; 
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {

				$scope.networkdetailslist = data;
							jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) { 
						
							console.log('error: data = ', data); 
						}); 
<%-- // 					document.getElementById("textsuccess").innerHTML = "<center>Record Deleted Successfully </center>"; --%>
// 					document.getElementById("successmsg").hidden = false; 
					

				}).error(function(data, status, headers, config) {
					jAlert('Record Not Inserted','Information');
<%-- 					//document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>"; --%>
					//document.getElementById("errorsmsg").hidden = false; 
					console.log('error: data = ', data); 
				});
					} 
				}); 
			} 
			
			
			$scope.networkInsert=function networkInsert()
			{
				try
				{
					
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
				      
				      else
				    	  {
				    	  var chk=0,i=0;
				    	  for(i=0 ;i<$scope.networkdetailslist.length;i++)
				    		  {
				    		  if($scope.networkdetailslist[i].networkname==document.getElementById('insertnetworkname').value)
				    			  {
				    			  chk++;
				    			  }
				    		 
				    		  }
				    		 if(chk>0)
				    			 {  jAlert('Problem In Saving Records!Network Name Already Exists!','Information');}
				    		 else
				    			 {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkinsert?networkname='+document.getElementById('insertnetworkname').value+'&networkapn='+document.getElementById('insertnetworkapn').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertnetworkremark').value)
				.success(function(data, status, headers, config) {
					jAlert('Record Inserted Successfully', 'Success Dialog'); 
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {

						$scope.networkdetailslist = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
				}).error(function(data, status, headers, config) {
				jAlert('Unable To Proceed Your Request!', 'Information'); 
					console.log('error: data = ', data);
				});
				    			 }
				    		  	  }
			}
				catch(e)
				{
					
				}
			}
			
			
			
			$scope.networkUpdate= function networkUpdate()
			{
				
//	 			alert("in network update");
				try
				{
				$scope.editnetworkid=$scope.networkdata.networkid;
//	 			alert("networkid"+$scope.editnetworkid);
				
				
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
			     
			      else{
				
// 				alert('http://localhost:8080/indtrackwebservice/rest/CallService/networkupdate?networkid='+$scope.editnetworkid+'&networkname='+document.getElementById('editnetworkname').value+'&networkapn='+document.getElementById('editnetworkapn').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editnetworkremark').value);
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkupdate?networkid='+$scope.editnetworkid+'&networkname='+document.getElementById('editnetworkname').value+'&networkapn='+document.getElementById('editnetworkapn').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editnetworkremark').value)
				.success(function(data, status, headers, config) {

					document.getElementById("mainnetwork").hidden = false;
					document.getElementById("showeditnetwork").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {

						$scope.networkdetailslist = data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					}); 
					jAlert('Record Updated Successfully', 'Success Dialog'); 
					document.getElementById('networkedit').reset(); 

				}).error(function(data, status, headers, config) {
					jAlert('Record Not Updated','Information');
					console.log('error: data = ', data);
				});
				
			      }	
				}
				catch(e)
				{
					//alert(e);
					
				}
			}
			
			
		});


	
	
	scotchApp.controller('assetController', function($scope,$http, $compile, $filter) {
	
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
		
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		$scope.pagesno = [20,50,80,100,120];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
			
			}
		
		
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
		.success(function(data, status, headers, config) {

			$scope.assetdetailslist=data;

		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
		
		$scope.editasset=function(editdataasset)
		{
			$scope.dataaAsset=editdataasset;
		}
		
		
		$scope.showassetdiv1 = function() {
			document.getElementById("showeditasset").hidden = false;
			document.getElementById("mainasset").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainasset").hidden = false;
			document.getElementById("showeditasset").hidden = true;
		}
		
		$scope.assetUpdate=function assetUpdate()
		{
			
			try
			{
				
				$scope.updateassetid=$scope.dataaAsset.assettypeid;
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetupdate?companyid='+sptstr[1]+'&remarks='+document.getElementById('editassetremark').value+'&assetname='+document.getElementById('editassetname').value+'&loginid='+sptstr[2]+'&assettypeid='+$scope.updateassetid)
				.success(function(data, status, headers, config) {
					document.getElementById("mainasset").hidden = false;
					document.getElementById("showeditasset").hidden = true;
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
					.success(function(data, status, headers, config) {

						$scope.assetdetailslist=data;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
				}).error(function(data, status, headers, config) {
					jAlert('Record Not Updated','Information');
					console.log('error: data = ', data);
				});
			}
			catch(e)
			{
				alert(e);
			}
		}
		
		
		
		$scope.assetInsert=function assetInsert()
		{
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetinsert?companyid='+sptstr[1]+'&remarks='+document.getElementById('insertassetname').value+'&assetname='+document.getElementById('assetinsertremark').value+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {

				alert("success");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
				.success(function(data, status, headers, config) {

					$scope.assetdetailslist=data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			
		}
		
	
	});
	
	
	
	
	
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
				window.location.replace("Logout");
			}
			mydate = new Date();
			
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
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
				
				$scope.customerdetails = data;
				
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			$scope.editcustdata=function editcustomer(editcustomer)
			{
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
			   newWin= window.open("");
			   
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
			
			
		$("#exportpdf").click(function(){
			
			try
			{
			$('#printTablecust').tableExport({
				type:'pdf',escape:'false',separator: ',',
				tableName:'Customer',
				pdfFontSize:10,
				htmlContent:'false',
				consoleLog:'false',
						}
					);
			}catch(e){alert(e);}
		});
			
	$("#exportexcel").click(function(){
		try
		{
		$('#printTablecust').tableExport({
			type:'excel',escape:'false',separator: ',',
			tableName:'Customer',
			pdfFontSize:10,
			htmlContent:'false',
			consoleLog:'false',
					}
			);
		}catch(e){alert(e);}
	});
	
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
	
	
	$scope.loginid=sptstr[2];
$scope.parentDealer='Banglore Dealers';
	
	try
	{
		if($scope.loginid!='10001')
		{
			document.getElementById('maindealer').hidden=true;
		
		}
	}catch(e){}
	
	
	
		$scope.deletecustomer = function(deletecustomerid){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdelete?id='+deletecustomerid.customerid)
				.success(function(data, status, headers, config) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
								$scope.customerdetails = data;
					jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) {
							jAlert('Record Not deleted','Information');
							console.log('error: data = ', data);
						});$scope.showcustomerdiv1 = function() {
							//alert("in");
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
			
		
		

		try
		{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslistcust= data;
			//alert(data);
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
			
			
		}catch(e){alert(e);}	
			
		
		
		
		
		
		
			$scope.customerInsert=function customerInsert()
			{	
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
					   var i=0;chk=0;
				    	  for(i=0;i<$scope.customerdetails.length;i++)
				    		  {
				    		  if($scope.customerdetails[i].cutomername==document.getElementById('insertcustomername').value)
				    			  {
				    			 chk++
				    			  }
				    		  }
				    		  if(chk>0)
				    			{
				    			  jAlert('Problem in Saving Records! Customer Name Already Exist!','Information');
				    		 	}
				    		  
				    		  
				    		  for(i=0;i<$scope.customerdetails.length;i++)
				    		  {
				    		  if($scope.customerdetails[i].emailid==document.getElementById('insertcustomeremailid').value)
				    			  {
				    			 chk++
				    			  }
				    		  }
				    		  if(chk>0)
				    			{
				    			  jAlert('Problem in Saving Records! Email Id Already Exist!','Information');
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
	
	
	$scope.custdealerid='';
	for(i=0;i<$scope.dealerdetailslistcust.length;i++)
		{
		
		if($scope.dealerdetailslistcust[i].dealername==document.getElementById('custdealerdetails').value)
			{
			$scope.custdealerid=$scope.dealerdetailslistcust[i].dealerid;
			}
		}
	if($scope.custdealerid==''){
		$scope.custdealerid = sptstr[7];
	}
	
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerinsert?customername='+document.getElementById('insertcustomername').value+'&customertype='+document.getElementById('insertcustomertype').value+'&contactperson='+document.getElementById('insertcustomercontactperson').value+'&emailid='+document.getElementById('insertcustomeremailid').value+'&mobilenumber='+document.getElementById('insertcustomermobileno').value+'&alternatecontnumber='+document.getElementById('insertcustomeraltno').value+'&address='+document.getElementById('insertcustomeradd').value+'&city='+document.getElementById('insertcustomercity').value+'&pincode='+document.getElementById('insertcustomerpincode').value+'&iscredit='+$scope.insertcreditvalue+'&creditdays='+document.getElementById('insertcustomercreditdays').value+'&creditamount='+document.getElementById('insertcustomercreditamount').value+'&paymentmode='+$scope.insertpaymentvalue+'&bank_name='+document.getElementById('insertcustomerbankname').value+'&branch='+document.getElementById('insertcustomerbranch').value+'&accountno='+document.getElementById('insertcustomeraccountno').value+'&bankaddress='+document.getElementById('insertcustomerbankadd').value+'&ifscno='+document.getElementById('insertcustomerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertcustomerremark').value+'&dealerid='+$scope.custdealerid)
					.success(function(data, status, headers, config) {
						jAlert('Record Inserted Successfully', 'Success Dialog');
						
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
								$scope.customerdetails = data;
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}).error(function(data, status, headers, config) {
						jAlert('Record Not Inserted','Information');
						console.log('error: data = ', data);
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
			{
			
				try
				{
					var mycustomeredit = document.editcustomerform; 
				      if (mycustomeredit.editcustomertype.value== "") 
				      { 	 mycustomeredit.editcustomertype.focus(); 
				      } 
				      else  if (mycustomeredit.editCustomername.value== "") 
				      { 	 mycustomeredit.editCustomername.focus(); 
				      }   else  if (mycustomeredit.editcustomercontactperson.value== "") 
				      { 	 mycustomeredit.editcustomercontactperson.focus(); 
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
							{	
								$scope.creditvalue='No';
							}
									
							if(document.getElementById('editCustomerBycash').checked==true)
							{
								$scope.customerpaymentmode='By Cash';
							}
							else if(document.getElementById('editCustomernotBybank').checked==true)
							{
								$scope.customerpaymentmode='By Bank';	
							}
							
// 							alert(document.getElementById('editCustomerremark').value);
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerupdate?customerid='+$scope.editcustomerid+'&customername='+document.getElementById('editCustomername').value+'&customertype='+document.getElementById('editcustomertype').value+'&contactperson='+document.getElementById('editcustomercontactperson').value+'&emailid='+document.getElementById('editcustomeremailid').value+'&mobilenumber='+document.getElementById('editcustomermobileno').value+'&alternatecontnumber='+document.getElementById('editcustomeraltno').value+'&address='+document.getElementById('editcustomeradd').value+'&city='+document.getElementById('editcustomercity').value+'&pincode='+document.getElementById('editcustomerpincode').value+'&iscredit='+$scope.creditvalue+'&creditdays='+document.getElementById('editCustomercreditdays').value+'&creditamount='+document.getElementById('editCustomercreditamt').value+'&paymentmode='+$scope.customerpaymentmode+'&bank_name='+document.getElementById('editCustomerbankname').value+'&branch='+document.getElementById('editcustomerbranch').value+'&accountno='+document.getElementById('editCustomeraccno').vlaue+'&bankaddress='+document.getElementById('editCustomerbankaddress').value+'&ifscno='+document.getElementById('editCustomerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editCustomerremark').value)
							.success(function(data, status, headers, config) {
								document.getElementById("maincustomer").hidden = false;
								document.getElementById("showeditcustomer").hidden = true;
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
								.success(function(data, status, headers, config) {
										$scope.customerdetails = data;
								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
								jAlert('Record Updated Successfully', 'Success Dialog');
							document.getElementById('editcustomer').reset();
							}).error(function(data, status, headers, config) {
								jAlert('Record Not Updated','Information');
								console.log('error: data = ', data);
							});
				    	 }
				}
				catch(e)
				{
					
				}
			}
			
		}
		catch(e)
		{
		
		}
		});
		
		
		
		
		
		
scotchApp.controller('rawdataCtrl', function($scope,$http, $compile, $filter)
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
	try
	{
		 var over = '<div id="overlay">' +
//	     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
	     '</div>';
	    $(over).appendTo('body');
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/rawdata')
	.success(function(data, status, headers, config) {
		 $('#overlay').remove();
		$scope.rawdatadetails = data;
	}).error(function(data, status, headers, config) {
		 $('#overlay').remove();
		console.log('error: data = ', data);
	});
	}catch(e)
	{
		
	}
		});
		
scotchApp.controller('dealerassignCtrl', function($scope,$http, $compile, $filter) {
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
	
	
	
	
	
	
	function printData()
	{
	   var divToPrint=document.getElementById("printTabledealer");
	   newWin= window.open("");
	   
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
	
	
$("#exportpdf").click(function(){
	
	try
	{
	$('#printTabledealer').tableExport({
		type:'pdf',escape:'false',separator: ',',
		tableName:'Dealer Sale',
		
		pdfFontSize:10,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);
	}catch(e){alert(e);}
});
	
	


	
	
$("#exportexcel").click(function(){

try
{
$('#printTabledealer').tableExport({
	type:'excel',escape:'false',separator: ',',
	tableName:'Dealer sale',
	
	pdfFontSize:10,
	
	htmlContent:'false',
	consoleLog:'false',
	
	}

);

}catch(e){alert(e);}
});

	
	  $scope.colourIncludes = [];
	  
  $scope.includeColour = function(colour) {
      var i = $.inArray(colour, $scope.colourIncludes);
      if (i > -1) {
    	  $scope.colourIncludes.splice(i, 1);
      } else {
    	  if($scope.colourIncludes.length < parseInt(document.getElementById("insertdaelerassdeviceno").value)){
    		  $scope.colourIncludes.push(colour);
    	  }else{
    		  document.getElementById(colour).checked = false;
    		jAlert('You Cannot Select Devices more than the Quantity!', 'Information');
    	  }
      }
  }
  $("#insertdaelerassdeviceno").blur( function() {
  	for(i=0;i<$scope.dealermodeldetails.length;i++)
		{ 

		if($scope.dealermodeldetails[i].modelname==document.getElementById('insertdealerassmodelname').value)
			{
			$scope.dealermodelId=$scope.dealermodeldetails[i].modelid;
			}
		}
//   	alert('http://localhost:8080/indtrackwebservice/rest/CallService/devicecount?count='+document.getElementById('insertdaelerassdeviceno').value+'&modelid='+$scope.dealermodelId+
//  		   '&dealerid='+sptstr[7]);
   $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicecount?count='+document.getElementById('insertdaelerassdeviceno').value+'&modelid='+$scope.dealermodelId+
		   '&dealerid='+sptstr[7])
		.success(function(data, status, headers, config) {
  		document.getElementById("devices").hidden = false;
		}).error(function(data, status, headers, config) {
			document.getElementById("devices").hidden = true;
			jAlert(document.getElementById('insertdaelerassdeviceno').value+' Devices are not available', 'Information');
			console.log('error: data = ', data);
		});
  	
   });
  
$scope.showdealerassigndiv1 = function() {
//alert("in");
document.getElementById("showeditdealerassign").hidden = false;
document.getElementById("maindealerassign").hidden = true;
}
$scope.back = function() {
document.getElementById("maindealerassign").hidden = false;
document.getElementById("showeditdealerassign").hidden = true;
}


$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
.success(function(data, status, headers, config) {

	$scope.assidealerdetailslist = data;

}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});



$scope.getAllStates = function (callback) {
	    callback($scope.assidealerdetailslist);
	};

	$scope.stateSelected = function (state) {
	    $scope.stateInfo = state.name + " (" + state.id + ")";
	}

$("#insertdealerassignname").blur( function() {

	var i=0,j=0;
	

	
	for(i=0;i<$scope.assidealerdetailslist.length;i++)
		{
		if($scope.assidealerdetailslist[i].paymentmode=='By Cash')
			{
			
			document.getElementById('insertdealerasscash').checked=true;
			if($scope.assidealerdetailslist[i].dealername==document.getElementById('insertdealerassignname').value)
			{
			document.getElementById('insertdealerasspayed').value=$scope.assidealerdetailslist[i].contactperson;
			document.getElementById('insertdealerassdispatchname').value=$scope.assidealerdetailslist[i].contactperson;
			document.getElementById('insertdealerdispatchphone').value=$scope.assidealerdetailslist[i].mobilenumber;
			document.getElementById('insertdealerassphone1').value=$scope.assidealerdetailslist[i].mobilenumber;
	}
			}
		else if($scope.assidealerdetailslist[i].paymentmode=='By Bank')
			{
			
			document.getElementById('insertdealerassneft').checked=true;
			}
		}
	
});
$(function() {
$('.datepick').datepicker({
format: "dd-M-yyyy",
endDate: '+0d',
autoclose: true
});  
$('.datepick').datepicker('setDate', '+0d');
});



$(function() {
$('input[name="pay"]').on('click', function() {
if ($(this).val() == 'Cheque') {
$('#cheque').show();
$('#chequedate').show();
}
else if($(this).val() == 'Credit') 
	{
	 $('#creditam').show();
 $('#creditdays').show();
 $('#cheque').hide();
    $('#chequedate').hide();
	}
else {
	 $('#cheque').hide();
    $('#chequedate').hide();
    $('#creditam').hide();
     $('#creditdays').hide();
}
});
});

$(function() {
$('input[name="insertorder"]').on('click', function() {
if ($(this).val() == 'Email') {
$('#emailiddiv').show();

$('#phonediv').hide();
$('#orderplacedpersondiv').hide();

}
else if($(this).val() == 'Phone') 
	{
	 $('#phonediv').show();
	 $('#emailiddiv').hide();
	 $('#orderplacedpersondiv').hide();
	 $('#verbaldiv').hide();
	}
else if($(this).val() == 'Verbal') 
{
$('#orderplacedpersondiv').show();
$('#phonediv').hide();
$('#emailiddiv').hide();

}
else {
	 $('#phonediv').hide();
	 $('#emailiddiv').hide();
	 $('#orderplacedpersondiv').hide();
}
});
});



$(function() {
$('input[name="insertdip"]').on('click', function() {
if ($(this).val() == 'Courier') {
$('#insertcouname').show();

$('#pacno').show();


$('#diapcthperdiv').hide();
	 $('#diapcthphonediv').hide();

}
else if($(this).val() == 'Self') 
	{
	 $('#diapcthperdiv').show();
	 $('#diapcthphonediv').show();
	
	 $('#insertcouname').hide();
  
    $('#pacno').hide();
	}

else {
	 $('#insertcouname').hide();
	  
    $('#diapcthperdiv').hide();
	 $('#diapcthphonediv').hide();
    $('#pacno').hide();
}
});
});


$(function() {
$('input[name="tax"]').on('click', function() {
if ($(this).val() == 'Octroi') {
$('#octraiDiv').show();
$('#taxDiv').show();
$('#VatDiv').hide();

}
else if($(this).val() == 'Vat') 
	{
	 $('#VatDiv').show();
	 $('#taxDiv').show();
  
    $('#octraiDiv').hide();
	}

else {
	  $('#octraiDiv').hide();
	  $('#taxDiv').hide();
   $('#VatDiv').hide();
   
}
});
});


try
{
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
$scope.dealerassigndetails = data;
}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});
}
catch(e)
{
}

//make

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
$scope.dealermakenamelist = data;

}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});

//	MODEL BIN
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
$scope.dealermodeldetails = data;

}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});


//dealerlist

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
.success(function(data, status, headers, config) {

$scope.dealerassdealerdetailslist = data;

}).error(function(data, status, headers, config) {
console.log('error: data = ', data);
});

///device
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {

	$scope.devicedealerlist = data;
}).error(function(data, status, headers, config) {
	alert("error");
console.log('error: data = ', data);
});

$scope.getName = function getName(newlist,nroute) {


}


$scope.editdealerassigndata=function editcustomer(editdealerass)
{
try
{
$scope.dealerassdata=editdealerass;

if($scope.dealerassdata.paymentmode =='Cheque')
{

document.getElementById('editdealerasscheque').checked=true;
document.getElementById('editchequ').hidden=false;
document.getElementById('editchqdate').hidden=false;

}
else if($scope.dealerassdata.paymentmode=='Cash')
{

document.getElementById('editdealerasscash').checked=true;

}
else if($scope.dealerassdata.paymentmode=='By Bank')
{

document.getElementById('editdealerassneft').checked=true;

}
else if($scope.dealerassdata.paymentmode=='Credit')
{ 
document.getElementById('editdealerasscredit').checked=true;
document.getElementById('editcreditdays').hidden=false;
document.getElementById('editcreditam').hidden=false;
}

if($scope.dealerassdata.order_placedby=='Email')
{
document.getElementById('editdealerassemail').checked=true;
document.getElementById('editemail').hidden=false;

}
else if($scope.dealerassdata.order_placedby=='Phone')
{
document.getElementById('editdealerassphone').checked=true;
document.getElementById('editphone').hidden=false;
}
else if($scope.dealerassdata.order_placedby=='Verbal')
{
document.getElementById('editdealerassverbal').checked=true;
document.getElementById('editverbal').hidden=false;
}



if($scope.dealerassdata.dispatchby=='Courier')
{
document.getElementById('editdealerasscourier').checked=true;
document.getElementById('editdiscourComp').hidden=false;
document.getElementById('editdispacno').hidden=false;
}
else if($scope.dealerassdata.dispatchby=='Self')
{
document.getElementById('editdealerassself').checked=true;
document.getElementById('editdisPers').hidden=false;
document.getElementById('editdisphon').hidden=false;
}


}
catch(e)
{
alert(e);
}
}

$scope.deletedealerassign = function(dealerassid){
jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
if(r){
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledelete?id='+dealerassid.transid)
.success(function(data, status, headers, config) {

$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
$scope.dealerassigndetails = data;
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

$("#insertdealerasstax").keyup( function() {
try
{	
	for(i=0;i<$scope.dealermodeldetails.length;i++)
	{ 

	if($scope.dealermodeldetails[i].modelname==document.getElementById('insertdealerassmodelname').value)
		{
		$scope.dealercost=$scope.dealermodeldetails[i].cost;
		}
	}
	var myResult=0;
	var result = document.getElementById('insertdealerasstax');	
	var textfieldvalue=[];
	for(j=1;j<=h;j++)
		{
		textfieldvalue[j-1]=document.getElementById("iname"+j).value;
		myResult=myResult+(parseInt(document.getElementById("iname"+j).value)/100);
			}
result.value = myResult*(parseInt($scope.dealercost)*parseInt(document.getElementById("insertdaelerassdeviceno").value));

}catch(e)
{
}

});
$("#insertdealerasstax").blur( function() {
try
{
var tax = parseInt(document.getElementById('insertdealerasstax').value);
var result = document.getElementById('insertdealerassfinaltotal');
result.value = tax+(parseInt($scope.dealercost)*parseInt(document.getElementById("insertdaelerassdeviceno").value));
}catch(e)
{
}

});

$scope.dealerassignInsert=function dealerassignInsert()
{

try	{

var mydealerinsert = document.DealerassignInsert; 
if (mydealerinsert.insertdealerassignname.value== "") 
{ 
	
	 mydealerinsert.insertdealerassignname.focus(); 
} 
else if (mydealerinsert.insertdealerassmakenameo.value== "") 
{ 
	
	 mydealerinsert.insertdealerassmakenameo.focus(); 
} 
else if (mydealerinsert.insertdealerassmodelname.value== "") 
{ 
	
	 mydealerinsert.insertdealerassmodelname.focus(); 
} 
else if (mydealerinsert.insertdaelerassdeviceno.value== "") 
{ 
	
	 mydealerinsert.insertdaelerassdeviceno.focus(); 
} 
else if (mydealerinsert.insertdealerpodate.value== "") 
{ 

	 mydealerinsert.insertdealerpodate.focus(); 
} 
else if (mydealerinsert.insertdealerassponumber.value== "") 
{ 

mydealerinsert.insertdealerassponumber.focus(); 
}
else if (mydealerinsert.insertdealerassinvoiceno.value== "") 
{ 

mydealerinsert.insertdealerassinvoiceno.focus(); 
}
else if (mydealerinsert.insertdealerassinvoicedate.value== "") 
{ 

mydealerinsert.insertdealerassinvoicedate.focus(); 
}
else if (mydealerinsert.insertdealerasspayed.value== "") 
{ 

mydealerinsert.insertdealerasspayed.focus(); 
}
else
{
var i=0;
for(i=0;i<$scope.dealerassdealerdetailslist.length;i++)
	{
	if($scope.dealerassdealerdetailslist[i].dealername==document.getElementById('insertdealerassignname').value)
		{
		$scope.insertSaledealerid=$scope.dealerassdealerdetailslist[i].dealerid;
		}
	}


if(document.getElementById('insertdealerasscheque').checked==true)
{
$scope.insertpaymentmode='Cheque';
}
else  if(document.getElementById('insertdealerasscash').checked==true)
{
$scope.insertpaymentmode='Cash';
}
else  if(document.getElementById('insertdealerassneft').checked==true)
{

$scope.insertpaymentmode='By Bank';
}
else  if(document.getElementById('insertdealerasscredit').checked==true)
{
$scope.insertpaymentmode='Credit';
}

if(document.getElementById('insertdealerassemail').checked==true)
{

$scope.insertorderplacedby='Email';

}
else  if(document.getElementById('insertdealerassphone').checked==true)
{

$scope.insertorderplacedby='Phone';

}
else  if(document.getElementById('insertdealerassverbal').checked==true)
{
$scope.insertorderplacedby='Verbal';

}

if(document.getElementById('insertdealerasscourier').checked==true)
{

$scope.insertdisptchplacedby='Courier';
}
else  if(document.getElementById('insertdealerassself').checked==true)
{

$scope.insertdisptchplacedby='Self';
}


	try
	{
		var i=0;
		for(i=0;i<$scope.dealermodeldetails.length;i++)
			{ 

			if($scope.dealermodeldetails[i].modelname==document.getElementById('insertdealerassmodelname').value)
				{
				$scope.dealermodelId=$scope.dealermodeldetails[i].modelid;
				}
			}
		try{
// 		alert('http://localhost:8080/indtrackwebservice/rest/CallService/devicecount?count='+document.getElementById('insertdaelerassdeviceno').value+
// 				'&modelid='+$scope.dealermodelId+'&dealerid='+sptstr[2]);
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicecount?count='+document.getElementById('insertdaelerassdeviceno').value+
				'&modelid='+$scope.dealermodelId+'&dealerid='+sptstr[7])
		.success(function(data, status, headers, config) {
			if($scope.colourIncludes.length==document.getElementById('insertdaelerassdeviceno').value){
	try{	 
		      $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleinsert?dealerid='+$scope.insertSaledealerid+
					'&no_devices='+document.getElementById('insertdaelerassdeviceno').value+
					'&purchaseorder_number='+document.getElementById('insertdealerassponumber').value+
					'&purchaseorder_date='+document.getElementById('insertdealerpodate').value+
					'&invoice_number='+document.getElementById('insertdealerassinvoiceno').value+
					'&invoice_date='+document.getElementById('insertdealerassinvoicedate').value+
					'&total='+
					'&tax='+document.getElementById('insertdealerasstax').value+
					'&octroi='+
					'&vatt='+
					'&modelid='+$scope.dealermodelId+
					'&count='+document.getElementById('insertdaelerassdeviceno').value+
					'&servicetax='+
					'&paymentmode='+$scope.insertpaymentmode+
					'&chequeno='+document.getElementById('insertdealerasscheque').value+
					'&chequedate='+document.getElementById('insertdealerasschequedate').value+
					'&creditdays='+document.getElementById('insertdealerasscreditdays').value+
					'&creditamount='+document.getElementById('insertdealerasscreditamount').value+
					'&payedby='+document.getElementById('insertdealerasspayed').value+
					'&order_placedby='+$scope.insertorderplacedby+
					'&emailidby='+document.getElementById('insertdaelerassemail').value+
					'&phonenoby='+document.getElementById('insertdealerassphone1').value+
					'&nameby='+document.getElementById('insertdealerassperson').value+
					'&dispatchnameby='+document.getElementById('insertdealerassdispatchname').value+
					'&dispatchphoneby='+document.getElementById('insertdealerdispatchphone').value+
					'&dispatchcourier='+document.getElementById('insertdealerasscouriercom').value+
					'&dispatchpaketno='+document.getElementById('insertdealerasspacketno').value+
					'&finaltotal='+document.getElementById("insertdealerassfinaltotal").value+
					'&loginid='+sptstr[2]+'&dispatchby='+ $scope.insertdisptchplacedby)
				.success(function(data, status, headers, config) {
					

							
							var dataObj = {
									imeino : $scope.colourIncludes
							}
							
							var res = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getimei?'+
									   'dealerid='+$scope.insertSaledealerid+'&ponum='+
									   document.getElementById('insertdealerassponumber').value+
									   '&loginid='+sptstr[2], dataObj);
							res.success(function(data, status, headers, config) {
								jAlert('Record Inserted Successfully', 'Success Dialog');
							});
							res.error(function(data, status, headers, config) {
								alert( "failure message: " + JSON.stringify({data: data}));
							});	
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.dealerassigndetails = data;
							}).error(function(data, status, headers, config) {
								jAlert('Record Not Inserted','Information');
								console.log('error: data = ', data);
							});
				}).error(function(data, status, headers, config) {
					jAlert('Record Not Inserted','Information');
					console.log('error: data = ', data);
				});
			}catch(e){
				alert(e);
			}
		}else{
			jAlert('Select Devices to sale','Information');
		}
		}).error(function(data, status, headers, config) {
			jAlert(document.getElementById('insertdaelerassdeviceno').value+'Devices are Not available','Information');
			console.log('error: data = ', data);
		});
		}catch(e){alert(e);}
	}catch(e)
	{
	}
}
}
catch(e)
{
alert(e);
}
}

$(function() {
	$('input[name="edittax"]').on('click', function() {
	if ($(this).val() == 'Octroi') {
	  $('#editoctraidiv').show();
	  $('#editvatdiv').hide();
	  $('# editdealerTaxdiv').show();
	}
	else if($(this).val() == 'Vat') 
		{
		 $('#editvatdiv').show();
		 $('#editoctraidiv').hide();
		 $('# editdealerTaxdiv').show();
		}

	else {
		 $('#editvatdiv').hide();
		 $('#editoctraidiv').hide();
		 $('# editdealerTaxdiv').hide();
	}
	});

});
$(function() {
	$('input[name="editdisptach"]').on('click', function() {
	if ($(this).val() == 'Courier') {
	  $('#editdiscourComp').show();
	  $('#editdispacno').show();
	  $('#editdisPers').hide();
		 $('#editdisphon').hide();
	}
	else if($(this).val() == 'Self') 
		{
		 $('#editdisPers').show();
		 $('#editdisphon').show();
		 
		 $('#editdiscourComp').hide();
		  $('#editdispacno').hide();
		}

	else {
		 $('#editdisPers').hide();
		 $('#editdisphon').hide();
		 
		 $('#editdiscourComp').hide();
		  $('#editdispacno').hide();
	}
	});

});
$(function() {
	$('input[name="editorder"]').on('click', function() {
	if ($(this).val() == 'Email') {
	  $('#editemail').show();
	  $('#editphone').hide();
	  $('#editverbal').hide();
	 
	}
	else if($(this).val() == 'Phone') 
		{
		 $('#editphone').show();
		 $('#editemail').hide();
		 $('#editverbal').hide();
		}
	else if($(this).val() == 'Verbal') 
			{
		 $('#editverbal').show();
		 $('#editphone').hide();
		 $('#editemail').hide();
		
		} 
	
	else {
		 $('#editverbal').hide();
		 $('#editphone').hide();
		 $('#editemail').hide();
	}
	});

});
$(function() {
	$('input[name="editpayment"]').on('click', function() {
	if ($(this).val() == 'Cheque') {
	  $('#editchequ').show();
	  $('#editchqdate').show();
	 
	 
	}
	else if($(this).val() == 'Cash') 
		{
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		}
	else if($(this).val() == 'By Bank') 
			{
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		} 
	else if($(this).val() == 'Credit') 
	{
$('#editcreditam').show();
$('#editcreditdays').show();
} 
	else {
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hid
	}
	});

});
//tax
$("#editdealersaletax").keyup( function() {
	try
	{
	for(i=0;i<$scope.dealermodeldetails.length;i++)
	{ 
	if($scope.dealermodeldetails[i].modelname==document.getElementById('editdealerassmodelname').value)
		{
		$scope.editdealercost=$scope.dealermodeldetails[i].cost;
		}
	}
	if(document.getElementById('editdealersaleoctrai').value!=null || document.getElementById('editdealersalevatt').value!=null){
	var octrai = parseInt(document.getElementById('editdealersaleoctrai').value);
	var vatt = parseInt(document.getElementById('editdealersalevatt').value);
	var result = document.getElementById('editdealersaletax');
	if(!octrai>0){
	octrai=0;
	}
	if(!vatt>0){
	vatt=0;
	}
	var myResult = (octrai/100)+(vatt/100);
	result.value = myResult*(parseInt($scope.editdealercost)*parseInt(document.getElementById("editdealerassnoofdevices").value));
	}

	}catch(e)
	{
	alert(e);
	}

	});

$("#editdealersaletax").blur( function() {
try
{
var tax = parseInt(document.getElementById('editdealersaletax').value);
var result = document.getElementById('editdealersalefinaltotal');
result.value = tax+(parseInt($scope.editdealercost)*parseInt(document.getElementById("editdealerassnoofdevices").value));
}catch(e)
{
alert(e);
}

});

$scope.dealerassignUpdate=function dealerassignUpdate()
{

try
{

$scope.transid=$scope.dealerassdata.transid;
var mydealeredit = document.editDealerassign; 
if (mydealeredit.editdealerassname.value== "") 
{ 

mydealerinsert.editdealerassname.focus(); 
} 
else if(mydealeredit.editdealerassnoofdevices.value== "") 
{ 
	
	 mydealerinsert.editdealerassnoofdevices.focus(); 
} 
else if(mydealeredit.editdealersalepodate.value== "") 
{ 
	
	 mydealerinsert.editdealersalepodate.focus(); 
} 
else if(mydealeredit.editdealersaleinvoiceno.value== "") 
{ 
	
	 mydealerinsert.editdealersaleinvoiceno.focus(); 
} 
else if(mydealeredit.editdealersaleinvoicedate.value== "") 
{ 
	
	 mydealerinsert.editdealersaleinvoicedate.focus(); 
} 

else if(mydealeredit.editdealersaletax.value== "") 
{ 
	
	 mydealerinsert.editdealersaletax.focus(); 
} 
else if(mydealeredit.editdalersalepayed.value== "") 
{ 
	
	 mydealerinsert.editdalersalepayed.focus(); 
} 
else if(mydealeredit.editdalersalepayed.value== "") 
{ 
	
	 mydealerinsert.editdalersalepayed.focus(); 
}
else
{
var i=0;
for(i=0;i<$scope.dealerassdealerdetailslist.length;i++)
{
if($scope.dealerassdealerdetailslist[i].dealername==document.getElementById('editdealerassname').value)
	{
	$scope.dealerEditdealersaleid=$scope.dealerassdealerdetailslist[i].dealerid;
	}
}


if(document.getElementById('editdealerasscheque').checked==true)
{
	$scope.editpaymentmode='Cheque';

}
else  if(document.getElementById('editdealerasscash').checked==true)
{
//alert("in if dealercash");
	$scope.editpaymentmode='Cash';

}
else  if(document.getElementById('editdealerassneft').checked==true)
{

	$scope.editpaymentmode='By Bank';
}
else  if(document.getElementById('editdealerasscredit').checked==true)
{
	$scope.editpaymentmode='Credit';

}

if(document.getElementById('editdealerassemail').checked==true)
{
$scope.editoderplaced='Email';

}
else  if(document.getElementById('editdealerassphone').checked==true)
{

$scope.editoderplaced='Phone';

}
else  if(document.getElementById('editdealerassverbal').checked==true)
{

$scope.editoderplaced='Verbal';
}



if(document.getElementById('editdealerasscourier').checked==true)
{
$scope.editdisptach='Courier';

}
else  if(document.getElementById('editdealerassself').checked==true)
{

$scope.editdisptach='Self';

}
	$http.get('	http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleupdate?'+
				'transid='+$scope.transid+'&dealerid='+$scope.dealerEditdealersaleid+
				'&no_devices='+document.getElementById('editdealerassnoofdevices').value+
				'&purchaseorder_number='+document.getElementById('editdealersaleponumber').value+
				'&purchaseorder_date='+document.getElementById('editdealersalepodate').value+
				'&invoice_number='+document.getElementById('editdealersaleinvoiceno').value+
				'&invoice_date='+document.getElementById('editdealersaleinvoicedate').value+
				'&total='+
				'&tax='+
				'&octroi='+
				'&vatt='+
				'&servicetax='+
				'&paymentmode='+  $scope.editpaymentmode+
				'&chequeno='+document.getElementById('editdealersalechqno').value+
				'&chequedate='+document.getElementById('editdalersalechqdate').value+
				'&creditdays='+document.getElementById('editdalersaledays').value+
				'&creditamount='+document.getElementById('editdealersalecreditamount').value+
				'&payedby='+document.getElementById('editdalersalepayed').value+
				'&order_placedby='+$scope.editoderplaced+
				'&emailidby='+document.getElementById('editdealeremailid').value+
				'&phonenoby='+document.getElementById('editdealersalephone').value+
				'&nameby='+document.getElementById('editdealersaleperson').value+
				'&dispatchnameby='+document.getElementById('ieditdealerassdispatchname').value+
				'&dispatchphoneby='+document.getElementById('editdealerdispatchphone').value+
				'&dispatchcourier='+document.getElementById('editdealerasscouriercom').value+
				'&dispatchpaketno='+document.getElementById('editdealerasspacketno').value+
				'&finaltotal='+document.getElementById('editdealersalefinaltotal').value+'&loginid='+sptstr[2]+
				'&dispatchby='+ $scope.editdisptach)
	.success(function(data, status, headers, config) {
		document.getElementById("maindealerassign").hidden = false;
		document.getElementById("showeditdealerassign").hidden = true;
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.dealerassigndetails = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		jAlert('Record Updated Successfully', 'Success Dialog');
		document.getElementById('editDealerassign').reset();
	}).error(function(data, status, headers, config) {
		jAlert('Record Not updated','Information');
		console.log('error: data = ', data);
	});
	
	}
}
catch(e)
{alert(e);}
}

});

scotchApp.controller('customerassignCtrl', function($scope,$http, $compile, $filter) {
	
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
	
	
	$scope.loginid=sptstr[2];
	
	
$scope.parentDealer='Banglore Dealers';
	
	try
	{
		if($scope.loginid!='10001')
		{
			document.getElementById('maindealer').hidden=true;
		
		}
	}catch(e){}
	
	
	function printData()
	{
	   var divToPrint=document.getElementById("printTablecustomer");
	   newWin= window.open("");
	   
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
	
	
$("#exportpdf").click(function(){
	
	try
	{
	$('#printTablecustomer').tableExport({
		type:'pdf',escape:'false',separator: ',',
		tableName:'Customer assignmnet',
		
		pdfFontSize:10,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);
	}catch(e){alert(e);}
});
	
	


	
	
$("#exportexcel").click(function(){

try
{
$('#printTablemodel').tableExport({
	type:'excel',escape:'false',separator: ',',
	tableName:'Customer assignmnet',
	
	pdfFontSize:10,
	
	htmlContent:'false',
	consoleLog:'false',
	
	}

);

}catch(e){alert(e);}
});







$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
.success(function(data, status, headers, config) {

	$scope.custassdealerlist = data;
}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});






	$scope.colourIncludes = [];
	$scope.includeColour = function(colour) {
	var i = $.inArray(colour, $scope.colourIncludes);
	if (i > -1) {
		  $scope.colourIncludes.splice(i, 1);
	} else {
		  if($scope.colourIncludes.length < parseInt(document.getElementById("insertcustomerassdeviceno").value)){
			  $scope.colourIncludes.push(colour);
		  }else{
			  document.getElementById(colour).checked = false;
			jAlert('You Cannot Select Devices more than the Quantity!', 'Information');
		  }
	}
	}
	$("#insertcustomerassdeviceno").blur( function() {
	for(i=0;i<$scope.customermodeldetails.length;i++)
		{ 

		if($scope.customermodeldetails[i].modelname==document.getElementById('insertcustomerassmodelname').value)
			{
			$scope.customermodelId=$scope.customermodeldetails[i].modelid;
			}
		}
	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicecountcustomer?count='+document.getElementById('insertcustomerassdeviceno').value+
			'&modelid='+$scope.customermodelId+
		   '&loginid='+sptstr[7])
		.success(function(data, status, headers, config) {
		document.getElementById("devicescustomer").hidden = false;
		}).error(function(data, status, headers, config) {
			document.getElementById("devicescustomer").hidden = true;
			jAlert(document.getElementById('insertcustomerassdeviceno').value+' Devices are not available', 'Information');
			console.log('error: data = ', data);
		});

	});
	$scope.showcustomerassigndiv1 = function() {
	document.getElementById("showeditcustomerassign").hidden = false;
	document.getElementById("maincustomerassign").hidden = true;
	}
	$scope.back = function() {
	document.getElementById("maincustomerassign").hidden = false;
	document.getElementById("showeditcustomerassign").hidden = true;
	}
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {

	$scope.assicustomerdetailslist = data;

	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});

	$scope.getAllStates = function (callback) {
	  callback($scope.assicustomerdetailslist);
	};
	$scope.stateSelected = function (state) {
	  $scope.stateInfo = state.name + " (" + state.id + ")";
	}

	$("#insertcustomerassignname").blur( function() {

	var i=0,j=0;
	for(i=0;i<$scope.assicustomerdetailslist.length;i++)
		{
		if($scope.assicustomerdetailslist[i].paymentmode=='By Cash')
			{
			
			document.getElementById('insertcustomerasscash').checked=true;
			if($scope.assicustomerdetailslist[i].customername==document.getElementById('insertcustomerassignname').value)
			{
			document.getElementById('insertcustomerasspayed').value=$scope.assicustomerdetailslist[i].contactperson;
			document.getElementById('insertcustomerassdispatchname').value=$scope.assicustomerdetailslist[i].contactperson;
			document.getElementById('insertcustomerdispatchphone').value=$scope.assicustomerdetailslist[i].mobilenumber;
			document.getElementById('insertcustomerassphone1').value=$scope.assicustomerdetailslist[i].mobilenumber;
	}
			}
		else if($scope.assicustomerdetailslist[i].paymentmode=='By Bank')
			{
			
			document.getElementById('insertcustomerassneft').checked=true;
			}
		}

	});

	$(function() {
	$('.datepick').datepicker({
	format: "dd-M-yyyy",
	endDate: '+0d',
	autoclose: true
	});  
	$('.datepick').datepicker('setDate', '+0d');
	});


	$(function() {
	$('input[name="pay"]').on('click', function() {
	if ($(this).val() == 'Cheque') {
	$('#cheque').show();
	$('#chequedate').show();
	}
	else if($(this).val() == 'Credit') 
	{
	$('#creditam').show();
	$('#creditdays').show();
	$('#cheque').hide();
	$('#chequedate').hide();
	}
	else {
	$('#cheque').hide();
	$('#chequedate').hide();
	$('#creditam').hide();
	$('#creditdays').hide();
	}
	});
	});

	$(function() {
	$('input[name="insertorder"]').on('click', function() {
	if ($(this).val() == 'Email') {
	$('#emailiddiv').show();

	$('#phonediv').hide();
	$('#orderplacedpersondiv').hide();

	}
	else if($(this).val() == 'Phone') 
	{
	$('#phonediv').show();
	$('#emailiddiv').hide();
	$('#orderplacedpersondiv').hide();
	$('#verbaldiv').hide();
	}
	else if($(this).val() == 'Verbal') 
	{
	$('#orderplacedpersondiv').show();
	$('#phonediv').hide();
	$('#emailiddiv').hide();

	}
	else {
	$('#phonediv').hide();
	$('#emailiddiv').hide();
	$('#orderplacedpersondiv').hide();
	}
	});
	});



	$(function() {
	$('input[name="insertdip"]').on('click', function() {
	if ($(this).val() == 'Courier') {
	$('#insertcouname').show();

	$('#pacno').show();


	$('#diapcthperdiv').hide();
	$('#diapcthphonediv').hide();

	}
	else if($(this).val() == 'Self') 
	{
	$('#diapcthperdiv').show();
	$('#diapcthphonediv').show();

	$('#insertcouname').hide();

	$('#pacno').hide();
	}

	else {
	$('#insertcouname').hide();

	$('#diapcthperdiv').hide();
	$('#diapcthphonediv').hide();
	$('#pacno').hide();
	}
	});
	});


	$(function() {
	$('input[name="tax"]').on('click', function() {
	if ($(this).val() == 'Octroi') {
	$('#octraiDiv').show();
	$('#taxDiv').show();
	$('#VatDiv').hide();

	}
	else if($(this).val() == 'Vat') 
	{
	$('#VatDiv').show();
	$('#taxDiv').show();

	$('#octraiDiv').hide();
	}

	else {
	$('#octraiDiv').hide();
	$('#taxDiv').hide();
	$('#VatDiv').hide();

	}
	});
	});


	try
	{
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
	$scope.customerassigndetails = data;
	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});
	}
	catch(e)
	{
	}

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
	$scope.customermakenamelist = data;

	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
	$scope.customermodeldetails = data;

	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
	.success(function(data, status, headers, config) {

	$scope.customerasscustomerdetailslist = data;

	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {

	$scope.devicecustomerlist = data;
	}).error(function(data, status, headers, config) {
	alert("error");
	console.log('error: data = ', data);
	});

	$scope.getName = function getName(newlist,nroute) {


	}


	$scope.editcustomerassigndata=function editcustomer(editcustomerass)
	{
	try
	{
	$scope.customerassdata=editcustomerass;

	if($scope.customerassdata.paymentmode =='Cheque')
	{

	document.getElementById('editcustomerasscheque').checked=true;
	document.getElementById('editchequ').hidden=false;
	document.getElementById('editchqdate').hidden=false;

	}
	else if($scope.customerassdata.paymentmode=='Cash')
	{

	document.getElementById('editcustomerasscash').checked=true;

	}
	else if($scope.customerassdata.paymentmode=='By Bank')
	{

	document.getElementById('editcustomerassneft').checked=true;

	}
	else if($scope.customerassdata.paymentmode=='Credit')
	{ 
	document.getElementById('editcustomerasscredit').checked=true;
	document.getElementById('editcreditdays').hidden=false;
	document.getElementById('editcreditam').hidden=false;
	}

	if($scope.customerassdata.order_placedby=='Email')
	{
	document.getElementById('editcustomerassemail').checked=true;
	document.getElementById('editemail').hidden=false;

	}
	else if($scope.customerassdata.order_placedby=='Phone')
	{
	document.getElementById('editcustomerassphone').checked=true;
	document.getElementById('editphone').hidden=false;
	}
	else if($scope.customerassdata.order_placedby=='Verbal')
	{
	document.getElementById('editcustomerassverbal').checked=true;
	document.getElementById('editverbal').hidden=false;
	}



	if($scope.customerassdata.dispatchby=='Courier')
	{
	document.getElementById('editcustomerasscourier').checked=true;
	document.getElementById('editdiscourComp').hidden=false;
	document.getElementById('editdispacno').hidden=false;
	}
	else if($scope.customerassdata.dispatchby=='Self')
	{
	document.getElementById('editcustomerassself').checked=true;
	document.getElementById('editdisPers').hidden=false;
	document.getElementById('editdisphon').hidden=false;
	}

	}
	catch(e)
	{
	alert(e);
	}
	}

	$scope.deletecustomerassign = function(customerassid){
	jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
	if(r){
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledelete?id='+customerassid.transid)
	.success(function(data, status, headers, config) {

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
	$scope.customerassigndetails = data;
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

	$("#insertcustomerasstax").keyup( function() {
	try
	{	
	for(i=0;i<$scope.customermodeldetails.length;i++)
	{ 

	if($scope.customermodeldetails[i].modelname==document.getElementById('insertcustomerassmodelname').value)
		{
		$scope.customercost=$scope.customermodeldetails[i].cost;
		}
	}
	var myResult=0;
	var result = document.getElementById('insertcustomerasstax');	
	var textfieldvalue=[];
	for(j=1;j<=h;j++)
		{
		textfieldvalue[j-1]=document.getElementById("iname"+j).value;
		myResult=myResult+(parseInt(document.getElementById("iname"+j).value)/100);
			}
	result.value = myResult*(parseInt($scope.customercost)*parseInt(document.getElementById("insertcustomerassdeviceno").value));

	}catch(e)
	{
	}

	});
	$("#insertcustomerasstax").blur( function() {
	try
	{
	var tax = parseInt(document.getElementById('insertcustomerasstax').value);
	var result = document.getElementById('insertcustomerassfinaltotal');
	result.value = tax+(parseInt($scope.customercost)*parseInt(document.getElementById("insertcustomerassdeviceno").value));
	}catch(e)
	{
	}

	});

	$scope.CustomerassignInsert=function CustomerassignInsert()
	{
	try	{

	var mycustomerinsert = document.customerassignInsert; 
	if (mycustomerinsert.insertcustomerassignname.value== "") 
	{ 

	mycustomerinsert.insertcustomerassignname.focus(); 
	} 
	else if (mycustomerinsert.insertcustomerassmakenameo.value== "") 
	{ 

	mycustomerinsert.insertcustomerassmakenameo.focus(); 
	} 
	else if (mycustomerinsert.insertcustomerassmodelname.value== "") 
	{ 

	mycustomerinsert.insertcustomerassmodelname.focus(); 
	} 
	else if (mycustomerinsert.insertcustomerassdeviceno.value== "") 
	{ 

	mycustomerinsert.insertcustomerassdeviceno.focus(); 
	} 
	else if (mycustomerinsert.insertcustomerpodate.value== "") 
	{ 

	mycustomerinsert.insertcustomerpodate.focus(); 
	} 
	else if (mycustomerinsert.insertcustomerassponumber.value== "") 
	{ 

	mycustomerinsert.insertcustomerassponumber.focus(); 
	}
	else if (mycustomerinsert.insertcustomerassinvoiceno.value== "") 
	{ 

	mycustomerinsert.insertcustomerassinvoiceno.focus(); 
	}
	else if (mycustomerinsert.insertcustomerassinvoicedate.value== "") 
	{ 

	mycustomerinsert.insertcustomerassinvoicedate.focus(); 
	}
	else if (mycustomerinsert.insertcustomerasspayed.value== "") 
	{ 

	mycustomerinsert.insertcustomerasspayed.focus(); 
	}
	else
	{
	var i=0;
	for(i=0;i<$scope.customerasscustomerdetailslist.length;i++)
	{
	if($scope.customerasscustomerdetailslist[i].customername==document.getElementById('insertcustomerassignname').value)
		{
		$scope.insertSalecustomerid=$scope.customerasscustomerdetailslist[i].customerid;
		}
	}

	if(document.getElementById('insertcustomerasscheque').checked==true)
	{
	$scope.insertpaymentmode='Cheque';
	}
	else  if(document.getElementById('insertcustomerasscash').checked==true)
	{
	$scope.insertpaymentmode='Cash';
	}
	else  if(document.getElementById('insertcustomerassneft').checked==true)
	{

	$scope.insertpaymentmode='By Bank';
	}
	else  if(document.getElementById('insertcustomerasscredit').checked==true)
	{
	$scope.insertpaymentmode='Credit';
	}


	//fororder plac


	if(document.getElementById('insertcustomerassemail').checked==true)
	{

	$scope.insertorderplacedby='Email';

	}
	else  if(document.getElementById('insertcustomerassphone').checked==true)
	{

	$scope.insertorderplacedby='Phone';

	}
	else  if(document.getElementById('insertcustomerassverbal').checked==true)
	{
	$scope.insertorderplacedby='Verbal';

	}

	if(document.getElementById('insertcustomerasscourier').checked==true)
	{

	$scope.insertdisptchplacedby='Courier';
	}
	else  if(document.getElementById('insertcustomerassself').checked==true)
	{

	$scope.insertdisptchplacedby='Self';
	}


	try
	{
		var i=0;
		for(i=0;i<$scope.customermodeldetails.length;i++)
			{ 

			if($scope.customermodeldetails[i].modelname==document.getElementById('insertcustomerassmodelname').value)
				{
				$scope.customermodelId=$scope.customermodeldetails[i].modelid;
				}
			}
		
		 for(i=0;i<$scope.custassdealerlist.length;i++)
			 {
			 if($scope.custassdealerlist[i].dealername==document.getElementById('custassSubdealerdetails').value)
				 {
				 $scope.dealerassid=$scope.custassdealerlist[i].dealerid;
				 }
			 }
		 $scope.dealerassid = sptstr[7];
		try{
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicecountcustomer?'+
				'count='+document.getElementById('insertcustomerassdeviceno').value+
				'&modelid='+$scope.customermodelId+'&dealerid='+sptstr[7])
		.success(function(data, status, headers, config) {
			if($scope.colourIncludes.length=document.getElementById('insertcustomerassdeviceno').value){
	try{	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleinsertcustomer?customerid='+$scope.insertSalecustomerid+
					'&no_devices='+document.getElementById('insertcustomerassdeviceno').value+
					'&purchaseorder_number='+document.getElementById('insertcustomerassponumber').value+
					'&purchaseorder_date='+document.getElementById('insertcustomerpodate').value+
					'&invoice_number='+document.getElementById('insertcustomerassinvoiceno').value+
					'&invoice_date='+document.getElementById('insertcustomerassinvoicedate').value+
					'&total='+
					'&tax='+document.getElementById('insertcustomerasstax').value+
					'&octroi='+
					'&vatt='+
					'&modelid='+$scope.customermodelId+
					'&count='+document.getElementById('insertcustomerassdeviceno').value+
					'&servicetax='+
					'&paymentmode='+$scope.insertpaymentmode+
					'&chequeno='+document.getElementById('insertcustomerasscheque').value+
					'&chequedate='+document.getElementById('insertcustomerasschequedate').value+
					'&creditdays='+document.getElementById('insertcustomerasscreditdays').value+
					'&creditamount='+document.getElementById('insertcustomerasscreditamount').value+
					'&payedby='+document.getElementById('insertcustomerasspayed').value+
					'&order_placedby='+$scope.insertorderplacedby+
					'&emailidby='+document.getElementById('insertcustomerassemail').value+
					'&phonenoby='+document.getElementById('insertcustomerassphone1').value+
					'&nameby='+document.getElementById('insertcustomerassperson').value+
					'&dispatchnameby='+document.getElementById('insertcustomerassdispatchname').value+
					'&dispatchphoneby='+document.getElementById('insertcustomerdispatchphone').value+
					'&dispatchcourier='+document.getElementById('insertcustomerasscouriercom').value+
					'&dispatchpaketno='+document.getElementById('insertcustomerasspacketno').value+
					'&finaltotal='+document.getElementById("insertcustomerassfinaltotal").value+
					'&loginid='+sptstr[2]+'&dispatchby='+ $scope.insertdisptchplacedby+'&parentloginid='+$scope.dealerassid)
				.success(function(data, status, headers, config) {
					

							
							var dataObj = {
									imeino : $scope.colourIncludes
							}
							
							var res = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getimeicustomer?'+
									   'customerid='+$scope.insertSalecustomerid+'&ponum='+
									   document.getElementById('insertcustomerassponumber').value+
									   '&loginid='+sptstr[2], dataObj);
							res.success(function(data, status, headers, config) {
								jAlert('Record Inserted Successfully', 'Success Dialog');
							});
							res.error(function(data, status, headers, config) {
								alert( "failure message: " + JSON.stringify({data: data}));
							});	
					
					
					
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.customerassigndetails = data;
							}).error(function(data, status, headers, config) {
								jAlert('Record Not Inserted','Information');
								console.log('error: data = ', data);
							});
				}).error(function(data, status, headers, config) {
					jAlert('Record Not Inserted','Information');
					console.log('error: data = ', data);
				});
			}catch(e){
				alert(e);
			}
		}else{
			jAlert('Select Devices to sale','Information');
		}
		}).error(function(data, status, headers, config) {
			jAlert(document.getElementById('insertcustomerassdeviceno').value+'Devices are Not available','Information');
			console.log('error: data = ', data);
		});
		}catch(e){alert(e);}
	}catch(e)
	{
		alert(e);
	}
	}
	}
	catch(e)
	{
	alert(e);
	}
	}

	$(function() {
	$('input[name="edittax"]').on('click', function() {
	if ($(this).val() == 'Octroi') {
	$('#editoctraidiv').show();
	$('#editvatdiv').hide();
	$('# editcustomerTaxdiv').show();
	}
	else if($(this).val() == 'Vat') 
		{
		 $('#editvatdiv').show();
		 $('#editoctraidiv').hide();
		 $('# editcustomerTaxdiv').show();
		}

	else {
		 $('#editvatdiv').hide();
		 $('#editoctraidiv').hide();
		 $('# editcustomerTaxdiv').hide();
	}
	});

	});


	$(function() {
	$('input[name="editdisptach"]').on('click', function() {
	if ($(this).val() == 'Courier') {
	$('#editdiscourComp').show();
	$('#editdispacno').show();
	$('#editdisPers').hide();
		 $('#editdisphon').hide();
	}
	else if($(this).val() == 'Self') 
		{
		 $('#editdisPers').show();
		 $('#editdisphon').show();
		 
		 $('#editdiscourComp').hide();
		  $('#editdispacno').hide();
		}

	else {
		 $('#editdisPers').hide();
		 $('#editdisphon').hide();
		 
		 $('#editdiscourComp').hide();
		  $('#editdispacno').hide();
	}
	});

	});


	$(function() {
	$('input[name="editorder"]').on('click', function() {
	if ($(this).val() == 'Email') {
	$('#editemail').show();
	$('#editphone').hide();
	$('#editverbal').hide();

	}
	else if($(this).val() == 'Phone') 
		{
		 $('#editphone').show();
		 $('#editemail').hide();
		 $('#editverbal').hide();
		}
	else if($(this).val() == 'Verbal') 
			{
		 $('#editverbal').show();
		 $('#editphone').hide();
		 $('#editemail').hide();
		
		} 

	else {
		 $('#editverbal').hide();
		 $('#editphone').hide();
		 $('#editemail').hide();
	}
	});

	});



	$(function() {
	$('input[name="editpayment"]').on('click', function() {
	if ($(this).val() == 'Cheque') {
	$('#editchequ').show();
	$('#editchqdate').show();


	}
	else if($(this).val() == 'Cash') 
		{
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		}
	else if($(this).val() == 'By Bank') 
			{
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		} 
	else if($(this).val() == 'Credit') 
	{
	$('#editcreditam').show();
	$('#editcreditdays').show();
	} 
	else {
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hid
	}
	});

	});
	//tax
	$("#editcustomersaletax").keyup( function() {
	try
	{
	for(i=0;i<$scope.customermodeldetails.length;i++)
	{ 
	if($scope.customermodeldetails[i].modelname==document.getElementById('editcustomerassmodelname').value)
		{
		$scope.editcustomercost=$scope.customermodeldetails[i].cost;
		}
	}
	if(document.getElementById('editcustomersaleoctrai').value!=null || document.getElementById('editcustomersalevatt').value!=null){
	var octrai = parseInt(document.getElementById('editcustomersaleoctrai').value);
	var vatt = parseInt(document.getElementById('editcustomersalevatt').value);
	var result = document.getElementById('editcustomersaletax');
	if(!octrai>0){
	octrai=0;
	}
	if(!vatt>0){
	vatt=0;
	}
	var myResult = (octrai/100)+(vatt/100);
	result.value = myResult*(parseInt($scope.editcustomercost)*parseInt(document.getElementById("editcustomerassnoofdevices").value));
	}

	}catch(e)
	{
	alert(e);
	}

	});

	$("#editcustomersaletax").blur( function() {
	try
	{
	var tax = parseInt(document.getElementById('editcustomersaletax').value);
	var result = document.getElementById('editcustomersalefinaltotal');
	result.value = tax+(parseInt($scope.editcustomercost)*parseInt(document.getElementById("editcustomerassnoofdevices").value));
	}catch(e)
	{
	alert(e);
	}

	});

	$scope.CustomerassignUpdate=function CustomerassignUpdate()
	{

	try
	{

	$scope.transid=$scope.customerassdata.transid;
	var mycustomeredit = document.editcustomerassign; 
	if (mycustomeredit.editcustomerassname.value== "") 
	{ 

	mycustomerinsert.editcustomerassname.focus(); 
	} 
	else if(mycustomeredit.editcustomerassnoofdevices.value== "") 
	{ 

	mycustomerinsert.editcustomerassnoofdevices.focus(); 
	} 
	else if(mycustomeredit.editcustomersalepodate.value== "") 
	{ 

	mycustomerinsert.editcustomersalepodate.focus(); 
	} 
	else if(mycustomeredit.editcustomersaleinvoiceno.value== "") 
	{ 

	mycustomerinsert.editcustomersaleinvoiceno.focus(); 
	} 
	else if(mycustomeredit.editcustomersaleinvoicedate.value== "") 
	{ 

	mycustomerinsert.editcustomersaleinvoicedate.focus(); 
	} 

	else if(mycustomeredit.editcustomersaletax.value== "") 
	{ 

	mycustomerinsert.editcustomersaletax.focus(); 
	} 
	else if(mycustomeredit.editdalersalepayed.value== "") 
	{ 

	mycustomerinsert.editdalersalepayed.focus(); 
	} 
	else if(mycustomeredit.editdalersalepayed.value== "") 
	{ 

	mycustomerinsert.editdalersalepayed.focus(); 
	}
	else
	{
	var i=0;
	for(i=0;i<$scope.customerasscustomerdetailslist.length;i++)
	{
	if($scope.customerasscustomerdetailslist[i].customername==document.getElementById('editcustomerassname').value)
	{
	$scope.customerEditcustomersaleid=$scope.customerasscustomerdetailslist[i].customerid;
	}
	}


	if(document.getElementById('editcustomerasscheque').checked==true)
	{
	$scope.editpaymentmode='Cheque';

	}
	else  if(document.getElementById('editcustomerasscash').checked==true)
	{
	//alert("in if customercash");
	$scope.editpaymentmode='Cash';

	}
	else  if(document.getElementById('editcustomerassneft').checked==true)
	{

	$scope.editpaymentmode='By Bank';
	}
	else  if(document.getElementById('editcustomerasscredit').checked==true)
	{
	$scope.editpaymentmode='Credit';

	}

	if(document.getElementById('editcustomerassemail').checked==true)
	{
	$scope.editoderplaced='Email';

	}
	else  if(document.getElementById('editcustomerassphone').checked==true)
	{

	$scope.editoderplaced='Phone';

	}
	else  if(document.getElementById('editcustomerassverbal').checked==true)
	{

	$scope.editoderplaced='Verbal';
	}



	if(document.getElementById('editcustomerasscourier').checked==true)
	{
	$scope.editdisptach='Courier';

	}
	else  if(document.getElementById('editcustomerassself').checked==true)
	{

	$scope.editdisptach='Self';

	}
	$http.get('	http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleupdatecustomer?'+
				'transid='+$scope.transid+'&customerid='+$scope.customerEditcustomersaleid+
				'&no_devices='+document.getElementById('editcustomerassnoofdevices').value+
				'&purchaseorder_number='+document.getElementById('editcustomersaleponumber').value+
				'&purchaseorder_date='+document.getElementById('editcustomersalepodate').value+
				'&invoice_number='+document.getElementById('editcustomersaleinvoiceno').value+
				'&invoice_date='+document.getElementById('editcustomersaleinvoicedate').value+
				'&total='+
				'&tax='+
				'&octroi='+
				'&vatt='+
				'&servicetax='+
				'&paymentmode='+  $scope.editpaymentmode+
				'&chequeno='+document.getElementById('editcustomersalechqno').value+
				'&chequedate='+document.getElementById('editdalersalechqdate').value+
				'&creditdays='+document.getElementById('editdalersaledays').value+
				'&creditamount='+document.getElementById('editcustomersalecreditamount').value+
				'&payedby='+document.getElementById('editdalersalepayed').value+
				'&order_placedby='+$scope.editoderplaced+
				'&emailidby='+document.getElementById('editcustomeremailid').value+
				'&phonenoby='+document.getElementById('editcustomersalephone').value+
				'&nameby='+document.getElementById('editcustomersaleperson').value+
				'&dispatchnameby='+document.getElementById('ieditcustomerassdispatchname').value+
				'&dispatchphoneby='+document.getElementById('editcustomerdispatchphone').value+
				'&dispatchcourier='+document.getElementById('editcustomerasscouriercom').value+
				'&dispatchpaketno='+document.getElementById('editcustomerasspacketno').value+
				'&finaltotal='+document.getElementById('editcustomersalefinaltotal').value+'&loginid='+sptstr[2]+
				'&dispatchby='+ $scope.editdisptach)
	.success(function(data, status, headers, config) {
		document.getElementById("maincustomerassign").hidden = false;
		document.getElementById("showeditcustomerassign").hidden = true;
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.customerassigndetails = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		jAlert('Record Updated Successfully', 'Success Dialog');
		document.getElementById('editcustomerassign').reset();
	}).error(function(data, status, headers, config) {
		jAlert('Record Not updated','Information');
		console.log('error: data = ', data);
	});

	}
	}
	catch(e)
	{alert(e);}
	}
	});

	</script>
</head>

<!-- define angular controller -->
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
