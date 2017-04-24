		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en" ng-app="scotchApp">
<head>
  <title>ORSAC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="resources/assets/alertjs/js/jquery.js"></script>
<!--   <link type="text/css" rel="shortcut icon" href="resources/assets/images/logonew.png"> -->
  <link type="text/css" rel="stylesheet" href="resources/assets/alertjs/jquery.alerts.css">
  <link type="text/css" rel="stylesheet" href="resources/assets/fonts/fonts.googleapis.com.css">
  <link rel="stylesheet" type="text/css" href="resources/assets/font-awesome/4.2.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="resources/assets/css/ace.min.css" type="text/css">
  <link rel="stylesheet" type="text/css" type="text/css" href="resources/assets/navcssnew11.css" type="text/css">
<!--   <link rel="stylesheet" type="text/css" href="resources/assets/style11.css"> -->
<!--   <link rel="stylesheet" type="text/css" href="resources/mainjavascript/font-awesome.css"> -->
 <link rel="stylesheet" type="text/css" href="resources/mainjavascript/loginpagescript/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="resources/mainjavascript/datepicker3.css" >
<!--  <link rel="stylesheet" href="resources/css/alert.css" /> -->
 <link rel="stylesheet" type="text/css" href="resources/timepicker/css/timepicki.css" >
<!--  <script src="resources/assets/alertjs/js/jquery.ui.draggable.js"></script> -->
 <script src="resources/assets/alertjs/js/jquery.alerts.js" type="text/javascript"></script>
  <script src="resources/mainjavascript/angular.min.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/angular-route.js" type="text/javascript"></script>
 <script src="resources/mainjavascript/dirPagination.js" type="text/javascript"></script>
  <script src="resources/mainjavascript/jquery.min.js" type="text/javascript"></script>
  <script src="resources/mainjavascript/bootstrap.min.js" type="text/javascript"></script>
<!--  <script src="resources/mainjavascript/jquery-ui.js"></script> -->
 <script src="resources/mainjavascript/bootstrap-datepicker.js" type="text/javascript"></script>
<!--  <script src="resources/mainjavascript/ui-bootstrap-tpls.js"></script> -->
 <script src="resources/mainjavascript/jsapi" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="src/main/webapp/resources/css/styles.css">
<script src="resources/assets/js/ace.min.js" type="text/javascript"></script>
<script src="resources/script/timpicker.js" type="text/javascript"></script>
<script src="resources/assets/newpdf/jspdf.min.js" type="text/javascript"></script> 
 
<script src="resources/assets/Exportjs/jquery.base64.js" type="text/javascript"></script>
<script src="resources/assets/Exportjs/tableExport.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<!-- //pdf -->
<!-- <script src="resources/assets/libs/jspdf.min.js"></script> -->

<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script src="resources/assets/libs/jspdf.plugin.autotable.src.js"></script>
<!-- <script type="text/javascript" src="http://cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js"></script> -->
<!-- <script type="text/javascript" src="http://cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js"></script> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
 <style type="text/css">
    .selectRow {
	    display : block;
	    padding : 20px;
	}
	.select2-container {
	    width: 200px;
	}
	 .upload-button {
    padding: 4px;
    border: 1px solid black;
    border-radius: 5px;
    display: block;
    float: left;
}

.profile-pic {
    max-width: 200px;
    max-height: 200px;
    display: block;
}

.file-upload {
    display: none;
}

#circle2 {
    width: 25px;
    height: 25px;
    background: #8B7500; 
    -moz-border-radius: 30px;
    -webkit-border-radius: 30px;
    border-radius: 25px;
    border: 3px solid #8B4513; 
}
#circle3 {
    width: 38px;
    height: 25px;
 background: #8B7500; 
    -moz-border-radius: 30px;
    -webkit-border-radius: 30px;
    border-radius: 25px;
    border: 3px solid #8B4513; 
}
#circle4 {
    width: 25px;
    height: 25px;
 background: #8B7500; 
    -moz-border-radius: 30px;
    -webkit-border-radius: 30px;
    border-radius: 25px;
    border: 3px solid #8B4513; 
}
#circle {
    width: 38px;
    height: 25px;
 background: #8B7500; 
    -moz-border-radius: 30px;
    -webkit-border-radius: 30px;
    border-radius: 25px;
    border: 3px solid #8B4513; 
}
  </style>
<style>
	#load{
    width:100%;
    height:100%;
    position:fixed;
	background-color:white;
    background:url('resources/assets/images/horizontalloader.gif') no-repeat center center rgba(0,0,0,0.25)
}
/*   tr:nth-child(even) {background:  #D7D6DE;}  */
/*   tr:nth-child(even) {background:#E4DBC3;}   */
 
/*    tr:nth-child(even) {background:#C0C0C0;}   */
 
/*   tr:nth-child(odd){backgroundr: #d3d3d3;}	 */
/*  tr:nth-child(odd){backgroundr: red;}	 */
/* The Modal (Company) */
.modal { 
    display: none; /* Hidden by default */ 
     position: fixed; /* Stay in place */ 
   
     padding-top: 80px; /* Location of the box */ 
     left: 0; 
     top: 0; 
    width: 100%; /* Full width */ 
     height: 100%; /* Full height */ 
     overflow: auto; /* Enable scroll if needed */ 
    
 } 
/* Modal Content */
 .modal-content { 
     position: relative; 
     background-color: #fefefe; 
     margin: auto; 
     padding: 0; 
     border: 1px solid #888; 
     width:80%; 
     box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19); 
     -webkit-animation-name: animatetop; 
     -webkit-animation-duration: 0.4s; 
     animation-name: animatetop; 
          animation-duration: 0.4s 
 } 

 /* Add Animation */ 
 @-webkit-keyframes animatetop { 
     from {top:-300px; opacity:0}  
     to {top:0; opacity:1} 
 } 

 @keyframes animatetop { 
     from {top:-300px; opacity:0} 
    to {top:0; opacity:1} 
 } 

 /* The Close Button */ 
 .close { 
     color: red;
/*      background:white;  */
     float: right; 
     font-size: 20px; 
      font-weight: bold;  
      border-radius:30px;
      height:20px;
      width:20px;
       text-align: center; 
        background:white;  
 } 

 .close:hover, 
 .close:focus { 
     color:red; 
     background:white;  
     cursor: pointer; 
 } 

 .modal-header {
     padding:1px 1px; 
     background-color: #1A78A5; 
     color: white; 
 } 

 .modal-body {padding: 2px 24px;} 

 .modal-footer { 
     padding: 7px 22px; 
     background-color: #ffffff;
	 border-color: #ffffff;
     color: black; 
 } 
#gridheader
{
/* background: -moz-linear-gradient(top, rgba(44,83,158,1) 0%, rgba(44,83,158,1) 100%); */
/* background: #9A95BC; */
/* background: #666699; */
background: #779ECB;
}

tr:nth-child(even) {background:#E3E5E2;}  
 
  tr:nth-child(odd){backgroundr: #d3d3d3;}	
.gd {
	position: fixed;
    top:20px;
	left: 20px; 
/* 	z-index: 992; */
	width:650px;
	background-color:white;
/* 	padding: 1px; */
	}
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
 
	
	try
	{
	function toggle_password(target){
	    var d = document;
	    var tag = d.getElementById(target);
	    var tag2 = d.getElementById("showhide");

	    if (tag2.innerHTML == 'Show'){
	        tag.setAttribute('type', 'text');   
	        tag2.innerHTML = 'Hide';

	    } else {
	        tag.setAttribute('type', 'password');   
	        tag2.innerHTML = 'Show';
	    }
	}}catch(e){}
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
	
	
	function validateForm(email) {
			var x=email.value;
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		    document.getElementById('emailmsg').hidden=false;
			email.value ="";
			email.focus();
			email.style.borderColor="red";
		        return false;
		    }
		    else
		    	{
		    	document.getElementById('emailmsg').hidden=true;
		    	email.style="none";
		    	}
		}
	
	   function CheckPassword(inputtxt)   
	    {  
		   var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,8}$/;  
		    if(inputtxt.value.match(passw))   
		    {   
		    document.getElementById('passmsg').hidden=true;
		    inputtxt.style="none";
		    return true;  
		    }  
		    else  
		    {   
		    document.getElementById('passmsg').hidden=false;
		    inputtxt.value="";
		    inputtxt.focus();
		    inputtxt.style.borderColor="red";
		    return false;  
		    }  
	    }  
	        
	   function ChecknewPassword(inputtxt)   
	    {  
	
	    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,8}$/;  
	    if(inputtxt.value.match(passw))   
	    {   
	    document.getElementById('passnewmsg').hidden=true;
	    inputtxt.style="none";
	    return true;  
	    }  
	    else  
	    {   
	    document.getElementById('passnewmsg').hidden=false;
	    inputtxt.value="";
	    inputtxt.focus();
	    inputtxt.style.borderColor="red";
	    return false;  
	    }  
	    }    
	   function CheckconfirmPassword(inputtxt)   
	    {   
	    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,8}$/;  
	    if(inputtxt.value.match(passw))   
	    {   
	     document.getElementById('passconfirmmsg').hidden=true;
	     inputtxt.style="none";
	    return true;  
	    }  
	    else  
	    {   
	    document.getElementById('passconfirmmsg').hidden=false;
	    inputtxt.value="";
	    inputtxt.focus();
	    inputtxt.style.borderColor="red";
	    return false;  
	    }  
	    } 
	   
	function isNumberKey(evt)
       {
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;
 	 return true;
       }
	
	
	function onlyAlphabets(evt) {
        var charCode;
        if (window.event)
            charCode = window.event.keyCode;  //for IE
        else
            charCode = evt.which;  //for firefox
        if (charCode == 32) //for &lt;space&gt; symbol
        { 
        document.getElementById('roleval').hidden=true;
        evt.style="none";
        return true;
        }
        if (charCode > 31 && charCode < 65) //for characters before 'A' in ASCII Table
            {
        	document.getElementById('roleval').hidden=false;
        	evt.focus();
        	evt.style.borderColor="red";
        	return false;
            }
        if (charCode > 90 && charCode < 97) //for characters between 'Z' and 'a' in ASCII Table
            {
        	return false;
            }
        if (charCode > 122)
        	{//for characters beyond 'z' in ASCII Table
        	
  	 	return false;
        	}
        document.getElementById('roleval').hidden=true;
        evt.style="none";
        return true;
    }
	
	
	function PhoneValidation(ob) {
	  		var invalidChars = /[^0-9]/gi;
	 		 if(invalidChars.test(ob.value)) {
				document.getElementById('idmsg').hidden=false;
			 	ob.value = ob.value.replace(invalidChars,"");
			 	ob.focus();
			 	ob.style.borderColor="red";
			 	return false;
		  }
	 		 else
	 			 {document.getElementById('idmsg').hidden=true;
	 			ob.style="none";
	 			 }
			}
	
	function alternateValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idmsg2').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 	return false;
	  } else
 			 {	document.getElementById('idmsg2').hidden=true;ob.style="none";}
		}

	function lengthAlternateNo(obj)
	{	var number = (obj.value).length;
		if(number<10) {
	document.getElementById('length1').hidden=false;
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
 	}
	else
	{	document.getElementById('length1').hidden=true;obj.style="none";}
	}
	
	
	function lengthValidation(obj)
	{	var number = (obj.value).length;
		if(number<10) {
	document.getElementById('length').hidden=false;
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
 	}
	else
	{	document.getElementById('length').hidden=true;obj.style="none";}
	}
	function landlineValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idmsg1').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
			 	return false;
	  } else
 			 {	document.getElementById('idmsg1').hidden=true;ob.style="none";}
		}
	function lengthValidationLandline(obj)
	{	var number = (obj.value).length;
		if(number<11) {
	document.getElementById('lengthlanline').hidden=false;
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
 	}
	else
	{	document.getElementById('lengthlanline').hidden=true;obj.style="none";}
	}
	
	function lengthValidationcontact(obj)
	{	var number = (obj.value).length;
		if(number<10) {
	document.getElementById('lengthContact').hidden=false;
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
 	}
	else
	{	document.getElementById('lengthContact').hidden=true;obj.style="none";}
	}
	
	
function contactnoValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idcontact').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 	return false;
	  }
 		 else
 			 {	document.getElementById('idcontact').hidden=true;ob.style="none";}
		}
	
	function simValidation(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('idsim').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 	return false;
	  }else
		{
		document.getElementById('idsim').hidden=true;ob.style="none";}
		}

	
function deviceValidation(ob) {
		var invalidChars = /[^0-9]/gi;
		 if(invalidChars.test(ob.value)) {
		document.getElementById('iddeviceno').hidden=false;
	 	ob.value = ob.value.replace(invalidChars,"");
	 	ob.focus();
	 	ob.style.borderColor="red";
		 	return false;
  }	else
	{
	document.getElementById('iddeviceno').hidden=true;ob.style="none";}
	}
function creditdaysValidation(ob) {
	var invalidChars = /[^0-9]/gi;
	 if(invalidChars.test(ob.value)) {
	document.getElementById('creditdays').hidden=false;
 	ob.value = ob.value.replace(invalidChars,"");
 	ob.focus();
 	ob.style.borderColor="red";
	 	return false;
}	else
{
document.getElementById('creditdays').hidden=true;ob.style="none";}
}

