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
   
   <script src="resources/Mapscript/js/jquery-2.2.3.min.js"></script>
   <script src="resources/Mapscript/js/bootstrap.min.js"></script>
   <script src="resources/Mapscript/js/ol.js"></script>
   <script src="resources/Mapscript/js/angular.min.js"></script>
   <script type="text/javascript" src="resources/Mapscript/js/bootstrap-datepicker.js"></script>
   <script src="resources/Mapscript/js/ui-bootstrap-tpls.js"></script>
   <script src="resources/Mapscript/javascripts/timpicker.js" type="text/javascript"></script>
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
	    background:url('resources/Mapscript/images/horizontalloader.gif') no-repeat center center rgba(0,0,0,0.25)
	}
   </style>
   <link rel="stylesheet" href="resources/Mapscript/css/map.css" type="text/css">
  </head>
  <body>

  <div ng-app="MapApp" ng-controller="mapCtrl">
  <div id="div1" class="cd collapse in" hidden>
	<div id="togglemap" class="row"  hidden>
		<table>
				<tr>
					<td><input type="radio" name="grp" id="all" checked="checked" ng-click="allMarkers()"/><label for="all"><font color="white">All Vehicles</font></label></td>
					<td><input type="radio" name="grp" id="live"/><label for="live"><font color="white">Live Vehicles</font></label></td>
				 	<td><input type="radio" name="grp" id="history"/><label for="history"><font color="white">History</font></label></td>
				</tr>
			</table>
	<datalist id="vehicleslist">
			<option ng-repeat="x in MarkerArrayList" value="{{x.vehical_no}}"></option>
	</datalist>
    <div id="livediv" hidden="true">
		<table>
	              <tr>
			        <td><b><font color="white">Vehicle No</font></b></td>
			        <td>  <input type="text" class="form-control" id="liveinput" placeholder="Select Vehicle No" list="vehicleslist"> </td>
	    				<td>  <button id="livebtntrail" class="btn btn-default btclass" ng-click="livefunctionTrail()">Live Trail</button></td>
	   			  </tr>
		 </table>
		 <br>
	 </div>
	     		
	<div id="hisdiv" hidden="true">
	<table>
	  <tr>
	       <td><b><font color="white">Vehicle No </font></b></td>
	       <td>
	       	<input type="text" class="form-control" placeholder="Select Vehicle No" id="historyinput" list="vehicleslist">
	       </td> 
	       <td><b><font color="white">Date</font></b></td>
	       <td>
	       	<input  type="text" class="form-control" placeholder="mm/dd/yyyy" id="data" >
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
			<button id="historybtn" class="btn btn-default btclass" ng-click="historyfunction()">View</button>
		</td>
	  </tr>
	</table>
	<br>
	</div>
	</div>
    <center><div class="btn-xs123" id="slide"><span class="glyphicon glyphicon-chevron-down" style="color:white;cursor:pointer;"></span></div></center>
 </div>
 
 <div id="div2" class="gd collapse in" hidden>
 <div class="btn-xs123" id="geoslide"><center><span style="color:white;cursor:pointer;"><label><font color="white"> Geofence </font></label></span></center></div>
 <div id="togglegeo" class="row" hidden>
  <form class="form-inline">
      <label><font color="white">Geometry type</font> &nbsp;</label>
      <select id="type">
        <option value="None">None</option>
        <option value="LineString">LineString</option>
        <option value="Polygon">Polygon</option>
