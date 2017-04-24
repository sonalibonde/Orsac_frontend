<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="<c:url value="/resources/images/index.png"/>">
<title>Track On Map</title>
<link rel="stylesheet" href="<c:url value="/resources/style/ol.css"/>" type="text/css">
<style>
.loader {
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
	opacity: 1;
	filter: alpha(opacity = 80);
	background-color: transparent;
	background: url('resources/images/Preloader_7.gif') no-repeat
		center center rgba(0, 0, 0, 0.25)
}

#loading {
	width: 50px;
	height: 57px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -28px 0 0 -25px;
}

	html           { width:100%; height:900px; margin:0; }
	#map           { width:100%; height:900px; margin:0; top: 50px; }
	#toolbox       { position:absolute; top:8px; right:8px; padding:3px; border-radius:4px; color:#fff; background: rgba(255, 255, 255, 0.4); z-index:100; }
	#layerswitcher { margin:0; padding:10px; border-radius:4px; background:rgba(0, 60, 136, 0.5); list-style-type:none; } 
	.ol-popup {
		  position: absolute;
		  background-color: white;
		  -webkit-filter: drop-shadow(0 1px 4px rgba(0,0,0,0.2));
		  filter: drop-shadow(0 1px 4px rgba(0,0,0,0.2));
/* 		  padding: 15px; */
		  border-radius: 10px;
		  border: 1px solid gray;
		  bottom: 07px;
		  left: -50px;
		  min-width: 280px;
	    border-radius: 10px;
	    box-shadow: 10px 10px 5px #888888;
/* 	    font-family: "Copperplate Gothic Bold", Times, serif; */
		}
		.ol-popup:after, .ol-popup:before {
		  top: 100%;
		  border: solid transparent;
		  content: " ";
		  height: 0;
		  width: 0;
		  position: absolute;
		  pointer-events: none;
		}
		.ol-popup:after {
		  border-top-color: white;
		  border-width: 10px;
		  left: 48px;
		  margin-left: -10px;
		}
		.ol-popup:before {
		  border-top-color: #cccccc;
		  border-width: 11px;
		  left: 48px;
		  margin-left: -11px;
		}
		.ol-popup-closer {
		  text-decoration: none;
		  position: absolute;
		  top: 2px;
		  right: 8px;
		}
		.ol-popup-closer:after {
/*  		  content: "✖";  */
/* 			content:url(http://www.eqs-corporate-communications.com/fileadmin/templates/images/icon_close_brown.svg); */
			height:30px;
			width:30px;
		}
 		
 		#map .ol-zoom .ol-zoom-out {
		  margin-top: 204px;
		}
		#map .ol-zoomslider {
		  background-color: transparent;
		  top: 2.3em;
		}
		
		#map .ol-touch .ol-zoom .ol-zoom-out {
		  margin-top: 212px;
		}
		#map .ol-touch .ol-zoomslider {
		  top: 2.75em;
		}
		
		#map .ol-zoom-in.ol-has-tooltip:hover [role=tooltip],
		#map .ol-zoom-in.ol-has-tooltip:focus [role=tooltip] {
		  top: 3px;
		}
		
		#map .ol-zoom-out.ol-has-tooltip:hover [role=tooltip],
		#map .ol-zoom-out.ol-has-tooltip:focus [role=tooltip] {
		  top: 232px;
		}
		.cd {
			position: absolute;
		    top:0px;
 		 	left: 70px; 
			z-index: 992;
/* 		  	background-color:#f3f3f3;   */
/* 			position: fixed; */
			width:80%;
		/* 	text-align:center; */
		/* 	border: 1px solid black; */
			/*width: 100px;*/
			padding: 1px;
/* 			box-shadow: 0 0 20px black; */
		}
		#togglemap{
			background-color:#F1EEE8;
			display:none;
			float:top;
/* 			border: 1px solid black; */
		}
 		.row{
 			box-shadow: 0 0 20px black; 
 		} 
		.dd {
			position: absolute;
			top: 20%;
			right: 0px;
			z-index: 992;
			/*background-color:#f3f3f3;*/
/* 			position: fixed; */
/*  			width:300px;height:500px; */
			padding: 1px;
			display:none;
/* 			background-color:white; */
			
		}
		.bd1 {
			position: absolute;
			top: 10%;
			right: 30px;
			z-index: 992;
			/*background-color:#f3f3f3;*/
			position: fixed;
/*  			width:300px;height:500px; */
			padding: 1px;
			display:none;
/* 			background-color:white; */
			
		}
		.btn-xs123{
			width:80px;
			height:20px;
			float:bottom;
			background-color:#838380;
		}
		.btn-xs122{
			width:40px;
			height:40px;
			background-color:#838380;
		}
		#dislide{
			-webkit-box-shadow: -6px 8px 5px 0px rgba(50, 50, 50, 0.59);
			-moz-box-shadow:    -6px 8px 5px 0px rgba(50, 50, 50, 0.59);
			box-shadow:         -6px 8px 5px 0px rgba(50, 50, 50, 0.59);
			background-color:#EEEEEE;
			padding-left:20px;
/* 			width:550px; */
/* 			height:600px; */
			float:right;
			display:none
		}
		
</style>

<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap.min.css"/>">

<link href="<c:url value="/resources/style/bootstrap.min3.css"/>" rel="stylesheet">
<link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.cs"/>" rel="stylesheet">
<link href="<c:url value="/resources/style/cssMap11.css"/>" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/style/datepicker3.css">
 <link rel="stylesheet" type="text/css" href="/resources/style/jquery-ui.css">
<%-- <link rel="stylesheet" href="<c:url value="/resources/style/stylemapg1.css"/>" type="text/css"> --%>
<style>
 	.tiplabel{font-weight: bold;  background-color: threedhighlight; } 