function devicenolengthValidation(obj)
{	var number = (obj.value).length;

if(number<15) {
document.getElementById('devicenolength').hidden=false;
	 	obj.value = ob.value.replace(number,"");
	 	obj.focus();
	 	obj.style.borderColor="red";
}
else
{
document.getElementById('devicenolength').hidden=true;obj.style="none";}
}	
function invoicecharvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('invoicechar').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 			 	return false;
	  }else
 		{
 		document.getElementById('invoicechar').hidden=true;ob.style="none";}
		}
	
	function invoicenolegth(obj)
	{
  		var number = (obj.value).length;
  		
  		 if(number<15) {
		document.getElementById('invoicelength').hidden=false;
		document.getElementById('insertdealerassinvoiceno').value="";
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
	}
  		else
 		{
 		document.getElementById('invoicelength').hidden=true;obj.style="none";}
		}
	
		function faxvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('faxdata').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 	
		 		 	return false;
	  }
 		else
 		{
 		document.getElementById('faxdata').hidden=true;ob.style="none";}
		}
		
	function faxvalidlength(obj)
	{var number = (obj.value).length;
  	if(number<10) {
		document.getElementById('faxval').hidden=false;
		document.getElementById('fax1').value="";
 		 obj.value = ob.value.replace(number,"");
 		obj.focus();
	 	obj.style.borderColor="red";
	}	else
 		{
 		document.getElementById('faxval').hidden=true;obj.style="none";}
	}
	function chqcharvalid(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('cheqhar').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
		 	return false;
	  }	else
 		{
 		document.getElementById('cheqhar').hidden=true;ob.style="none";}
		}
	function chqnolegth(obj)
	{
  		var number = (obj.value).length;
  		 if(number<6) {
		document.getElementById('chqlength').hidden=false;
		 obj.value = ob.value.replace(number,"");
		 obj.focus();
		 obj.style.borderColor="red";
	}
  		else
 		{
 		document.getElementById('chqlength').hidden=true;obj.style="none";}
	}		
	function ponumber(ob) {
  		var invalidChars = /[^0-9]/gi;
 		 if(invalidChars.test(ob.value)) {
			document.getElementById('ponu').hidden=false;
		 	ob.value = ob.value.replace(invalidChars,"");
		 	ob.focus();
		 	ob.style.borderColor="red";
			 	return false;
	  }else
 		{
 		document.getElementById('ponu').hidden=true;ob.style="none";}
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
	{}
	$(function() { 
		$('.datepick').datepicker({ 
		    format: "dd-M-yyyy", 
		    endDate: '+0d', 
		    autoclose: true 
		});   
		 $('.datepick').datepicker('setDate', '+0d'); 
	}); 	var interval;
	
		var scotchApp = angular.module('scotchApp', ['ngRoute','angularUtils.directives.dirPagination']);
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
			}).when('/report', {
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
	
}).	when('/adminDashboard', {
	templateUrl : 'adminDashboard',
	controller  : 'adminDasBoardctrl'
	
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
}).	when('/IgnitionReport', {
		templateUrl : 'IgnitionReport',
		controller  : 'iginitonCtrl'
}).	when('/LUStatusReport', {
	templateUrl : 'LUStatusReport',
	controller  : 'lustatusctrl'
	
}).	when('/DealerdashLiveDetails', {
		templateUrl : 'DealerdashLiveDetails',
		controller  : 'dealerdasboardLivectrl'
}).when('/CustomerLivedash', {
		templateUrl : 'CustomerLivedash',
		controller  : 'customerdashcontroller'
}).when('/Changepassword', {
		templateUrl : 'Changepassword',
		controller  : 'changepasswordctrl'
}).when('/DealerMap', {
		templateUrl : 'DealerMap',
		controller  : 'dealermapctrl'
	}).when('/CustomerMap', {
		templateUrl : 'CustomerMap',
		controller  : 'dealermapctrl'
	}).when('/Nonpolling', {
		templateUrl : 'Nonpolling',
		controller  : 'nonpollingCtrl'
	}).when('/ApprovalForm', {
		templateUrl : 'ApprovalForm',
		controller  : 'ApprovalFormCtrl'
	}).	when('/minesdashboard', {
		templateUrl : 'minesdashboard',
		controller  : 'minesdashboardctrl'
	}).when('/livestatus', {
		templateUrl : 'livestatus',
		controller  : 'livestatusCtrl'
	}).when('/dealerreport', {
		templateUrl : 'dealerreport',
		controller  : 'dealerreportCtrl'
	}).when('/minereport', {
		templateUrl : 'minereport',
		controller  : 'mineCtrl'
	}).when('/Devicestatistics', {
		templateUrl : 'Devicestatistics',
		controller  : 'DevicestatisticsCtrl'
	}).when('/Vehiclelivedetails', {
		templateUrl : 'Vehiclelivedetails',
		controller  : 'VehiclelivedetailsCtrl'
	}).when('/truckmov', {
		templateUrl : 'truckmov',
		controller  : 'truckmovCtrl'
	}).when('/VehicleDealerChange', {
		templateUrl : 'VehicleDealerChange',
		controller  : 'VehicleDealerChangeCtrl'
	})
	.when('/routedev', {
		templateUrl : 'routedev',
		controller  : 'routedevCtrl'
	}).when('/routewisetime', {
		templateUrl : 'routewisetime',
		controller  : 'routetimectrl'
	}).when('/circledash', {
		templateUrl : 'circledash',
		controller  : 'circledashCtrl'
	}).when('/newvehicle', {
		templateUrl : 'newvehicle',
		controller  : 'vehdevctrl'
	})
	});
// 	NewVehicleFormInsert
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
	<script src="resources/pagescripts/newscripts.js"></script>
	<script src="resources/pagescripts/ignitionCtrl.js"></script>
   
	<script>
	scotchApp.controller('mainController', function($scope,$http, $compile, $filter,$location) {
		clearInterval(interval);
		$scope.loginid = sptstr[2];
		$scope.roleid = sptstr[6];
		if($scope.loginid=='10001' || $scope.loginid=='10044'){
			$location.path('/adminDashboard');
		}else if($scope.roleid=='1003'){
			 $location.path('/home');
		}else if($scope.roleid=='1004'){
			 $location.path('/admindash');
		}else if($scope.roleid=='1002'){
		 $location.path('/livestatus');
		}
		else if($scope.roleid=='1012'){
			 $location.path('/circledash');
			}
		else{
			 $location.path('/Dealerdashnew');
		}
		$scope.dashboardclick=function()
		{
			if($scope.loginid=='10001' || $scope.loginid=='10044'){
				$location.path('/adminDashboard');
			}else if($scope.roleid=='1003'){
				 $location.path('/home');
			}else if($scope.roleid=='1004'){
				 $location.path('/admindash');
			}else if($scope.roleid=='1002'){
			 $location.path('/livestatus');
			}else if($scope.roleid=='1012'){
			 $location.path('/circledash');
			}
			else{
				 $location.path('/Dealerdashnew');
			}
		}	
		
		
		$(document).ready(function(){
			
			//Check to see if the window is top if not then display button
			$(window).scroll(function(){
				if ($(this).scrollTop() > 100) {
					$('#scroll').fadeIn();
				} else {
					$('#scroll').fadeOut();
				}
			});	//Click event to scroll to top
			
			
			$('#scroll').click(function(){
				$('html, body').animate({scrollTop : 0},800);
				return false;
			});
			
// 			$("#slider,.close").click(function(){
// 			    var $target = $('#dislide'),
// 			        $toggle = $(this);

// 			    $target.toggle(500);
// 			});
			
		});
		  $("#exportexcel").click(function(){
			try
			{
			$('#livesumm').tableExport({
				type:'csv',escape:'false',separator: ',',
				tableName:'Company',
				pdfFontSize:10,
				htmlContent:'false',
				consoleLog:'false',
				}
			);
			}catch(e){//alert(e);
			}
		});		
		  $scope.pageno = 1;
		  $scope.pagesint = 8;
		  $scope.getDataalert = function(pageno){ 
// 			  $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/alertdashData?pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&ownersid='+sptstr[2])
// 				.success(function(data){ 
// 					$scope.dashboardAlertdata = data; 
// 					$scope.total_count = data[0].count;
// 				}).error(function(data, status, headers, config) {
// 					console.log('error: data = ', data);
// 			});	
		  }
		  
		  $scope.getDataalert(1);
		$scope.compname=sptstr[3];
// 			
			$scope.name = sptstr[0];
			$scope.logout = function() {
				window.location.replace("/");
			}
			if(sptstr[4]=='0'){
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[6]+'&parentid='+sptstr[4])
				.success(function(data, status, headers, config) {
					$scope.menus = data;
			}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
				});
			}
			else{
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudalletails?companyid='+sptstr[1]+'&roleid='+sptstr[6])
				.success(function(data, status, headers, config) {
					$scope.menus = data;
			}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
				});
			}
			
			if($scope.loginid=='10001'){
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
			
		}
			$scope.showDiv = function() {
				$scope.showhideprop = true;
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
				   var divToPrint=document.getElementById("menutable");
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
			     try{
						var columns = ["Row NO", "Parent Menu", "Menu Name","Navigate URL","Order No"];
						var i=0;
			   	var data1=[];
				  	for(i=0;i<$scope.menusdetails.length;i++){
				    		
				        var data  = $scope.menusdetails[i];
				    		 data1.push([data.rowno,data.parentname,data.menutext,data.navigateurl,data.orderno]);
				    		}
				    	var doc = new jsPDF('landscape','pt');
				       	 doc.autoTable(columns, data1);
				         doc.save("MenuDetails.pdf");
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
		        var table_div = document.getElementById('menuDiv');
		        //alert("table_div"+table_div);
		        var i=0;
		        var table_html = "";
		         table_html = table_html +" <html><body><table><tr>"+
			    	"<td ><font>Row No</font></td>"+
					"<td><font>Menu Name</font></td>"+
					"<td><font>Parent Menu </font></td>"+
					"<td><font>Navigate Url</font></td>"+
					"<td><font>Order No</font></td>"
					"</tr>";
						try{
			    	for(i=0;i<$scope.menusdetails.length;i++){
			    		data  = $scope.menusdetails[i];
			    		table_html = table_html + "<tr>"+
						"<td ><font>"+data.rowno+"</font></td>"+
						"<td ><font>"+data.menutext+"</font></td>"+
						"<td ><font>"+data.parentname+"</font></td>"+
						"<td><font>"+data.navigateurl+"</font></td>"+
						"<td><font>"+data.orderno+"</font></td>"+
						"</tr>";
							}
					}catch(e){}
				table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Menu_Details' + postfix + '.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){}
		
		$scope.SearchByMenuname='';
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?roleid='+sptstr[6]+'&parentid='+sptstr[4]+'&companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchByMenuname)
					.success(function(data, status, headers, config) {
						$scope.menusdetails = data;
						$scope.getData15($scope.pageno); 
			}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				$scope.menusdetailsnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
				$scope.getData15 = function(pageno){ 
					$scope.menusdetailsnew = [];
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
						if(i<=$scope.menusdetails.length){
							if($scope.SearchByMenuname!='')
								{
								if($scope.menudetails[i].includes($scope.SearchByMenuname))
									{
							$scope.menusdetailsnew.push($scope.menusdetails[i-1]);
									}
								}
							else
								{
								$scope.menusdetailsnew.push($scope.menusdetails[i-1]);
								}
						}else{
							break;
						}
					}
					$scope.total_count = $scope.menusdetails.length;
					
				};	
				$("#searchbymenuname").keypress(function(){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?roleid='+sptstr[6]+'&parentid='+sptstr[4]+'&companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchByMenuname)
					.success(function(data, status, headers, config) {
						$scope.menusdetailsnew = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menupage?roleid='+sptstr[6]+'&parentid='+sptstr[4]+'&companyid='+sptstr[1]+'&searchBymenuname='+$scope.SearchByMenuname)
						.success(function(data, status, headers, config) {
							$scope.menusdetailsnew = data;
					}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
		
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
				});
					
				$scope.showmenudiv1 = function() {
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
		$scope.deletemenu = function(menuasignid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudelete?id='+menuasignid.menuid)
					.success(function(data, status, headers, config) {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[6]+'&parentid='+sptstr[4])
						.success(function(data, status, headers, config) {
							$scope.menusdetails = data;
							$scope.getData15($scope.pageno);
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
						   {   var i=0;
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
								var i=0,chk=0,chk2=0;
								for(i=0;i<$scope.menusdetails.length;i++)
									{
									if($scope.menusdetails[i].menutext==document.getElementById('insertmenuname').value)
									{
									chk++;
									}	}
								if(chk>0)
								{
								jAlert('Problem in Saving Records!Menu Name Already Exists','Information');
								}
							else
								{
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menuinsert?menutext='
									+document.getElementById("insertmenuname").value
									+'&description='+document.getElementById("insertdescription").value
									+'&navigateurl='+url
									+'&parentid='+$scope.menuparentidinsert+'&orderno='+document.getElementById("insertorderno").value
									).success(
											function(data, status, headers, config) {
//			 									
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[6]+'&parentid='+sptstr[4])
														.success(function(data, status, headers, config) {
																	$scope.menusdetails = data;
																	$scope.getData15($scope.pageno);
																})
														.error(function(data, status, headers, config) {
																	console.log('error: data = ',data);
//		 	 														
																});
												jAlert('Record Inserted Successfully', 'Success Dialog'); 
												document.getElementById("form2").reset(); 
											}).error(function(data, status, headers, config) {
												jAlert('Unable to  Proceed Your Request','Information');
												console.log('error: data = ', data);
												var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MenuFormInsert',data);
												response.success(function(data, status, headers, config) {
												});
												response.error(function(data, status, headers, config) {
												}); 
											});
							   }
						   }
						   }
// 				}
				
				$scope.menueditform = function menueditform() {
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
				   { var i=0;
					   
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
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[6]+'&parentid='+sptstr[4])
												.success(function(data, status, headers, config) {
															$scope.menusdetails = data;
															$scope.getData15($scope.pageno);
															document.getElementById("mainmenu").hidden = false;
															document.getElementById("showeditmenu").hidden = true;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('menuupdateform').reset(); 
									}).error(function(data, status, headers, config) {
										jAlert('Unable to  Proceed Your Request','Information');
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=MenuFormUpdate',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
										}); 
									});
					   }
					}catch(e){//alert(e);
					}
				}		
			} catch (e) {
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
			window.location.replace("/");
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
		
		try {
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		$scope.pagesno = [20,50,80,100,120,'All'];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
				$scope.pagesint=page;
				if($scope.pagesint=='All')
					{
					$scope.pagesint=$scope.sim.length;
	                        }

			}
			
					function printData()
			{
			   var divToPrint=document.getElementById("printTablesim");
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
		
// 			try{
// 				$("#exportexcel").click(function() {
// 			        var dt = new Date();
// 			        var day = dt.getDate();
// 			        var month = dt.getMonth() + 1;
// 			        var year = dt.getFullYear();
// 			        var hour = dt.getHours();
// 			        var mins = dt.getMinutes();
// 			        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
// 			        var a = document.createElement('a');
// 			        var data_type = 'data:application/vnd.ms-excel';//base64,' 
// 			        var table_div = document.getElementById('simDiv');
// 			        var i=0;
// 			        var table_html = table_div.outerHTML.replace(/ /g, '%20');
// 			        a.href = data_type + ', ' + table_html;
			       
// 			        a.download = 'Sim_Details' + postfix +'.xls';
// 			        a.click();
// 			             e.preventDefault(); 
// 			    });}catch(e){alert("sss"+e);}
	
			    
			    
			    
			    
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
			    	var table_div = document.getElementById('simDiv');
			    	//alert("table_div"+table_div);
			    	var i=0;
			    	var table_html = "";
			    	table_html = table_html +"<html><body><table><tr>"+
			    	"<td><font>SR. No</font></td>"+
			    	"<td><font>Sim No</font></td>"+
			    	"<td><fon>Network Name</font></td>"+
			    	"<td><font>Vendor Name</font></td>"+
			    	"<td><font>Mobile No</font></td>"+
			    	"<td><font>Remarks</font></td>"+
			    			    	"</tr>";
			    	//alert(htmlString);
			    	try{
			    	for(i=0;i<$scope.sim.length;i++){
			    	data  = $scope.sim[i];
			    	table_html = table_html + "<tr>"+
			    	"<td><font>"+data.rowno+"</font></td>"+
			    	"<td><font>"+data.simnumber+"</font></td>"+
			    	"<td><font>"+data.networkname+"</font></td>"+
			    	"<td><font>"+data.vendorname+"</font></td>"+
			    	"<td><font>"+data.mobilenumber+"</font></td>"+
			    	"<td><font>"+data.remarks+"</font></td>"+
			    	
			    	"</tr>";
			    			}
			    	}catch(e){}
			    	table_html = table_html + "</table></body></html>";
			    	a.href = data_type + ', ' + table_html;
			    	//setting the file name
			    	a.download = 'Sim_Details' + postfix + '.xls';
			    	a.click();
			    	//just in case, prevent default behaviour
			    	e.preventDefault(); 
			    	});}catch(e){}

				  
				  $('#exportpdf').click(function () {
//		    
		    try{
				//alert("hhhhhhhhhi");
				var columns = ["Row NO", "Sim Number", "Network Name","Vendor Name","Mobile no","Remarks","Sim Status","Action"];
				var i=0;
		        
		      	var data1=[];
					
		    	for(i=0;i<$scope.sim.length;i++){
		    		
		        var data  = $scope.sim[i];
		    		 data1.push([data.rowno,data.simnumber,data.networkname ,data.vendorname,data.mobilenumber,data.remarks,data.status,data.sim_status]);
		     	}
		    
		    	 var doc = new jsPDF('landscape','pt');
		      
		    	 doc.autoTable(columns, data1);
		         doc.save("SimDetails.pdf");
		     
		        }
		    catch(e)
		    {
		    	alert(e.message);
		    }
		    
		      });
			  		
   			