<!--         <option value="Circle">Circle</option> -->
        <option value="Square">Square</option>
        <option value="Point">Circle</option>
        
      </select>
    </form>
    	<br>
    <div id="btndiv">
    	<button id="featureinfo12" class="btn btn-default btclass" data-toggle="modal" data-target="#myModal1" >Save</button>
    	<button id="clearfeature"  class="btn btn-default btclass">Clear</button>
    	<button id="showgeofence"  class="btn btn-default btclass" ng-click="showFence()">Show Geofence</button>
    </div>
    <br>
    </div>
 </div>
 
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
		  
 </div>
	     
   <div id="map" class="map"></div>
		 <div id="popup" class="ol-popup">
		      <a id="popup-closer" class="ol-popup-closer">
		      <img src="http://www.eqs-corporate-communications.com/fileadmin/templates/images/icon_close_brown.svg"
		         height="30px" width="30px">
		      </a>
		      <div id="popup-content"></div>
		    </div>
     <div id="toolbox">
			<ul id="layerswitcher">
			<li><label><input type="radio" name="layer" value="3" checked> Bing </label></li>
			<li><label><input type="radio" name="layer" value="0"> OSM </label></li>
			<li><label><input type="radio" name="layer" value="1" > India</label></li>
			</ul>
		</div>
    </div>
    <script src="resources/Mapscript/js/jqueryscripts.js"></script>
    <script src="resources/Mapscript/js/allmarkers_summary.js"></script>
    <script src="resources/Mapscript/js/historymarkers_summary.js"></script>
    <script src="resources/Mapscript/js/trailmarkers.js"></script>
    <script type="text/javascript">
    var latt,longit,index=0;
    document.getElementById("div2").style.display='none';
	document.getElementById("div1").style.display='none';
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
    }catch(e){
    	alert(e);
    }
	 var map = new ol.Map({
	        layers: [
	          layers[3],layers[1],layers[0],layers[2],vectorLayergreen,vector,vectorLayersingle,drawvector,savedrawvector
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
	 var vehicleno = "${vehicleno}";
	 var tripid = "${tripid}";
	 var latitude = "${latitude}";
	 var longitude = "${longitude}";
	 var date = "${date}";
      </script>
      <script src="resources/Mapscript/js/draw_features.js"></script>
      <script src="resources/Mapscript/js/createpopup.js"></script>
      <script>
      var app = angular.module('MapApp', ['timepickerPop']);
      app.controller('mapCtrl', function($scope, $http, $compile, $filter) {
    	  var interval;
    	  try{
    		  if(date==""){
    		  $http.get('summarydatadata')
				.success(function(data, status, headers, config) {
					// 	    		    	alert(data);
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
					alert("No data Found");
				});
    		  }else{
    			  try{
    			  var data =[];
					 data.push({
						 tripid : tripid,
						 mindatereceived : date,
						 latitude : latitude,
						 longitude : longitude
					 });
					 if(data[0].tripid>0 && data[0].tripid<50){
				        	createSingleMarkers(data[0],'green');
				        } else if(data[0].tripid>=50){
				        	createSingleMarkers(data[0],'overspeed');
				        } else if(data[0].tripid==0){
				        	createSingleMarkers(data[0],'stop');
				        }
					 getExtentMap(data);
					 map.getView().setZoom(15);
					 $('#overlay').remove();
    			  }catch(e){
    				  alert(e);
    			  }
    		  }
    	  $scope.allMarkers = function(){
    		  var over = '<div id="overlay"></div>';
    		    $(over).appendTo('body');
    		    clearInterval(interval);
				clearInterval(intervall1);
    		  $http.get('http://elocator.in/gvkwebservice/rest/CallService/getallvehicles?ownersid=10002').success(
    	  				function(data, status, headers,config) {
    	  					
    	  					removeFeatures();
    	  					$scope.MarkerArrayList = data;
    	  					createAllMarkers(data);
    	  					getExtentMap(data);
    	  					$('#overlay').remove();
    	  				}).error(function(data, status, headers,config) {
    	  					$('#overlay').remove();
    	  					alert('error: data = ',data);
    	  				});
    	  }
    	  
    	  $scope.livefunctionTrail = function livefunctionTrail() {
    		  var over = '<div id="overlay"></div>';
    		    $(over).appendTo('body');
    		    clearInterval(interval);
				clearInterval(intervall1);
				
				$http.get('http://elocator.in/gvkwebservice/rest/CallService/getlivevehicles?vehicleno='+ document.getElementById("liveinput").value)
						.success(function(data, status,headers, config) {
							
									removeFeatures();
									createTrail(data);
									$('#overlay').remove();
									
									interval = setInterval(function () {
										$http.get('http://elocator.in/gvkwebservice/rest/CallService/getlivevehicles?vehicleno='+ document.getElementById("liveinput").value)
										.success(function(data, status,headers, config) {
													createTrail(data);
												})
										.error(function(data, status, headers, config) {
													console.log('error: data = ',data);
													alert("No data Found");
												});
														}, 10000);
								})
						.error(function(data, status, headers, config) {
									$('#overlay').remove();
									console.log('error: data = ',data);
									alert("No data Found");
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
					
			$http.get('http://elocator.in/gvkwebservice/rest/CallService/gethistoryvehicles?vehicleno='+ document.getElementById("historyinput").value
									+ '&date='
									+ document.getElementById('data').value
									+ '&time1='
									+ mytime1
									+ '&time2='
									+ mytime2)
					.success(function(data, status, headers, config) {
								// 	    		    	alert(data);
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
								alert("No data Found");
							});
		}
    	  
    	  
    	  $scope.getDrawnFeature = function() {
    		  	var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				var feature = getDrawnFeatureValue();
				var route = document.getElementById("srname").value;
				if (route == "") {
					alert("Route Name is Empty Try Again");
				} else if (route != "") {
//					alert('http://elocator.in/gvkwebservice/rest/CallService/geofenceinsert?geofencename='+route+'&loginid=10001&coord='+feature);
					$http.get('http://elocator.in/gvkwebservice/rest/CallService/geofenceinsert?geofencename='+route+'&loginid=10001&coord='+feature)
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
					alert("Route Name is Empty Try Again");
				}
			}
    	  
    	  
    	  $scope.showFence = function(){
    			var over = '<div id="overlay"></div>';
	  		    $(over).appendTo('body');
				clearInterval(interval);
				clearInterval(intervall1);
				$http.get('http://elocator.in/gvkwebservice/rest/CallService/geofencedetails?companyid=61011&loginid=10001')
				.success(function(data, status, headers, config) {
									try {
										if(data == ""){
											$('#overlay').remove();
										} else{
											$('#overlay').remove();
											$scope.routename = data;
											showFeature(data);
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

    	  
    	    $scope.time1 = new Date();
			$scope.time2 = new Date();
			$scope.time1.setHours(00);
			$scope.time1.setMinutes(05);
			$scope.time2.setHours(23);
			$scope.time2.setMinutes(50);
			$scope.showMeridian = true;
			$scope.disabled = false;
    	  }catch(e){
    		  alert(e);
    	  }
      });
    </script>
  </body>
</html>
