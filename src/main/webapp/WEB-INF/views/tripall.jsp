<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
   <link rel="stylesheet" href="resources/Mapscript/css/ol.css" type="text/css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="resources/Mapscript/css/datepicker3.css">
   <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<!--     <link rel="stylesheet" type="text/css" href="resources/Mapscript/css/overlaystyle.css"> -->
   
   <script src="resources/Mapscript/js/jquery-2.2.3.min.js"></script>
   <script src="resources/Mapscript/js/bootstrap.min.js"></script>
   <script src="resources/Mapscript/js/ol.js"></script>
   <script src="resources/Mapscript/js/angular.min.js"></script>
   <script type="text/javascript" src="resources/Mapscript/js/bootstrap-datepicker.js"></script>
   <script src="resources/Mapscript/js/ui-bootstrap-tpls.js"></script>
   <script src="resources/Mapscript/javascripts/timpicker.js" type="text/javascript"></script>
<!--    <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script> -->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
   <style id="jsbin-css">
.clearable{
  background: #fff url(data:image/gif;base64,R0lGODlhBwAHAIAAAP///5KSkiH5BAAAAAAALAAAAAAHAAcAAAIMTICmsGrIXnLxuDMLADs=) no-repeat right -10px center;
  border: 1px solid #999;
  padding: 3px 18px 3px 4px; /* Use the same right padding (18) in jQ! */
  border-radius: 3px;
  transition: background 0.4s;
}
.clearable.x  { background-position: right 5px center; }
.clearable.onX{ cursor: pointer; }
.clearable::-ms-clear {display: none; width:0; height:0;}
</style>
   <style>
   
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
	    background:url('resources/Mapscript/images/loader.gif') no-repeat center center rgba(0,0,0,0.25)
	}
   </style>
   <link rel="stylesheet" href="resources/Mapscript/css/map.css" type="text/css">
  </head>
  <body>
<script>
var route = [];
$(document).ready(function(){
    $("#slide").click(function(){
        $("#togglemap").slideToggle();
    });
    $("#geoslide").click(function(){
        $("#togglegeo").slideToggle();
    });
    var effect = 'slide';

    // Set the options for the effect type chosen
    var options = { direction: 'right' };

    // Set the duration (default: 400 milliseconds)
    var duration = 500;
//	    $("#slider").click(function(){
//	        $("#dislide").toggle(effect, options, duration);
//	    });
    
    
    $("#slider").click(function(){
        var $target = $('#dislide'),
            $toggle = $(this);

        $target.toggle( 500);
    });
    
});
</script>

  <div ng-app="MapApp" ng-controller="mapCtrl">
  
  <div class="dd collapse in" >
	<div>
		<button id="slider" class="btn btn-default btn-xs btn-xs122" style="background-color:#34495e;float:left;color:white;"><span class="glyphicon glyphicon-align-justify" style="color:white;cursor:pointer;"></span></button>

		<div id="dislide" style="height:400px;width:300px;overflow:scroll;" >
		   <br>
				<table>
				<thead><th><font color="white">{{namesub}}</font></th></thead>
	 				<tr ng-repeat="x in dataveh">
			       		<td class="col-md-6"><input id="{{x}}" checked="yes" ng-model="x.status"   ng-click="removevehicle(x.status, x)"   type="checkbox" class="cradio"/>
			       		<label for="{{x}}" ><font color="white">{{x.vehical_no}}</font></label></td>
			       	</tr>
				</table>
		</div>
		
<!-- 		<div id="dislide" style="height:400px;width:300px;overflow:scroll;" > -->
<!-- 		   <br> -->
<!-- 				<table> -->
<!-- 				<thead><th><font color="white">{{namesub}}</font></th></thead> -->
<!-- 	 				<tr ng-repeat="x in dataveh"> -->
<!-- 			       		<td class="col-md-6"><input id="{{x}}" checked="yes"  type="checkbox" class="cradio"/> -->
<!-- 			       		<label><font color="white">{{x.vehical_no}}</font></label></td> -->
<!-- 			       	</tr> -->
<!-- 				</table> -->
<!-- 		</div> -->
		
	</div>
   </div>
   
    <div class="legends collapse in">
				<table>
					<tr><td><center><font style="font-size:9px;color:blue;"><b>All</b></font></center><div class="frame" ng-click="getvehicles('All')">
								    <span class="helper"></span>
								    <img src="resources/Mapscript/images/truck_blue_32.png" height="25px" width="25px"/>
								</div></td></tr>
	 				<tr><td><center><font style="font-size:9px;color:blue;"><b>Running</b></font></center><div class="frame" ng-click="getvehicles('Running')">
								    <span class="helper"></span>
								    <img src="resources/Mapscript/images/truck-green.png" height="25px" width="25px"/>
								</div></td></tr>
	 				<tr><td><center><font style="font-size:9px;color:blue;"><b>Halt</b></font></center><div class="frame" ng-click="getvehicles('Hault')">
								    <span class="helper"></span>
								    <img src="resources/Mapscript/images/truck-yellow.png" height="25px" width="25px"/>
<!-- 								<div class="showme">Hault</div> -->
								</div></td></tr>
	 				<tr><td><center><font style="font-size:9px;color:blue;"><b>Stop</b></font></center><div class="frame" ng-click="getvehicles('Stop')">
								    <span class="helper"></span>
								    <img src="resources/Mapscript/images/truck-red.png" height="25px" width="25px"/>
<!-- 								<div class="showme">Stop</div> -->
								</div></td></tr>
				</table>
   </div>
  
  
  <div class="cd collapse in">
	<div id="togglemap" class="row" >
		<table>
				<tr>