$('#simassign').click(function () 
{	document.getElementById("assignFieldset").hidden=false;
	document.getElementById("insertAsssimno").value=document.getElementById("insertsimno").value

});
		
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
.success(function(data, status, headers, config) {
	$scope.devicedetails = data;
}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});	
	$scope.BySimno='';
// 			Page.setTitle("Welcome");
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBySimno='+$scope.BySimno)
					.success(function(data, status, headers, config) {
						$scope.sim = data;
						$scope.getData22($scope.pageno); 
						}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
			
			$scope.simnew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
			
			$scope.getData22 = function(pageno){ 
				$scope.simnew = [];
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
					if(i<=$scope.sim.length){
						if($scope.BySimno!='')
							{
							if($scope.sim[i].includes($scope.BySimno))
								{
						$scope.simnew.push($scope.sim[i-1]);
								}
							}
						else
							{
							$scope.simnew.push($scope.sim[i-1]);
							}
					}else{
						break;
					}
				}
					$scope.total_count = $scope.sim.length;
			};
			
		} catch (e) {
			//alert(e);
		}
			
		$("#searchbySimno").keypress(function(){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBySimno='+$scope.BySimno)
			.success(function(data, status, headers, config) {
				$scope.simnew  = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchBySimno='+$scope.BySimno)
				.success(function(data, status, headers, config) {
					$scope.simnew  = data;
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
	
			
		});
		
		
		
		
		$scope.deletesim = function(deletesimid){
			if(deletesimid.flag=='true'){
			jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
				if(r){ 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdelete?id='+deletesimid.simid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.sim = data;
						$scope.getData22($scope.pageno);
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
		}
		//activatesim    activatesim
		try
		{
		$scope.activatesim = function(deletesimid){
			jConfirm('Do you want to activate?', 'Confirmation Dialog', function(r) { 
				if(r){ 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simactivate?id='+deletesimid.simid)
			.success(function(data, status, headers, config) {
// 				$scope.company = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.sim = data;
						$scope.getData22($scope.pageno);
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
		}catch(e){}
		
		$scope.simdata = function simdata(editsim) {
			$scope.simdata=editsim;
		}
		
		$scope.showsimdiv1 = function() {
			document.getElementById("simedit").hidden = false;
			document.getElementById("mainsim").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainsim").hidden = false;
			document.getElementById("simedit").hidden = true;
		}
		
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vendordetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
							$scope.simvendordetails = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						//network
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]).success
						 	 (function(data, status, headers, config) {
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
			      else if (mysiminsert.insertsimmobileno2.value== "")
			      {
			    	 	 mysiminsert.insertsimmobileno2.focus();
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
			    	  		
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/siminsert?networkid='+$scope.simnetworkid+'&assettypeid=40002&simno='+document.getElementById('insertsimno').value+'&mobileno='+document.getElementById('insertsimmobileno').value+'&vendorid='+$scope.simvendorid+'&receiptdt='+document.getElementById('siminsertreciptdate').value+'&loginid='+sptstr[2]+'&remark='+document.getElementById('insertsimRemark1').value+'&mobileno2='+document.getElementById('insertsimmobileno2').value)
						 .success(function(data, status, headers, config) {
								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2])
											.success(function(data, status, headers, config) {
												$scope.sim = data;
												$scope.getData22($scope.pageno); 
												jAlert('Record Inserted Successfully', 'Success Dialog');
												var i=0;
												 for(i=0;i<$scope.devicedetails.length;i++)
												 {
													if($scope.devicedetails[i].uniqueid==document.getElementById("simassdevicenumber").value) 
														{
														$scope.assignDeviceid=$scope.devicedetails[i].deviceid;
														}
												 }
												 for(i=0;i<$scope.sim.length;i++)
									    		  {
									    		  if($scope.sim[i].simnumber==document.getElementById("insertAsssimno").value)
													 {
									    			  $scope.assignSimid=$scope.sim[i].simid;
													 }
									    		  }
										
												$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigninsert?'+
														'deviceid='+$scope.assignDeviceid+'&simid='+ $scope.assignSimid+'&loginid='+sptstr[2]+
														'&remarks=OK')
												.success(function(data, status, headers, config) {
													
												}).error(function(data, status, headers, config) {
													console.log('error: data = ', data);
													
												});
												
												
											}).error(function(data, status, headers, config) {
												console.log('error: data = ', data);
												
											});
							
							      })
							      .error(function(data, status, headers, config) 
							     		 {
							    	  jAlert('Unable to  Proceed Your Request','Information');
										$scope.error=data;
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=SimFormInsert',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
											//alert( "Exception details: " + JSON.stringify({data: data}));
										}); 
							        		
							             console.log('error: data = ' , data);
									   });
						}
			    		  }  }
				
			} catch (e) {
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
		      else  if (mysimedit.editsimmobileno2.value== "")
		      {
			    	
			    	 mysimedit.editsimmobileno2.focus();
			      }	
		      else  if (mysimedit.editsimvendorname.value== "")
		      {
			    	 mysimedit.editsimvendorname.focus();
			      }	

		      else  if (mysimedit.editsimactivedate.value== "")
		      {
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
				
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simupdate?simid='
			+$scope.simdata.simid+'&networkid='+$scope.simeditnetworkid+
			'&assettypeid=40002&simno='+document.getElementById('editsimnumber').value+
			'&mobileno='+document.getElementById('editsimmobileno').value+
			'&mobileno2='+document.getElementById('editsimmobileno2').value+
			'&vendorid='+$scope.simeditvendorid+'&receiptdt='+document.getElementById('editsimreceiptdate').value+
			'&loginid='+sptstr[2]+'&remark='+document.getElementById('editsimRemark').value)
			 .success(function(data, status, headers, config) {
				 $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.sim = data;
				$scope.getData22($scope.pageno); 
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
								    	  jAlert('Unable to  Proceed Your Request','Information');
											$scope.error=data;
											console.log('error: data = ', data);
											var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=SimFormUpdate',data);
											response.success(function(data, status, headers, config) {
											});
											response.error(function(data, status, headers, config) {
											}); 
								      });}   }
}
catch(e){}
}});


	scotchApp.controller('SimAssignCtrl', function($scope,$http, $compile, $filter) {
		var time = new Date();
		var diffMs = (time-mydate); // milliseconds between now & Christmas
		var diffDays = Math.round(diffMs / 86400000); // days
		var diffHrs = Math.round((diffMs % 86400000)/ 3600000); // hours
		var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
		if(diffMins>20){
			jAlert('Session Expired Please Login Again','Information');
			window.location.replace("/");
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
			
			$scope.pagesno = [20,50,80,100,120,'All'];

		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
			if($scope.pagesint=='All')
			{
			$scope.pagesint=$scope.simassign.length;
                    }

		}
		function printData()
		{
		   var divToPrint=document.getElementById("printTablesimass");
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
					var columns = ["Row NO","Device Number","Sim Number","Status"];
					var i=0;
			       	var data1=[];
				  	for(i=0;i<$scope.simassign.length;i++){
			    		
			        var data  = $scope.simassign[i];
			    		 data1.push([data.rowno,data.uniqueid,data.simnumber,"Assigned"]);
		
			    	}
			    	var doc = new jsPDF('landscape','pt');
			       doc.autoTable(columns, data1);
			         doc.save("SimAssignment.pdf");
			      
			        }
			    catch(e)
			    {  	alert(e.message);
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
		      //  var table_div = document.getElementById('simDiv');
		        //alert("table_div"+table_div);
		        var i=0;
		        var table_html = "";
		    	table_html = table_html +"<html><body><table><tr>"+
		    	"<td><font>Row No</font></td>"+
		    	"<td><font>Device Number</font></td>"+
		    	"<td><font>Sim Number</font></td>"+
		    	"<td><font>Status</font></td>"+
		    	"</tr>";
		    	//alert(htmlString);
		    	try{
		    	for(i=0;i<$scope.simassign.length;i++){
		    		data  = $scope.simassign[i];
		    		table_html = table_html + "<tr>"+
		    		"<td><font>"+data.rowno+"</font></td>"+
		    		"<td><font>"+data.uniqueid+"</font></td>"+
		    		"<td><font>"+data.mobileno+"</font></td>"+
		    		"<td><font>Assigned</font></td>"+
		    		"</tr>";
		    		}
		    				}catch(e){}
		    table_html = table_html + "</table></body></html>";
		        a.href = data_type + ', ' + table_html;
		        //setting the file name
		        a.download = 'Sim_Details' + postfix +'.xls';
		        a.click();
		        //just in case, prevent default behaviour
		       e.preventDefault(); 
		    });}catch(e){alert("sss"+e);}

