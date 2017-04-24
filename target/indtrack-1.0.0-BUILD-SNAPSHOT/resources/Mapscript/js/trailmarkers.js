/**
 * 
 */
try{
	//alert("in trial 6");
	function createTrail(Markerlist){
			var type;
			vectorSourceSingle.clear();
		    data = Markerlist[0];
		    var ONE_HOUR = 60 * 60 * 1000;
	        var time=(new Date).getTime();
			try{
		    var newdate = new Date(data.trackdate);
            var hrs=time-newdate.getTime();
            var mins=hrs/1000;
            var min=mins/60;
            if(min>60){
         	  // alert("resources/Mapscript/images/vehicle_icons/RED"+data.icon+".png");
         	   type = 'red';
            }else{
	                  if(data.speed==0){
	                	  type = 'yellow';
	                  }
	                  else{
	                	  type = 'green';
	                  }
	              }
           // alert(type);
			}catch(e){
				//alert(e);
			}
		if(index1==0){
			createSingleMarkers(data,type);
		}else{
				var coords = [[Number(data.longitude), Number(data.latitude)], [Number(longit), Number(latt)]];
		
		        var lineString = new ol.geom.LineString(coords);
		        lineString.transform('EPSG:4326', 'EPSG:3857');
		
		        var feature = new ol.Feature({
		            geometry: lineString
		        });
		      
		        source.addFeatures([feature]);
		        vector.setSource(source);
		    	vector.setStyle(styleFunction);
		    	createSingleMarkers(data,type);
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
		        			