/*     .tiptext{font-weight: bold;} */
    .tiphead{ font-weight: bolder; color: #222;  font-size: 12pt;
        /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#b4ddb4+0,83c783+26,52b152+36,005700+100,002400+100,005700+100 */background: #b4ddb4; /* Old browsers */
background-color: green;
}
    .popup{height:50px; width:300px;}
    .popopimage{background-image: url(close.gif); width: 22px;}
    .popupbox{padding-left:97%; width: 22px; backface-visibility: hidden; background-color: #EEE;}
</style>
</head>
<body ng-app="single-page-app" ng-controller="CustomerListController">

<!-- <div class="navbar navbar-default navbar-fixed-top"> -->
<!--       <div class="container"> -->
          
<!--         <div class="navbar-header pull-left">      -->
<!--           <a class="navbar-brand" href="#">Diksuchi</a> -->
<!--         </div> -->
<!--         <div class="navbar-header pull-right"> -->
<!--            <button type="button" class="navbar-toggle"  -->
<!--                   data-toggle="collapse" data-target=".navbar-collapse"> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--           </button> -->
            
<!--           <p class="navbar-text"> -->
<!--             <a href="Logout" class="navbar-link">Logout</a>&nbsp; -->
<!--           </p>   -->
<!--         </div> -->
          
<!--         <div class="navbar-collapse collapse"> -->
<!--           <ul class="nav navbar-nav"> -->
<!--              <li><a href="DeviceDataList">Device Logs</a></li> -->
<!-- 		      <li><a href="DataPosition">Parsed Data</a></li> -->
<!-- 		       <li ><a href="PacketMessageAlert">Alerts</a></li> -->
<!-- 		      <li class="active"><a href="#">Track On Map</a></li> -->
<!--           </ul> -->
<!--         </div> -->

<!--     </div> -->
<!--   </div> -->
<!-- <br><br><br> -->
<!-- overflow-y: scroll; -->
<!-- <div class="md collapse in"><button id="slider" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-chevron-left" ></span></button></div> -->
	<div class="bd1 collapse in" >
		<input type="image" id="stop" value="" name="stop" id="stop" src="<c:url value="/resources/images/Stop.png"/>"
				width="32" height="32" data-content="Stop History Plotting" rel="popover" data-placement="left"  data-trigger="hover"
					 style="cursor:pointer;" hidden> 
	</div>
	<div class="dd collapse in" >
	<div>
		<button id="slider" class="btn btn-default btn-xs btn-xs122" style="float:left;background-color:#808080;"><span class="glyphicon glyphicon-align-justify" style="color:blue;"></span></button>

		<div id="dislide" >
		   <br>
		   		<b>Feature Controls</b>
			<br><br>&nbsp;
			
<!-- 			</br> -->&nbsp;
		    <img src="<c:url value="/resources/images/line.png"/>" id="drawline"
			    height="30" width="35" alt="" data-content="Draw Route on Map" rel="popover" data-placement="left"  data-trigger="hover"
				 style="cursor:pointer;" />
<!-- 				 </br> -->&nbsp;
				  <img src="<c:url value="/resources/images/delete.png"/>" id="deleteline" 
			    height="30" width="35" alt="" data-content="Delete Line Route" rel="popover" data-placement="left"  data-trigger="hover"
				 style="cursor:pointer;" data-toggle="modal" data-target="#myModal"/>
<!-- 				 </br> -->&nbsp;
				 <img src="<c:url value="/resources/images/pan.png"/>" id="panmap"
			    height="30" width="35" alt="" data-content="Pan on Map" rel="popover" data-placement="left"  data-trigger="hover"
				 style="cursor:pointer;" />
<!-- 				 </br> -->&nbsp;
				 <img src="<c:url value="/resources/images/save.png"/>" id="saveline" 
			    height="30" width="35" alt="" data-content="Save Drawn Line" rel="popover" data-placement="left"  data-trigger="hover"
				 style="cursor:pointer;" data-toggle="modal" data-target="#myModal1" hidden/>
<!-- 				  </br> -->&nbsp;
				
				 <img src="<c:url value="/resources/images/clear.jpg"/>" id="clearfeature"
			    height="30" width="35" alt="" data-content="Clear Drawn Line" rel="popover" data-placement="left"  data-trigger="hover"
				 style="cursor:pointer;" hidden/>
				 </br></br>
				  <datalist id="routelist">
						<option ng-repeat="y in routename" value="{{y.routename}}"></option>
				</datalist>
		       <table>
		       <thead>
				 	<tr>
				 		<td><b>Add Shelters to route</b></td>
				 	</tr>
				 </thead>
		       	<tr>
		       		<td>Select Route</td>
		       		<td><input type="text" id="routenamenewlist" class="form-control" list="routelist"></td>
		       		<td><button id="routenamenew">Select</button></td>
		       	</tr>
		       	
		       </table>
		       <br>
		       <div>
		       <form class="form-inline">
					<div class="form-group">
						<label >Search</label>
						<input type="text" ng-model="search" class="form-control" placeholder="Search">
					</div>
				</form><br>
				 <table class="table table-hover table-bordered">
				 <thead>
				 	<tr>
				 		<td><b>Shelter</b></td>
				 		<td><b>Order No</b></td>
				 	</tr>
				 </thead>
				    <tr dir-paginate="x in shelters|orderBy:sortKey:reverse|filter:search|itemsPerPage:5">
			       		<td class="col-md-6"><input id="{{x}}" ng-model="disablelist" type="checkbox" ng-click="getName(disablelist,x)" class="cradio" disabled/><label for="{{x}}" >{{x.sheltename}}</label></td>
			       		<td class="col-md-6"><div class="col-xs-4"><input type="text" class="form-control"  ng-model="x.orderno" ng-disabled="!disablelist" valid-number /></div></td>
			       	</tr>
			       	<tr>
			       		<td><button id="shelterassign" ng-click="setShelter()">Assign</button></td>
			       		
			       	</tr>
				 </table>
				 <dir-pagination-controls
					max-size="5"
					direction-links="true"
					boundary-links="true" >
				</dir-pagination-controls>
				 </div>
				 </div>
				 </div>
			</div>
			
		<datalist id="vehicleslist">
				<option ng-repeat="x in MarkerArrayList" value="{{x.vehical_no}}"></option>
		</datalist>
		<div class="cd collapse in">
			<div id="togglemap" class="row" >
			<table>
				<tr>
					<td><input type="radio" name="grp" id="all" checked="checked" ng-click="allMarkers()"/><label for="all">All Vehicles</label></td>
					<td><input type="radio" name="grp" id="live"/><label for="live">Live Vehicles</label></td>
					<td><input type="radio" name="grp" id="history"/><label for="history">History</label></td>
				</tr>
			</table>
	<!-- 	     <button ng-click="allMarkers()">All</button> -->
				<table id="livediv" hidden="true">
			          <tr>
					        <td><b>Vehicle No </b></td>
					        <td>  <input type="text" class="form-control" id="liveinput" list="vehicleslist"> </td>
					  
		     				
		     				<td>  <button id="livebtntrail" ng-click="livefunctionTrail()">View Live Trail</button></td>
	     			  </tr>
	     		</table>
		     	<table id="hisdiv" hidden="true">
			          <tr>
					        <td><b>Vehicle No </b></td>
					        <td>
					        	<input type="text" class="form-control" id="historyinput" list="vehicleslist">
					        </td> 
					  
					        <td><b>Date</b></td>
					        <td>
					        	<input  type="text" class="form-control" placeholder="mm/dd/yyyy" id="data" >
					        </td>
				       
					        <td><b>Time From </b></td>
					        <td>
	<!-- 				        	<input class="form-control" type="time" id="time1"> -->
								  <timepicker-pop input-time="time1"  class="input-group" disabled="disabled"
														show-meridian='showMeridian' value="0:0"> </timepicker-pop>
									</div>
					        </td>
					   
							<td><b>Time To</b></td>
							<td>
	<!-- 							<input class="form-control" type="time" id="time2"> -->
									<timepicker-pop input-time="time2" class="input-group" disabled="disabled"
														show-meridian='showMeridian'> </timepicker-pop>
							</td>
						
							<td>
								<button id="historybtn" ng-click="historyfunction()">View</button>
							</td>
						</tr>
	             </table>
	             <table hidden>
	            	 <tr>
	            	 	<td><b>Select Feature</b></td>
			            <td> <select id="type">
						        <option value="None">None</option>
						        <option value="Point">Point</option>
						        <option value="LineString">LineString</option>
						        <option value="Polygon">Polygon</option>
						        <option value="Circle">Circle</option>
						        <option value="Square">Square</option>
						        <option value="Box">Box</option>
					      </select></td>
					       <td><button id="featureinfo" ng-click="featurefunction()">Save</button></td>
					       <td><button ng-click="showLine()">Show feature</button></td>
					       <td><button id="clear">Clear feature</button></td>
				       </tr>
			       </table>
	             </div>
<!--              <div> -->
<!--              <div style="background-color:white" class="row" id="forhide"></br></div> -->
         	    <center><div class="btn btn-default btn-xs btn-xs123" style="background-color:#808080;" id="slide"><span class="glyphicon glyphicon-chevron-down" style="color:blue;"></span></div></center>
<!--              </div> -->
	     </div>
	     
	      <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" >&times;</button>
		          <h4 class="modal-title">Delete Route</h4>
		        </div>
		        <div class="modal-body">
		        <table>
		        	<tr>
		        		<td><b>Route Name</b></td>
		        		<td><input id="drname" type="text" class="form-control" list="routelist"/></td>
		        	</tr>
		        	<tr>
		        		<td><button ng-click="deleteLine()" data-dismiss="modal">Delete</button></td>
		        	</tr>
		        </table>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		  
		  <div class="modal fade" id="myModal1" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Save Route</h4>
		        </div>
		        <div class="modal-body">
		        <table>
		        	<tr>
		        		<td><b>Route Name</b></td>
		        		<td><input id="srname" type="text" class="form-control" /></td>
		        	</tr>
		        	<tr>
		        		<td><button ng-click="featurefunction()" data-dismiss="modal">Save</button></td>
		        	</tr>
		        </table>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
	     
	     
		 <div id="map" class="map"></div>
		    <div id="popup" class="ol-popup">
		      <a href="#" id="popup-closer" class="ol-popup-closer">
				<img src="http://www.eqs-corporate-communications.com/fileadmin/templates/images/icon_close_brown.svg"
		         height="30px" width="30px">
			  </a>
			  
		      <div id="popup-content"></div>
		    </div>
		<div id="toolbox">
		<ul id="layerswitcher">
		<li><label><input type="radio" name="layer" value="0" checked> OSM </label></li>
		<li><label><input type="radio" name="layer" value="1" > India</label></li>
		</ul>
		</div>
		
		<script src="<c:url value="resources/javascripts/angular.min.js"/>"></script>
		<script src="<c:url value="resources/javascripts/dirPagination.js"/>"></script>
		<script src="<c:url value="resources/javascripts/angular-route.min.js"/>"></script>
		<script src="<c:url value="resources/javascripts/angular-resource.js"/>"></script>
		<script src="<c:url value="resources/javascripts/jquery.min.js"/>"></script>
		<script src="<c:url value="resources/javascripts/jquery-ui.js"/>"></script>
		<script src="<c:url value="resources/javascripts/bootstrap.min.js"/>"></script>
<%-- 		<script type='text/javascript' src="<c:url value="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script> --%>
		<script src="<c:url value="resources/javascripts/ui-bootstrap-tpls.js"/>"></script>
		<script src="resources/javascripts/timpicker.js" type="text/javascript"></script>
		<script src="<c:url value="resources/javascripts/ol.js"/>" type="text/javascript"></script>
		<script type="text/javascript" src="resources/javascripts/bootstrap-datepicker.js"></script>
		<script>
			var key;
			try{
			    $.ajax({
			        url: "http://68.64.172.10:9090/nrdamapwebservice/rest/CallService/getkey"
			    }).then(function(data) {
			       key = data.key;
			    });
			}catch(e){
// 				alert(e);
			}
		</script>
		<script type="text/javascript">
		
		  var over = '<div id="overlay">' +
//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
		     '</div>';
		    $(over).appendTo('body');
		$("#routenamenewlist").change(function(){
			    if(vectorSource.getFeatureById(document.getElementById('routenamenewlist').value) == null){
			    	$('.cradio').each(function() {
			            if ($(this).attr('disabled')) {
			            	 $(this).attr({
				                    'disabled': 'disabled'
				                });
			            } else {
			                $(this).attr({
			                    'disabled': 'disabled'
			                });
			            }
			        });
			    } 
		});
             
              
		try{
		 $("#routenamenew").click(function(){
			    if(vectorSource.getFeatureById(document.getElementById('routenamenewlist').value) != null){
// 			    	document.getElementsByClassName('cradio').disabled = false;
			    	sourcestop.addFeature(vectorSource.getFeatureById(document.getElementById('routenamenewlist').value));
					var extent1 = sourcestop.getExtent();
					map.getView().fit(extent1, map.getSize()); 
					//var c = [];
					//sheltcode = c;
					$('.cradio').each(function() {
			            if ($(this).attr('disabled')) {
			                $(this).removeAttr('disabled');
			            }
			            $(this).attr("checked", false);
			        });
			    } else{
			    	alert('Invalid Route Name');
			    	$('.cradio').each(function() {
			            if ($(this).attr('disabled')) {
			            	 $(this).attr({
				                    'disabled': 'disabled'
				                });
			            } else {
			                $(this).attr({
			                    'disabled': 'disabled'
			                });
			            }
			        });
			    }
			    
			});
		 }catch(e){alert(e);}
		 

// 	------------------------------Datepicker js------------------------
	$(function() {
		$('#drawline').popover({ trigger: "hover" });
		$('#panmap').popover({ trigger: "hover" });
		$('#clearfeature').popover({ trigger: "hover" });
		$('#saveline').popover({ trigger: "hover" });
		$('#deleteline').popover({ trigger: "hover" });
		$('#stop').popover({ trigger: "hover" });
		$('#data').datepicker({
		    format: "dd-M-yyyy",
		    endDate: '+0d',
		    autoclose: true
		});  
		 $('#data').datepicker('setDate', '+0d');
	});
// 	------------------------------Datepicker js------------------------

// 	------------------------------SlideToggle--------------------------
	$(document).ready(function(){
	    $("#slide").click(function(){
	        $("#togglemap").slideToggle();
	        $("#forhide").toggle();
	    });
	    var effect = 'slide';

	    // Set the options for the effect type chosen
	    var options = { direction: 'right' };

	    // Set the duration (default: 400 milliseconds)
	    var duration = 500;
// 	    $("#slider").click(function(){
// 	        $("#dislide").toggle(effect, options, duration);
// 	    });
	    
	    
	    $("#slider").click(function(){
	        var $target = $('#dislide'),
	            $toggle = $(this);

	        $target.toggle( 500);
	    });
	    
	    
	    
// 	});
// 	$(document).ready(function(){
	    $("#all").click(function(){
	    	$("#hisdiv").hide();
	        $("#livediv").hide();
	        $("#stop").hide();
	    });
// 	});
// 	$(document).ready(function(){
	    $("#drawline").click(function(){
// 	    	alert("in draw");
	    	drawLine();
	    });
// 	});
// 	$(document).ready(function(){
	    $("#live").click(function(){
	    	$("#hisdiv").hide();
	        $("#livediv").show();
	        $("#stop").hide();
	    });
// 	});
// 	$(document).ready(function(){
	    $("#history").click(function(){
	    	$("#livediv").hide();
	        $("#hisdiv").show();
	    });
	});
// 	------------------------------SlideToggle--------------------------

// -----------------popup Contents--------------------------------------
		var container = document.getElementById('popup');
		var content = document.getElementById('popup-content');
		var closer = document.getElementById('popup-closer');
// -----------------popup Contents--------------------------------------		
	
	

//  -------------------Drag Method---------------------
		/**
		 * Define a namespace for the application.
		 */
// 				d://app_drag_selected
	//  -------------------Drag Method---------------------	
		
		
		
// 		-----------------------Layer Switcher---------------------
		$(function() { 
			var checkedLayer = $('#layerswitcher input[name=layer]:checked').val();
			for (i = 0, ii = layers.length; i < ii; ++i) {
				layers[i].setVisible(i==checkedLayer);
				layers[2].setVisible(true);
				layers[3].setVisible(true);
				layers[4].setVisible(true);
				layers[5].setVisible(true);
				layers[6].setVisible(true);
				layers[7].setVisible(true);
				layers[8].setVisible(true); 
			}
		});
			
		$("#layerswitcher input[name=layer]").change(function() { 
			var checkedLayer = $('#layerswitcher input[name=layer]:checked').val();
			for (i = 0, ii = layers.length; i < ii; ++i) {
				layers[i].setVisible(i==checkedLayer);
				layers[2].setVisible(true);
				layers[3].setVisible(true);
				layers[4].setVisible(true);
				layers[5].setVisible(true);
				layers[6].setVisible(true);
				layers[7].setVisible(true);
				layers[8].setVisible(true);			
				}
		 });
// 		-----------------------Layer Switcher---------------------
		
		
// 		-------------------------Creating Markers------------------
		var iconFeaturesgreen=[],iconFeaturesred=[],iconFeaturesyellow=[],iconFeatureslive, iconFeatureshistory;
		var iconFeature;
		var markers = [], layerLines=[], vector1=[],source=[];
		 var layers = [],vector=[];
	       var map;
	       var  features1 = new ol.Feature({
//	            geometry: geom,
// 		            name: 'Line'
		        });
      var lines = new ol.source.Vector({
// 		       feature : features1
 		    });
       function createAllMarkers(MarkerList){
		iconc="<c:url value="/resources/images/closenew.png" />";
			try{
				   var ONE_HOUR = 60 * 60 * 1000;
		           var time=(new Date).getTime();
		    	   for(i=0;i<MarkerList.length;i++){
		    		    data=MarkerList[i];
		    		    var desc =
				    		     '<table class="popupback"> <tr>'+
					             '<td><div><table class="popup">' +
					             '<tr><td align=center class="tiphead" colspan="2"><font>Vehicle Details</font></td></tr>'+
					              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
					              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
					              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
								  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
								  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
// 								  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
					              '</table></div></td><td></td>'+
					              '</tr></table></div>';
		    		    var lat= Number(data.latitude);
		    		    var longi=Number(data.longitude);
					    iconFeature = new ol.Feature({
						  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
						  'EPSG:3857')),
						  name: desc,
						  population: 4000,
						  rainfall: 500
						});
					    var newdate = new Date(data.datereceived);
			               var hrs=time-newdate.getTime();
			               var mins=hrs/1000;
			               var min=mins/60;
			               if(min>60){
			            	   iconFeaturesred.push(iconFeature);
			              }
			              else{
			                  if(data.speed==0){
			                	  iconFeaturesyellow.push(iconFeature);
			                  }
			                  else{
			                	  iconFeaturesgreen.push(iconFeature);
			                  }
			              }
						
		       		}
		    	   createVectorGreen();createVectorRed();createVectorYellow();
			}
			catch(e){alert(e);}
       }
       
       function createLiveMarkers(MarkerList){
//     	   alert("map = "+map);
    	   data=MarkerList[0];
    	   var desc =
     		     '<table class="popupback"> <tr>'+
  	             '<td><div><table class="popup">' +
  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
  	              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
  	              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
  				  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
  				  '<tr class="tiplabel"><td >Location:</td><td> '+ data.location +' </td></tr>' +
//   				  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
  	              '</table></div></td><td></td>'+
  	              '</tr></table></div>';
  		    var lat= Number(data.latitude);
  		    var longi=Number(data.longitude);
  		   
  		  	iconFeatureslive = new ol.Feature({
  			  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
  			  'EPSG:3857')),
  			  name: desc,
  			  population: 4000,
  			  rainfall: 500
  			});
  		  	removableLiveFeatue = iconFeatureslive;