$scope.ByDeviceNo='';
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbydeviceno='+$scope.ByDeviceNo)
		.success(function(data, status, headers, config) {
				$scope.simassign = data;
				$scope.getData23($scope.pageno); 
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
$scope.simassignnew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
//		$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
		$scope.getData23 = function(pageno){ 
			$scope.simassignnew = [];
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
				if(i<=$scope.simassign.length){
					if($scope.ByDeviceNo!='')
						{
						if($scope.simassign[i].includes($scope.ByDeviceNo))
							{
					$scope.simassignnew.push($scope.simassign[i-1]);
							}
						}
					else
						{
						$scope.simassignnew.push($scope.simassign[i-1]);
						}
				}else{
					break;
				}
			}
					$scope.total_count = $scope.simassign.length;
			
		};	
		$("#searchsimassbyDeviceno").keypress(function(){
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbydeviceno='+$scope.ByDeviceNo)
			.success(function(data, status, headers, config) {
				$scope.simassignnew = data;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbydeviceno='+$scope.ByDeviceNo)
				.success(function(data, status, headers, config) {
					$scope.simassignnew = data;
					}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});	
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
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndelete?id='+deletesimid.devicesimid)
			.success(function(data, status, headers, config) {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.simassign = data;
					$scope.getData23($scope.pageno);
					jAlert('Record Deleted Successfully', 'Confirmation Results');
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				}).error(function(data, status, headers, config) {
				jAlert('Record Not Deleted','Information');
				console.log('error: data = ', data);
			});	
			}catch(e)
					{}
				}
		});
		}	catch(e){alert(e);}	}
	
	/// simassign activate   simassignactivate
	$scope.activateSimassign = function (deletesimid){
		try
	{	jConfirm('Do you want to Activate?', 'Confirmation Dialog', function(r) { 
			if(r){ 
				try
				{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassignactivate?id='+deletesimid.devicesimid)
		.success(function(data, status, headers, config) {
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/simassigndetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
				$scope.simassign = data;
				$scope.getData23($scope.pageno);
				jAlert('Record Activated Successfully', 'Confirmation Results');
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
		}).error(function(data, status, headers, config) {
			jAlert('Record Not Activated','Information');
			console.log('error: data = ', data);
		});	}	catch(e)
				{}	}	});
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
var i=0;$scope.deviceid=null;$scope.simid=null;
for(i=0;i<$scope.devicedetails.length;i++)
{	if($scope.devicedetails[i].uniqueid==document.getElementById('devicenumber').value)
	{
	$scope.deviceid=$scope.devicedetails[i].deviceid;
	}
}
for(i=0;i<$scope.simdetails.length;i++){
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
{	var i=0,chk1=0,chk2=0;
	for(i=0;i<$scope.simassign.length;i++)
	{
		if($scope.simassign[i].uniqueid==document.getElementById('devicenumber').value)
			{
			chk1++;
			}
		else if($scope.simassign[i].uniqueid==document.getElementById('simnumberInsert').value)
		{
			chk2++;
		}
	}
	if(chk1>0)
		{
		jAlert('Problem in Saving Records! Device Number Already Assigned!','Information');
		}
	else if(chk2>0)
		{
		jAlert('Problem in Saving Records! Sim Number Already Assigned!','Information');
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
					$scope.getData23($scope.pageno); 
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				jAlert('Record Inserted Successfully', 'Success Dialog'); 
			}).error(function(data, status, headers, config) {
				  jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=SimAssignFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
					}); 
				console.log('error: data = ', data);
			});
		}
}
}
}catch(e){//alert(e);
}
}
$scope.simassignupdate = function simassignupdate() {
try
{
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
{		var k=0;
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
					$scope.getData23($scope.pageno); 
					document.getElementById("simassignmain").hidden = false;
					document.getElementById("simassignedit").hidden = true;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				jAlert('Record Updated Successfully', 'Success Dialog'); 
				document.getElementById('simassignedit').reset(); 
		}).error(function(data, status, headers, config) {
		jAlert('Sim already Assigned to Device','Information');
			$scope.error=data;
			console.log('error: data = ', data);
			var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=SimAssignFormUpdate',data);
			response.success(function(data, status, headers, config) {
			});
			response.error(function(data, status, headers, config) {
			}); 	//console.log('error: data = ', data);
		});
		}
}
}catch(e){}
}
$scope.showsimdevicediv1 = function() {
document.getElementById("simassignedit").hidden = false;
document.getElementById("simassignmain").hidden = true;
}
$scope.back = function() {
document.getElementById("simassignmain").hidden = false;
document.getElementById("simassignedit").hidden = true;
}});

		scotchApp.controller('DeviceAssignCtrl', function($scope,$http, $compile, $filter) {
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
		   		$scope.pagesno = [20,50,80,100,120,'All'];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
					if($scope.pagesint=='All')
   					{
   					$scope.pagesint=$scope.deviceassign.length;
   	                        }
   			

				}
				function printData()
				{
				   var divToPrint=document.getElementById("printTablevehass");
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
			        newWin.print();	}

				$('#printbutton').on('click',function(){
				printData();
				})		
			
				
		
				$('#exportpdf').click(function () {
//			    
			    try{
					//alert("hhhhhhhhhi");
					var columns = ["Row NO","Device Number","Vehicle Number","Assign Date","Status"];
					var i=0;
			        
			      	var data1=[];
						
			    	for(i=0;i<$scope.deviceassign.length;i++){
			    		
			        var data  = $scope.deviceassign[i];
			    		 data1.push([data.rowno,data.uniqueid,data.vehicleregno,data.assigndate,"Assigned"]);
			     	}
			    	 var doc = new jsPDF('landscape','pt');
			      
			    	 doc.autoTable(columns, data1);
			         doc.save("DeviceAssignment.pdf");
			         }
			    catch(e)
			    {
			    	alert(e.message);
			    }
			    
			      });
				  
				  
				
			try{
					$("#exportexcel").click(function() {alert("in");
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
						"<td><font>Device No</font></td>"+
						"<td><font>Vehicle No</font></td>"+
						"<td><font>Assign Date</font></td>"
						"</tr>";
					try{
				    	for(i=0;i<$scope.deviceassign.length;i++){
				    		data  = $scope.deviceassign[i];
				    		table_html = table_html + "<tr>"+
							"<td><font>"+data.rowno+"</font></td>"+
							"<td><font>"+data.uniqueid+"</font></td>"+
							"<td><font>"+data.vehicleregno+"</font></td>"+
							"<td><font>"+data.assigndate+"</font></td>"
							"</tr>";
							}
						}catch(e){}
						table_html = table_html + "</table></body></html>";
				        a.href = data_type + ', ' + table_html;
				        a.download = 'DeviceAssignment_Details' + postfix +'.xls';
				        a.click();
				       e.preventDefault(); 
				    });}catch(e){alert("sss"+e);}
			

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {

				$scope.dealerdetailslistvehass = data;
				
				$scope.loginid=sptstr[2];
				$scope.roleid=sptstr[6];
				
				try
				{	if($scope.loginid!='10001')
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
			
	    	
	    	$("#vehasscustdealerdetails").blur( function() {
			
			try
			{
	    	var i=0;
	    	for(i=0;i<$scope.customerdetailsvehass.length;i++)
	    		{
	    		if($scope.customerdetailsvehass[i].customername==document.getElementById('vehasscustdealerdetails').value)
	    		{
	    			$scope.customerid=$scope.customerdetailsvehass[i].customerid;
	    		}	
	    		}
	    $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/custoerwisedevice?customerid='+$scope.customerid)
	    	.success(function(data, status, headers, config) {
	    		//alert("detdevice"+data);
	    		$scope.customerwisedevice = data;
	       }).error(function(data, status, headers, config) {
	    		console.log('error: data = ', data);
	    	});
			}catch(e){}

	    	});  	
	    	$scope.Byvehicleno='';
	    	    	
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchByDeviceVehicle='+$scope.Byvehicleno)
						.success(function(data, status, headers, config) {
							$scope.deviceassign = data;
							$scope.getData39($scope.pageno); 
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
				
				$scope.deviceassignnew = [];
				$scope.pageno = 1; // initialize page no to 1
				$scope.total_count = 0;
//				$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
				
				$scope.getData39 = function(pageno){ 
					$scope.deviceassignnew = [];
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
						if(i<=$scope.deviceassign.length){
							if($scope.Byvehicleno!='')
								{
								if($scope.deviceassign[i].includes($scope.Byvehicleno))
									{
							$scope.deviceassignnew.push($scope.deviceassign[i-1]);
									}
								}
							else
								{
								$scope.deviceassignnew.push($scope.deviceassign[i-1]);
								}
						}else{
							break;
						}
					}		
					$scope.total_count = $scope.deviceassign.length;
					
				};	
					
				$("#searchByVehicleNO").keypress(function(){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchByDeviceVehicle='+$scope.Byvehicleno)
					.success(function(data, status, headers, config) {
						$scope.deviceassignnew = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchByDeviceVehicle='+$scope.Byvehicleno)
						.success(function(data, status, headers, config) {
							$scope.deviceassignnew = data;
							
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
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
							$scope.getData39($scope.pageno); 
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
			
				$scope.jsonArr = [];
					
				try
				{
					$("#addtolist").click(function(){
	 				   var table = document.getElementById("myTable");
					    var row = table.insertRow(1);
					    var cell1 = row.insertCell(0);
					    var cell2 = row.insertCell(0);
					    cell1.innerHTML = document.getElementById("vehicleassignvehicleinsert").value;
					    cell2.innerHTML =document.getElementById("vehicleassigndeviceinsert").value;
	   
					    var i=0,j=0;
					     for(i=0;i<$scope.vehicledetails.length;i++)
					    	 {
					    	 if(document.getElementById("vehicleassignvehicleinsert").value==$scope.vehicledetails[i].vehicleregno)
					    		 {
					    		 $scope.vehicleId=$scope.vehicledetails[i].vehicleid;
					    			 }
					    	 }
					     
					     for(j=0;j<$scope.customerwisedevice.length;j++)
					    	{
					    	 if(document.getElementById("vehicleassigndeviceinsert").value==$scope.customerwisedevice[j].uniqueid)
				    		 {
				    		 $scope.deviceId=$scope.customerwisedevice[j].deviceid;
				    		
				    		 }
					    	 
					    	}    $scope.jsonArr.push({
						       'vehicleid': $scope.vehicleId,
						       'deviceid':  $scope.deviceId
						    });
					 });
				
				
				}catch(e){}
					
				$scope.query = {}
				$scope.queryBy = '$'
				$scope.orderProp = "CompanyName";

				$scope.showvehicleassigndiv1 = function() {
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
					try{
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
							
						  var i=0;chk=0,chk2=0;
						  for(i=0;i<$scope.deviceassign.length;i++)
							  {
							
							  if($scope.deviceassign[i].uniqueid==document.getElementById("vehicleassigndeviceinsert").value)
								{
								 
								chk++;
								}
							  else if($scope.deviceassign[i].vehicleregno==document.getElementById("vehicleassignvehicleinsert").value)
								  {
								
								  chk2++;
								  }
							  
							  }
						  
						  if(chk>0)
							{
							  
							jAlert('Problem in Saving Records!Device No. Already Exists','Information');
							document.getElementById("vehicleassigndeviceinsert").value="";
							myForm.vehicleassigndeviceinsert.focus();
							}
						  else if(chk2>0)
							  {
							
								jAlert('Problem in Saving Records!Vehicleno No. Already Exists','Information');
								document.getElementById("vehicleassigndeviceinsert").value
								myForm.vehicleassignvehicleinsert.focus();
							  }
						else
							{
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

							 try
							 {	 var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getmultipledeviceassign?status=1&assigndate='+document.getElementById("vehicleassigndateinsert").value
			 								+'&loginid='+sptstr[2]+'&remarks='+document.getElementById("vehicleassignremarksinsert").value+'&customerid='+$scope.customerid,  $scope.jsonArr);
									response.success(function(data, status, headers, config) {
										jAlert('Record Inserted Successfully', 'Success Dialog'); 
										$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/deviceassigndetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
										.success(function(data, status, headers, config) {
											$scope.deviceassign = data;
											$scope.getData39($scope.pageno);
											}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
										
									});
									response.error(function(data, status, headers, config) {
										jAlert('Unable to  Proceed Your Request','Information');
										$scope.error=data;
										console.log('error: data = ', data);
										var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DeviceAssignFormInsert',data);
										response.success(function(data, status, headers, config) {
										});
										response.error(function(data, status, headers, config) {
										}); 
									}); 
												
							 }catch(e){}
						 }}  }}catch(e){}}
					}catch(e){}
			$scope.vehicleassignedit = function vehicleassignedit() {
						try
						{
						$scope.deviceassigndetails=$scope.deviceassign;
						var i=0;
						var myForm1 = document.formeditvehicle;
					      if (myForm1.vehicleassignvehicleedit.value== "")
					      {	 myForm1.vehicleassignvehicleedit.focus();
					      }
					      else if (myForm1.vehicleassigndeviceedit.value== "")
					      { myForm1.vehicleassigndeviceedit.focus();
					      }
					      else if (myForm1.vehicleassigndateedit.value== "")
					      {	 myForm1.vehicleassigndateedit.focus();
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
								  $scope.vvehicleid = $scope.vehicledetails[i].vehicleid;
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
											$scope.getData39($scope.pageno); 
										}).error(function(data, status, headers, config) {
											console.log('error: data = ', data);
										});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
							document.getElementById('formeditvehicle').reset();
						})	.error(function(data, status, headers, config) {
							jAlert('Unable to  Proceed Your Request','Information');
							$scope.error=data;
							console.log('error: data = ', data);
							var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DeviceAssignFormUpdate',data);
							response.success(function(data, status, headers, config) {
							});
							response.error(function(data, status, headers, config) {
							}); 				});
						}
					}
						}catch(e){}
		}
			} catch (e) {	}	});
		

	scotchApp.controller('dealerCtrl', function($scope,$http, $compile, $filter) {
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
		$scope.ByDealername='';
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbydealername='+$scope.ByDealername)
		.success(function(data, status, headers, config) {
			
			$scope.dealerdetailslist = data;
			$scope.getData24($scope.pageno); 
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		$scope.dealerdetailslistnew = [];
		$scope.pageno = 1; // initialize page no to 1
		$scope.total_count = 0;
//		$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
		$scope.getData24 = function(pageno){ 
			$scope.dealerdetailslistnew = [];
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
				if(i<=$scope.dealerdetailslist.length){
					if($scope.ByDealername!='')
						{
						if($scope.dealerdetailslist[i].includes($scope.ByDealername))
							{
					$scope.dealerdetailslistnew.push($scope.dealerdetailslist[i-1]);
							}
						}
					else
						{
						$scope.dealerdetailslistnew.push($scope.dealerdetailslist[i-1]);
						}
				}else{
					break;
				}
			}	
				$scope.total_count = $scope.dealerdetailslist.length;
		};
		function printData()
		{  var divToPrint=document.getElementById("printTabledealer");
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
					var columns = ["Row NO","Dealer Name","City","Mobile No","Alternate no"];
					var i=0;
			        
			      	var data1=[];
						
			    	for(i=0;i<$scope.dealerdetailslistnew.length;i++){
			    		
			        var data  = $scope.dealerdetailslistnew[i];
			    		 data1.push([data.rowno,data.dealername,data.city,data.mobilenumber,data.alternatecontnumber]);
			    		}
			     var doc = new jsPDF('landscape','pt');
			       doc.autoTable(columns, data1);
			         doc.save("Dealerdetails.pdf");
			        
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
        var table_div = document.getElementById('dealerDiv');
        var i=0;
        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Row No</font></td>"+
		"<td><font>Dealer Name</font></td>"+
		"<td><font>Dealer Type</font></td>"+
		"<td><font>City</font></td>"+
		"<td><font>Mobile No</font></td>"+
		"<td><font>Alternate No</font></td>"
		"</tr>";
		try{
		for(i=0;i<$scope.dealerdetailslist.length;i++){
			data  = $scope.dealerdetailslist[i];
			table_html = table_html + "<tr>"+
			"<td><font>"+data.rowno+"</font></td>"+
			"<td><font>"+data.dealername+"</font></td>"+
			"<td><font>"+data.city+"</font></td>"+
			"<td><font>"+data.mobilenumber+"</font></td>"+
			"<td><font>"+data.alternatecontnumber+"</font></td>"
			"</tr>";
			}
		}catch(e){}
		table_html = table_html + "</table></body></html>";
        a.href = data_type + ', ' + table_html;
        a.download = 'Dealer_Details' + postfix +'.xls';
        a.click();
       e.preventDefault(); 
    });}catch(e){}

$("#searchbydealername").keypress(function(){
	try																									
	{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbydealername='+$scope.ByDealername)
		.success(function(data, status, headers, config) {
			$scope.dealerdetailslistnew = data;
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2]+'&searchbydealername='+$scope.ByDealername)
			.success(function(data, status, headers, config) {
				$scope.dealerdetailslistnew = data;
				//$scope.getData24($scope.pageno); 
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			//$scope.getData24($scope.pageno); 
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		
	}
	catch(e){}
	
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
			$scope.getData24($scope.pageno);
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
			{}}
		
		$scope.dealerInsert=function dealerInsert()
		{	var mydelaerinsert = document.inserdealerform;
			
			 if (mydelaerinsert.insertDealername.value== "")
		      {
		    	
		    	 mydelaerinsert.insertDealername.focus();
		      }
			 else if(mydelaerinsert.insertdealercontactperson.value== "")
				 {
				 mydelaerinsert.insertdealercontactperson.focus();
				 }
		 else if (mydelaerinsert.insertdealermobileno.value== "")
		      {
			    	
			    	 mydelaerinsert.insertdealermobileno.focus();
			      }
		      else if (mydelaerinsert.insertdealerperadd.value== "")
		      {
			    	
			    	 mydelaerinsert.insertdealerperadd.focus();
			   }
		      else if(mydelaerinsert.insertdealeremailid.value== "")
		    	  {
		    	  mydelaerinsert.insertdealeremailid.focus();
		    	  }
		      
		      else
		    	  {
		    	  
		    	  var i=0;chk=0,chk2=0,chk3=0;
		    	  for(i=0;i<$scope.dealerdetailslist.length;i++)
		    	  {
		    		  if($scope.dealerdetailslist[i].dealername==document.getElementById('insertDealername').value)
						{
						chk++;
						} 
		    		  else if($scope.dealerdetailslist[i].mobilenumber==document.getElementById('insertdealermobileno').value)
		    		  {
		    			  chk2++;
		    			  
		    		  }
		    		  else if($scope.dealerdetailslist[i].emailid==document.getElementById('insertdealeremailid').value)
		    			{
		    			  chk3++;
		    			}
		    	  
		    	  }
		    	    if(chk>0)
					{
					jAlert('Problem in Saving Records!Dealer Name Already Exists','Information');
					document.getElementById('insertDealername').value="";
					 mydelaerinsert.insertDealername.focus();
					
					}
		    	  else if(chk2>0)
		    		  {
		    			jAlert('Problem in Saving Records!Mobileno Already Exists','Information');
		    			document.getElementById('insertdealermobileno').value="";
		    			 mydelaerinsert.insertdealermobileno.focus();
		    		  }
		    	  else if(chk3>0)
	    		  {
	    			jAlert('Problem in Saving Records!Email ID Already Exists','Information');
	    			document.getElementById('insertdealeremailid').value="";
	    			  mydelaerinsert.insertdealeremailid.focus();
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
	    	  
	    	  $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerinsert?dealername='+document.getElementById('insertDealername').value+'&dealertype=Organization&address='+document.getElementById('insertdealerperadd').value+'&city='+document.getElementById('insertlocalcity').value+'&pincode='+document.getElementById('insertlocalpincode').value+'&mobilenumber='+document.getElementById('insertdealermobileno').value+'&alternatecontnumber='+document.getElementById('insertdealeraltno').value+'&bankname='+document.getElementById('insertDealerbankname').value+'&branch='+document.getElementById('insertDealerbranch').value+'&accountno='+document.getElementById('insertDealeraccountno').value+'&bankaddress='+document.getElementById('insertDealerbankadd').value+'&ifsc='+document.getElementById('insertDealerifsc').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertdealerremark').value+'&creditdays='+document.getElementById('insertDealercreditdays').value+'&creditamount='+document.getElementById('insertDealercreditamount').value+'&iscredit='+$scope.insertcreditdetail+'&paymentmode='+$scope.insertdealerpayment+'&contactperson='+document.getElementById('insertdealercontactperson').value+'&emailid='+document.getElementById('insertdealeremailid').value+'&state='+document.getElementById('insertstate').value)
			.success(function(data, status, headers, config) {
				jAlert('Record Inserted Successfully', 'Success Dialog'); 
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
				.success(function(data, status, headers, config) {
					$scope.dealerdetailslist = data;
					//if(document.getElementById('insertcustomername').value!=""){
						try{
						var i=0;
						for(i=0;i<$scope.dealerdetailslist.length;i++)
						{
							if($scope.dealerdetailslist[i].dealername==document.getElementById('insertDealername').value)
								{
									$scope.usercomId=$scope.dealerdetailslist[i].dealerid;
									
								}
						}
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/userinsert?'+
								'&loginname='+document.getElementById('insertCustomerLoginname').value+
								'&password='+document.getElementById('insertCustomerpassword').value+
								'&controlid='+sptstr[7]+'&roleid=1002&ownersid='+$scope.usercomId+'&companyid='+sptstr[1])
						.success(function(data, status, headers, config) {
								jAlert('Record Inserted Successfully', 'Success Dialog');
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					
					}catch(e){
						alert(e);
					}
					
					
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
			
			}).error(function(data, status, headers, config) {
				 jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DealerFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
					});	});
		    }  	  }	
		}
		
		$scope.dealerUpdate=function dealerUpdate()
		{	try
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
					'&dealertype=Organization'+
					'&address='+document.getElementById('editdealerperadd').value+
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
					'&creditdays='+document.getElementById('editDealercreditdays').value+
					'&creditamount='+document.getElementById('editDealercreditamt').value+
					'&iscredit='+$scope.editcreditdetail+'&paymentmode='+ $scope.editdealerpayment+
					'&contactperson='+document.getElementById('editdealercontactperson').value+
					'&emailid='+document.getElementById('editdealeremailid').value+
					'&state='+document.getElementById('editdealerperstate').value)
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
					 jAlert('Unable to  Proceed Your Request','Information');
						$scope.error=data;
						console.log('error: data = ', data);
						var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DealerFormUpdate',data);
						response.success(function(data, status, headers, config) {
						});
						response.error(function(data, status, headers, config) {
						});
				});		}
		}catch(e){ 
			alert(e);
		}}
	});
	
	
	
	scotchApp.controller('netCtrl', function($scope,$http, $compile, $filter) {
		try{
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
			
			$scope.ByNetworkName='';
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyNetworkname='+$scope.ByNetworkName)
			.success(function(data, status, headers, config) {

				$scope.networkdetailslist = data;
				$scope.getData21($scope.pageno); 

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
			
			$scope.networkdetailslistnew = [];
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData21 = function(pageno){ 
				$scope.networkdetailslistnew = [];
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
					if(i<=$scope.networkdetailslist.length){
						if($scope.ByNetworkName!='')
							{
							if($scope.networkdetailslist[i].includes($scope.ByNetworkName))
								{
						$scope.networkdetailslistnew.push($scope.networkdetailslist[i-1]);
								}
							}
						else
							{
							$scope.networkdetailslistnew.push($scope.networkdetailslist[i-1]);
							}
					}else{
						break;
					}
				}	
				$scope.total_count = $scope.networkdetailslist.length;
				
			};
		}
		catch(e)
		{}	
		$scope.shownetworkdiv1 = function() {
				document.getElementById("showeditnetwork").hidden = false;
				document.getElementById("mainnetwork").hidden = true;
			}
			$scope.back = function() {
				document.getElementById("mainnetwork").hidden = false;
				document.getElementById("showeditnetwork").hidden = true;
			}	
			$scope.networkeditdata=function networkeditdata(editnetworkdata)
			{	$scope.networkdata=editnetworkdata;
			}	//company bind
			
			function printData()
		{
		   var divToPrint=document.getElementById("printTablenet");
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
						var columns = ["Row NO", "Network Name", "Network APN","Remark"];
						var i=0;
				        
				      	var data1=[];
							
				    	for(i=0;i<$scope.networkdetailslistnew.length;i++){
				    		
				        var data  = $scope.networkdetailslistnew[i];
				    		 data1.push([data.rowno,data.networkname,data.networkapn ,data.remarks]);
				    	}
				    var doc = new jsPDF('landscape','pt');
				       doc.autoTable(columns, data1);
				         doc.save("NetworkDetails.pdf");
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
        var table_div = document.getElementById('netDiv');
        //alert("table_div"+table_div);
        var i=0;
        var table_html = "";
table_html = table_html +"<html><body><table><tr>"+
"<td><font>Row No</font></td>"+
"<td><font>Network Name</font></td>"+
"<td><font>Network Apn</font></td>"+
"<td><font>Remark</font></td>"
"</tr>";
try{
for(i=0;i<$scope.networkdetailslist.length;i++){
	data  = $scope.networkdetailslist[i];
	table_html = table_html + "<tr>"+
	"<td><font>"+data.rowno+"</font></td>"+
	"<td><font>"+data.networkname+"</font></td>"+
	"<td><font>"+data.networkapn+"</font></td>"+
	"<td><font>"+data.remarks+"</font></td>"
		"</tr>";	
		}
}catch(e){}
		table_html = table_html + "</table></body></html>";
        a.href = data_type + ', ' + table_html;
        //setting the file name
        a.download ='Network_Details' + postfix +'.xls';
        a.click();
        //just in case, prevent default behaviour
       e.preventDefault(); 
    });}catch(e){alert("sss"+e);}

$("#searchbynetworkname").keypress(function(){
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyNetworkname='+$scope.ByNetworkName)
	.success(function(data, status, headers, config) {
		$scope.networkdetailslistnew = data;
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyNetworkname='+$scope.ByNetworkName)
		.success(function(data, status, headers, config) {
			$scope.networkdetailslistnew = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
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
				$scope.getData21($scope.pageno);
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
				{	var mynetworkinsert = document.networkinsertform;
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
				    		  if($scope.networkdetailslist[i].networkname.toLowerCase()==(document.getElementById('insertnetworkname').value).toLowerCase())
				    			  {
				    			  chk++;
				    			  }
				    		 
				    		  }
				    		 if(chk>0)
				    			 {  
				    			 jAlert('Problem In Saving Records!Network Name Already Exists!','Information');
				    			 document.getElementById('insertnetworkname').style.borderColor="red";
				    			 document.getElementById('insertnetworkname').value="";
				    			 document.getElementById('insertnetworkname').focus();
				    			 }
				    		 else
				    			 {
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkinsert?networkname='+document.getElementById('insertnetworkname').value+'&networkapn='+document.getElementById('insertnetworkapn').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertnetworkremark').value)
				.success(function(data, status, headers, config) {
					jAlert('Record Inserted Successfully', 'Success Dialog'); 
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {

						$scope.networkdetailslist = data;
						$scope.getData21($scope.pageno);
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					
				}).error(function(data, status, headers, config) {
					jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=NetworkFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
						//alert( "Exception details: " + JSON.stringify({data: data}));
					}); 
				});
				    			 }
				    		  	  }
			}catch(e)
				{	
				}
			}
			$scope.networkUpdate= function networkUpdate()
			{	//alert("in network update");
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
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkupdate?networkid='+$scope.editnetworkid+'&networkname='+document.getElementById('editnetworkname').value+'&networkapn='+document.getElementById('editnetworkapn').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editnetworkremark').value)
				.success(function(data, status, headers, config) {
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/networkdetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
					.success(function(data, status, headers, config) {
						$scope.networkdetailslist = data;
						$scope.getData21($scope.pageno);
						document.getElementById("mainnetwork").hidden = false;
						document.getElementById("showeditnetwork").hidden = true;

					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});
					jAlert('Record Updated Successfully', 'Success Dialog'); 
					document.getElementById('mynetworkEdit').reset(); 

				}).error(function(data, status, headers, config) {
					jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=NetworkFormUpdate',data);
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
					//alert("eerr"+e);
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
			window.location.replace("/");
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
		{	try
			{	$scope.updateassetid=$scope.dataaAsset.assettypeid;
				
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
			{	//alert(e);
			}
		}
		
		$scope.assetInsert=function assetInsert()
		{$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetinsert?companyid='+sptstr[1]+'&remarks='+document.getElementById('insertassetname').value+'&assetname='+document.getElementById('assetinsertremark').value+'&loginid='+sptstr[2])
			.success(function(data, status, headers, config) {
			//alert("success");
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

	
	scotchApp.controller('rawdataCtrl', function($scope,$http, $compile, $filter)
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
		
		$(function() {
			$('.datepick').datepicker({
			    format: "dd-M-yyyy",
			    endDate: '+0d',
			    autoclose: true
			});  
			 $('.datepick').datepicker('setDate', '+0d');
		});
		
		mydate = new Date();
		$scope.sort = function(keyname){
			$scope.sortKey = keyname;   //set the sortKey to the param passed
			$scope.reverse = !$scope.reverse; //if true make it false and vice versa
		}
			$scope.query = {};
	   		$scope.queryBy = '$';
	   		$scope.pagesno = [20,50,100,150,200,300];
			$scope.pagesint=20;
			$scope.onpagechange = function(page){
			$scope.pagesint=page;
			}
		clearInterval(interval);
		
		//export PDF
		
	$('#exportpdf').click(function () {
		    try{
// 					alert("hhhhhhhhhi");
					
					var columns = ["Row NO", "Device Log", "Device Polling Time","Device Ip","Device Port"];
					var i=0;
					var data1=[];
				//		alert($scope.roledet.length);
// 			 alert('http://localhost:8080/indtrackwebservice/rest/CallService/rawdata?pageno=1'+'&itemsPerPage='+1000+'&imeino='+$scope.imeino+'&date='+document.getElementById('datesummaryreport').value);
              $http.get('http://localhost:8080/indtrackwebservice/rest/CallService/rawdata?pageno=1&itemsPerPage=10&imeino='+$scope.imeino+'&date='+document.getElementById('datesummaryreport').value).success(function(response){ 
			  alert(response.data);
			  for(i=0;i<response.data.length;i++)
			  {
// 			    	alert("in data2");	
			        var data2  = response.data[i];
			        data1.push([data2.rowno,data2.datamessage ,data2.datatimestamp,data2.clientfqdn,data2.clientport]);
			   }
			     var doc = new jsPDF('landscape','pt');
		       // debugger;
		    	 doc.autoTable(columns, data1);
		         doc.save("rawdata.pdf");
			 
			   }).error(function(data, status, headers, config)
					   {
				         document.getElementById('rawdatatbl').hidden = false;
				          $('#overlay').remove();
					      console.log('error: data = ', data);
				        });
		
               
		         
			    //	alert(data1);
			    	 
			        
			    }
			    catch(e)
			    {
			    	alert(e.message);
			    }
			    
		});
				

		
		


		
			try
		{
			document.getElementById('rawdatatbl').hidden = true;
			$scope.getRawdata = function(imei){
				

				document.getElementById('rawdatatbl').hidden = true;
				$scope.imeino = imei;
				$scope.getData42($scope.pageno); 
			}    
		    $scope.rawdatadetails = []; //declare an empty array
			$scope.pageno = 1; // initialize page no to 1
			$scope.total_count = 0;
//			$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
			
			$scope.getData42 = function(pageno){ // This would fetch the data on page change.
				//In practice this should be in a factory.
				document.getElementById('rawdatatbl').hidden = true;
				var over = '<div id="overlay">' +
//			     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
			     '</div>';
			    $(over).appendTo('body');
				$scope.rawdatadetails = [];
//				alert('livevehicle?companyid='+sptstr[1]+'&customerid='+sptstr[2]+'&pageno='+pageno+'&itemsPerPage='+$scope.itemsPerPage);
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/rawdata?pageno='+pageno+'&itemsPerPage='+$scope.pagesint+'&imeino='+$scope.imeino+'&date='+document.getElementById('datesummaryreport').value).success(function(response){ 
				//	alert(response.data);
					document.getElementById('rawdatatbl').hidden = false;
					 $('#overlay').remove();
					$scope.rawdatadetails = response.data;  //ajax request to fetch data into vm.data
					$scope.total_count = response.total_count;
				}).error(function(data, status, headers, config) {
					document.getElementById('rawdatatbl').hidden = false;
					 $('#overlay').remove();
						console.log('error: data = ', data);
					});
			};
			
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
		window.location.replace("/");
	}
	mydate = new Date();
	
	clearInterval(interval);
	function printData()
	{
	   var divToPrint=document.getElementById("printTabledealer");
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
        //var table_div = document.getElementById('dealerassignDiv');
        var i=0;
        var table_html = "";
		table_html = table_html +"<html><body><table><tr>"+
		"<td><font>Row No</font></td>"+
		"<td><font>Dealer Name</font></td>"+
		"<td><font>No Of Devices</font></td>"+
		"<td><font>Paid By</font></td>"+
		"<td><font>Payment Mode</font></td>"
		"<td><font>Order By</font></td>"+
		"<td><font>Dispatched By</font></td>"+
		"</tr>";
		try{
		for(i=0;i<$scope.dealerassigndetails.length;i++){
			data  = $scope.dealerassigndetails[i];
			table_html = table_html + "<tr>"+
			"<td><font>"+data.rowno+"</font></td>"+
			"<td><font>"+data.dealername+"</font></td>"+
			"<td><font>"+data.no_devices+"</font></td>"+
			"<td><font>"+data.payedby+"</font></td>"+
			"<td><font>"+data.paymentmode+"</font></td>"+
			"<td><font>"+data.order_placedby+"</font></td>"+
			"<td><font>"+data.dispatchby+"</font></td>"+
			"</tr>";
			}
		}catch(e){}
		table_html = table_html + "</table></body></html>";
        a.href = data_type + ', ' + table_html;
        a.download = 'DealerAssignment_Details' + postfix +'.xls';
        a.click();
       e.preventDefault(); 
    });}catch(e){alert("sss"+e);}


	$('#exportpdf').click(function () {
	//    
	    try{
			//alert("hhhhhhhhhi");
			var columns = ["Row NO","Dealer Name","No.of devices","Paid By","Payment Mode","Order By","Dispatched By"];
			var i=0;
	        
	      	var data1=[];
				
	    	for(i=0;i<$scope.dealerassigndetails.length;i++){
	    		
	        var data  = $scope.dealerassigndetails[i];
	    		 data1.push([data.rowno,data.dealername,data.no_devices,data.payedby,data.paymentmode,data.order_placedby,data.dispatchby]);
	    	}
	    
	    	 var doc = new jsPDF('landscape','pt');
	       doc.autoTable(columns, data1);
	         doc.save("DeviceAssignment.pdf");
	        }
	    catch(e)
	    {
	    	alert(e.message);
	    }
	    
	      });
$scope.colourIncludes = [];
 $scope.includeColour = function(colour) {
      var i = $.inArray(colour, $scope.colourIncludes);
      if (i > -1) {
    	  $scope.colourIncludes.splice(i, 1);
      } else {
    		  $scope.colourIncludes.push(colour);
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
			if($scope.assidealerdetailslist[i].dealername==document.getElementById('insertdealerassignname').value)
			{
				document.getElementById("insertDealerassbankname").value=$scope.assidealerdetailslist[i].bank_name;
				document.getElementById("insertDealerassbranch").value=$scope.assidealerdetailslist[i].branch;
				document.getElementById("insertDealerassaccountno").value=$scope.assidealerdetailslist[i].account_no;
				document.getElementById("insertDealerassbankadd").value=$scope.assidealerdetailslist[i].bank_address;
				document.getElementById("insertDealerassifsc").value=$scope.assidealerdetailslist[i].ifscno;

			}
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
$('#bankname').show();
$('#branch').hide();
$('#accountno').hide();
$('#add').hide();
$('#ifsccode').hide();
}
else if($(this).val() == 'Credit') 
	{
	 $('#creditam').show();
 $('#creditdays').show();
 $('#cheque').hide();
    $('#chequedate').hide();
    $('#bankname').hide();
    $('#branch').hide();
    $('#accountno').hide();
    $('#add').hide();
    $('#ifsccode').hide();
	}
else if($(this).val() == 'By Bank') 
{
	
$('#bankname').show();
$('#branch').show();
$('#accountno').show();
$('#add').show();
$('#ifsccode').show();
$('#creditam').hide();
$('#creditdays').hide();
$('#cheque').hide();
$('#chequedate').hide();
}
else {
	 $('#cheque').hide();
    $('#chequedate').hide();
    $('#creditam').hide();
     $('#creditdays').hide();
     $('#bankname').hide();
     $('#branch').hide();
     $('#accountno').hide();
     $('#add').hide();
     $('#ifsccode').hide();
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
$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdashvalues?loginid='+sptstr[2])
.success(function(data, status, headers, config) {
$scope.totaldevicessold = data;
$scope.AvialDevice=data.availabledevice;
}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});
$scope.ByDealername='';
try
{	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyDealername='+$scope.ByDealername)
	.success(function(data, status, headers, config) {
		$scope.dealerassigndetails = data;
		$scope.getData25($scope.pageno); 
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	$scope.dealerassigndetailsnew = [];
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
//	$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
	
	$scope.getData25 = function(pageno){ 
		$scope.dealerassigndetailsnew = [];
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
			if(i<=$scope.dealerassigndetails.length){
				if($scope.ByDealername!='')
					{
					if($scope.dealerassigndetails[i].includes($scope.ByDealername))
						{
				$scope.dealerassigndetailsnew.push($scope.dealerassigndetails[i-1]);
						}
					}
				else
					{
					$scope.dealerassigndetailsnew.push($scope.dealerassigndetails[i-1]);
						}
			}else{
				break;
			}
		}	
			$scope.total_count = $scope.dealerassigndetails.length;
	};
}
catch(e)
{}
$("#searchByDealername").keypress(function(){
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyDealername='+$scope.ByDealername)
	.success(function(data, status, headers, config) {
		$scope.dealerassigndetailsnew = data;
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyDealername='+$scope.ByDealername)
		.success(function(data, status, headers, config) {
			$scope.dealerassigndetailsnew = data;
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
});
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
	//alert(data.length);
	$scope.devicedealerlist = data;
	$scope.devlength=data.length;
}).error(function(data, status, headers, config) {
	//alert("error");
console.log('error: data = ', data);
});


$scope.dealerassign = function(){
// 	alert($scope.colourIncludes);
	
	try{
	var i=0;
	for(i=0;i<$scope.dealerassdealerdetailslist.length;i++)
	{
	if($scope.dealerassdealerdetailslist[i].dealername==document.getElementById('insertdealerassignname').value)
		{
		$scope.insertSaledealerid=$scope.dealerassdealerdetailslist[i].dealerid;
		}
	}
// 	alert("k")
	var dataObj = {
			imeino : $scope.colourIncludes
	}
	
	if($scope.colourIncludes.length==0){
		
		jAlert('Please Select Devices', 'Error');	
	}
	
	else {
	 
		 var over = '<div id="overlay">' +
//	     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
	     '</div>';
	    $(over).appendTo('body');
	    
	var res = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getimei?'+
			   'dealerid='+$scope.insertSaledealerid+'&ponum=889'+
			   '&loginid='+sptstr[2], dataObj);
	res.success(function(data, status, headers, config) {
		 $('#overlay').remove();
		jAlert('Record Inserted Successfully', 'Success Dialog');
	});
	res.error(function(data, status, headers, config) {
		 $('#overlay').remove();
	});	
};
	}catch(e){
		alert(e);
	}
}


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
//alert(e);
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
$scope.getData25($scope.pageno); 
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
{for(i=0;i<$scope.dealermodeldetails.length;i++)
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
{ 	 mydealerinsert.insertdealerassignname.focus(); 
} 
else if (mydealerinsert.insertdealerassmakenameo.value== "") 
{ 	 mydealerinsert.insertdealerassmakenameo.focus(); 
} 
else if (mydealerinsert.insertdealerassmodelname.value== "") 
{ 	 mydealerinsert.insertdealerassmodelname.focus(); 
} 
else if (mydealerinsert.insertdaelerassdeviceno.value== "") 
{ 	 mydealerinsert.insertdaelerassdeviceno.focus(); 
} 
else if (mydealerinsert.insertdealerpodate.value== "") 
{ 	 mydealerinsert.insertdealerpodate.focus(); 
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
	{	var i=0;
		for(i=0;i<$scope.dealermodeldetails.length;i++)
			{ 
			if($scope.dealermodeldetails[i].modelname==document.getElementById('insertdealerassmodelname').value)
				{
				$scope.dealermodelId=$scope.dealermodeldetails[i].modelid;
				}
			}
		try{
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
					'&loginid='+sptstr[2]+'&dispatchby='+ $scope.insertdisptchplacedby+
					'&bank_name='+document.getElementById("insertDealerassbankname").value+
					'&branch='+document.getElementById("insertDealerassbranch").value+
					'&accoutno='+document.getElementById("insertDealerassaccountno").value+
					'&bank_address='+document.getElementById("insertDealerassbankadd").value+
					'&ifscno='+document.getElementById("insertDealerassifsc").value)
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
							});	
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.dealerassigndetails = data;
								$scope.getData25($scope.pageno); 
							}).error(function(data, status, headers, config) {
								jAlert('Record Not Inserted','Information');
								console.log('error: data = ', data);
							});
							
				}).error(function(data, status, headers, config) {
					jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DealerAssignFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
					}); 
					//console.log('error: data = ', data);
				});
			}catch(e){
				//alert(e);
			}
		}else{
			jAlert('Select Devices to sale','Information');
		}
		}).error(function(data, status, headers, config) {
			jAlert(document.getElementById('insertdaelerassdeviceno').value+'Devices are Not available','Information');
			console.log('error: data = ', data);
		});
		}catch(e){//alert(e);
		}
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
		  
		  $('#editbankname').hide();
			$('#editbranch').hide();
			$('#editaccountno').hide();
			$('#editadd').hide();
			$('#editifsccode').hide();
			
		 
		}
	else if($(this).val() == 'By Bank') 
			{
		$('#editbankname').show();
		$('#editbranch').show();
		$('#editaccountno').show();
		$('#editadd').show();
		$('#editifsccode').show();
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		} 
	else if($(this).val() == 'Credit') 
	{
$('#editcreditam').show();
$('#editcreditdays').show();
$('#editchequ').hide();
$('#editchqdate').hide();

$('#editbankname').hide();
$('#editbranch').hide();
$('#editaccountno').hide();
$('#editadd').hide();
$('#editifsccode').hide();

} 
	else {
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		  $('#editbankname').hide();
		  $('#editbranch').hide();
		  $('#editaccountno').hide();
		  $('#editadd').hide();
		  $('#editifsccode').hide();
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
	{}});

