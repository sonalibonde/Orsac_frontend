/**
 * 
 */
alert("in all marker");
var drawsource = new ol.source.Vector({wrapX: false});

      var drawvector = new ol.layer.Vector({
        source: drawsource,
        style: new ol.style.Style({
          fill: new ol.style.Fill({
            color: 'rgba(255, 255, 255, 0.7)'
          }),
          stroke: new ol.style.Stroke({
            color: '#ffcc33',
            width: 2
          }),
          image: new ol.style.Circle({
            radius: 5,
            fill: new ol.style.Fill({
              color: '#ffcc33'
            })
          })
        })
      });
      
      
      
      var savedrawsource = new ol.source.Vector({wrapX: false});

      var savedrawvector = new ol.layer.Vector({
        source: savedrawsource,
        style: new ol.style.Style({
          fill: new ol.style.Fill({
            color: 'rgba(255, 255, 255, 0.7)'
          }),
          stroke: new ol.style.Stroke({
            color: '#ffcc33',
            width: 2
          }),
          image: new ol.style.Circle({
            radius: 5,
            fill: new ol.style.Fill({
              color: '#ffcc33'
            })
          })
        })
      });
      
var iconFeaturesgreen=[];
	var iconFeature;
	var iconStyleGreen = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/car-red.png"
		}))
	});
	var iconStyleRed = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/car-red.png"
		}))
	});
	var iconStyleYellow = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/car-red.png"
		}))
	});
	var iconStyleGreenbus = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/SchoolBus.png"
		}))
	});
	var iconStyleRedbus = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/SchoolBus.png"
		}))
	});
	var iconStyleYellowbus = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/SchoolBus.png"
		}))
	}); 
        var iconStyleGreenAmbulance = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/ambulance.png"
		}))
	});
	var iconStyleRedAmbulance = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/ambulance.png"
		}))
	});
	var iconStyleYellowAmbulance = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/ambulance.png"
		}))
	});
	var iconStyleOverspeed = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/overspeed.gif"
		}))
	});
	var iconStyleStoppage = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/stoppage.png"
		}))
	});
	var vectorSourceGreen = new ol.source.Vector({
	});
	
	var vectorLayergreen = new ol.layer.Vector({
	});
	
	var vectorSourceSingle = new ol.source.Vector({
	});
	
	var vectorLayersingle = new ol.layer.Vector({
	});
    function createAllMarkers(MarkerList){
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
								  '<tr class="tiplabel"><td >Direction:</td><td> '+data.headings +' </td></tr>' +
								  '<tr class="tiplabel"><td >Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
								  '<tr class="tiplabel"><td >Ignition:</td><td>' + data.ignnumber + ' </td></tr>' ;
//								  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
//// 								  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//					              '</table></div></td><td></td>'+
//					              '</tr></table></div>';
		    		    var lat= Number(data.latitude);
		    		    var longi=Number(data.longitude);
					    iconFeature = new ol.Feature({
						  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
						  'EPSG:3857')),
						  name: desc,
						  population: 4000,
						  rainfall: 500
						});
					    var newdate = new Date(data.trackdate);
					  
			               var hrs=time-newdate.getTime();
			               var mins=hrs/1000;
			               var min=mins/60;
			               if(min>60){
			            	   if(data.vtype.includes('Bus')){
			            		   iconFeature.setStyle(iconStyleRedbus);
			            	   }else if(data.vtype.includes('Ambulance')){
			            		   iconFeature.setStyle(iconStyleRedAmbulance);
			            	   } else{
			            		   iconFeature.setStyle(iconStyleRed);
			            	   }
			               }else{
				                  if(data.speed==0){
				                	  if(data.vtype.includes('Bus')){
				                		  iconFeature.setStyle(iconStyleYellowbus);
					            	   }else if(data.vtype.includes('Ambulance')){
					            		   iconFeature.setStyle(iconStyleYellowAmbulance);
					            	   } else{
					            		   iconFeature.setStyle(iconStyleYellow);
					            	   }
				                  }
				                  else{
				                	  if(data.vtype.includes('Bus')){
				                		  iconFeature.setStyle(iconStyleGreenbus);
					            	   }else if(data.vtype.includes('Ambulance')){
					            		   iconFeature.setStyle(iconStyleGreenAmbulance);
					            	   } else{
					            		   iconFeature.setStyle(iconStyleGreen);
					            	   }
				                  }
				              }
					    iconFeaturesgreen.push(iconFeature);
		       		}
		    	   vectorSourceGreen.addFeatures(iconFeaturesgreen);
				   vectorLayergreen.setSource(vectorSourceGreen);
		    	  
			}
			catch(e){alert(e);}
       }
    
    function createSingleMarkers(data,type){
		try{
			var desc;
			if(data.location!=null){
	    		     desc =
			    		     '<table class="popupback"> <tr>'+
				             '<td><div><table class="popup">' +
				             '<tr><td align=center class="tiphead" colspan="2"><font>Vehicle Details</font></td></tr>'+
				              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
				              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
				              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
							  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
							  '<tr class="tiplabel"><td >Direction:</td><td> '+data.headings +' </td></tr>' +
							  '<tr class="tiplabel"><td >Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
							  '<tr class="tiplabel"><td >Ignition:</td><td>' + data.ignnumber + ' </td></tr>' ;
//							  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
////								  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//				              '</table></div></td><td></td>'+
//				              '</tr></table></div>';
			}else{
				desc =
	    		     '<table class="popupback"> <tr>'+
		             '<td><div><table class="popup">' +
		             '<tr><td align=center class="tiphead" colspan="2"><font>Vehicle Details</font></td></tr>'+
		              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
		              '<tr class="tiplabel"><td >VehicleNo:</td><td>' + data.vehical_no + '</td></tr>' +
		              '<tr class="tiplabel"><td >Date Time:</td><td>' + data.datereceived + '</td></tr>' +
					  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
					  '<tr class="tiplabel"><td >Direction:</td><td> '+data.headings +' </td></tr>' +
					  '<tr class="tiplabel"><td >Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
					  '<tr class="tiplabel"><td >Ignition:</td><td>' + data.ignnumber + ' </td></tr>' ;
//						  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//		              '</table></div></td><td></td>'+
//		              '</tr></table></div>';
			}
	    		    var lat= Number(data.latitude);
	    		    var longi=Number(data.longitude);
				    var iconFeature1 = new ol.Feature({
					  geometry: new ol.geom.Point(ol.proj.transform([longi, lat], 'EPSG:4326',     
					  'EPSG:3857')),
					  name: desc,
					  population: 4000,
					  rainfall: 500
					});
				  // alert(data.vtype+" "+type);
		               if(type=='red'){
		            	   if(data.vtype.includes('Bus')){
		            		   iconFeature1.setStyle(iconStyleRedbus);
		            	   }else if(data.vtype.includes('Ambulance')){
		            		   iconFeature1.setStyle(iconStyleRedAmbulance);
		            	   } else{
		            		   iconFeature1.setStyle(iconStyleRed);
		            	   }
		               }else if(type=='yellow'){
		            	   if(data.vtype.includes('Bus')){
		                		  iconFeature1.setStyle(iconStyleYellowbus);
			            	   }else if(data.vtype.includes('Ambulance')){
			            		   iconFeature1.setStyle(iconStyleYellowAmbulance);
			            	   } else{
			            		   iconFeature1.setStyle(iconStyleYellow);
			            	   }
			            }else if(type=='green'){
			            	if(data.vtype.includes('Bus')){
			            		//alert("in");
		                		  iconFeature1.setStyle(iconStyleGreenbus);
			            	   }else if(data.vtype.includes('Ambulance')){
			            		   iconFeature1.setStyle(iconStyleGreenAmbulance);
			            	   } else{
			            		   iconFeature1.setStyle(iconStyleGreen);
			            	   }
			            }else if(type=='stop'){
			                	  iconFeature1.setStyle(iconStyleStoppage);
			            }else if(type=='overspeed'){
			                	  iconFeature1.setStyle(iconStyleOverspeed);
			            }
		               
	    	   vectorSourceSingle.addFeatures([iconFeature1]);
			   vectorLayersingle.setSource(vectorSourceSingle);
	    	  
		}
		catch(e){alert(e);}
   }
    
  