//   		  iconFeatureslive.push(iconFeature);
  		  createVectorLive(longi,lat);
       }
       
       function createRedMarker(MarkerList){
//     	   alert("map = "+map);
    	   data=MarkerList[0];
    	   var desc =
     		     '<table class="popupback"> <tr>'+
  	             '<td><div><table class="popup">' +
  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
  	              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
  	              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
  				  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
  				  '<tr class="tiplabel"><td >Location:</td><td> '+ data.location +' </td></tr>' +
//   				  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
  	              '</table></div></td><td></td>'+
  	              '</tr></table></div>';
  		    var lat= Number(data.latitude);
  		    var longi=Number(data.longitude);
  		   
  		  	var iconFeatureslivered = new ol.Feature({
  			  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
  			  'EPSG:3857')),
  			  name: desc,
  			  population: 4000,
  			  rainfall: 500
  			});
  		  iconFeaturesred.push(iconFeatureslivered);
  		  createVectorRed();
       }
       
       var featurestrail = new ol.Feature({
       });
       var marktrail = [];
       var ind = 0;
       function createTrail(MarkerList){
//     	   marktrail = trail;
// 				 alert("in trail" + ind);
				 var data = MarkerList[0];
				 var lat= Number(data.latitude);
		  		 var longi=Number(data.longitude);
		  		 var desc =
	     		     '<table class="popupback"> <tr>'+
	  	             '<td><div><table class="popup">' +
	  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
	  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	  	              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
	  	              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
	  				  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
	  				  '<tr class="tiplabel"><td >Location:</td><td> '+ data.location +' </td></tr>' +
//	   				  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
	  	              '</table></div></td><td></td>'+
	  	              '</tr></table></div>';
// 		  		 alert(lat+" "+longi);
				 marktrail[ind]= ol.proj.transform([longi, lat], 'EPSG:4326',   'EPSG:3857');
// 				 alert(marktrail.length);
				 ind = ind + 1;
			var geomtrail = new ol.geom.LineString(marktrail, 'XY');
// 			alert(geomtrail.length);
			var extenttrail = geomtrail.getExtent();
			//map.getView().fit(extenttrail, map.getSize()); 
			//map.getView().setZoom(15);
			
			var styleFunctiontrail = function(feature, resolution) {
  			  var geometry = feature.getGeometry();
  			  var styles = [
  			    // linestring
  			    new ol.style.Style({
  			      stroke: new ol.style.Stroke({
  			        color: 'blue',
  			        width: 2
  			      })
  			    })
  			  ];

  			  geometry.forEachSegment(function(start, end) {
  			    var dx = end[0] - start[0];
  			    var dy = end[1] - start[1];
  			    var rotation = Math.atan2(dy, dx);
//   			    alert(rotation);
  			    // arrows
  			    styles.push(new ol.style.Style({
  			      geometry: new ol.geom.Point(end),
  			      image: new ol.style.Icon({
  			        src: "<c:url value="/resources/images/90.png"/>",
  			        anchor: [0.5, 0.5],
  			        rotateWithView: false,
  			        rotation: -rotation,
  			        name: desc
  			      })
  			    }));
  			  });

  			  return styles;
  			};
    	    
		    featurestrail.setGeometry(geomtrail);
	    	linesourcetrail.addFeature(featurestrail);
	    	linevectortrail.setSource(linesourcetrail);
	    	linevectortrail.setStyle(styleFunctiontrail);
// 	    	alert(linevectortrail);
       }
       
       var ln,lt, geom = [];
       var imgs = new ol.style.Icon({
	            src: "<c:url value="/resources/images/pin_small.png"/>",
	            anchor: [0.85, 1],
	            rotateWithView: false,
// 	            rotation: -rotation1
	          });
	     var imgstyle = new ol.style.Style({
	          image: imgs 
	        });
	     var i=0; var mmstop = []
	     var interval;
       function createHistoryMarkers(MarkerList){
//     	   for(i=0;i<MarkerList.length;i++){
			lines.clear();
			$("#stop").show();
			var kk = [];
			mmstop = kk;
			markers = [];
			mmstop = MarkerList;
			 i=0;
			for(m = 0; m < MarkerList.length; m++){
				data = MarkerList[m];
				 var lat= Number(data.latitude);
		  		    var longi=Number(data.longitude);
				 markers[m]= ol.proj.transform([longi, lat], 'EPSG:4326',   'EPSG:3857');
			}
			geom = new ol.geom.LineString(markers, 'XY');
			var extent = geom.getExtent();
			map.getView().fit(extent, map.getSize()); 
			try{
 		   interval = setInterval(function () {
	    	   data=MarkerList[i];
	    	   var desc =
	     		     '<table class="popupback"> <tr>'+
	  	             '<td><div><table class="popup">' +
	  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
	  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	  	              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
	  	              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
	  				  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
// 	  				  '<tr class="tiplabel"><td >Route Name:</td><td> '+data.routename +' </td></tr>' +
// 	  				  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
	  	              '</table></div></td><td></td>'+
	  	              '</tr></table></div>';
	  		    var lat= Number(data.latitude);
	  		    var longi=Number(data.longitude);
	  		  	iconFeatureshistory = new ol.Feature({
	  			  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
	  			  'EPSG:3857')),
	  			  name: desc,
	  			  population: 4000,
	  			  rainfall: 500
	  			});
	  		     var index1=MarkerList.length;
		        window.parseInt(index1);
				 //map.getView().setCenter(ol.proj.transform([longi, lat], 'EPSG:4326', 'EPSG:3857'));
				 //map.getView().setZoom(15);
		        var l = [];
	  		  	if(i == 0){
	  		  		iconFeaturesgreen = l;
	  		  		iconFeaturesgreen.push(iconFeatureshistory);
	  		  		createVectorGreen();
	  		  	} else if(i == index1-1){
	  		  		iconFeaturesred = l;
	  		  		iconFeaturesred.push(iconFeatureshistory);
	  		  		createVectorRed();
	  		  	} else {
			  		 createVectorHistory();
	  		  	}
	  		i++;
	  		ln=longi;
	  		lt=lat;
		        if (i == index1) {
		        	try{
// 		   		        alert(markers.length);
		        		var styleFunction = function(feature, resolution) {
		        			  var geometry = feature.getGeometry();
		        			  var styles = [
		        			    // linestring
		        			    new ol.style.Style({
		        			      stroke: new ol.style.Stroke({
		        			        color: 'blue',
		        			        width: 1
		        			      })
		        			    })
		        			  ];

		        			  geometry.forEachSegment(function(start, end) {
		        			    var dx = end[0] - start[0];
		        			    var dy = end[1] - start[1];
		        			    var rotation = Math.atan2(dy, dx);
// 		        			    alert(rotation);
		        			    // arrows
		        			    styles.push(new ol.style.Style({
		        			      geometry: new ol.geom.Point(end),
		        			      image: new ol.style.Icon({
		        			        src: "<c:url value="/resources/images/90.png"/>",
		        			        anchor: [0.75, 0.5],
		        			        rotateWithView: false,
		        			        rotation: -rotation,
		        			        name: desc
		        			      })
		        			    }));
		        			  });

		        			  return styles;
		        			};
		        			
		        			features1.setGeometry(geom);
							lines.addFeature(features1);
							layerLines.setSource(lines);
							layerLines.setStyle(styleFunction);
// 							vector1.setStyle(imgstyle);
							clearInterval(interval);
									} catch (e) {
										alert(e);
									}
								}

							}, 80);
				} catch (e) {
					alert(e);
				}
			}
			
			function stopMarker(){
				clearInterval(interval);
				$("#stop").hide();
				try{
	 		   for(k=i;k<mmstop.length;k++) {
		    	   data=mmstop[k];
		    	   var desc =
		     		     '<table class="popupback"> <tr>'+
		  	             '<td><div><table class="popup">' +
		  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
		  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
		  	              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
		  	              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
		  				  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
//	 	  				  '<tr class="tiplabel"><td >Route Name:</td><td> '+data.routename +' </td></tr>' +
//	 	  				  '<tr class="tiplabel"><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
		  	              '</table></div></td><td></td>'+
		  	              '</tr></table></div>';
		  		    var lat= Number(data.latitude);
		  		    var longi=Number(data.longitude);
		  		  	iconFeatureshistory = new ol.Feature({
		  			  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
		  			  'EPSG:3857')),
		  			  name: desc,
		  			  population: 4000,
		  			  rainfall: 500
		  			});
		  		     var index1=mmstop.length;
			        window.parseInt(index1);
			        var l = [];
		  		  	if(k == 0){
		  		  		iconFeaturesgreen = l;
		  		  		iconFeaturesgreen.push(iconFeatureshistory);
		  		  		createVectorGreen();
		  		  	} else if(k == index1-1){
		  		  		iconFeaturesred = l;
		  		  		iconFeaturesred.push(iconFeatureshistory);
		  		  		createVectorRed();
		  		  	} else {
				  		 createVectorHistory();
		  		  	}
		  		ln=longi;
		  		lt=lat;
			        if (k == index1-1) {
			        	try{
			        		var styleFunction = function(feature, resolution) {
			        			  var geometry = feature.getGeometry();
			        			  var styles = [
			        			    // linestring
			        			    new ol.style.Style({
			        			      stroke: new ol.style.Stroke({
			        			        color: 'blue',
			        			        width: 1
			        			      })
			        			    })
			        			  ];

			        			  geometry.forEachSegment(function(start, end) {
			        			    var dx = end[0] - start[0];
			        			    var dy = end[1] - start[1];
			        			    var rotation = Math.atan2(dy, dx);
//	 		        			    alert(rotation);
			        			    // arrows
			        			    styles.push(new ol.style.Style({
			        			      geometry: new ol.geom.Point(end),
			        			      image: new ol.style.Icon({
			        			        src: "<c:url value="/resources/images/90.png"/>",
			        			        anchor: [0.75, 0.5],
			        			        rotateWithView: false,
			        			        rotation: -rotation,
			        			        name: desc
			        			      })
			        			    }));
			        			  });

			        			  return styles;
			        			};
			        			features1.setGeometry(geom);
								lines.addFeature(features1);
								layerLines.setSource(lines);
								layerLines.setStyle(styleFunction);
//	 							vector1.setStyle(imgstyle);
										} catch (e) {
											alert(e);
										}
									}

								}
					} catch (e) {
						alert(e);
					}
			}

			//		-------------------------Creating Markers--------------------------

			//  		-------------------------Creating Animated Markers------------------

			var duration = 1000;
			function flash(feature) {
				var start = new Date().getTime();
				var listenerKey;

				function animate(event) {
					var vectorContext = event.vectorContext;
					var frameState = event.frameState;
					var flashGeom = feature.getGeometry().clone();
					var elapsed = frameState.time - start;
					var elapsedRatio = elapsed / duration;
					// radius will be 5 at start and 30 at end.
					var radius = ol.easing.easeOut(elapsedRatio) * 12 + 5;
					var opacity = ol.easing.easeOut(1 - elapsedRatio);

					var flashStyle = new ol.style.Circle({
						radius : radius,
						snapToPixel : false,
						stroke : new ol.style.Stroke({
							color : 'rgba(255, 0, 0, ' + opacity + ')',
							width : 0.30,
							opacity : opacity
						})
					});

					vectorContext.setImageStyle(flashStyle);
					vectorContext.drawPointGeometry(flashGeom, null);
					if (elapsed > duration) {
						ol.Observable.unByKey(listenerKey);
						return;
					}
					// tell OL3 to continue postcompose animation
					frameState.animate = true;
				}
				listenerKey = map.on('postcompose', animate);
			}

			var iconStyleHistory1 = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.7, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 0.75,
					src : "<c:url value="/resources/images/green-dot.png"/>"
				}))
			});

			// 			source = new ol.source.Vector({
			//   			  wrapX: false
			//   			});
			//   			 vector1 = new ol.layer.Vector({
			//   			  source: source
			// //   			  style: iconStyleHistory1
			//   			});

			//  		-------------------------Creating Animated Markers------------------

			// 		-------------------------Craeting Live Markers--------------------

			var vectorLayergreen = [], vectorLayerred = [], vectorLayeryellow = [], vectorLayerlive = [], vectorLayerhistory = [];
			function createVectorHistory() {
				// 			vectorSourceHistory.addFeature(iconFeatureshistory);
				// 			vectorLayerhistory.setSource(vectorSourceHistory);
				source1.addFeature(iconFeatureshistory);
				
			}

			var vectorSourceHistory = new ol.source.Vector({
			//			  features: iconFeaturesgreen //add an array of features
			});

			var iconStyleHistory = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.7, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 2,
					src : "<c:url value="/resources/images/green-dot.png"/>"
				}))
			});

			vectorLayerhistory = new ol.layer.Vector({
				//			  source: vectorSource,
				style : iconStyleHistory
			});
			// 		 vector1.setStyle(iconStyleHistory);

			// 		-------------------------Craeting Live Markers--------------------

			// 		-------------------------Craeting History Markers--------------------
			var ll=1,li=1;
			function createVectorLive(longi,lat) {
// 				alert(iconFeatureslive);
				vectorSourceLive.addFeature(iconFeatureslive);
				if(ll!=1){
// 				alert("in if"+ll+" "+li+" "+longi+" "+lat);
				try{
					linesource.addFeature(
					    new ol.Feature({
					        geometry: new ol.geom.LineString([
					            [Number(ll), Number(li)],
					            [longi, lat]
					        ])
					    })
					);
					
				}catch(e){alert(e);}
				} if(ll==1){
					var extent = vectorSourceLive.getExtent();
					map.getView().setCenter(extent); 
					map.getView().setZoom(17);
				}
				ll=longi;
				li=lat;
			}

			var vectorSourceLive = new ol.source.Vector({
			//			  features: iconFeaturesgreen //add an array of features
			});

			var iconStyleLive = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.5, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 2,
					src : "<c:url value="/resources/images/green-dot.png"/>"
				}))
			});

			vectorLayerlive = new ol.layer.Vector({
				source : vectorSourceLive,
				style : iconStyleLive
			});

			// 		-------------------------Craeting History Markers--------------------

			// 		-------------------------Craeting Greeen Markers--------------------

			function createVectorGreen() {
				vectorSourceGreen.addFeatures(iconFeaturesgreen);
				vectorLayergreen.setSource(vectorSourceGreen);
			}

			var vectorSourceGreen = new ol.source.Vector({
			// 			  features: iconFeaturesgreen //add an array of features
			});

			var iconStyleGreen = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.5, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 2,
					src : "<c:url value="/resources/images/green-dot.png"/>"
				}))
			});

			vectorLayergreen = new ol.layer.Vector({
				// 			  source: vectorSource,
				style : iconStyleGreen
			});

			//		-------------------------Craeting Greeen Markers--------------------

			// 		-------------------------Craeting Red Markers--------------------

			function createVectorRed() {
				vectorSourceRed.addFeatures(iconFeaturesred);
				vectorLayerred.setSource(vectorSourceRed);
			}
			var vectorSourceRed = new ol.source.Vector({
			//     			  features: iconFeaturesred //add an array of features
			});

			var iconStyleRed = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.5, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 2,
					src : "<c:url value="/resources/images/red-dot.png"/>"
				}))
			});

			vectorLayerred = new ol.layer.Vector({
				//     			  source: vectorSource,
				style : iconStyleRed
			});

			//		-------------------------Craeting Red Markers--------------------

			// 		-------------------------Craeting Yellow Markers--------------------

			function createVectorYellow() {
				vectorSourceYellow.addFeatures(iconFeaturesyellow);
				vectorLayeryellow.setSource(vectorSourceYellow);
			}
			var vectorSourceYellow = new ol.source.Vector({
			//     			  features: iconFeaturesyellow //add an array of features
			});

			var iconStyleYellow = new ol.style.Style({
				image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
				({
					anchor : [ 0.5, 0.5 ],
					anchorXUnits : 'fraction',
					anchorYUnits : 'pixels',
					opacity : 2,
					src : "<c:url value="/resources/images/yellow-dot.png"/>"
				}))
			});

			vectorLayeryellow = new ol.layer.Vector({
				//     			  source: vectorSource,
				style : iconStyleYellow
			});
			var vector1 = [], source1 = [];
			
			var linesource = new ol.source.Vector({
			
			});
			
			var linevector = new ol.layer.Vector({
				source : linesource,
				style: new ol.style.Style({
			          stroke: new ol.style.Stroke({
			            width: 3,
			            color: 'blue'
			          }),
			          fill: new ol.style.Fill({
			            color: [0, 0, 255, 0.6]
			          })
			        })
			});
			//		-------------------------Craeting Yellow Markers--------------------

			
