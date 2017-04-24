/**
 * 
 */
var styleFunction = function(feature, resolution) {
		        			  var geometry = feature.getGeometry();
		        			  var styles = [
		        			    // linestring
		        			    new ol.style.Style({
		        			      stroke: new ol.style.Stroke({
		        			        color: '#239927',
		        			        width: 2
		        			      })
		        			    })
		        			  ];

		        			  geometry.forEachSegment(function(start, end) {
		        			    var dx = end[0] - start[0];
		        			    var dy = end[1] - start[1];
		        			    var rotation = Math.atan2(dy, dx);
		        			    
		        			    styles.push(new ol.style.Style({
		        			      geometry: new ol.geom.Point(end),
		        			      image: new ol.style.Icon({
		        			        src: "resources/Mapscript/images/back-arrow.png",
		        			        anchor: [0.75, 0.5],
		        			        rotateWithView: false,
		        			        rotation: -rotation
//		        			        name: "hello"
		        			      })
		        			    }));
		        			  });

		        			  return styles;
		        			};

	var iconStylehistory = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.75, 0.75],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/position.png"
		}))
	});

var source = new ol.source.Vector({
//	features: [feature]
});
var vector = new ol.layer.Vector({
	source: source,
	style: [styleFunction]
});

var intervall1;
var featurehistory = [];
    function createHistoryMarkers(MarkerList){
    	try{
    	var lat,longi;
    	var i = 0;
//    	for(i=0;i<MarkerList.length;i++){
    		intervall1 = setInterval(function () {
		    data=MarkerList[i];
		   
		   if(i!=0){
		    	var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longi), Number(lat)]];

		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');

		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		        if(data.tripid>0 && data.tripid<50){
		        	createSingleMarkers(data,'green');
		        } else if(data.tripid>=50){
		        	createSingleMarkers(data,'overspeed');
		        } else if(data.tripid==0){
		        	createSingleMarkers(data,'stop');
		        }
		        desc =
	    		     '<table class="popupback"> <tr>'+
		             '<td><div><table class="popup">' +
		             '<tr><td align=center class="tiphead" colspan="2"><font>Vehicle Details</font></td></tr>'+
		              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
		              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + vehicleno + '</td></tr>' +
		              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.mindatereceived + '</td></tr>' +
					  '<tr class="tiplabel"><td >Speed:</td><td>' + data.tripid + ' Km/Hr</td></tr>' ;
//					  '<tr class="tiplabel"><td >Direction:</td><td> '+data.headings +' </td></tr>' +
//					  '<tr class="tiplabel"><td >Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
//					  '<tr class="tiplabel"><td >Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
//					  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
//						  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//		              '</table></div></td><td></td>'+
//		              '</tr></table></div>';
		        var iconFeaturehistory = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([Number(longi), Number(lat)], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc
					});
		        iconFeaturehistory.setStyle(iconStylehistory);
		        featurehistory.push(iconFeaturehistory);
		        source.addFeatures([feature]);
		   }else{
			   createSingleMarkers(data,'green');
		   }
		    lat=data.latitude;
		    longi=data.longitude;
		    i++;
		    if(MarkerList.length == i){
		    	clearInterval(intervall1);
		    	createSingleMarkers(data,'red');
		    	source.addFeatures(featurehistory);
		    }
    		}, 100);
//    	}
    	
    	vector.setSource(source);
    	vector.setStyle(styleFunction);
    	}catch(e){
    		alert("history markers "+e);
    	}
    }
    
    
    function createHistoryMarkers_history(MarkerList){
    	try{
    	var lat,longi;
    	var i = 0;
//    	for(i=0;i<MarkerList.length;i++){
    		intervall1 = setInterval(function () {
		    data=MarkerList[i];
		   
		   if(i!=0){
		    	var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longi), Number(lat)]];

		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');

		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		       
		        var desc =
	     		     '<table class="popupback"> <tr>'+
	  	             '<td><div><table class="popup">' +
	  	             '<tr><td align=center class="tiphead" colspan="2">Vehicle Details</td></tr>'+
	  	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	  	              '<tr class="tiplabel"><td>VehicleNo:</td><td>' + data.vehicleregno + '</td></tr>' +
	  	              '<tr class="tiplabel"><td>Date Time:</td><td>' + data.datatimestamp + '</td></tr>' +
	  				  '<tr class="tiplabel"><td>Speed:</td><td>' + data.vehiclespeed + ' Km/Hr</td></tr>' ;
//	  				  '<tr class="tiplabel"><td>Route Name:</td><td> '+data.routename +' </td></tr>' +
//	  				  '<tr class="tiplabel"><td>Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//	  	              '</table></div></td><td></td>'+
//	  	              '</tr></table></div>';
		        var iconFeaturehistory = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([Number(longi), Number(lat)], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc
					});
		        iconFeaturehistory.setStyle(iconStylehistory);
		        featurehistory.push(iconFeaturehistory);
		        source.addFeatures([feature]);
		   }else{
			   createSingleMarkers_history(data,'green');
		   }
		    lat=data.latitude;
		    longi=data.longitude;
		    i++;
		    if(MarkerList.length == i){
		    	clearInterval(intervall1);
		    	createSingleMarkers_history(data,'red');
		    	source.addFeatures(featurehistory);
		    }
    		}, 100);
//    	}
    	
    	vector.setSource(source);
    	vector.setStyle(styleFunction);
    	}catch(e){
    		alert("history markers "+e);
    	}
    }

    