$("#editdealersaletax").blur( function() {
try
{
var tax = parseInt(document.getElementById('editdealersaletax').value);
var result = document.getElementById('editdealersalefinaltotal');
result.value = tax+(parseInt($scope.editdealercost)*parseInt(document.getElementById("editdealerassnoofdevices").value));
}catch(e)
{}
});

$scope.dealerassignUpdate=function dealerassignUpdate()
{
try
{
$scope.transid=$scope.dealerassdata.transid;
var mydealeredit = document.editDealerassign; 
if (mydealeredit.editdealerassname.value== "") 
{ 
	mydealeredit.editdealerassname.focus(); 
} 
else if(mydealeredit.editdealerassnoofdevices.value== "") 
{ 	
	mydealeredit.editdealerassnoofdevices.focus(); 
} 
else if(mydealeredit.editdealersalepodate.value== "") 
{ 	 mydealeredit.editdealersalepodate.focus(); 
} 
else if(mydealeredit.editdealersaleinvoiceno.value== "") 
{ 	 mydealeredit.editdealersaleinvoiceno.focus(); 
} 
else if(mydealeredit.editdealersaleinvoicedate.value== "") 
{ 		 mydealeredit.editdealersaleinvoicedate.focus(); 
} 

else if(mydealeredit.editdealersaletax.value== "") 
{ 	 mydealeredit.editdealersaletax.focus(); 
} 
else if(mydealeredit.editdalersalepayed.value== "") 
{ 
	
	mydealeredit.editdalersalepayed.focus(); 
} 
else if(mydealeredit.editdalersalepayed.value== "") 
{ 
	
	mydealeredit.editdalersalepayed.focus(); 
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
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleupdate?'+
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
				'&dispatchby='+ $scope.editdisptach+'&bank_name='+document.getElementById("editdalersalebankname").value+
				'&branch='+document.getElementById("editdalersalebranch").value+'&accoutno='+document.getElementById("editdalersaleaccountno").value+
				'&bank_address='+document.getElementById("editdalersalebakadd").value+
				'&ifscno='+document.getElementById("editdalersaleifsccode").value)
	.success(function(data, status, headers, config) {
		document.getElementById("maindealerassign").hidden = false;
		document.getElementById("showeditdealerassign").hidden = true;
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.dealerassigndetails = data;
			$scope.getData25($scope.pageno); 
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
		jAlert('Record Updated Successfully', 'Success Dialog');
		document.getElementById('editDealerassign').reset();
	}).error(function(data, status, headers, config) {
		
		jAlert('Unable to  Proceed Your Request','Information');
		$scope.error=data;
		console.log('error: data = ', data);
		var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=DealerAssignFormUpdate',data);
		response.success(function(data, status, headers, config) {
		});
		response.error(function(data, status, headers, config) {
			//alert( "Exception details: " + JSON.stringify({data: data}));
		}); 
		
		
		console.log('error: data = ', data);
	});
	
	}
}
catch(e)
{//alert(e);
}
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
		window.location.replace("/");
	}
	mydate = new Date();
	clearInterval(interval);
