/**
 * 
 */

var zoomsource = new ol.source.Vector({wrapX: false});

      var zoomvector = new ol.layer.Vector({
        source: zoomsource,
        style : new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(255, 255, 255, 0.7)'
			}),
			stroke : new ol.style.Stroke({
				color : [ 0, 0, 255, 1 ],
				width : 3
			}),
			image : new ol.style.Circle({
				radius : 6,
				anchor : [ 0.5, 46 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 0.55,
				stroke : new ol.style.Stroke({
					color : 'red',
					width : 2
				}),
				fill : new ol.style.Fill({
					color : [ 201,188,179, 0.5 ]
				})
			})
		})
      });



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
      
      var routedrawsource = new ol.source.Vector({wrapX: false});

      var routedrawvector = new ol.layer.Vector({
        source: routedrawsource,
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
      
      //alert("colored");
      var savedrawsource = new ol.source.Vector({wrapX: false});
      var savedrawvector = new ol.layer.Vector({
        source: savedrawsource
      });
      
      var savedrawsheltersource = new ol.source.Vector({wrapX: false});
      var savedrawsheltervector = new ol.layer.Vector({
        source: savedrawsheltersource
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
			src : "resources/Mapscript/images/truck-green.png"
		}))
	});
	var iconStyleRed = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/truck-red.png"
		}))
	});
	var iconStyleYellow = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/truck-yellow.png"
		}))
	});
	
	var iconStyleRouteDev = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/placeholder.png"
		}))
	});
	var iconStyleOverspeed = new ol.style.Style({
		image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
		({
			anchor : [ 0.5, 0.5 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 2,
			src : "resources/Mapscript/images/overspeed.png"
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
				var dataveh = [];
				iconFeaturesgreen = [];
				   var ONE_HOUR = 60 * 60 * 1000;
		           var time=(new Date).getTime();
		    	   for(i=0;i<MarkerList.length;i++){
		    		  
		    		    data=MarkerList[i];
		    		    
			    		   if(data.status==true){
			    			   dataveh.push(data);
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
						 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
						 
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
//								  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//			              '</table></div></td><td></td>'+
//			              '</tr></table></div></td></tr></table>';
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
			               if(min>10){
			            		   iconFeature.setStyle(iconStyleRed);
			               }else{
				                  if(data.speed==0){
					            	iconFeature.setStyle(iconStyleYellow);
				                  }
				                  else{
					            	iconFeature.setStyle(iconStyleGreen);
				                  }
				              }
			            iconFeature.setId(data.vehical_no);
					    iconFeaturesgreen.push(iconFeature);
		    		   }
		       		}
		    	   vectorSourceGreen.addFeatures(iconFeaturesgreen);
				   vectorLayergreen.setSource(vectorSourceGreen);
		    	  
			}
			catch(e){alert(e);}
			return dataveh;
       }
    function removeclearById(rname){
    	vectorSourceGreen.removeFeature(vectorSourceGreen.getFeatureById(rname));
    }
    function createSingleMarkers(data,type){
		try{
			var desc;
			if(data.location!=null){
				 desc =  '<table class="popup"><tr>'+
	             '<td><div style="float:left; width:40%; border-right:thin solid #34495e;"><table>' +
	             '<tr><td align=center class="tiphead" colspan="2"><font>Truck Details</font></td></tr>'+
	              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
	              '<tr ><td class="tiplabel">Truck No:</td><td>' + data.vehical_no + '</td></tr>' +
	              '<tr ><td class="tiplabel">Date Time:</td><td>' + data.datereceived + '</td></tr>' +
				  '<tr ><td class="tiplabel">Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
				  '<tr ><td class="tiplabel">Direction:</td><td> '+data.headings +' </td></tr>' +
				  '<tr ><td class="tiplabel">Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
				 '<tr ><td class="tiplabel">Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
				 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
				 
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
////								  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//				              '</table></div></td><td></td>'+
//				              '</tr></table></div>';
			}else{
				 desc =  '<table class="popup"><tr>'+
		             '<td><div style="float:left; width:40%; border-right:thin solid #34495e;"><table>' +
		             '<tr><td align=center class="tiphead" colspan="2"><font>Truck Details</font></td></tr>'+
		              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
		              '<tr ><td class="tiplabel">Truck No:</td><td>' + data.vehical_no + '</td></tr>' +
		              '<tr ><td class="tiplabel">Date Time:</td><td>' + data.datereceived + '</td></tr>' +
					  '<tr ><td class="tiplabel">Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
					  '<tr ><td class="tiplabel">Direction:</td><td> '+data.headings +' </td></tr>' +
					  '<tr ><td class="tiplabel">Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
					 '<tr ><td class="tiplabel">Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
					 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
					 
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
		            		   iconFeature1.setStyle(iconStyleRed);
		               }else if(type=='yellow'){
			            		   iconFeature1.setStyle(iconStyleYellow);
			            }else if(type=='green'){
			            		   iconFeature1.setStyle(iconStyleGreen);
			            }else if(type=='stop'){
			                	  iconFeature1.setStyle(iconStyleStoppage);
			            }else if(type=='overspeed'){
			                	  iconFeature1.setStyle(iconStyleOverspeed);
			            }else if(type=='rdev'){
			            	iconFeature1.setStyle(iconStyleRouteDev);
			            	vectorSourceGreen.addFeatures([iconFeature1]);
			 			    vectorLayergreen.setSource(vectorSourceGreen);
			            }else if(type=='start'){
			            	iconFeature1.setStyle(iconStyleGreen);
			            	vectorSourceGreen.addFeatures([iconFeature1]);
			 			    vectorLayergreen.setSource(vectorSourceGreen);
			            }
		               
				    
	    	   vectorSourceSingle.addFeatures([iconFeature1]);
			   vectorLayersingle.setSource(vectorSourceSingle);
	    	  
		}
		catch(e){alert(e);}
   }
 
    function createHaultMarkers(MarkerList){
		try{
			var dataveh = [];
			iconFeaturesgreen = [];
			   var ONE_HOUR = 60 * 60 * 1000;
	           var time=(new Date).getTime();
	    	   for(i=0;i<MarkerList.length;i++){
	    		  
	    		    data=MarkerList[i];
		    		   if(data.status==true){
	    		    
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
					 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
					 
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
//							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//		              '</table></div></td><td></td>'+
//		              '</tr></table></div></td></tr></table>';
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
		               if(min>10){
		            		  
		               }else{
			                  if(data.speed==0){
				            	iconFeature.setStyle(iconStyleYellow);
				            	iconFeature.setId(data.vehical_no);
							    iconFeaturesgreen.push(iconFeature);
							    dataveh.push(data);
			                  }
			                  
			              }
		            
	    		   }
	       		}
	    	   vectorSourceGreen.addFeatures(iconFeaturesgreen);
			   vectorLayergreen.setSource(vectorSourceGreen);
	    	  
		}
		catch(e){alert(e);}
		return dataveh;
   }
   // alert("hsdghj");
    
    function createRunningMarkers(MarkerList){
		try{
			var dataveh = [];
			iconFeaturesgreen = [];
			   var ONE_HOUR = 60 * 60 * 1000;
	           var time=(new Date).getTime();
	    	   for(i=0;i<MarkerList.length;i++){
	    		  
	    		    data=MarkerList[i];
		    		   if(data.status==true){
	    		    
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
					 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
					 
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
//							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//		              '</table></div></td><td></td>'+
//		              '</tr></table></div></td></tr></table>';
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
		               if(min>10){
		            		   
		               }else{
			                  if(data.speed==0){
				            	
			                  }
			                  else{
				            	iconFeature.setStyle(iconStyleGreen);
				            	iconFeature.setId(data.vehical_no);
							    iconFeaturesgreen.push(iconFeature);
							    dataveh.push(data);
			                  }
			              }
		            
	    		   }
	       		}
	    	   vectorSourceGreen.addFeatures(iconFeaturesgreen);
			   vectorLayergreen.setSource(vectorSourceGreen);
	    	  
		}
		catch(e){alert(e);}
		return dataveh;
   }
    
    
    function createStopMarkers(MarkerList){
		try{
			var dataveh = [];
			iconFeaturesgreen = [];
			   var ONE_HOUR = 60 * 60 * 1000;
	           var time=(new Date).getTime();
	    	   for(i=0;i<MarkerList.length;i++){
	    		  
	    		    data=MarkerList[i];
		    		   if(data.status==true){
	    		    
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
					 '<tr ><td class="tiplabel">Company Name:</td><td>' + data.company + ' </td></tr>' +
					 
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
//							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
//		              '</table></div></td><td></td>'+
//		              '</tr></table></div></td></tr></table>';
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
		               if(min>10){
		            		   iconFeature.setStyle(iconStyleRed);
		            		   iconFeature.setId(data.vehical_no);
		   				       iconFeaturesgreen.push(iconFeature);
		   				       dataveh.push(data);
		               }
	    		   }
	       		}
	    	   vectorSourceGreen.addFeatures(iconFeaturesgreen);
			   vectorLayergreen.setSource(vectorSourceGreen);
	    	  
		}
		catch(e){alert(e);}
		return dataveh;
   }
  
