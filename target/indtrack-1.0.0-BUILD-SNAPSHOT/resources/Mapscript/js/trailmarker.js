/**
 * 
 */
try{
	function createTrail(Markerlist){
		data = Markerlist[0];
		if(index1==0){
			vectorSourceSingle.clear();
			createSingleMarkers(data,'green');
		}else{
			vectorSourceSingle.clear();
//			createSingleMarkers(data,'green');
				var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longit), Number(latt)]];
		
		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');
		
		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		       // var desc =
		        var desc =
   		    	 '<table class="popup"><tr>'+
		             '<td><div><table>' +
		             '<tr><td align=center class="tiphead" colspan="2"><font>Vehicle Details</font></td></tr>'+
		              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
		              '<tr ><td class="tiplabel">Vehicle No:</td><td>' + data.vehical_no + '</td></tr>' +
		              '<tr ><td class="tiplabel">Date Time:</td><td>' + data.datereceived + '</td></tr>' +
					  '<tr ><td class="tiplabel">Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
					  '<tr ><td class="tiplabel">Direction:</td><td> '+data.headings +' </td></tr>' +
					  '<tr ><td class="tiplabel">Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
					  '<tr ><td class="tiplabel">Ignition:</td><td>' + data.ignnumber + ' </td></tr>' ;
//						  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
////						  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//			              '</table></div></td><td></td>'+
//			              '</tr></table></div>';
		        var iconFeaturehistory = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([Number(longit), Number(latt)], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc
					});
		        iconFeaturehistory.setStyle(iconStylehistory);
		        source.addFeatures([feature,iconFeaturehistory]);
		        vector.setSource(source);
		    	vector.setStyle(styleFunction);
		    	createSingleMarkers(data,'green');
//		    	var extent1 = source.getExtent();
//				map.getView().fit(extent1, map.getSize()); 
//				map.getView().setZoom(15);
		}
		latt=data.latitude;
	    longit=data.longitude;
	    index1 = index1 + 1;
	}
		  
	
}catch(e){
	alert(e);
}
		        			