function printData()
	{  var divToPrint=document.getElementById("printTablecustomer");
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
					var columns = ["Row NO","Customer Name","No.of Devices","Paid By","Payment Mode","Order By","Disptached By"];
					var i=0;
			        
			      	var data1=[];
						
			    	for(i=0;i<$scope.customerassigndetails.length;i++){
			    		
			        var data  = $scope.customerassigndetails[i];
			    		 data1.push([data.rowno,data.customername,data.no_devices,data.payedby,data.paymentmode,data.order_placedby,data.dispatchby]);
			    
			    	}
			    
			    	 var doc = new jsPDF('landscape','pt');
			      
			    	 doc.autoTable(columns, data1);
			         doc.save("DeviceSaleDetails.pdf");
			        
			    
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
"<td><font>Customer Name</font></td>"+
"<td><font>No Of Device</font></td>"+
"<td><font>Paid By</font></td>"+
"<td><font>Payment Mode</font></td>"+
"<td><font>Order By</font></td>"+

"<td><font>Dispatched By</font></td>"+
"</tr>";
try{
for(i=0;i<$scope.customerassigndetails.length;i++){
	data  = $scope.customerassigndetails[i];
	table_html = table_html + "<tr>"+
	"<td><font>"+data.rowno+"</font></td>"+
	"<td><font>"+data.customername+"</font></td>"+
	"<td><font>"+data.no_devices+"</font></td>"+
	"<td><font>"+data.payedby+"</font></td>"+
	"<td><font>"+data.paymentmode+"</font></td>"+
	"<td><font>"+data.order_placedby+"</font></td>"+
	"<td><font>"+data.dispatchby+"</font></td>"+
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
});}catch(e){alert("sss"+e);}




$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdashvalues?loginid='+sptstr[2])
.success(function(data, status, headers, config) {
	$scope.totaldevicessold = data;
	$scope.AvialDevice=data.availabledevice;
	}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
	});