<!-- 				    <td id="allcomptd" hidden> -->
<!-- 						<select id="allcomp" ng-model="allcomp"> -->
<!-- 					        <option value="allcomp" selected>All Companies</option> -->
<!-- 					        <option ng-repeat="k in companylist" value="{{k.loginid}}">{{k.companyname}}</option> -->
<!-- 					    </select> -->
<!-- 					</td> -->
					<td><input type="radio" name="grp" id="all" checked="checked" ng-click="allMarkers()"/><label for="all"><font color="white">All Vehicles</font></label></td>
					<td><input type="radio" name="grp" id="live"/><label for="live"><font color="white">Live Vehicles</font></label></td>
				 	<td><input type="radio" name="grp" id="history"/><label for="history"><font color="white">History</font></label></td>
				 	<td><input type="radio" name="grp" id="trip"/><label for="trip"><font color="white">Trip Wise Track</font></label></td>
					
				</tr>
			</table>
			
			
<!-- 	<datalist id="vehicleslist"> -->
<!-- 			<option ng-repeat="x in MarkerArrayList" ng-if="allcomp==x.district"  value="{{x.vehical_no}}"></option> -->
<!-- 	</datalist> -->
<!-- 	<datalist id="districtlist"> -->
<!-- 			<option ng-repeat="y in distveh" ng-if="filter" value="{{y.district}}"></option> -->
<!-- 	</datalist> -->
    <div id="livediv" hidden="true">
		<form ng-submit="livefunctionTrail()">
		<table>
	              <tr>
			        <td><b><font color="white">Vehicle No</font></b></td>
			        <td>  <select id="liveinput" class="form-control" required></select> </td>
	    				<td>  <button type="submit" id="livebtntrail" class="btn btn-default btclass" >Live Trail</button></td>
	   			  </tr>
		 </table>
		 </form>
		 <br>
	 </div>
	  		
	<div id="hisdiv" hidden="true">
	<form ng-submit="historyfunction()">
	<table>
	  <tr>
	       <td><b><font color="white">Vehicle No </font></b></td>
	       <td>
	        <select id="historyinput" class="form-control" required></select> 
<!-- 	      		<select id="vehiclelist"> -->
<!-- 	      			<options ng-repeat="x in MarkerArrayList" >{{x.vehical_no}}</options> -->
<!-- 	      		</select> -->
	       </td> 
	       <td><b><font color="white">Date</font></b></td>
	       <td>
	       	<input  type="text" class="form-control datepick" placeholder="mm/dd/yyyy" id="data">
	       </td>
	       <td><b><font color="white">Time From </font></b></td>
	       <td>
			  <timepicker-pop input-time="time1"  class="input-group" disabled="disabled"
									show-meridian='showMeridian' value="0:0"> </timepicker-pop>
				</div>
	       </td>
		<td><b><font color="white">Time To</font></b></td>
		<td>
				<timepicker-pop input-time="time2" class="input-group" disabled="disabled"
									show-meridian='showMeridian'> </timepicker-pop>
		</td>
		<td>
			<button type="submit" id="historybtn" class="btn btn-default btclass">View</button>
		</td>
	  </tr>
	</table>
	</form>
	<br>
	</div>
	
	<div id="tripdiv" hidden="true">
	<form ng-submit="gettripdet()">
	<table>
	  <tr>
	       <td><b><font color="white">Vehicle No </font></b></td>
	       <td>
	        <select id="tripinput" class="form-control" required></select> 
<!-- 	      		<select id="vehiclelist"> -->
<!-- 	      			<options ng-repeat="x in MarkerArrayList" >{{x.vehical_no}}</options> -->
<!-- 	      		</select> -->
	       </td> 
	       <td><b><font color="white">From  Date</font></b></td>
	       <td>
	       	<input  type="text" class="form-control datepick" placeholder="mm/dd/yyyy" id="todate" class="datepick">
	       </td>
	       <td><b><font color="white">To Date</font></b></td>
	       <td>
			  <input  type="text" class="form-control datepick" placeholder="mm/dd/yyyy" id="fromdate" class="datepick">
	       </td>
		<td>
			<button type="submit" id="tripbtn" class="btn btn-default btclass">Search</button>
		</td>
	  </tr>
	</table>
	</form>
	<br>
	<div id='etpno' hidden>
		<table>
			<tr>
			<td><b><font color="white">ETP No</font></b></td>
		       <td>
		        <select id="etpinput" class="form-control" required></select> 
		       </td>
		       <td>
					<button type="submit" id="tripbtn2" ng-click="etpnocall()" class="btn btn-default btclass">View</button>
				</td>
			</tr>
		</table>
	</div>
	<br>
	</div>
	
	</div>
    <center><div class="btn-xs123" id="slide"><span class="glyphicon glyphicon-chevron-down" style="color:white;cursor:pointer;"><br>Filter</span></div></center>
 </div>
 
 <div class="gd collapse in">
 <div class="btn-xs125" style="height:26px;" id="geoslide"><center><span style="color:white;cursor:pointer;"><label><font color="white"> Draw </font></label></span></center></div>
 <div id="togglegeo" class="row">
 <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menu1"><font color="white">Geofence</font></a></li>
    <li><a data-toggle="tab" href="#menu2"><font color="white">Route</font></a></li>
    <li><a data-toggle="tab" href="#menu3"><font color="white">POI</font></a></li>
  </ul>
  <div class="tab-content">
    
    <div id="menu1" class="tab-pane fade in active">