// 			---------------------------------Live Trail Markers -------------------------
		        			
       			var linesourcetrail = new ol.source.Vector({
       			});
       			
       			var linevectortrail = new ol.layer.Vector({
//        				source : linesourcetrail,
//        				style : styleFunctiontrail
       			});
//		       	---------------------------------Live Trail Markers -------------------------
			// 		-------------------------Creating Map and Layer---------------------
			function createLayers() {

				source = new ol.source.Vector({
					wrapX : false
				});
				source1 = new ol.source.Vector({
					wrapX : false
				});
				vector1 = new ol.layer.Vector({
					source : source1,
				 	style: imgstyle
				});
				vector = new ol.layer.Vector({
					source : source,
					style : new ol.style.Style({
						fill : new ol.style.Fill({
							color : [ 201,188,179, 0.7 ]
						}),
						stroke : new ol.style.Stroke({
							color : [ 0, 0, 255, 1 ],
							width : 5
						}),
						image : new ol.style.Circle({
							radius : 5,
							anchor : [ 0.5, 46 ],
							anchorXUnits : 'fraction',
							anchorYUnits : 'pixels',
							opacity : 0.55,
							stroke : new ol.style.Stroke({
								color : [ 0, 0, 255, 1 ],
								width : 2
							}),
							fill : new ol.style.Fill({
								color : [ 201,188,179, 0.5 ]
							})
						})
					})
				});

				layers[0] = new ol.layer.Tile({
					source : new ol.source.OSM()
				});
				
				
				var projExtent = ol.proj.get('EPSG:3857').getExtent();
				var startResolution = ol.extent.getWidth(projExtent) / 256;
				var resolutions = new Array(22);
				for (var i = 0, ii = resolutions.length; i < ii; ++i) {
				  resolutions[i] = startResolution / Math.pow(2, i);
				}
				var tileGrid = new ol.tilegrid.TileGrid({
				  extent: [ -20037508, -20037508, 20037508, 20037508 ],
				  resolutions: resolutions,
				  tileSize: [2000, 1000]
				});
				
				
				
				
				layers[1] = new ol.layer.Tile({
					extent : [ -20037508, -20037508, 20037508, 20037508 ],
					source : new ol.source.TileWMS({
						url : ''+key+'',
						type : 'base',
						params : {
							'LAYERS' : 'IndiaLayer',
							'TILED' : true,
							'CRS' : 'EPSG:4326'
						},
						serverType : 'geoserver',
						 tileGrid: tileGrid
					})
				});
				

				layerLines = new ol.layer.Vector({});
				

				map = new ol.Map({
					//     			  interactions: ol.interaction.defaults().extend([new app.Drag()]),
					target : 'map',
					layers : [layers[1],layers[0], linevector, layerLines, linevectortrail,
							vectorLayerlive, vectorLayerFeature,
							vectorLayergreen, vectorLayerred,
							vectorLayeryellow, vector1, vector, vectorLayerstop ],
				 	controls: ol.control.defaults({ attribution: false }),
					view : new ol.View({
						center : ol.proj.transform([ 78.2090, 21.6139 ],
								'EPSG:4326', 'EPSG:3857'),
						zoom : 11,
						minZoom: 5
					})
				});
// 				source1.on('addfeature', function(e) {
// 					flash(e.feature);
// 				});
				var zoomslider = new ol.control.ZoomSlider();
				map.addControl(zoomslider);
		
			}
			
			
			
			function getExtentMap(MarkerList){
				var marker1 = [];
		    	   for(m = 0; m < MarkerList.length; m++){
						var data = MarkerList[m];
						 var lat= Number(data.latitude);
				  		    var longi=Number(data.longitude);
						 marker1[m]= ol.proj.transform([longi, lat], 'EPSG:4326',   'EPSG:3857');
					}
					var geom1 = new ol.geom.LineString(marker1, 'XY');
					var extent1 = geom1.getExtent();
					map.getView().fit(extent1, map.getSize()); 
// 					var extent = vectorSourceLive.getExtent();
// 					map.getView().setCenter(extent1); 
// 					map.getView().setZoom(15);
					
			}

			//		 		-------------------------Creating Map and Layer---------------------

			// 				-------------------------Removing Features Of vector layer----------

			function removeFeatures() {
				vectorSourceGreen.clear();
				vectorSourceRed.clear();
				vectorSourceYellow.clear();
				vectorSourceLive.clear();
				source1.clear();
				lines.clear();
				linesource.clear();
				linesourcetrail.clear();
				lines.clear();
			}
			
			function clearFeature(){
				vectorSource.clear();
			}
			
			 
			        $("#clearfeature").click(function() {     
// 			        	vectorSource.clear();
			        	source.clear();
			        });
			        
			        $("#panmap").click(function() {     
			        	map.removeInteraction(draw);
			        });
			        
			        $("#stop").click(function() {     
			        	stopMarker();
			        });
			        
			        
			    

			// 				-------------------------Removing Features Of vector layer----------

			// 				-------------------------Create Popup Method------------------------

			
           
			closer.onclick = function() {
				popup.setPosition(undefined);
				closer.blur();
				return false;
			};
			// 			  var featureinfo = document.getElementById('featureinfo');
			function featureinfo() {
				try {
					var GEOJSON_PARSER = new ol.format.GeoJSON();
					var linejson = GEOJSON_PARSER.writeFeatures(lines.getFeatures());
								          alert(linejson);
					return (linejson);
				} catch (e) {
					alert(e);
				}
			}

			function saveFeature(geojsonObject) {
				try {
// 					var routen = []; 
					for(i=0;i<geojsonObject.length;i++){
						var feature = (new ol.format.GeoJSON())
						.readFeatures(geojsonObject[i].route);
// 						if(feature.length == 1 ){
// 							routen.push(geojsonObject[i].routename);
// 						for(j = 0; j<feature.length;j++){
							var feature1 = new ol.Feature({
							  geometry: feature[0].get('geometry'),
							  name:  '<table class="popupback"> <tr>' +
					             '<td><div><table class="popup">' +
					             '<tr><td align=center class="tiphead" colspan="2">Route Details</td></tr>'+
					              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
					              '<tr class="tiplabel"><td >Rote Name:</td><td>' + geojsonObject[i].routename + '</td></tr>' +
					              '</table></div></td><td></td>'+
					              '</tr></table></div>'
							});
						feature1.setId(geojsonObject[i].routename);
						vectorSource.addFeature(feature1);
// 						}
// 					}
// 						alert((new ol.format.GeoJSON()).readProjection(geojsonObject[i]).getCode());
// 						
					
// 					vectorLayerFeature.setStyle(styleFunction);
					}
// 					var extent1 = vectorSource.getExtent();
// 					map.getView().fit(extent1, map.getSize()); 
// 					return routen;
					
				} catch (e) {
					alert(e);
				}
			}
			
			
			
			
			try{
				
				function GetTextBoxValueTwo() {
// 					  $("#sheltertext").each(function () {
// 					    alert($(this).val());
// 					  });
					}
				
				
				//var  sheltcode = [];
				function addFeatureRoute(sts,route){
// 					alert(document.getElementById(String(route.shelterid)).value);
// 					  var geom = new ol.geom.LineString(new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
// 		  			  'EPSG:3857')), 'XY');
                     if(sts){
						  var feature1 = new ol.Feature({
							geometry: new ol.geom.Point(ol.proj.transform([Number(route.longitude), Number(route.latitude)], 'EPSG:4326',     
				  			  'EPSG:3857')),
							  name:  '<table class="popupback"> <tr>' +
					             '<td><div><table class="popup">' +
					             '<tr><td align=center class="tiphead" colspan="2">Shelter Details</td></tr>'+
					              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
					              '<tr class="tiplabel"><td >Sheltername Name:</td><td>' + route.sheltename + '</td></tr>' +
					              '<tr class="tiplabel"><td >Status</td><td>Not Assigned</td></tr>' +
					              '</table></div></td><td></td>'+
					              '</tr></table></div>'
							});
						feature1.setId(route.sheltename);
						sourcestop.addFeature(feature1);
				    }
                     else{
                    	 var id = sourcestop.getFeatureById(route.sheltename);
                    	 sourcestop.removeFeature(id);
                     }
					//sheltcode.push(route.shelterid);
					
// 					alert(sheltcode);
// 					var extent1 = geom.getExtent();
// 					map.getView().setCenter(extent1); 
// 					map.getView().setZoom(12);
				}
				
				function addAssignShelter(route){
// 					alert(document.getElementById(String(route.shelterid)).value);
// 					  var geom = new ol.geom.LineString(new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
// 		  			  'EPSG:3857')), 'XY');
                    for(i = 0;i<route.length;i++){
                      data = route[i];
					  var feature1 = new ol.Feature({
						geometry: new ol.geom.Point(ol.proj.transform([Number(data.longitude), Number(data.latitude)], 'EPSG:4326',     
			  			  'EPSG:3857')),
						  name:  '<table class="popupback"> <tr>' +
				             '<td><div><table class="popup">' +
				             '<tr><td align=center class="tiphead" colspan="2">Shelter Details</td></tr>'+
				              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
				              '<tr class="tiplabel"><td >Assign Route Name:</td><td>' + data.routename + '</td></tr>' +
				              '<tr class="tiplabel"><td >Sheltername Name:</td><td>' + data.sheltename + '</td></tr>' +
				              '<tr class="tiplabel"><td >Status</td><td>Assigned</td></tr>' +
				              '</table></div></td><td></td>'+
				              '</tr></table></div>'
						});
					  vectorSource.addFeature(feature1);
                    }
					//sheltcode.push(route.shelterid);
					
// 					alert(sheltcode);
// 					var extent1 = geom.getExtent();
// 					map.getView().setCenter(extent1); 
// 					map.getView().setZoom(12);
				}
				
				function assignShelter(list){
					GetTextBoxValueTwo();
					var routeid;
					var name = document.getElementById("routenamenewlist").value;
					for(i = 0; i<list.length ;i++){
						if(list[i].routename == name){
							routeid = list[i].routeid;
						}
					}
					return(routeid);
				}
				
			
			}catch(e){
				alert(e);
			}

			try{
			// 			   function showFeature(){
			// 				  var geojsonObject  = '{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"LineString","coordinates":[[8565170.77916907,3336723.245138],[8581146.118080672,3335423.8156571523],[8586802.458173774,3328315.172026631],[8592458.798266876,3332824.9566954565],[8591923.73906888,3338481.2967885593],[8596127.775624566,3340927.2816936853],[8598115.13835998,3346889.369899929],[8604382.974679364,3347042.2439564993],[8606905.396612776,3350329.0361727616],[8615848.52892214,3347577.3031544955],[8620205.439534396,3352392.8359364616],[8625632.468542643,3351169.843483899],[8627543.394249773,3354074.4505587355]]},"properties":null}]}';
			var vectorSource = new ol.source.Vector({
			// 					   features: (new ol.format.GeoJSON()).readFeatures(geojsonObject)
			});
			
			var sourcestop = new ol.source.Vector({
			});
			
			var vectorLayerstop = new ol.layer.Vector({
				source : sourcestop,
				style : new ol.style.Style({
					fill : new ol.style.Fill({
						color : [ 201,188,179, 0.7 ]
					}),
					stroke : new ol.style.Stroke({
						color : [ 0, 0, 255, 1 ],
						width : 5
					}),
					image : new ol.style.Circle({
						radius : 10,
						anchor : [ 0.5, 46 ],
						anchorXUnits : 'fraction',
						anchorYUnits : 'pixels',
						opacity : 0.55,
						stroke : new ol.style.Stroke({
							color : "green",
							width : 2
						}),
						fill : new ol.style.Fill({
							color : "gray"
						})
					})
				})
// 				style: createLineStyleFunction()
			});

			var vectorLayerFeature = new ol.layer.Vector({
				source : vectorSource,
				style : new ol.style.Style({
					fill : new ol.style.Fill({
						color : [ 201,188,179, 0.7 ]
					}),
					stroke : new ol.style.Stroke({
						color : [ 0, 0, 255, 1 ],
						width : 5
					}),
					image : new ol.style.Circle({
						radius : 10,
						anchor : [ 0.5, 46 ],
						anchorXUnits : 'fraction',
						anchorYUnits : 'pixels',
						opacity : 0.55,
						stroke : new ol.style.Stroke({
							color : 'red',
							width : 2
						}),
						fill : new ol.style.Fill({
							color : 'gray'
						})
					})
				})
// 				style: createLineStyleFunction()
			});
			} catch(e){alert(e);}
			// 			   }

			// 				-------------------------Create Popup Method------------------------

			// 				-------------------------Draw Feature on Map------------------------

			var typeSelect = document.getElementById('type');

			var draw; // global so we can remove it later
			function addInteraction() {
				var value = typeSelect.value;
				if (value !== 'None') {
					var geometryFunction, maxPoints;
					if (value === 'Square') {
						value = 'Circle';
						geometryFunction = ol.interaction.Draw
								.createRegularPolygon(4);
					} else if (value === 'Box') {
						value = 'LineString';
						maxPoints = 2;
						geometryFunction = function(coordinates, geometry) {
							if (!geometry) {
								geometry = new ol.geom.Polygon(null);
							}
							var start = coordinates[0];
							var end = coordinates[1];
							geometry.setCoordinates([ [ start,
									[ start[0], end[1] ], end,
									[ end[0], start[1] ], start ] ]);
							return geometry;
						};
					}
					draw = new ol.interaction.Draw({
						source : source,
						type : /** @type {ol.geom.GeometryType} */
						(value),
						geometryFunction : geometryFunction,
						maxPoints : maxPoints
					});
					map.addInteraction(draw);
				}
			}

			/**
			 * Let user change the geometry type.
			 * @param {Event} e Change event.
			 */
			typeSelect.onchange = function(e) {
				map.removeInteraction(draw);
				addInteraction();
			};
			
			function drawLine(){
				value = 'LineString';
// 				maxPoints = 2;
// 				geometryFunction = function(coordinates, geometry) {
// 					if (!geometry) {
// 						geometry = new ol.geom.Polygon(null);
// 					}
// 					var start = coordinates[0];
// 					var end = coordinates[1];
// 					geometry.setCoordinates([ [ start,
// 							[ start[0], end[1] ], end,
// 							[ end[0], start[1] ], start ] ]);
// 					return geometry;
// 				};
				draw = new ol.interaction.Draw({
					source : source,
					type : /** @type {ol.geom.GeometryType} */
					(value)
// 					geometryFunction : geometryFunction,
// 					maxPoints : maxPoints
				});
				map.addInteraction(draw);
			}
			
			var interval1 =  setInterval(function () {
				if(source.getFeatures()==""){
					$("#saveline").hide();
// 					$("#panmap").hide();
					$("#clearfeature").hide();
				} else{
					$("#saveline").show();
// 					$("#panmap").show();
					$("#clearfeature").show();
				}
			} , 10);
			
			
			var popup;
			function createPopup() {
				var element = document.getElementById('popup');

				
			popup = new ol.Overlay({
					element : element,
					autoPan : true,
					autoPanAnimation : {
						duration : 250
					},
					positioning : 'bottom-center',
					stopEvent : false
				});
				map.addOverlay(popup);

				// display popup on click
				map.on('click', function(evt) {
					var feature = map.forEachFeatureAtPixel(evt.pixel,
							function(feature, layer) {
								return feature;

							});
					if (feature.get('name')) {
						if (feature) {
							var geometry = feature.getGeometry();
							var coord = geometry.getCoordinates();
// 							alert(coord[0]);
							content.innerHTML = feature.get('name');
							if(coord.length > 2){
								popup.setPosition(coord[0]);
							} else{
							 popup.setPosition(coord);
							}
						} else {
							//     				        $(element).popover('destroy');
						}
					}
				});

				// change mouse cursor when over marker
				//     				map.on('pointermove', function (e) {
				//     				    if (e.dragging) {
				//     				        $(element).popover('destroy');
				//     				        return;
				//     				    }
				//     				    var pixel = map.getEventPixel(e.originalEvent);
				//     				    var hit = map.hasFeatureAtPixel(pixel);
				//     				    map.getTarget().style.cursor = hit ? 'pointer' : '';
				//     				});

			}

			// 				-------------------------Draw Feature on Map------------------------

			// 			-----------------------------AngularJS Controller-----------------------
			var customerApp = angular.module('single-page-app',
					[ 'timepickerPop','angularUtils.directives.dirPagination' ]);

			
			customerApp.directive('validNumber', function() {
			      return {
			        require: '?ngModel',
			        link: function(scope, element, attrs, ngModelCtrl) {
			          if(!ngModelCtrl) {
			            return; 
			          }

			          ngModelCtrl.$parsers.push(function(val) {
			            if (angular.isUndefined(val)) {
			                var val = '';
			            }
			            
			            var clean = val.replace(/[^-0-9\.]/g, '');
			            var negativeCheck = clean.split('-');
						var decimalCheck = clean.split('.');
			            if(!angular.isUndefined(negativeCheck[1])) {
			                negativeCheck[1] = negativeCheck[1].slice(0, negativeCheck[1].length);
			                clean =negativeCheck[0] + '-' + negativeCheck[1];
			                if(negativeCheck[0].length > 0) {
			                	clean =negativeCheck[0];
			                }
			                
			            }
			              
			            if(!angular.isUndefined(decimalCheck[1])) {
			                decimalCheck[1] = decimalCheck[1].slice(0,2);
			                clean =decimalCheck[0] + '.' + decimalCheck[1];
			            }

			            if (val !== clean) {
			              ngModelCtrl.$setViewValue(clean);
			              ngModelCtrl.$render();
			            }
			            return clean;
			          });

			          element.bind('keypress', function(event) {
			            if(event.keyCode === 32) {
			              event.preventDefault();
			            }
			          });
			        }
			      };
			    });
			
			
			customerApp.controller("CustomerListController",function($scope, $http, $compile, $filter) {
				var intervall1;
				createLayers();
				createPopup();
				$http.get('list').success(
							function(data, status, headers,config) {
								$scope.MarkerArrayList = data;
								createAllMarkers($scope.MarkerArrayList);
								if(data.length!=0){
									getExtentMap(data);
								}
// 								
								$('#overlay').remove();
							}).error(function(data, status, headers,config) {
								$('#overlay').remove();
								console.log('error: data = ',data);
							});

								$scope.allMarkers = function allMarkers() {
									var over = '<div id="overlay">' +
						//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
									 '</div>';
									$(over).appendTo('body');
									$http.get('list').success(
											function(data, status, headers,config) {
												clearInterval(intervall1);
												removeFeatures();
												createAllMarkers(data);
												getExtentMap(data);
												$('#overlay').remove();
											}).error(
											function(data, status, headers,config) {
												console.log('error: data = ',data);
												$('#overlay').remove();
											});
								}
								
								$scope.sort = function(keyname){
									$scope.sortKey = keyname;   //set the sortKey to the param passed
									$scope.reverse = !$scope.reverse; //if true make it false and vice versa
								}

								$scope.livefunction = function livefunction() {
									var over = '<div id="overlay">' +
						//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
									 '</div>';
									$(over).appendTo('body');
									$http.get('vehicle?vehicleno='+ document.getElementById("liveinput").value)
											.success(function(data, status,headers, config) {
// 														alert(data);
														clearInterval(intervall1);
														removeFeatures();
														createLiveMarkers(data);
														map.getView().setZoom(15);
														$('#overlay').remove();
// 														getExtentMap(data);
														intervall1 = setInterval(function () {
															$http.get('vehicle?vehicleno='+ document.getElementById("liveinput").value)
															.success(function(data, status,headers, config) {
																	removeFeatures();
																	createLiveMarkers(data);
// 																	getExtentMap(data);
																	})
															.error(function(data, status, headers, config) {
																		console.log('error: data = ',data);
																		//alert("No data Found");
																	});
																			}, 20000);
													})
											.error(function(data, status, headers, config) {
														console.log('error: data = ',data);
														$('#overlay').remove();
														//alert("No data Found");
													});
								}
								
								try{
// 								var listtrail = [];
								$scope.livefunctionTrail = function livefunctionTrail() {
									var over = '<div id="overlay">' +
						//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
									 '</div>';
									$(over).appendTo('body');
									$http.get('vehicle?vehicleno='+ document.getElementById("liveinput").value)
											.success(function(data, status,headers, config) {
// 														alert(data[0].latitude+" "+data[0].longitude);
														clearInterval(intervall1);
														removeFeatures();
// 														listtrail.add(data[0]);
// 														alert(data.length);
														createRedMarker(data);
														createTrail(data);
														getExtentMap(data);
														map.getView().setZoom(15);
														$('#overlay').remove();
														intervall1 = setInterval(function () {
															$http.get('vehicle?vehicleno='+ document.getElementById("liveinput").value)
															.success(function(data, status,headers, config) {
// 																		alert(data.length);
// 																		listtrail.add(data[0]);
																		createTrail(data);
																	})
															.error(function(data, status, headers, config) {
																		console.log('error: data = ',data);
																		//alert("No data Found");
																	});
																			}, 30000);
													})
											.error(function(data, status, headers, config) {
														console.log('error: data = ',data);
														//alert("No data Found");
														$('#overlay').remove();
													});
								}
								}catch(e){
									//alert(e);
								}

								$scope.historyfunction = function historyfunction() {
									var over = '<div id="overlay">' +
						//		     '<p class="loader"><img src="https://d13pix9kaak6wt.cloudfront.net/background/users/r/a/n/ranjitkumar_1377928595_95.jpg <br />Please Wait While Prepare you folder...</p>' +
									 '</div>';
									$(over).appendTo('body');
// 									alert("in history");

									clearInterval(intervall1);
									clearInterval(interval);
									removeFeatures();
									mytime1 = $scope.time1.getHours() + ":"
											+ $scope.time1.getMinutes() + ":"
											+ $scope.time1.getSeconds();
									mytime2 = $scope.time2.getHours() + ":"
											+ $scope.time2.getMinutes() + ":"
											+ $scope.time2.getSeconds();
									$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/gethistoryvehicles?vehicleno='+ document.getElementById("historyinput").value
															+ '&date='
															+ document.getElementById('data').value
															+ '&time1='
															+ mytime1
															+ '&time2='
															+ mytime2)
											.success(function(data, status, headers, config) {
														// 	    		    	alert(data);
														try {if (data == "") {
																//alert("No Data Found");
															} else {
																// 	    				    	alert(data);
																removeFeatures();
																createHistoryMarkers(data);
															}
														} catch (e) {
															//	    	 	    		alert(e);
														}
														$('#overlay').remove();
													})
											.error(function(data, status, headers, config) {
														console.log('error: data = ',data);
														$('#overlay').remove();
														//alert("No data Found");
													});
								}

								$scope.featurefunction = function featurefunction() {
									clearInterval(intervall1);
									var feature = featureinfo();
									var route = document.getElementById("srname").value;
									if (route == "") {
										alert("Route Name is Empty Try Again");
									} else if (route != "") {
										$http.get('saveline?line='+ feature
																+ '&route='
																+ route)
												.success(function(data, status, headers, config) {
															if (data = "success") {
																alert("Saved Successfully");
															} else {
																alert("Not Saved Please try Again");
															}

														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
															//		              alert("error "+data);
														});
									} else {
										alert("Route Name is Empty Try Again");
									}
								}
								
								
								$scope.deleteLine = function deleteLine() {
									var feature = featureinfo();
									var route = document.getElementById("drname").value;
									if (route == "") {
										alert("Route Name is Empty Try Again");
									} else if (route != "") {
										$http.get('deleteline?route=' + route)
												.success(function(data, status, headers, config) {
															if (data = "success") {
																clearFeature();
																alert("Deleted Successfully");
																$http.get('showline')
																.success(function(data, status, headers, config) {
																					try {
																						if(data == ""){
																							
																						} else{
																							var geoson = data;
																							var routename = [];
																							$http.get('routename')
																							.success(function(data, status, headers, config) {
																												try {
																													routename = data;
																													saveFeature(geoson, routename);
																												} catch (e) {
																												}
																											})
																									.error(function(data, status, headers, config) {
																												console.log('error: data = ',data);
																											});
																						}
																					} catch (e) {
																					}
																				})
																		.error(function(data, status, headers, config) {
																					console.log('error: data = ',data);
																				});
															} else {
																alert("Not Deleted Please try Again");
															}

														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
															//		              alert("error "+data);
														});
									} else {
										alert("Route Name is Empty Try Again");
									}
								}
								
								

								$scope.getName = function getName(sts,nroute) {
// 									if(sts){
										addFeatureRoute(sts,nroute);
// 									}
								}
								try{
									var k = 0,orderno="",sheltcode="";
								$scope.setShelter = function setShelter(){
									//alert($scope.shelters[0].orderno);
									
									for(i=0;i<$scope.shelters.length;i++){
										if($scope.shelters[i].orderno != null){
											if(k!=0){
												orderno = orderno+","+$scope.shelters[i].orderno;
												sheltcode = sheltcode+","+$scope.shelters[i].shelterid;
											}else{
												orderno  = $scope.shelters[i].orderno;
												sheltcode = $scope.shelters[i].shelterid;
												k++;
											}
											
										}
									}
// 									alert(orderno+" "+sheltcode);
									if(sheltcode==""){
										alert("Please Select Shelters to Assign")
									}else{
									var rid = assignShelter($scope.routename);
									$http.get('assignshelter?shelterids='+sheltcode+'&routeid='+rid+'&orderno='+orderno)
									.success(function(data, status, headers, config) {
														try {
															if(data == ""){
																	alert("Not Saved");
															} else{
																	alert("Saved Successfully");
																
															}
														} catch (e) {
														}
													})
											.error(function(data, status, headers, config) {
														console.log('error: data = ',data);
													});
									}
								}
								}catch(e){alert(e);}
// 									var route = prompt(
// 											"Please Enter Route Name",
// 											"Delhi-gaziabad");
// 									if (!route) {
// 										alert("Route Name is Empty Try Again");
// 									} else if (route != "") {
										$http.get('showline')
										.success(function(data, status, headers, config) {
															try {
																if(data == ""){
// 																	alert(data);
																} else{
// 																	alert("route "+data);
																	$scope.routename = data;
// 																	alert(data.length);
																	saveFeature(data);
// 																	$scope.shelters = getRouteNames(geoson);
// 																	alert($scope.shelters);
																}
															} catch (e) {
															}
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										
										$http.get('showshelter')
										.success(function(data, status, headers, config) {
															try {
																if(data == ""){
// 																	alert(data);
																} else{
// 																	alert(""+data);
																	$scope.shelters = data;
// 																	alert(data.length);
// 																	alert($scope.shelters);
																}
															} catch (e) {
															}
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										
										$http.get('showassignshelter')
										.success(function(data, status, headers, config) {
															try {
																if(data == ""){
// 																	alert(data);
																} else{
// 																	alert(data);
																	addAssignShelter(data);
// 																	alert(data.length);
// 																	alert($scope.shelters);
																}
															} catch (e) {
															}
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
														});
										
// 									} else {
// 										alert("Route Name is Empty Try Again");
// 									}

// 								}

								$scope.time1 = new Date();
								$scope.time2 = new Date();
								$scope.time1.setHours(00);
								$scope.time1.setMinutes(05);
								$scope.time2.setHours(23);
								$scope.time2.setMinutes(50);
								$scope.showMeridian = true;
								//	 			document.getElementById("data").value=new Date("2015-03-25");
								$scope.disabled = false;
							});

			//			-----------------------------AngularJS Controller-----------------------
		</script>
</body>
</html>
