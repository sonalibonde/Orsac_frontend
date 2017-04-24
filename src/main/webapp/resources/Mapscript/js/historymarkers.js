/**
 * 
 */
//alert("in history 42");
var styleFunction = function(feature, resolution) {
		        			  var geometry = feature.getGeometry();
		        			  var styles = [
		        			    // linestring
		        			    new ol.style.Style({
		        			      stroke: new ol.style.Stroke({
		        			        color: 'orange',
		        			        width: 3
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

	

var source = new ol.source.Vector({
//	features: [feature]
});
var newstyle = new ol.style.Style({
    stroke: new ol.style.Stroke({
        color: 'orange',
        width: 3
      })
    });
var vector = new ol.layer.Vector({
	source: source,
	style:  newstyle
});
//alert("in historymarkers");
var intervall1;
var featurehistory = [];
    function createHistoryMarkers(MarkerList){
    	try{
    		
    	var lat,longi;
    	var i = 0;
//    	for(i=0;i<MarkerList.length;i++){
    		intervall1 = setInterval(function () {
		    data=MarkerList[i];
		    if(i!=1){
		    	vectorSourceSingle.clear();
		    }else{
		    	 createSingleMarkers(data,'start');
		    }
		   if(i!=0){
		    	var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longi), Number(lat)]];

		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');

		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		        var desc =  '<table class="popup"><tr>'+
	             '<td><div style="float:left; width:40%; border-right:thin solid #34495e;"><table>' +
	             '<tr><td align=center class="tiphead" colspan="2"><font>Truck Details</font></td></tr>'+
	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	              '<tr ><td class="tiplabel">Truck No:</td><td>' + data.vehical_no + '</td></tr>' +
	              '<tr ><td class="tiplabel">Date Time:</td><td>' + data.datereceived + '</td></tr>' +
				  '<tr ><td class="tiplabel">Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
				  '<tr ><td class="tiplabel">Direction:</td><td> '+data.headings +' </td></tr>' +
				  '<tr ><td class="tiplabel">Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
				 '<tr ><td class="tiplabel">Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
				 
	              '</table></div><div><table style="border-left:thin solid #34495e;">' +
	              '<thead><td align=center class="tiphead" colspan="2"><font>Trip Details</font></td></thead>'+
	              '<tbody style="padding-left:7px;"><tr><td colspan="2" style="padding:0px;height:2px;background-color:#007ee9;"></td></tr>' +
	              '<tr ><td class="tiplabel">ETP/PASS No:</td><td>' + data.etpno + '</td></tr>' +
	              '<tr ><td class="tiplabel">Mineral Name:</td><td>' + data.minename + '</td></tr>' +
				  '<tr ><td class="tiplabel">Quantity:</td><td>' + data.quantity + '</td></tr>' +
				  '<tr ><td class="tiplabel">Source:</td><td>' + data.source + '</td></tr>' +
				  '<tr ><td class="tiplabel">Destination:</td><td>' + data.destination + '</td></tr>' +
				  '<tr ><td class="tiplabel">Route Name:</td><td>' + data.routename + '</td></tr>' +
				  '<tr ><td class="tiplabel">Start Time:</td><td> '+data.starttime +' </td></tr>' +
				  '<tr ><td class="tiplabel">Valid Upto:</td><td>' + data.endtime + '</td></tr></tbody>' +
				  '<tr ><td class="tiplabel">Transporter Name:</td><td>' + data.transportername + '</td></tr>';
//							  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
////							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//				              '</table></div></td><td></td>'+
//				              '</tr></table></div>';
		        var iconFeaturehistory = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([Number(longi), Number(lat)], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc
					});
//		        alert("resources/Mapscript/images/dir/"+data.historyicon);
		        var iconStylehistory = new ol.style.Style({
		    		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		    		({
		    			anchor : [ 0.75, 0.75],
		    			anchorXUnits : 'fraction',
		    			anchorYUnits : 'pixels',
		    			opacity : 2,
		    			src : "resources/Mapscript/images/dir/"+data.historyicon
		    		}))
		    	});
		        //iconFeaturehistory.setStyle(iconStylehistory);
		        //featurehistory.push(iconFeaturehistory);
		        source.addFeatures([feature]);
		        createSingleMarkers(data,'green');
		   }else{
			   createSingleMarkers(data,'green');
		   }
		    lat=data.latitude;
		    longi=data.longitude;
		    i++;
		    if(MarkerList.length == i){
		    	clearInterval(intervall1);
		    	createSingleMarkers(data,'red');
		    	//source.addFeatures(featurehistory);
		    }
    		}, 100);
//    	}
    	
    	vector.setSource(source);
    	vector.setStyle(newstyle);
    	}catch(e){
    		//alert("history markers "+e);
    	}
    }
    
    
    function createHistoryMarkersTrip(MarkerList){
    	try{
    		
    	var lat,longi;
    	var i = 0;
//    	for(i=0;i<MarkerList.length;i++){
    		intervall1 = setInterval(function () {
		    data=MarkerList[i];
		   
		    if(i!=1){
		    	vectorSourceSingle.clear();
		    }else{
		    	 createSingleMarkers(data,'start');
		    }
		    
		   if(i!=0){
		    	var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longi), Number(lat)]];

		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');

		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		        var desc =  '<table class="popup"><tr>'+
	             '<td><div style="float:left; width:40%; border-right:thin solid #34495e;"><table>' +
	             '<tr><td align=center class="tiphead" colspan="2"><font>Truck Details</font></td></tr>'+
	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	              '<tr ><td class="tiplabel">Truck No:</td><td>' + data.vehical_no + '</td></tr>' +
	              '<tr ><td class="tiplabel">Date Time:</td><td>' + data.datereceived + '</td></tr>' +
				  '<tr ><td class="tiplabel">Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
				  '<tr ><td class="tiplabel">Direction:</td><td> '+data.headings +' </td></tr>' +
				  '<tr ><td class="tiplabel">Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
				 '<tr ><td class="tiplabel">Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
				 
	              '</table></div><div><table style="border-left:thin solid #34495e;">' +
	              '<thead><td align=center class="tiphead" colspan="2"><font>Trip Details</font></td></thead>'+
	              '<tbody style="padding-left:7px;"><tr><td colspan="2" style="padding:0px;height:2px;background-color:#007ee9;"></td></tr>' +
	              '<tr ><td class="tiplabel">ETP/PASS No:</td><td>' + data.etpno + '</td></tr>' +
	              '<tr ><td class="tiplabel">Mineral Name:</td><td>' + data.minename + '</td></tr>' +
				  '<tr ><td class="tiplabel">Quantity:</td><td>' + data.quantity + '</td></tr>' +
				  '<tr ><td class="tiplabel">Source:</td><td>' + data.source + '</td></tr>' +
				  '<tr ><td class="tiplabel">Destination:</td><td>' + data.destination + '</td></tr>' +
				  '<tr ><td class="tiplabel">Route Name:</td><td>' + data.routename + '</td></tr>' +
				  '<tr ><td class="tiplabel">Start Time:</td><td> '+data.starttime +' </td></tr>' +
				  '<tr ><td class="tiplabel">Valid Upto:</td><td>' + data.endtime + '</td></tr></tbody>' +
				  '<tr ><td class="tiplabel">Transporter Name:</td><td>' + data.transportername + '</td></tr>';
//							  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
////							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//				              '</table></div></td><td></td>'+
//				              '</tr></table></div>';
		        var iconFeaturehistory = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([Number(longi), Number(lat)], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc
					});
//		        alert("resources/Mapscript/images/dir/"+data.historyicon);
		        var iconStylehistory = new ol.style.Style({
		    		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		    		({
		    			anchor : [ 0.75, 0.75],
		    			anchorXUnits : 'fraction',
		    			anchorYUnits : 'pixels',
		    			opacity : 2,
		    			src : "resources/Mapscript/images/dir/"+data.historyicon
		    		}))
		    	});
		        //iconFeaturehistory.setStyle(iconStylehistory);
		        //featurehistory.push(iconFeaturehistory);
		        source.addFeatures([feature]);
		        createSingleMarkers(data,'green');
		        try{
		        if(rtime==data.checkdate){
//		        	alert(rtime+" "+data.checkdate);
		        	createSingleMarkers(data,'rdev');
		        }
		        }catch(e){
		        	
		        }
		   }else{
			   createSingleMarkers(data,'green');
		   }
		    lat=data.latitude;
		    longi=data.longitude;
		    i++;
		    if(MarkerList.length == i){
		    	clearInterval(intervall1);
		    	createSingleMarkers(data,'red');
		    	//source.addFeatures(featurehistory);
		    }
    		}, 300);
//    	}
    	
    	vector.setSource(source);
    	vector.setStyle(newstyle);
    	}catch(e){
    		//alert("history markers "+e);
    	}
    }

    