<!--       <h3>Geofence</h3> -->
	 <br>
      <form class="form-inline">
      <label><font color="white">Geofence type</font> &nbsp;</label>
      <select id="type">
        <option value="None">None</option>
        <option value="Polygon">Polygon</option>
        <option value="Square">Square</option>
        
      </select>
    </form>
    <br>
    	<div id="btndiv" class="row">
		    <div class="col-xs-4">
		    	<button id="featureinfo12" class="btn btn-default btclass" data-toggle="modal" data-target="#myModal1" >Save Geofence</button>
		    </div>
		    <div class="col-xs-4">
		    	<button id="showgeofence"  class="btn btn-default btclass" ng-click="showFence()">Show Geofence</button>
		    </div>
		    <div class="col-xs-4">
		    	<button id="clearfeature"  class="btn btn-default btclass">Clear</button>
		    </div>
	    </div>
	    <br>
    </div>
    <div id="menu2" class="tab-pane fade">
<!--       <h3>Route</h3> -->
	  <br>
      <form class="form-inline">
      <label><font color="white">Draw Route</font> &nbsp;</label>
      <select id="typeroute">
        <option value="None">None</option>
        <option value="LineString">Route</option>
      </select>
    </form>
    <br>
    
    <div class="row">
    <div class="col-xs-4">
    	<button id="routesave" 	class="btn btn-default btclass" data-toggle="modal" data-target="#myModal2" >Save Route</button>
    </div>
    <div class="col-xs-4">
    	<button id="clearfeature2"  class="btn btn-default btclass">Clear</button>
    </div>
    </div>
    <br>
    </div>
    <div id="menu3" class="tab-pane fade">
<!--       <h3>Menu 3</h3> -->
	<br>
	  <div class="row">
      	 <div class="col-xs-4">
		  	<input type="checkbox" id="addpoicheck" ><font color="white">Add POI</font>
		 </div>
		</div> <br>
      <div class="row">
      	 <div class="col-xs-4">
		  	<input type="checkbox" id="deletepoicheck" ><font color="white">Delete POI</font>
		 </div>
		</div> <br>
		<form ng-submit="updatePoi()">
     	<div class="row">
     	 <div class="col-xs-4">
      		<font color="white">Select POI:</font>
      	</div>
      	<div class="col-xs-4">
      		<select id="updatepoiname" >
      		<option ng-repeat="p in poi" value="{{p.poiid}}">{{p.poiname}}</option>
      		</select>
      	</div>
     </div>
     <div class="row" id="updel" hidden>
      	<div class="col-xs-4">
      		<button id="delpoi" class="btn btn-default btclass" ng-click="deletePoi()">Delete</button>
      	</div>
      </div> <br>
     <div class="row" id="upname">
      	<div class="col-xs-4">
      		<font color="white">New Name:</font>
      	</div>
      	<div class="col-xs-4">
      		<input type="text" class="form-control" id="upoiname" required>
      	</div>
	 </div> <br>
     <div class="row" id="uptype">
     	<div class="col-xs-4">
      		<font color="white">Type:</font>
      	</div>
      	<div class="col-xs-4">
      		<select id="updateptype" >
              <option value="Airport">Airport</option><option value="Bar">Bar</option>
              <option value="Building">Building</option><option value="Busstop">Busstop</option>
              <option value="CoffeeHouse">CoffeeHouse</option><option value="Education">Education</option>
              <option value="Flag">Flag</option><option value="Garden">Garden</option>
              <option value="Hospital">Hospital</option><option value="Market">Market</option>
              <option value="Office">Office</option><option value="PostOffice">PostOffice</option>
              <option value="Railway">Railway</option><option value="Restaurant">Restaurant</option>
              <option value="Temple">Temple</option><option value="University">University</option>
              <option value="Water">Water</option>
            </select>
      	</div>
      	<div class="col-xs-4">
     	 <img src="{{poiimage}}" height="30px" width="30px">
     </div>
     </div>
      <br>
     <div class="row" id="upsave">
      	<div class="col-xs-4">
      		<button id="updatepoi" type="submit"  class="btn btn-default btclass" >Update</button>
      	</div>
      </div>
      
      </form>
   	<br>
    </div>
  </div>
    </div>
 </div>
 