$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
.success(function(data, status, headers, config) {

	$scope.custassdealerlist = data;
	
	
	$scope.loginid=sptstr[2];
	$scope.roleid=sptstr[0];
	
//$scope.parentDealer='Banglore Dealers';
	
	try
	{
		if($scope.loginid!='10001')
		{
			

			if(sptstr[6]=='1003'){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {

				$scope.devicecustomerlist = data;
				}).error(function(data, status, headers, config) {
				//alert("error");
				console.log('error: data = ', data);
				});
			}else if($scope.custassdealerlist.length==0){
			
				document.getElementById('cusassdealersDetails').hidden=true;
				document.getElementById('maindealer').hidden=true;
				$scope.custsale=sptstr[0];
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetailsbydealer?dealerid='+sptstr[7]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.devicecustomerlist = data;
//		 			alert(data.length);
				}).error(function(data, status, headers, config) {
					//alert("error");
					console.log('error: data = ', data);
				});
				
			}else{
				document.getElementById('maindealer').hidden=true;
				$scope.parentDealer=sptstr[0];	
				
			}
		
		}
	}catch(e){}
	
	
}).error(function(data, status, headers, config) {
	console.log('error: data = ', data);
});




	$scope.customerassign = function(){
		
		var dataObj = {
				imeino : $scope.colourIncludes
		}
		
		for(i=0;i<$scope.customerasscustomerdetailslist.length;i++)
		{
			if($scope.customerasscustomerdetailslist[i].customername==document.getElementById('insertcustomerassignname').value)
				{
				$scope.insertSalecustomerid=$scope.customerasscustomerdetailslist[i].customerid;
				}
		}
		
		
		if($scope.colourIncludes.length==0){
			
			jAlert('Please Select Devices', 'Error');
		}
		else{	
			 var over = '<div id="overlay">' +
//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
		    $(over).appendTo('body');
		var res = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/getimeicustomer?'+
		   'customerid='+$scope.insertSalecustomerid+'&ponum=889'+
		   '&loginid='+sptstr[2], dataObj);
		res.success(function(data, status, headers, config) {
			$('#overlay').remove();
			jAlert('Record Inserted Successfully', 'Success Dialog');
		});
		res.error(function(data, status, headers, config) {
			$('#overlay').remove();
			jAlert('Record Not Inserted', 'Information');
		//	alert( "failure message: " + JSON.stringify({data: data}));
		});	

	}
		}
	
	$("#custassSubdealerdetails").change( function() {
// 		alert("on change");

for(i=0;i<$scope.custassdealerlist.length;i++)
			 {
			 if($scope.custassdealerlist[i].dealername==document.getElementById('custassSubdealerdetails').value)
				 {
				 $scope.dealerassid=$scope.custassdealerlist[i].dealerid;
				 }
			 }	 
			 
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicedetailsbydealer?dealerid='+$scope.dealerassid+'&companyid='+sptstr[7])
		.success(function(data, status, headers, config) {
			$scope.devicecustomerlist = data;
// 			alert(data.length);
		}).error(function(data, status, headers, config) {
			//alert("error");
			console.log('error: data = ', data);
		});
	
	});

	$scope.colourIncludes = [];
	
	$scope.includeColour = function(colour) {
	var i = $.inArray(colour, $scope.colourIncludes);
		if (i > -1) {
			  $scope.colourIncludes.splice(i, 1);
		} else {
				  $scope.colourIncludes.push(colour);
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
			if($scope.assicustomerdetailslist[i].customername==document.getElementById('insertcustomerassignname').value)
				{
				document.getElementById("insertcustomerassbankname").value=$scope.assicustomerdetailslist[i].bank_name;
				document.getElementById("insertcustomerassbranch").value=$scope.assicustomerdetailslist[i].branch;
				document.getElementById("insertcustomerassaccountno").value=$scope.assicustomerdetailslist[i].account_no;
				document.getElementById("insertcustomerassbankadd").value=$scope.assicustomerdetailslist[i].bank_address;
				document.getElementById("insertcustomerassifsc").value=$scope.assicustomerdetailslist[i].ifscno;

				}
			
			
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
	$('#creditam').hide();
	$('#creditdays').hide();
	
	
	$('#custbank_name').hide();
	$('#custbranch').hide();
	$('#custaccount').hide();
	$('#custbankadd').hide();
	$('#custifscno').hide();
	}
	else if($(this).val() == 'Credit') 
	{
	$('#creditam').show();
	$('#creditdays').show();
	$('#cheque').hide();
	$('#chequedate').hide();
	
	
	$('#custbank_name').hide();
	$('#custbranch').hide();
	$('#custaccount').hide();
	$('#custbankadd').hide();
	$('#custifscno').hide();
	}
	else if($(this).val() == 'By Bank') 
	{
		$('#custbank_name').show();
		$('#custbranch').show();
		$('#custaccount').show();
		$('#custbankadd').show();
		$('#custifscno').show();
		
		$('#cheque').hide();
		$('#chequedate').hide();
		$('#creditam').hide();
		$('#creditdays').hide();
	}
	else {
	$('#cheque').hide();
	$('#chequedate').hide();
	$('#creditam').hide();
	$('#creditdays').hide();
	$('#custbank_name').hide();
	$('#custbranch').hide();
	$('#custaccount').hide();
	$('#custbankadd').hide();
	$('#custifscno').hide();
	
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

$scope.searchByCustomername='';
	try
	{
		
		try
		{
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyCustomer='+$scope.searchByCustomername)
	.success(function(data, status, headers, config) {
		//alert(" "+data);
		$scope.customerassigndetails = data;
		$scope.getData38($scope.pageno); 
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
		}catch(e){}
	$scope.customerassigndetailsnew = [];
	$scope.pageno = 1; // initialize page no to 1
	$scope.total_count = 0;
//	$scope.itemsPerPage = 20; //this could be a dynamic value from a drop down
	
	$scope.getData38 = function(pageno){ 
		$scope.customerassigndetailsnew = [];
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
			if(i<=$scope.customerassigndetails.length){
				if($scope.searchByCustomername!='')
					{
					if($scope.customerassigndetails[i].includes($scope.searchByCustomername))
						{
				$scope.customerassigndetailsnew.push($scope.customerassigndetails[i-1]);
						}
					}
				else
					{
					$scope.customerassigndetailsnew.push($scope.customerassigndetails[i-1]);
					}
			}else{
				break;
			}
		}
			
			$scope.total_count = $scope.customerassigndetails.length;
		
	};


	}
	catch(e)
	{}
	
	$("#searchbycustomername").keypress( function() {
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyCustomer='+$scope.searchByCustomername)
		.success(function(data, status, headers, config) {
			$scope.customerassigndetailsnew = data;
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]+'&searchbyCustomer='+$scope.searchByCustomername)
			.success(function(data, status, headers, config) {
				$scope.customerassigndetailsnew = data;
				 
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
	});
	
	
	

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
	//alert(e);
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
	$scope.getData38($scope.pageno);
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
		 
// 		 if($scope.dealerassid=='')
// 			{
			$scope.dealerassid=sptstr[7];
// 			}	 
		try{
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicecountcustomer?'+
				'count='+document.getElementById('insertcustomerassdeviceno').value+
				'&modelid='+$scope.customermodelId+'&dealerid='+sptstr[7])
		.success(function(data, status, headers, config) {
			if($scope.colourIncludes.length=document.getElementById('insertcustomerassdeviceno').value){
	try{	
		
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicesaleinsertcustomer?customerid='+$scope.insertSalecustomerid+
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
					'&loginid='+sptstr[2]+'&dispatchby='+ $scope.insertdisptchplacedby+'&parentloginid='+$scope.dealerassid+
					'&bank_name='+document.getElementById("insertcustomerassbankname").value+'&branch='+document.getElementById("insertcustomerassbranch").value+
					'&accountno='+document.getElementById("insertcustomerassaccountno").value+
					'&ifscno='+document.getElementById("insertcustomerassifsc").value+'&bank_address='+document.getElementById("insertcustomerassbankadd").value)
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
							//	alert( "failure message: " + JSON.stringify({data: data}));
							});	
							$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customersaledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
							.success(function(data, status, headers, config) {
								$scope.customerassigndetails = data;
								$scope.getData38($scope.pageno);
							}).error(function(data, status, headers, config) {
								jAlert('Record Not Inserted','Information');
								console.log('error: data = ', data);
							});
				}).error(function(data, status, headers, config) {
					jAlert('Unable to  Proceed Your Request','Information');
					$scope.error=data;
					console.log('error: data = ', data);
					var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=CustomerAssignFormInsert',data);
					response.success(function(data, status, headers, config) {
					});
					response.error(function(data, status, headers, config) {
						//alert( "Exception details: " + JSON.stringify({data: data}));
					});
				});
			}catch(e){
				//alert(e);
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
	{	//alert(e);
	}
	}}
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

	});	$(function() {
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
	
	$('#editcustBankname').show();
	$('#editcustbranch').show();
	$('#editcustaccount').show();
	$('#editcustbankadd').show();
	$('#editcustifscno').show();
	
	}
	else if($(this).val() == 'Cash') 
		{
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		  $('#editcustBankname').hide();
			$('#editcustbranch').hide();
			$('#editcustaccount').hide();
			$('#editcustbankadd').hide();
			$('#editcustifscno').hide();
			}
	else if($(this).val() == 'By Bank') 
			{
		
		$('#editcustBankname').hide();
		$('#editcustbranch').hide();
		$('#editcustaccount').hide();
		$('#editcustbankadd').hide();
		$('#editcustifscno').hide();
		
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		 
		} 
	else if($(this).val() == 'Credit') 
	{
		$('#editcustBankname').hide();
		$('#editcustbranch').hide();
		$('#editcustaccount').hide();
		$('#editcustbankadd').hide();
		$('#editcustifscno').hide();
		
	$('#editcreditam').show();
	$('#editcreditdays').show();
	} 
	else {
		
		$('#editcreditam').hide();
		 $('#editcreditdays').hide();
		 $('#editchequ').hide();
		  $('#editchqdate').hide();
		  
		  $('#editcustBankname').show();
			$('#editcustbranch').show();
			$('#editcustaccount').show();
			$('#editcustbankadd').show();
			$('#editcustifscno').show();
			
			
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
	//alert(e);
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
	//alert(e);
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
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/	devicesaleupdatecustomer?'+
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
				'&dispatchby='+ $scope.editdisptach+'&bank_name='+document.getElementById("editcustomersalebankname").value+
				'&branch='+document.getElementById("editcustomersalebranch").value+
				'&accountno='+document.getElementById("editcustsaleaccno").value+
				'&ifscno='+document.getElementById("editcustomersaleifscno").value+
				'&bank_address='+document.getElementById("editustomersalebankadd").value)
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
		jAlert('Unable to  Proceed Your Request','Information');
		$scope.error=data;
		console.log('error: data = ', data);
		var response = $http.post('http://localhost:8080/indtrackwebservice/rest/CallService/exceptioninsert?formname=CustomerAssignFormUpdate',data);
		response.success(function(data, status, headers, config) {
		});
		response.error(function(data, status, headers, config) {
			//alert( "Exception details: " + JSON.stringify({data: data}));
		}); 
	});	}
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
    <div id="navbar" class="navbar navbar-default navbar-fixed-top"  style="background-color: #779ECB;">

		
			

			<div class="navbar-container" id="navbar-container" >
				<button type="button" class="navbar-toggle menu-toggler pull-left"	
					id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>	

				<div class="navbar-header" style="height:80px;text-decoration: none; padding-top:0px">	
<!-- 				<a class="navbar-brand"  title="Go to Dashboard" href="" ng-click="dashboardclick();"> -->
					
<center><a text-align="center" ><img src="resources/images/ORSAC logo.png" height="90px";width="190%";></a></center><!-- 					  </a> -->
					   <!-- <font>Vehicle Tracking System</font> -->
					  
<!-- 					</a> -->
				</div>
				<div class="navbar-buttons navbar-header pull-right"
					role="navigation" style="height:60px";>
					<ul class="nav navbar-nav navbar-right">
					<li style="text-decoration: none;padding-top:15px;height:78px;" ng-if="loginid==10001">
					<a><i class=""></i> <button id="slider" class="btn btn-default btn-lg btn-link" style="font-size:32px;">
						    <span class="fa fa-bell" style="color:purple"></span>
						  </button>
						  <span class="badge badge-notify">0</span></a></li>
						<li  style="text-decoration: none; padding-top:15px">
						<a><i class=""></i>
<%-- 		  <img style="border: 0; padding-left:0px;" src="resources/images/activeuser1.png"></h2>  --%>
								 <font style="border: 0; padding-left:0px;" color="white"> Welcome: {{name}}</font>
						</a></li>
							<li class="light-blue"style="padding-top:15px;">
							<a data-toggle="dropdown" href="" class="dropdown-toggle">
								<img style="border: 0; padding-left:0px;" src="resources/assets/images/loout.png"height="20px" width="20px">

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								

								<li>
									<a href="#/Changepassword">
										<i class="ace-icon fa fa-user"></i>
										<font>Change Password</font>
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="/">
										<i class="ace-icon fa fa-power-off"></i>
										<font>Logout</font>
									</a>
								</li>
							</ul>
						</li>
						
									</ul>
				</div>
			</div>
			<!-- /.navbar-container     #C9D3DF -->
		</div>
<div class="main-container" id="main-c.ontainer" style="margin-top:60px;">

			<div id="sidebar" class="sidebar responsive" style="background-color:#f5f5f5;">
		
			
			
			<ul class="nav nav-list">
<!-- 			<li><a href="#/DealerAssignFormInsert" > <i -->
<!-- 							class="menu-icon fa fa-tachometer" style="color:#935116"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#935116" style="font-size: 15px;">Dealer Device Assign </font></span> -->
<!-- 					</a></li> -->
<!-- 			<li><a href="#/routedev" > <i -->
<!-- 							class="menu-icon fa fa-tachometer" style="color:#935116"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#935116" style="font-size: 15px;">Route Dev</font></span> -->
<!-- 			</a></li> -->

			<li ng-if="roleid=='1001'"  ><a href="#/Dealerdashnew" > <i
							class="menu-icon fa fa-tachometer" style="color:#4d4d8e;font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">DashBoard </font></span>
			</a></li>
								
				<li ng-if="roleid=='1012'"><a href="#/circledash" > <i
						class="menu-icon fa fa-tachometer" style="color:#4d4d8e;font-size: 25px"></i> <span
						class="menu-text"> 
						<font color="#4d4d8e" style="font-size: 15px;">Circle Dashboard</font></span>
				</a></li>

<!-- <li ng-if="loginid==10001 || loginid==10044" ><a href="#/VehicleDealerChange" > <i -->
<!-- 							class="menu-icon fa fa-tachometer" style="color: #4d4d8e;font-size: 25px"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color=#4d4d8e style="font-size: 15px;">Change Dealer </font></span> -->
<!-- 					</a></li> -->
				<li ng-if="loginid==10001 || loginid==10044"  ><a href="#/adminDashboard" > <i
							class="menu-icon fa fa-tachometer" style="color: #4d4d8e;font-size: 25px"></i> <span
							class="menu-text"> 
							<font color=#4d4d8e style="font-size: 15px;">DashBoard </font></span>
					</a></li>
				<li ng-if="roleid=='1002' && loginid!=10001"  ><a href="#/livestatus" > <i
							class="menu-icon fa fa-signal" style="color: #4d4d8e;font-size: 25px"></i> <span
							class="menu-text"> 
							<font color=#4d4d8e style="font-size: 15px;">Live Status</font></span>
					</a></li>
				<li ng-if="roleid=='1003'"  ><a href="#/home" > <i
							class="menu-icon fa fa-tachometer" style="color: #4d4d8e; font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">DashBoard </font></span>
					</a></li> 
					
					<li ng-if="roleid=='1004'"  ><a href="#/admindash" > <i
							class="menu-icon fa fa-tachometer" style="color: #4d4d8e; font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">DashBoard </font></span>
					</a></li>
					
					<li ng-if="loginid==10001"><a href="#/home" > <i
							class="menu-icon fa fa-truck" style="color: #4d4d8e;font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">Live Status </font></span>
					</a></li>
					
					<li ng-if="loginid==10001"><a href="#/minesdashboard" > 
					<i class="menu-icon fa fa-gavel" style="color: #4d4d8e;font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">Circle Dashboard </font></span>
					</a></li>
					
<!-- 					<li ng-if="loginid==10001"><a href="#/LUStatusReport" >  -->
<!-- 					<i class="menu-icon fa fa-gavel" style="color: #4d4d8e;font-size: 25px"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#4d4d8e" style="font-size: 15px;">LU Status Report </font></span> -->
<!-- 					</a></li> -->

<!--              <li ng-if="roleid==1012"><a href="#/truckmov" > <i -->
<!-- 							class="menu-icon fa fa-check-circle" style="color: #4d4d8e; font-size: 25px"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#4d4d8e" style="font-size: 15px;">Truck Movement </font></span> -->
<!-- 					</a></li> -->
					
<!-- 					<li ng-if="roleid==1012"><a href="#/routedev" > <i -->
<!-- 							class="menu-icon fa fa-check-circle" style="color: #4d4d8e; font-size: 25px"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#4d4d8e" style="font-size: 15px;">Route Daviation </font></span> -->
<!-- 					</a></li> -->
					
<!-- 					<li ng-if="roleid==1012"><a href="#/routewisetime" > <i -->
<!-- 							class="menu-icon fa fa-check-circle" style="color: #4d4d8e; font-size: 25px"></i> <span -->
<!-- 							class="menu-text">  -->
<!-- 							<font color="#4d4d8e" style="font-size: 15px;">RouteWise Time Taken </font></span> -->
<!-- 					</a></li> -->
				
					<li ng-if="loginid==10001"><a href="#/ApprovalForm" > <i
							class="menu-icon fa fa-check-circle" style="color: #4d4d8e; font-size: 25px"></i> <span
							class="menu-text"> 
							<font color="#4d4d8e" style="font-size: 15px;">Activate </font></span>
					</a></li>
					<li ng-repeat="x in menus | filter:{parentid: '11'}|orderBy:'orderno'" >
						<a href="{{x.navigateurl}}" class="dropdown-toggle"> <i
								class="menu-icon fa {{x.description}}" style="color: #4d4d8e;font-size: 25px"></i> <span
								class="menu-text" > <font	color="#4d4d8e" style="font-size: 15px;">{{x.menutext}}</font> </span>
								 
								<b class=" arrow fa fa-angle-down" style="color: blue"></b>
						</a>

						<ul class="submenu">
							<li ng-repeat="y in menus | filter:{parentid: x.menuid}|orderBy:'orderno'" 
							style="background: #8B9BAC;">
							<a href="{{y.navigateurl}}"> <i
									class="menu-icon fa fa-caret-right"></i> 
									<font color="#4d4d8e" style="font-size: 13px;">{{y.menutext}}
									</font>
							</a>
<!-- 							 <b class="arrow"></b> -->
							 </li>
						</ul>
					</li>
				</ul>
