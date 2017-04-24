/**
 * 
 */

alert("in homejs ");
  
	// create the module and name it scotchApp
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
		function lengthValidation(obj)
		{	var number = (obj.value).length;
			if(number<10) {
		document.getElementById('length').hidden=false;
	 		 	obj.value = ob.value.replace(number,"");
	 	}	else	{	document.getElementById('length').hidden=true;}
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
		
		if(number<15) {

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
		}catch(e)
		{	alert(e);
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
			}).when('/DealerAssignFormUpdate', {
				templateUrl : 'DealerAssignFormUpdate',
				controller  : 'dealerassignCtrl'
			}).
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
	
})
.when('/DealerDashboard', {
	templateUrl : 'DealerDashboard',
	controller  : 'dealerdasboardctrl'

}).when('/dashboard', {
	templateUrl : 'dashboard',
	controller  : 'dashController'

}).
			otherwise({
				redirectTo : '/'
			});
	});

	// create the controller and inject Angular's $scope   
// 	vehiclesummaryreport  

	scotchApp.controller('MapCtrl', function($scope,$http, $compile, $filter) {
		// create a message to display in our view
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