<!--  <div class="hd collapse in"><font color="white">Map Data @2016 RTL</font></div> -->
 
 <div class="modal fade" id="myModal1" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Save Geofence</h4>
		        </div>
		        <div class="modal-body">
		        <table class="table table-striped">
		        	<tr>
		        		<td><b>Geofence Name</b></td>
		        		<td><input id="srname" type="text" class="form-control" /></td>
		        	</tr>
		        	<tr></tr>
		        	<tr>
		        		<td><button ng-click="getDrawnFeature()" data-dismiss="modal">Save</button></td>
		        	</tr>
		        </table>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		  
		  <div class="modal fade" id="myModal2" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Save Route</h4>
		        </div>
		        <div class="modal-body">
		        <table class="table table-striped">
		        	<tr>
		        		<td><b>Route Name</b></td>
		        		<td colspan="8"><input id="rrname" type="text" class="form-control" /></td>
		        		<td><b>Route Type</b></td>
		        		<td><select id="rtype" class="form-control" ><option>UP</option><option>DOWN</option></select></td>
		        	</tr>
		        	<tr></tr>
		        	<tr>
		        		<td><button ng-click="getDrawnFeatureRoute()" data-dismiss="modal">Save</button></td>
		        	</tr>
		        </table>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
 </div>
	     
   <div id="map" class="map"></div>
		 <div id="popup">
		      <a id="popup-closer" class="ol-popup-closer">
		      <img src="http://frontlinejobs.corrections.govt.nz/assets/images/button-close-out.png"
		         height="30px" width="30px">
		      </a>
		      <div id="popup-content"></div>
		    </div>
		    
		    <div id="toolbox">
				<ul id="layerswitcher">
			<li><label><input type="radio" name="layer" value="3" > Bing </label></li>
			<li><label><input type="radio" name="layer" value="4" > Bing Hybrid</label></li>
			<li><label><input type="radio" name="layer" value="0" checked> OSM </label></li>
			<li><label><input type="radio" name="layer" value="1" > India</label></li>
				</ul>
			</div>
			
			
    
    <script src="resources/Mapscript/js/jqueryscripts.js"></script>
    <script src="resources/Mapscript/js/allmarkers.js"></script>
    <script src="resources/Mapscript/js/historymarkers.js"></script>
    <script src="resources/Mapscript/js/trailmarkers.js"></script>
    
    <script type="text/javascript">
    try{
    	var poidata = [];
    //	var latt,longit,index=0;
    	var key;
    	try{
    	    $.ajax({
    	        url: "http://209.190.15.26/orsacwebservice/rest/CallService/getkey"
    	    }).then(function(data) {
    	       key = data.key;
    	    });
    	}catch(e){
   		//	alert(e);
    	}
    	
    var circle = "${circle}";
//     alert(circle);
    var ownersid = 10001;
    
    try{
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
    layers.push(new ol.layer.Tile({
		source : new ol.source.OSM()
	}));
    layers.push(new ol.layer.Tile({
		extent : [ -20037508, -20037508, 20037508, 20037508 ],
		source : new ol.source.TileWMS({
			url : 'http://68.64.172.10:8082/geoserver/wms',
			type : 'base',
			params : {
				'LAYERS' : 'IndiaLayer',
				'TILED' : true,
				'CRS' : 'EPSG:4326'
			},
			serverType : 'geoserver',
			 tileGrid: tileGrid
		})
	}));
    layers.push(new ol.layer.Tile({
		extent : [ -20037508, -20037508, 20037508, 20037508 ],
		source : new ol.source.TileWMS({
			url : 'http://68.64.172.10:8082/geoserver/India/wms',
			type : 'base',
			params : {
				'LAYERS' : 'India:COUNTRY_Border',
				'TILED' : true,
				'CRS' : 'EPSG:4326'
			},
			serverType : 'geoserver',
			 tileGrid: tileGrid
		})
	}));
    layers.push(new ol.layer.Tile({
    	visible: false,
        preload: Infinity,
		source : new ol.source.BingMaps({
			key: 'AnQbS4Q6Ld8r_F1NWS2LpYZiFSq0OYe55UiV8pnT8xXwOpJjyXC8wvQtQLx-5dS0',
            imagerySet: 'Road'
		})
	}));
    layers.push(new ol.layer.Tile({
    	visible: false,
        preload: Infinity,
		source : new ol.source.BingMaps({
			key: 'AnQbS4Q6Ld8r_F1NWS2LpYZiFSq0OYe55UiV8pnT8xXwOpJjyXC8wvQtQLx-5dS0',
            imagerySet: 'AerialWithLabels'
		})
	}));
    }catch(e){
    }
	 var map = new ol.Map({
	        layers: [
	          layers[4],layers[3],layers[1],layers[0],layers[2],drawvector,savedrawsheltervector,savedrawvector,routedrawvector,
	          vectorLayergreen,vector,vectorLayersingle//, vectorhis
	        ],
	        target: 'map',
	        controls: ol.control.defaults({ attribution: false }),
	        view : new ol.View({
				center : ol.proj.transform([ 78.2090, 21.6139 ],
						'EPSG:4326', 'EPSG:3857'),		
				zoom : 2,
				minZoom: 5
	      })
	 });

	 function getExtentMap(MarkerList){
			var marker1 = [];
	    	   for(m = 0; m < MarkerList.length; m++){
					var data = MarkerList[m];
					 var lat= Number(data.latitude);
			  		    var longi=Number(data.longitude);
					 marker1[m]= ol.proj.transform([longi, lat], 'EPSG:4326', 'EPSG:3857');
				}
				var geom1 = new ol.geom.LineString(marker1, 'XY');
				var extent1 = geom1.getExtent();
				map.getView().fit(extent1, map.getSize()); 
		}
	 
	 function removeFeatures(){
		 vectorSourceGreen.clear();
		 source.clear();
		 vectorSourceSingle.clear();
	 }
	 var kpoi = "false";
    }catch(e){
    	alert(e);
    }
      </script>
      <script src="resources/Mapscript/js/draw_feature.js"></script>
      <script src="resources/Mapscript/js/createpopup.js"></script>
      <script>try {jQuery(function($) {
 
  
  // /////
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
} catch (error) { throw error; }

//# sourceURL=bebug.js
</script>
      <script>
      var latt,longit,index1=0;
      var app = angular.module('MapApp', ['timepickerPop']);
      app.directive('validNumber', function() {
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
      
      
      app.controller('mapCtrl', function($scope, $http, $compile, $filter) {
    	  var interval;
    	  $scope.loginid=ownersid;
//     	  if($scope.loginid!='10001'){
//     		  document.getElementById("allcomptd").hidden = true;
//     		  $scope.allcomp = $scope.loginid;
//     	  }else{
//     		  $scope.allcomp = "allcomp";
//     		  document.getElementById("allcomptd").hidden = false;
//     	  }
    	  $scope.namesub = 'All';
    	  try{
// 		  alert('http://209.190.15.26/orsacwebservice/rest/CallService/getallvehiclesbycircle?circle='+circle);
    	  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/getallvehiclesbycircle?circle='+circle).success(
  				function(data, status, headers,config) {
  					$scope.MarkerArrayList = data;
  					$scope.dataveh = data;
  					createAllMarkers(data);
  					if(data.length!=0){
  						getExtentMap(data);
  					}
  					
  					var country = [];
  					for(var i=0;i<data.length;i++){
  						country.push(data[i].vehical_no);
  					}
  					$("#liveinput").select2({
						  data: country
					});
  					$("#historyinput").select2({
						  data: country
					});
  					$("#tripinput").select2({
						  data: country
					});
  					
  					$scope.showShelter();
  					$scope.showRoute();
  					 $('#overlay').remove();
  					
  				}).error(function(data, status, headers,config) {
  					 $('#overlay').remove();
//   					alert('error: data = ',data);
  				});
    	  
    	  
    	  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/companydetails?companyid=30001&loginid=10001')
			.success(function(data, status, headers, config) {
				$scope.companylist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
    	  
    	  
    	 // document.getElementById("tripinput").onchange = function(){
    		$scope.gettripdet = function(){ 
        	 // alert(document.getElementById('tripinput').value);
        	 
        	 document.getElementById('etpno').hidden = true;
        	 
	    	  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/tripdet?vehicleno='+document.getElementById('tripinput').value+
	    			  '&todate='+document.getElementById('todate').value+'&fromdate='+document.getElementById('fromdate').value)
				.success(function(data, status, headers, config) {
					$scope.triplist = data;
					//alert(data);
					document.getElementById('etpno').hidden = false;
					var country = [];
  					for(var i=0;i<data.length;i++){
  						country.push(data[i].etpno);
  					}
  					$("#etpinput").select2({
						  data: country
					});
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
    	  };
    		
    		$scope.etpnocall = function(){
    		try{
    			for(var i = 0; i< $scope.triplist.length; i++){
    				if($scope.triplist[i].etpno == document.getElementById('etpinput').value){
    					//alert("in");
    					$scope.gettriptrail(document.getElementById('tripinput').value, $scope.triplist[i].starttime, $scope.triplist[i].passvalid);
    				}
    			}
    		}catch(e){
    			alert(e);
    		}
    		}
    		
    		
    		$scope.gettriptrail = function(vehicleno, fromtime, totime){
    		var over = '<div id="overlay"></div>';
  		    $(over).appendTo('body');
  		    clearInterval(interval);
				clearInterval(intervall1);
	
    		
    			$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/gethistorytrip?vehicleno='+ vehicleno
						+ '&fromdate='+fromtime+'&todate='+totime)
		.success(function(data, status, headers, config) {
						//alert(data);
					try {if (data == "") {
							$('#overlay').remove();
							alert("No Data Found");
						} else {
							getExtentMap(data);
							removeFeatures();
							createHistoryMarkers(data);
							$('#overlay').remove();
						}
					} catch (e) {
						//	    	 	    		alert(e);
					}
				})
		.error(function(data, status, headers, config) {
					$('#overlay').remove();
					console.log('error: data = ',data);
//						alert("No data Found");
				});
    		}
    	  
    	  $scope.allMarkers = function(){
    		  var over = '<div id="overlay"></div>';
    		    $(over).appendTo('body');
    		    clearInterval(interval);
				clearInterval(intervall1);
    		  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/getallvehicles?ownersid='+ownersid).success(
    	  				function(data, status, headers,config) {
    	  					
    	  					removeFeatures();
    	  					$scope.MarkerArrayList = data;
    	  					createAllMarkers(data);
    	  					getExtentMap(data);
    	  					$('#overlay').remove();
    	  				}).error(function(data, status, headers,config) {
    	  					$('#overlay').remove();
//     	  					alert('error: data = ',data);
    	  				});
    	  }
//     	  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/selectdistrict').success(
// 	  				function(data, status, headers,config) {
// 	  					$scope.distveh = data;
// 	  				}).error(function(data, status, headers,config) {
// 	  				});
    	  
    	  $scope.showDistrictVeh = function(loginid){
    		  var over = '<div id="overlay"></div>';
  		    $(over).appendTo('body');
  		    clearInterval(interval);
				clearInterval(intervall1);
  		  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/getallvehicles?ownersid='+loginid).success(
  	  				function(data, status, headers,config) {
  	  					
  	  					removeFeatures();
  	  					$scope.MarkerArrayList = data;
  	  					createAllMarkers(data);
  	  					getExtentMap(data);
  	  					$('#overlay').remove();
  	  				}).error(function(data, status, headers,config) {
  	  					$('#overlay').remove();
//   	  					alert('error: data = ',data);
  	  				});
  			}
    	  
    	  $scope.livefunctionTrail = function livefunctionTrail() {
    		  var over = '<div id="overlay"></div>';
    		    $(over).appendTo('body');
    		    clearInterval(interval);
				clearInterval(intervall1);
				
				$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/getlivevehicles?vehicleno='+ document.getElementById("liveinput").value)
						.success(function(data, status,headers, config) {
									index1 = 0;
									removeFeatures();
									if(data.length>0){
										createTrail(data);
										getExtentMap(data);
										map.getView().setZoom(15);
										$('#overlay').remove();
										
										interval = setInterval(function () {
											$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/getlivevehicles?vehicleno='+ document.getElementById("liveinput").value)
											.success(function(data, status,headers, config) {
														createTrail(data);
													})
											.error(function(data, status, headers, config) {
														console.log('error: data = ',data);
	// 													alert("No data Found");
													});
														}, 10000);
									}else{
										$('#overlay').remove();
									}
								})
						.error(function(data, status, headers, config) {
									$('#overlay').remove();
// 									console.log('error: data = ',data);
// 									alert("No data Found");
								});
			}
    	  
    	  
    	  $scope.historyfunction = function historyfunction() {
    		  var over = '<div id="overlay"></div>';
    		    $(over).appendTo('body');
			clearInterval(interval);
			clearInterval(intervall1);
			var mytime1 = $scope.time1.getHours() + ":"
					+ $scope.time1.getMinutes() + ":"
					+ $scope.time1.getSeconds();
			var mytime2 = $scope.time2.getHours() + ":"
					+ $scope.time2.getMinutes() + ":"
					+ $scope.time2.getSeconds();
					
		
			$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/gethistoryvehicles?vehicleno='+ document.getElementById("historyinput").value
									+ '&date='
									+ document.getElementById('data').value
									+ '&time1='
									+ mytime1
									+ '&time2='
									+ mytime2)
					.success(function(data, status, headers, config) {
// 								alert(data);
								try {if (data == "") {
										$('#overlay').remove();
										alert("No Data Found");
									} else {
										
										getExtentMap(data);
										removeFeatures();
										createHistoryMarkers(data);
										$('#overlay').remove();
									}
								} catch (e) {
									//	    	 	    		alert(e);
								}
							})
					.error(function(data, status, headers, config) {
								$('#overlay').remove();
								console.log('error: data = ',data);
// 								alert("No data Found");
							});
		}
    	  
    	  
    	  $scope.getDrawnFeature = function() {
    		  	var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				var feature = getDrawnFeatureValue();
				//alert(feature);
				var route = document.getElementById("srname").value;
				if (route == "") {
					alert("Geofence Name is Empty Try Again");
				} else if (route != "") {
					//alert('http://209.190.15.26/orsacwebservice/rest/CallService/geofenceinsert?geofencename='+route+'&loginid='+ownersid+'&coord='+feature);
					$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/geofenceinsert?geofencename='+route+'&loginid='+ownersid+'&coord='+feature)
					.success(function(data, status, headers, config) {
						$('#overlay').remove();
						alert("saved successfully");

					}).error(function(data, status, headers, config) {
						$('#overlay').remove();
						alert("not saved successfully"+" "+data+" "+status);
						console.log('error: data = ', data);
					});
				} else {
					$('#overlay').remove();
					alert("Geofence Name is Empty Try Again");
				}
			}
    	  
    	  
    	  $scope.getDrawnFeatureRoute = function() {
  		  	var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				var feature = getRouteFeatureValue();
				//alert(feature);
				var route = document.getElementById("rrname").value;
				var e = document.getElementById("rtype");
				var ptype = e.options[e.selectedIndex].text;
				if (route == "") {
					alert("Route Name is Empty Try Again");
					$('#overlay').remove();
				} else if (route != "") {
// 					alert('http://209.190.15.26/orsacwebservice/rest/CallService/routeinsert?routename='+route+
// 						  '&routetype='+ptype+'&loginid='+ownersid+'&coord='+feature);
					$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/routeinsert?routename='+route+
							'&routetype='+ptype+'&loginid='+ownersid+'&coord='+feature)
					.success(function(data, status, headers, config) {
						$('#overlay').remove();
						alert("saved successfully");

					}).error(function(data, status, headers, config) {
						$('#overlay').remove();
						alert("not saved successfully"+" "+data+" "+status);
// 						console.log('error: data = ', data);
					});
				} else {
					$('#overlay').remove();
					alert("Route Name is Empty Try Again");
				}
			}
    	  
    	 
    	  $scope.showFence = function(){
    			var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/geofencedetails?companyid=30003&loginid='+ownersid+'')
				.success(function(data, status, headers, config) {
									try {
										if(data == ""){
											$('#overlay').remove();
										} else{
											$('#overlay').remove();
// 											$scope.routename = data;
											alert(data);
											showFeature(data, 'geofence');
											geof=1;
										}
									} catch (e) {
										$('#overlay').remove();
									}
								})
						.error(function(data, status, headers, config) {
							$('#overlay').remove();
// 									console.log('error: data = ',data);
								});
            }
    	  
    		
    	  
    	  $scope.showRoute = function(){
  			var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/routedetails?companyid=1&loginid='+ownersid+'')
				.success(function(data, status, headers, config) {
											$scope.routename = data;
// 											alert($scope.routename[0].geofencename);
											route = $scope.routename;
											showFeature($scope.routename, 'route');
// 											processRoute(data[0].geofencename);
											$('#overlay').remove();
								})
						.error(function(data, status, headers, config) {
// 									console.log('error: data = ',data);
							$('#overlay').remove();
								});
				
         	 }
    	  var routename;
    	  $scope.process = function(){
    		  routename = document.getElementById('routenamenewlist').value;
    		  if(routename!=''){
    			  $scope.jsonArr = [];
    			  $scope.shelterassignlist = [];
    			  document.getElementById('shelterdiv').hidden = true;
        		  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/shelterdetails?companyid=30003&loginid='+ownersid+'&routename='+routename)
    				.success(function(data, status, headers, config) {
    									try {
    										if(data == ""){
    										} else{
    											$scope.unassignshelters = data;
    											document.getElementById('shelterdiv').hidden = false;
    										}
    									} catch (e) {
    										alert(e);
    									}
    								})
    						.error(function(data, status, headers, config) {
    							 		document.getElementById('shelterdiv').hidden = true;
//     									console.log('error: data = ',data);
    								});
        		  document.getElementById('shelterdiv').hidden = false;
    			  processRoute(routename);
    		  }
    		 
    	  }
    	  $scope.jsonArr = [];
    	  $scope.getName = function (sts,nroute) {
				if(sts){
					$scope.jsonArr.push(nroute);
				}else{
					var i = 0;
					for(i = 0; i < $scope.jsonArr.length; i++){
						if($scope.jsonArr[i].sheltername == nroute.sheltername){
							try{
								$scope.jsonArr.splice(i,1);
							}catch(e){
// 								alert(e);
							}
						}
					}
				}
			}
    	  
    	  $scope.dislist = true;
    	  $scope.shelterassignlist = [];
    	  $scope.getNameassigned = function (sts,nroute) {
				if(!sts){
					$scope.shelterassignlist.push(nroute);
				}else{
					var i = 0;
					for(i = 0; i < $scope.shelterassignlist.length; i++){
						if($scope.shelterassignlist[i].sheltername == nroute.sheltername){
							try{
								$scope.shelterassignlist.splice(i,1);
							}catch(e){
// 								alert(e);
							}
						}
					}
				}
			}
    	  
    	  
    	  $scope.saveshelters = function(){
    		  var i = 0, k = 0;
//     		  for(i = 0; i < $scope.shelterassignlist.length; i++){
//     			  alert($scope.shelterassignlist[i].sheltername);
//     		  }
    		  for(i = 0; i<$scope.jsonArr.length;i++){
    			  if($scope.jsonArr[i].orderno==null){
    				  k = 8;
    			  }
    			  if($scope.jsonArr[i].isDuplicate){
    				  k = 6;
    			  }
    		  }
    		  if($scope.jsonArr.length == 0 && $scope.shelterassignlist.length == 0){
    			  k = 7;
    		  }
    		  if(k==8){
    			  alert("Please provide order no for all shelters");
    		  }else if(k==7){
    			  alert("Please select some shelters to assign");
    		  }else if(k==6){
    			  alert("Order Nos are duplicated");
    		  }
    		  else{
    			  var routeid;
    			  for(i=0;i<$scope.routename.length;i++){
    				  if($scope.routename[i].geofencename == routename){
    					  routeid = $scope.routename[i].id;
    				  }
    			  }
    			  var response1 = $http.post('http://209.190.15.26/orsacwebservice/rest/CallService/shelterassigndelete?routeid='+routeid, 
    					  $scope.shelterassignlist);
					response1.success(function(data, status, headers, config) {
						 var response = $http.post('http://209.190.15.26/orsacwebservice/rest/CallService/shelterassign?routeid='+routeid, 
		    					  $scope.jsonArr);
							response.success(function(data, status, headers, config) {
								alert("Shelters Assigned Successfully");
								$scope.jsonArr = [];
								$scope.showShelter();
								$scope.process();
							});
							response.error(function(data, status, headers, config) {
								$scope.jsonArr = [];
								alert("Not Saved Successfully2");
							});
					});
					response1.error(function(data, status, headers, config) {
						$scope.jsonArr = [];
						alert("Not Saved Successfully1");
					});

    			 
    		  }
    	  }
    	  
    	  $scope.showShelter = function(){
    			var over = '<div id="overlay"></div>';
  	  		    $(over).appendTo('body');
  				clearInterval(interval);
  				clearInterval(intervall1);
  				$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/shelterdetails?companyid=30003&loginid='+ownersid+'')
  				.success(function(data, status, headers, config) {
  									try {
  										if(data == ""){
  											$('#overlay').remove();
  										} else{
  											$('#overlay').remove();
  											$scope.shelters = data;
  											//alert(data);
//   											$scope.shelterassignlist = data;
  											showShelters(data);
  										}
  									} catch (e) {
  										$('#overlay').remove();
  									}
  								})
  						.error(function(data, status, headers, config) {
  							$('#overlay').remove();
  									console.log('error: data = ',data);
  								});
  				
           	 }
    	  
    	  
				$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/poidetails?companyid=30003&loginid='+ownersid+'')
				.success(function(data, status, headers, config) {
									try {
										if(data == ""){
										} else{
											$scope.poi = data;
											poidata = data;
											//alert(data[0].poiname);
											 $("#updateptype").val(data[0].poitype);
											$scope.poiimage = "resources/Mapscript/images/"+data[0].poitype.toLowerCase()+".png";
// 											$scope.shelterassignlist = data;
											showPOI(data);
										}
									} catch (e) {
									}
								})
						.error(function(data, status, headers, config) {
									console.log('error: data = ',data);
								});
    	  
    	  $scope.duplicate;
    	  $scope.verifyDuplicate = function() {
    	        var sorted, i;
    	        
    	        sorted = $scope.jsonArr.concat().sort(function (a, b) {
    	            if (a.orderno > b.orderno) return 1;
    	            if (a.orderno < b.orderno) return -1;
    	            return 0;
    	        });
    	        for(i = 0; i < $scope.jsonArr.length; i++) {
    	            sorted[i].isDuplicate = ((sorted[i-1] && sorted[i-1].orderno == sorted[i].orderno) || (sorted[i+1] && sorted[i+1].orderno == sorted[i].orderno));
    	        }
    	        
    	  }
    	  
    	  
    	  
    	  $("#addpoicheck").click(function(){
        	  if(document.getElementById("addpoicheck").checked){
        		  kpoi= "true";
        	  }else{
        		  kpoi= "false"; 
        	  }
    	  });
    	  
    	  $scope.updatePoi = function(){
    		  try{
    		  var name1 = document.getElementById("updatepoiname");
    		  var id = name1.options[name1.selectedIndex].value;
   			  var e1 = document.getElementById("updateptype");
   			  var ptype1 = e1.options[e1.selectedIndex].text;
    		  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/poiupdate?loginid='+ownersid+'&id='+id+
    				  '&poiname='+document.getElementById("upoiname").value+'&poitype='+ptype1)
				.success(function(data, status, headers, config) {
					$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/poidetails?companyid=30003&loginid='+ownersid+'')
					.success(function(data, status, headers, config) {
										try {
											if(data == ""){
											} else{
												$scope.poi = data;
												poidata = data;
												//alert(data[0].poiname);
												 $("#updateptype").val(data[0].poitype);
												$scope.poiimage = "resources/Mapscript/images/"+data[0].poitype.toLowerCase()+".png";
//	 											$scope.shelterassignlist = data;
												savedrawsource.clear();
												showPOI(data);
											}
										} catch (e) {
										}
									})
							.error(function(data, status, headers, config) {
										console.log('error: data = ',data);
									});
									alert("Updated Successfully");
								})
						.error(function(data, status, headers, config) {
									alert("Not Updated");
								});
    		  }catch(e){
    			 // alert(e);
    		  }
    	  }
    	  
    	 
    	  $scope.deletePoi = function(){
    		  try{
	    		  var name1 = document.getElementById("updatepoiname");
	    		  var id = name1.options[name1.selectedIndex].value;
	    		  $http.get('http://209.190.15.26/orsacwebservice/rest/CallService/poidelete?loginid='+ownersid+'&id='+id)
					.success(function(data, status, headers, config) {
						$http.get('http://209.190.15.26/orsacwebservice/rest/CallService/poidetails?companyid=30003&loginid='+ownersid+'')
						.success(function(data, status, headers, config) {
											try {
												if(data == ""){
												} else{
													$scope.poi = data;
													poidata = data;
													//alert(data[0].poiname);
													 $("#updateptype").val(data[0].poitype);
													$scope.poiimage = "resources/Mapscript/images/"+data[0].poitype.toLowerCase()+".png";
//		 											$scope.shelterassignlist = data;
													savedrawsource.clear();
													showPOI(data);
												}
											} catch (e) {
											}
										})
								.error(function(data, status, headers, config) {
											console.log('error: data = ',data);
										});
										alert("Deleted Successfully");
							})
					.error(function(data, status, headers, config) {
							alert("Not Deleted");
					 });
    		  }catch(e){
    			 // alert(e);
    		  }
    	  }
    	  
    	    $scope.time1 = new Date();
			$scope.time2 = new Date();
			$scope.time1.setHours(00);
			$scope.time1.setMinutes(05);
			$scope.time2.setHours(23);
			$scope.time2.setMinutes(50);
			$scope.showMeridian = true;
			$scope.disabled = false;
			
			
			 $('#updateptype').on('change', function (e) {
	    		  try{
		   			  var e1 = document.getElementById("updateptype");
		   			  var ptype1 = e1.options[e1.selectedIndex].text;
		    		  $scope.poiimage = "resources/Mapscript/images/"+ptype1.toLowerCase()+".png";
	    		  }catch(e){
	    			  alert(e);
	    		  }
	    		});
	    	  
// 	    	  document.getElementById("ptype").onchange = function(){
// 	    		  try{
// 		   			  var e1 = document.getElementById("ptype");
// 		   			  var ptype1 = e1.options[e1.selectedIndex].text;
// 		    		  $scope.inpoiimage = "resources/Mapscript/images/"+ptype1.toLowerCase()+".png";
// 	    		  }catch(e){
// 	    			  alert(e);
// 	    		  }
// 	    		};
	    	   $scope.removevehicle = function (sts,nroute) {
					if(!sts){
						removeclearById(nroute.vehical_no);
					}else{
						createAllMarkers($scope.MarkerArrayList);
					}
			   }
	    	  document.getElementById("updatepoiname").onchange = function(){
	        	  var name1 = document.getElementById("updatepoiname");
	    		  var id = name1.options[name1.selectedIndex].value;
	    		  var temp;
	    		  for(var i = 0;i<poidata.length;i++){
	    			  if(id == poidata[i].poiid){
	    				  temp = poidata[i].poitype;
	    			  }
	    		  }
	    		 // alert(temp);
	        	  $("#updateptype").val(temp);
	    		  $scope.poiimage = "resources/Mapscript/images/"+temp.toLowerCase()+".png";
	          };
	          $scope.getvehicles = function(type){
	        	  removeFeatures();
	        	  $scope.namesub = type+" Vehicles";
	        	  $scope.dataveh=[];
	    		  if(type=='Running'){
	    			  $scope.dataveh = createRunningMarkers($scope.MarkerArrayList)
	    		  }else if(type=='Hault'){
	    			  $scope.dataveh = createHaultMarkers($scope.MarkerArrayList)
	    		  }else if(type=='All'){
	    			  $scope.dataveh = createAllMarkers($scope.MarkerArrayList)
	    		  }else{
	    			  $scope.dataveh = createStopMarkers($scope.MarkerArrayList)
	    		  }
	    			  
	    	  }
	          document.getElementById("allcomp").onchange = function(){
	        	  
	        	  var name1 = document.getElementById("allcomp");
	    		  var id = name1.options[name1.selectedIndex].value;
	    		  $scope.filter = id;
	    		  if(id=='allcomp'){
	    			  removeFeatures();
	    			  $scope.allMarkers();
	    		  }else{
	    			 // alert(id);
	    			  removeFeatures();
	    			  $scope.showDistrictVeh(id);
	    		  }
	          }
    	  }catch(e){
//     		  alert(e);
    	  }
      });
    </script>
  </body>
</html>