<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse" >		
					<i  style="color:#4d4d8e;border:5px solid;position:none !important" class="ace-icon fa fa-angle-double-right" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

			</div>
			<div id="pagecontent" class="main-content">
				<div class="main-content-inner">
					<div class="page-content">		
						<div class="row" ng-if="loginid==10001">
			<div class="col-md-12" style="padding-left:80px;">
        <div class="col-md-4 col-sm-4 col-xs-6">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><font color="white"><i class="fa fa-mobile fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Total GPS Installed</span>
              <span class="info-box-numberdev">{{totinstalled}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        
        
         <div class="col-md-4 col-sm-3 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><font color="white"><i class="fa fa-bus fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Sold Devices </span>
              <span class="info-box-numbertri"><centre>{{solddevices}}</centre></span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-3 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><font color="white"><i class="fa fa-truck fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">T Pass Generated</span>
              <span class="info-box-numbertri">{{tottripcount}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

      </div>
      <!-- /.row -->
      </div>
<!-- 						ng-view     -->
						<ng-view>Loading...</ng-view>
					</div>
				</div>
			</div>	
			
			<div id="footer" style="background: #181837;">
				
				<div  class="col-sm-4 col-lg-12">
				<div   class="col-sm-4">
				<font color="white">Designed And Developed By Rosmerta Technologies Ltd.</font>
 </div>
<div class="col-sm-8" style="text-align:right">
<font color="white">© 2016. All Rights Reserved ORSAC.</font>

				</div>
					
			</div>
			<a href="" id="scroll" class="os-back-to-top" style="display: block;" hidden="true"></a>
			</div>
		<!-- Inline Templates (Partials) -->


  </div>
  
<div class="dd collapse in">

	<div id="dislide" >
		<div class="container">
		<div class="row" style="padding: 15px;background-color:#1a78a5;padding-right:15px;]">
		<div class="close" style="top:0px;padding-rigth:20px;">x</div>
			 <div class="col-md-1 whi"><b>Sr.No</b></div>
			 <div class="col-md-2 whi"><b>Vehicleno</b></div>
			 <div class="col-md-2 whi"><b>Datetimestamp</b></div>
<!-- 			 <div class="col-md-2 whi"><b>Speed</b></div> -->
			 <div class="col-md-2 whi"><b>Location</b></div>
			  <div class="col-md-2 whi"><b>Alert Type</b></div>
			  <div class="col-md-2 whi"><b>Company Name</b></div>
		</div>
		<div dir-paginate="x in dashboardAlertdata|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
			 <div class="notice notice-danger" ng-if="x.alerttype=='Box Open'">
		        <div class="row">
		        	 <div class="col-md-1">{{x.rowno}}</div>
					 <div class="col-md-2">{{x.vehicleno}}</div>
					 <div class="col-md-2">{{x.datetime}}</div>
<!-- 					 <div class="col-md-2">{{x.speed}}</div> -->
					 <div class="col-md-2">{{x.location}}</div>
					 <div class="col-md-2"><strong>{{x.alerttype}}</strong></div>
					 <div class="col-md-2">{{x.companyname}}</div>
				</div>
		    </div>
		    <div class="notice notice-warning" ng-if="x.alerttype=='Overspeed'">
		         <div class="row">
					 <div class="col-md-1">{{x.rowno}}</div>
					 <div class="col-md-2">{{x.vehicleno}}</div>
					 <div class="col-md-2">{{x.datetime}}</div>
<!-- 					 <div class="col-md-2">{{x.speed}}</div> -->
					 <div class="col-md-2">{{x.location}}</div>
					 <div class="col-md-2"><strong>{{x.alerttype}}</strong>({{x.speed}})</div>
					  <div class="col-md-2">{{x.companyname}}</div>
				</div>
		    </div>
		</div>
		<dir-pagination-controls
				max-size="5"
				direction-links="true"
				boundary-links="true" 
				on-page-change="getDataalert(newPageNumber)" >
		</dir-pagination-controls>   
	</div>
	</div>
</div>
</body>
<style>
.notice {
    padding: 15px;
    background-color: #fafafa;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;
    -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
       -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
            box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
}
.whi{
	color:white;
}
.notice-warning {
    border-color: #FEAF20;
}
.notice-warning>strong {
    color: #FEAF20;
}
.notice-danger {
    border-color: #d73814;
}
.notice-danger>strong {
    color: #d73814;
}
.dd {
			position: absolute;
			top: 10%;
			right: 0px;
			z-index: 992;
			padding: 1px;
			display:none;
			
			
		}
		#dislide{
/* 			-webkit-box-shadow: -6px 8px 5px 0px rgba(50, 50, 50, 0.59); */
/* 			-moz-box-shadow:    -6px 8px 5px 0px rgba(50, 50, 50, 0.59); */
/* 			box-shadow:         -6px 8px 5px 0px rgba(50, 50, 50, 0.59); */
/* 			background-color:#EEEEEE; */
/* 			padding-left:20px; */
/* 			width:550px; */
/* 			height:600px; */
			float:right;
			display:none;
 			background-color:white; 
 			-webkit-box-shadow: -5px -4px 19px 0px rgba(50, 50, 50, 0.75);
			-moz-box-shadow:    -5px -4px 19px 0px rgba(50, 50, 50, 0.75);
			box-shadow:         -5px -4px 19px 0px rgba(50, 50, 50, 0.75);
		}
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
    background:url('resources/assets/images/16.gif') no-repeat center center rgba(0,0,0,0.25)
}
#loading {
    width: 50px;
    height: 57px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -28px 0 0 -25px;
}
.imagelogo{

 overflow: hidden;
 }
	#footer {
 
    position: fixed;
 
    height: 25px;
 	
    bottom: 0;
 
    width: 100%;	
 				
}

 .navbar .navbar-nav > li > a:hover, .navbar .navbar-nav > li > a:focus, .navbar .navbar-nav > li.open > a { 
    background-color: rgba(0,0,0,0) !important; 
    color: #fff !important; 
} 




.navbar .navbar-nav > li:first-child {
    border-width: 0 0 0 0;
}

.sidebar.menu-min .nav-list > li.hover-show > a > .menu-text {
   background-color:#f5f5f5;}
	
.sidebar .sidebar-toggle {
    border-style: none;
    border-width: 0 0 1px;
    text-align: center;
    padding: 3px 0;
    position: inherit;
}		
.sidebar.menu-min .nav-list > li > a.dropdown-toggle > .menu-text {
    top: -1px;
/*     border-width: 1px 1px 0; */
      background-color:#f5f5f5;
}

.nav .open > a, .nav .open > a:hover
{
/* background-color: rgb(130,191,86); */
background: #000000;
}


.nav-list > li .submenu > li > a:active
{
/* background-color: red; */
}

.nav-list > li .submenu > li > a:hover 
{
/* background-color: #453E5E; */
background-color:#fff;
color: white;
}
.nav-list > li .submenu > li > a:focus {
    


background-color: #fff;

}
.nav .open > a, .nav .open > a:focus, .nav .open > a:hover
{
 background: #9dabb5; 

}

.nav-list > li .submenu > li > a {
/* background-color: #C9D3DF; */
background-color: #829bed;
}

.nav > li > a:focus, .nav > li > a:hover 
{
background: #9dabb5;

}
.widget-toolbar > .nav-tabs > li.active > a{
 color:white !important;	
background-color: #64bdf9 !important;
border-bottom-color: none !important;
box-shadow:none !important;
margin-top: 0px !important;

	}


#popover_content_wrapper,#popover_content_wrapper1
{ padding: 10px;
    position: absolute;
    border-radius: 5px 5px 5px 5px; 
   -moz-border-radius: 5px 5px 5px 5px; 
   -webkit-border-radius: 5px 5px 5px 5px;
    margin-top: 20px;
    margin-left:300px;

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
	background-color: #1a78a5;
	text-align: justify;
	padding-top: 0px;
	}



.popover-title{
   background-color: #04020a;
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

.error {
  border:2px solid red;
}

 .os-back-to-top {
    position: fixed;
    bottom: 10%;
    right: 5px;
    text-decoration: none;
    color: #fff;
    background-color: rgb(21,109,124);
      background-image: url('http://www.cssauthor.com/wp-content/themes/pluto/assets/images/back-to-top-arrow.png');
    background-position: center 9px;
    -o-background-size: 15px 10px;
    -moz-background-size: 15px 10px;
    -webkit-background-size: 15px 10px;
    background-size: 15px 10px;
    background-repeat: no-repeat;
    height: 30px;
    width: 30px;
    border-radius: 30px;
    font-size: 10px;
    font-weight: bold;
    text-transform: uppercase;
    padding: 1em;
    display: none;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
}

/*new design  */
.panel-primary>.panel-heading {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
div {
    display: block;
}
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}

:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.fa-comments:before {
    content: "\f086";
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.panel-footer {
    padding: 10px 15px;
    background-color: #f5f5f5;
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}
a:focus, a:hover {
    color: #23527c;
    text-decoration: underline;
}
.huge {
    font-size: 40px;
}
.huge {
    font-size: 40px;
    line-height: normal;
}
.row:before {
    display: table;
    content: " ";
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.col-xs-3 {
    width: 25%;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.panel-green > .panel-heading {
    border-color: #5cb85c;
    color: #fff;
    background-color: #5cb85c;
}
.panel-green > a {
    color: #5cb85c;
}
.panel-blue > .panel-heading {
    border-color: #337ab7;
    color: #fff;
    background-color: #337ab7;
}
.panel-blue > a {
    color: #337ab7;
}
.fa-tasks:before {
    content: "\f0ae";
}
.panel-yellow > .panel-heading {
    border-color: #f0ad4e;
    color: #fff;
    background-color: #f0ad4e;
}
.panel-yellow > a {
    color: #f0ad4e;
}
.panel-red > .panel-heading {
    border-color: #d9534f;
    color: #fff;
    background-color: #d9534f;
}
.panel-red > a {
    color: #d9534f;
}
.panel-blue > a {
    color: #337ab7;
}
.panel-blue {
    border-color: #337ab7;
}
.panel-yellow {
    border-color: #f0ad4e;
}
.panel-red {
    border-color: #d9534f;
}
.panel-green {
    border-color: #5cb85c;
}


a {
    color: #337ab7;
    text-decoration: none;
}
.barheading {
    height:87px;
}

body
{
	overflow: scroll;

}
.widget-toolbar>.nav-tabs>li:not(.active)>a:hover {
   color:white !important;
    background-color: #64bdf9!important;
    margin-top: 0px !important;
}
.panel-primary>.panel-heading {
    color: #fff;
    background-color: #337ab7;
    border-color: #c0c0c0;
}
.panel-primary {
    border-color: #c0c0c0;	
}

.quick-btn {
    background: #eee none repeat scroll 0 0;
    box-shadow: 0 0 0 1px #f8f8f8 inset, 0 0 0 1px #cccccc;
    color: #444;
    display: inline-block;
    height: 80px;
    margin: 10px;
    padding-top: 16px;
    position: relative;
    text-align: center;
    text-decoration: none;
    width: 170px;
}
.quick-btn {
    color: #444;
    text-align: center;
/*     background-color: #2b75bf; */
}
.quick-btn span {
    display: block;
}
.quick-btn .label {
    position: absolute;
    right: -5px;
    top: -5px;
}

.label {
    border-radius: 0.25em;
    color: #fff;
    display: inline;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    padding: 0.2em 0.6em 0.3em;
    text-align: center;
    vertical-align: baseline;
    white-space: nowrap;
}
.quick-btn:hover {
    color: #fff;
}
* {
    box-sizing: border-box;
}
.quick-btn:hover{
background-color:#4d7589;
text-decoration:none;
}
@media (min-width: 992px)
grid-framework.less:48
.col-md-3 {
    width: 25%;
}
@media (min-width: 992px)
grid-framework.less:48
.col-md-3 {
    width: 25%;
}
.bg-aqua, .callout.callout-info, .alert-info, .label-info, .modal-info .modal-body {
    background-color: #00c0ef !important;
}
{
    box-sizing: border-box;
}
.info-box-icon {
    border-top-left-radius: 2px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 2px;
    display: block;
    float: left;
    height: 90px;
    width: 90px;
    text-align: center;
    font-size: 45px;
    line-height: 90px;
    background: rgba(0,0,0,0.2);
}
.info-box {
    display: block;
    min-height: 90px;
    background: #fff;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
    border-radius: 2px;
    margin-bottom: 15px;
}
.info-box .progress {
    background: rgba(0,0,0,0.2);
    margin: 5px -10px 5px -10px;
    height: 2px;
}
info-box .progress .progress-bar {
    background: white;
}
.info-box .progress, .info-box .progress .progress-bar {
    border-radius: 0;
}
.progress, .progress>.progress-bar, .progress .progress-bar, .progress>.progress-bar .progress-bar {
    border-radius: 1px;
}
.info-box-number {
    display: block;
    font-weight: bold;
    font-size: 18px;
}
.info-box-numberval {
    display: block;
    font-weight: bold;
    font-size: 18px;
}
.info-box-numberdev {
    display: block;
    font-weight: bold;
    font-size: 18px;
}
.info-box-numbertri {
    display: block;
    font-weight: bold;
    font-size: 18px;
}
.info-box-content {
    padding: 5px 10px;
    margin-left: 90px;
}
.info-box-content {
    padding: 5px 10px;
    margin-left: 90px;
}
.info-box-content {
    padding: 5px 10px;
    margin-left: 90px;
}
.info-box-content {
    padding: 5px 10px;
    margin-left: 90px;
}

.bg-green, .callout.callout-success, .alert-success, .label-success, .modal-success .modal-body {
    background-color: #00a65a !important;
}


.bg-yellow, .callout.callout-warning, .alert-warning, .label-warning, .modal-warning .modal-body {
    background-color: #f39c12 !important;
}


.bg-red, .callout.callout-danger, .alert-danger, .alert-error, .label-danger, .modal-danger .modal-body {
    background-color: #dd4b39 !important;
}


.label-success, .modal-success .modal-body {
    background-color: #00a65a !important;
}
.label-success {
    background-color: #5cb85c;
}
labels.less:
.label {
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}


}
body { text-align:center }
.ui-widget { position:relative; display:inline-block; width:140px; height:140px; margin:30px; border:15px solid #00aeef; border-radius:150px; text-align:center; font-family: Arial, sans-serif; box-shadow:inset 0 1px 0 rgba(255,255,255,.8), inset 0 3px 5px rgba(0,0,0,.25); box-sizing:border-box; border-bottom-color:#fff }
.ui-widget .ui-value { position:absolute; left:0; right:0; top:15px; font-size:40px; }
.ui-widget .ui-label { position:absolute; left:0; bottom:-10px; width:100%; font-size:14px; text-transform:uppercase; color:#888; font-weight:700 }

.nav-list>li {
	border-style:solid;
	border-width:2px 0px 0px;
	border-color:#779ECB;
}
.info-box-text{
	color:white;
	font-weight:600;
}
.info-box-number,.info-box-numberval,.info-box-numbertri,.info-box-numberdev{
	color:white;
	font-weight:900;
}
.badge-notify{
   background:red;
   position:relative;
   top: -20px;
   left: -35px;
  }
</style>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script  src="resources/fusioncharts/fusioncharts.charts.js"></script>
<script src="resources/fusioncharts/fusioncharts.js"></script>
 <script src="resources/fusioncharts/fusioncharts.theme.fint1.js"></script>
 <link type="text/css" rel="stylesheet" href="resources/css/minecss.css">
 
</html>
