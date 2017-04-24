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
			
	
	
	
	
	
	$("#historyexcel").click(function(){
		
		try
		{
		$('#historytable').tableExport({
			type:'excel',escape:'false',separator: ',',
			tableName:'History Log',
			
			pdfFontSize:10,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);

		}catch(e){}
	});
	
	$scope.getdatahist = function(){
		
		document.getElementById("historytableback").hidden = true;
		document.getElementById("loghistorydiv").hidden = false;
		document.getElementById("historytable").hidden = false;
		document.getElementById("historytable1").hidden = false;
		
		document.getElementById("historymapframefr").src = "";
		document.getElementById("historymapframe").hidden = true;
	}
	
	$scope.getAllMap = function(){
		
		
//		alert($scope.historylogreport);
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
			alert( "Exception details: " + JSON.stringify({data: data}));
		});
		
		
//		alert("yusgdyfh");
	}
	
	
	$scope.getmodal = function(comp){
		try{
			document.getElementById("historytableback").hidden = true;
//		alert(comp.tripid+" "+comp.mindatereceived+" "+comp.latitude+" "+comp.longitude);
		document.getElementById("vehicleframehistory").src = "vehiclesummarysingle?vehicleno="+document.getElementById('historyvehicleno').value
			+"&tripid="+comp.vehiclespeed+"&date="+comp.datatimestamp+"&latitude="+comp.latitude+"&longitude="+comp.longitude;
		var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");

//		$('a[data-modal-id]').click(function(e) {
//			e.preventDefault();
	    $("#historytable").append(appendthis);
	    $(".modal-overlay").fadeTo(500, 0.7);
	    //$(".js-modalbox").fadeIn(500);
			var modalBox = $("#historytable").attr('data-modal-id');
			$('#popup2').fadeIn($("#historytable").data());
//		});  
	  
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

	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {
		$scope.historyvehicledetails = data;
		
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	
	
	
	
	
	$scope.getLogs=function()
	 {
		var myform = document.history;
	      if (myform.historyvehicleno.value== "")
	      {
	    	  myform.historyvehicleno.focus();
	      }
	      else  if(myform.historyfromndate.value== "")
	      {
	    	  myform.historyfromndate.focus();
	      }
	      else  if(myform.historytodate.value== "")
	      {
	    	  myform.historytodate.focus();
	      }
	      else
	    	  {
	    	 
		 var over = '<div id="overlay">' +
//	     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg"/> <br />Please Wait While Prepare you folder...</p>' +
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
