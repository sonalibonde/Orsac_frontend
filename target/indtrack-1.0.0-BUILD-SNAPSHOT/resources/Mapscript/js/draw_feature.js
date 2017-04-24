/**
 * 
 */

//	alert("in draw source 33");
      var typeSelect = document.getElementById('type');

      var draw; // global so we can remove it later
      function addInteraction() {
        var value = typeSelect.value;
        if (value !== 'None') {
          var geometryFunction, maxPoints;
          if (value === 'Square') {
            value = 'Circle';
            geometryFunction = ol.interaction.Draw.createRegularPolygon(4);
          } else if (value === 'Box') {
            value = 'LineString';
            maxPoints = 2;
            geometryFunction = function(coordinates, geometry) {
              if (!geometry) {
                geometry = new ol.geom.Polygon(null);
              }
              var start = coordinates[0];
              var end = coordinates[1];
              geometry.setCoordinates([
                [start, [start[0], end[1]], end, [end[0], start[1]], start]
              ]);
              return geometry;
            };
          }
          draw = new ol.interaction.Draw({
            source: drawsource,
            type: /** @type {ol.geom.GeometryType} */ (value),
            geometryFunction: geometryFunction,
            maxPoints: maxPoints
          });
          map.addInteraction(draw);
        }
      }


      /**
       * Handle change event.
       */
      typeSelect.onchange = function() {
        map.removeInteraction(draw);
        addInteraction();
      };
      
      
      var typeSelectroute = document.getElementById('typeroute');

      var draw1; // global so we can remove it later
      function addInteractionroute() {
        var value = typeSelectroute.value;
        if (value !== 'None') {
          var geometryFunction, maxPoints;
          if (value === 'Square') {
            value = 'Circle';
            geometryFunction = ol.interaction.Draw.createRegularPolygon(4);
          } else if (value === 'Box') {
            value = 'LineString';
            maxPoints = 2;
            geometryFunction = function(coordinates, geometry) {
              if (!geometry) {
                geometry = new ol.geom.Polygon(null);
              }
              var start = coordinates[0];
              var end = coordinates[1];
              geometry.setCoordinates([
                [start, [start[0], end[1]], end, [end[0], start[1]], start]
              ]);
              return geometry;
            };
          }
          draw1 = new ol.interaction.Draw({
            source: routedrawsource,
            type: /** @type {ol.geom.GeometryType} */ (value),
            geometryFunction: geometryFunction,
            maxPoints: maxPoints
          });
          map.addInteraction(draw1);
        }
      }


      /**
       * Handle change event.
       */
      typeSelectroute.onchange = function() {
        map.removeInteraction(draw1);
        addInteractionroute();
      };
      
      
      function getDrawnFeatureValue(){
    	  var GEOJSON_PARSER = new ol.format.GeoJSON();
		  var linejson = GEOJSON_PARSER.writeFeatures(drawsource.getFeatures());
		  return linejson;
      }
      
      function getRouteFeatureValue(){
    	  var GEOJSON_PARSER = new ol.format.GeoJSON();
    	 // alert(source.getFeatures().length);
		  var linejson = GEOJSON_PARSER.writeFeatures(routedrawsource.getFeatures());
		  return linejson;
      }
      $("#deletepoicheck").click(function(){
    	  if(document.getElementById("deletepoicheck").checked){
	    	  document.getElementById("upname").hidden = true;
	    	  document.getElementById("uptype").hidden = true;
	    	  document.getElementById("upsave").hidden = true;
	    	  document.getElementById("updel").hidden = false;
    	  }else{
    		  document.getElementById("upname").hidden = false;
	    	  document.getElementById("uptype").hidden = false;
	    	  document.getElementById("upsave").hidden = false;
	    	  document.getElementById("updel").hidden = true
    	  }
	    });
      
      $("#clearfeature").click(function(){
    	  drawsource.clear();
//    	  savedrawsource.clear();
    	  routedrawsource.clear();
	    });
      
      $("#clearfeature2").click(function(){
    	  drawsource.clear();
//    	  savedrawsource.clear();
    	  routedrawsource.clear();
	    });
      var stylePOIFlag = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/flag.png"
		    }))
		});
      var stylePOIAirport = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/airport.png"
		    }))
		});
      var stylePOIBar = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/bar.png"
		    }))
		});
      var stylePOIBuilding = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/building.png"
		    }))
		});
      var stylePOIBusstop = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/busstop.png"
		    }))
		});
      var stylePOICoffeehouse = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/coffeehouse.png"
		    }))
		});
      var stylePOIEducation = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/education.png"
		    }))
		});
      var stylePOIGarden = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/garden.png"
		    }))
		});
      var stylePOIHospitals = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/hospitals.png"
		    }))
		});
      var stylePOIMarket = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/market.png"
		    }))
		});
      var stylePOIOffice = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/office.png"
		    }))
		});
      var stylePOIPostoffice = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/postoffice.png"
		    }))
		});
      var stylePOIRailway = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/railway.png"
		    }))
		});
      var stylePOIRestaurant = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/restaurant.png"
		    }))
		});
      var stylePOITemple = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/temple.png"
		    }))
		});
      var stylePOIUniversity = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/university.png"
		    }))
		});
      var stylePOIWater = new ol.style.Style({
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/water.png"
		    }))
		});
      var styleRouteBlue = new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(255, 255, 255, 0.7)'
			}),
			stroke : new ol.style.Stroke({
				color : 'blue',
				width : 10
			}),
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/bus-stop.png"
		    })),
		    zIndex: 1
		});
      //alert("k");
      var styleRouteGreen = new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(255, 255, 255, 0.7)'
			}),
			stroke : new ol.style.Stroke({
				color : 'green',
				width : 10
			}),
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/bus-stop.png"
		    })),
		    zIndex: 1
		});
     // alert("in draw");
      var styleRoutePink = new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(255, 255, 255, 0.7)'
			}),
			stroke : new ol.style.Stroke({
				color : 'rgba(255, 20, 147, 1)',
				width : 10,
				
			}),
			image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
			({
				anchor : [ 0.5, 0.5 ],
				anchorXUnits : 'fraction',
				anchorYUnits : 'pixels',
				opacity : 2,
				src : "resources/Mapscript/images/bus-stop.png"
		    })),
		    zIndex: 1
		});
      
      //alert("hello5");
//      alert("in draw");
      var styleGeogence = new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(128, 0, 128, 0.1)'
			}),
			stroke : new ol.style.Stroke({
				color : 'rgba(128, 0, 128, 0.8)',
				width : 2
			}),
			image: new ol.style.Circle({
	            radius: 5,
	            fill: new ol.style.Fill({
	              color: '#ffcc33'
	            })
	         })
		});
//      alert("in draw 3");
      try{
      function showFeature(geojsonObject, type) {
			try {
				for(i=0;i<geojsonObject.length;i++){
					
					var feature = (new ol.format.GeoJSON())
					.readFeatures(geojsonObject[i].coord);
						//alert(feature[0].get('geometry'));
						var feature1 = new ol.Feature({
						  geometry: feature[0].get('geometry'),
						  text: geojsonObject[i].geofencename
						});
						
						feature1.setId(geojsonObject[i].geofencename);
						var shadowStyle;
//						alert(geojsonObject[i].rtype);
						if(geojsonObject[i].rtype == '1'){
						shadowStyle = new ol.style.Style({
					          stroke: new ol.style.Stroke({
					            color: 'white',
					            width: 3,
					            lineDash: [5,5]
					          }),
//					          text: new ol.style.Text({
//						             textAlign: 'Center',
//						             textBaseline: 'Middle',
//						             font: 'Arial',
//						             text: feature1.get('text') ,
//						            // fill: new ol.style.Fill({color: 'white'}),
//						             stroke: new ol.style.Stroke({color: '#FF960B', width: '1'}),
//						             offsetX: -5,
//						             offsetY: -15,
//						             rotation: '150'
//						        }),
					          zIndex: 2
					        });
						}else{
							shadowStyle = new ol.style.Style({
						          stroke: new ol.style.Stroke({
						            color: 'white',
						            width: 3,
						            lineDash: [5,5]
						          }),
//						          text: new ol.style.Text({
//							             textAlign: 'Center',
//							             textBaseline: 'Middle',
//							             font: 'Arial',
//							             text: feature1.get('text') ,
//							            // fill: new ol.style.Fill({color: 'white'}),
//							             stroke: new ol.style.Stroke({color: '#FF960B', width: '1'}),
//							             offsetX: -25,
//							             offsetY: -15,
//							             rotation: '150'
//							        }),
						          zIndex: 2
						        });
						}
//					alert(type);
					if(type=='route'){
						//alert("in if");
						if(feature1.getId().toLowerCase().includes('corridor1')){
							feature1.setStyle([styleRouteGreen, shadowStyle]);
						}else if(feature1.getId().toLowerCase().includes('corridor2')){
							feature1.setStyle([styleRouteBlue, shadowStyle]);
						}else if(feature1.getId().toLowerCase().includes('corridor3')){
							feature1.setStyle([styleRoutePink, shadowStyle]);
						}else{
							feature1.setStyle([styleRouteBlue, shadowStyle]);
						}
						
					}else{
						//alert("in else");
						feature1.setStyle(styleGeogence);
					}
					
						//alert(feature1.getId());
					savedrawsource.addFeature(feature1);
				}
				
			} catch (e) {
				alert(e);
			}
		}
      
      }catch(e){
    	  alert(e);
      }
      
      function processRoute(rname){
    	  try{
    		  	zoomsource.clear();
    		  	zoomsource.addFeature(savedrawsource.getFeatureById(rname));
				var extent1 = zoomsource.getExtent();
				map.getView().fit(extent1, map.getSize()); 
    	  }catch(e){
    		  alert(e);
    	  }
      }

      function showShelters(MarkerList) {
			try {
				var i = 0;
//				alert("length = "+MarkerList.length)
				 for(i = 0;i<MarkerList.length;i++){
                     data = MarkerList[i];
					  var feature1 = new ol.Feature({
						geometry: new ol.geom.Point(ol.proj.transform([Number(data.longitude), Number(data.latitude)], 'EPSG:4326',     
			  			  'EPSG:3857')),
			  			text:  data.sheltername,
			  			 name:  '<table class="popupback"> <tr>' +
			             '<td><div><table class="popup">' +
			             '<tr><td align=center class="tiphead" colspan="2">Mine Details</td></tr>'+
			              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
			              '<tr><td class="tiplabel">Name:</td><td>' + data.sheltername + '</td></tr>' +
			             // '<tr ><td class="tiplabel">Sheltername Name:</td><td>' + data.sheltername + '</td></tr>' +
			             // '<tr ><td class="tiplabel">Status</td><td>Assigned</td></tr>' +
			              '</table></div></td><td></td>'+
			              '</tr></table></div>'
						});
					// alert(data.longitude+" "+data.latitude);
					 // styleshelter.getText().setText(resolution < 5000 ? 'hello' : '');
					  try{
						  var view = map.getView();
						  var coords = view.getCenter();
						  var resolution = view.getResolution(); 
						 // alert(data.sheltercode);
						  if(data.sheltercode=='1'){
						  var styleshelter = (new ol.style.Style({
							image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
							({
								anchor : [ 0.5, 0.5 ],
								anchorXUnits : 'fraction',
								anchorYUnits : 'pixels',
								opacity : 2,
								src : "resources/Mapscript/images/circle_green.png"
						    }))
//						    text: new ol.style.Text({
//					             textAlign: 'Center',
//					             textBaseline: 'Middle',
//					             font: 'Arial',
//					             text: feature1.get('text') ,
//					            // fill: new ol.style.Fill({color: 'white'}),
//					             stroke: new ol.style.Stroke({color: '#B899F7', width: '2'}),
//					             offsetX: -5,
//					             offsetY: -15,
//					             rotation: '0'
//					        })
						}));
					 feature1.setStyle(styleshelter);
					}else{
						 var styleshelter = (new ol.style.Style({
								image : new ol.style.Icon(/** @type {olx.style.IconOptions} */
								({
									anchor : [ 0.5, 0.5 ],
									anchorXUnits : 'fraction',
									anchorYUnits : 'pixels',
									opacity : 2,
									src : "resources/Mapscript/images/circle_red.png"
							    }))
//							    text: new ol.style.Text({
//						             textAlign: 'Center',
//						             textBaseline: 'Middle',
//						             font: 'Arial',
//						             text: feature1.get('text') ,
//						            // fill: new ol.style.Fill({color: 'white'}),
//						             stroke: new ol.style.Stroke({color: '#B899F7', width: '2'}),
//						             offsetX: -5,
//						             offsetY: -15,
//						             rotation: '0'
//						        })
							}));
						 feature1.setStyle(styleshelter);
					}
//					 feature1.setStyle(function(feature, resolution) {
//						//  alert("in = "+styleshelter[''+i+'']);
//						  styleshelter[''+i+''].getText().setText(feature < 15 ? feature1.get('text') : '');
//						    return styleshelter[''+i+''];
//					  });
//					  feature1.setStyle(createPolygonStyleFunction());
					 savedrawsheltersource.addFeature(feature1);
//					 alert(savedrawsheltersource);
					  }catch(e){
						  alert(e);
					  }
                   }
				
			} catch (e) {
				alert(e);
			}
		}

      function showPOI(MarkerList){
    	  try {
				var i = 0;
				 for(i = 0;i<MarkerList.length;i++){
                   data = MarkerList[i];
					  var feature1 = new ol.Feature({
						geometry: new ol.geom.Point(ol.proj.transform([Number(data.longitude), Number(data.latitude)], 'EPSG:4326',     
			  			  'EPSG:3857')),
						  name:  '<table class="popupback"> <tr>' +
				             '<td><div><table class="popup">' +
				             '<tr><td align=center class="tiphead" colspan="2">POI Details</td></tr>'+
				              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
				              '<tr ><td class="tiplabel">Name:</td><td>' + data.poiname + '</td></tr>' +
				             // '<tr ><td class="tiplabel">Sheltername Name:</td><td>' + data.sheltername + '</td></tr>' +
				             // '<tr ><td class="tiplabel">Status</td><td>Assigned</td></tr>' +
				              '</table></div></td><td></td>'+
				              '</tr></table></div>'
						});
					  if(data.poitype=='Airport'){
						  feature1.setStyle(stylePOIAirport);
					  }
					  if(data.poitype=='Bar'){
						  feature1.setStyle(stylePOIBar);
					  }
					  if(data.poitype=='Bulding'){
						  feature1.setStyle(stylePOIBulding);
					  }
					  if(data.poitype=='Busstop'){
						  feature1.setStyle(stylePOIBusstop);
					  }
					  if(data.poitype=='CoffeeHouse'){
						  feature1.setStyle(stylePOICoffeehouse);
					  }
					  if(data.poitype=='Education'){
						  feature1.setStyle(stylePOIEducation);
					  }
					  if(data.poitype=='Flag'){
						  feature1.setStyle(stylePOIFlag);
					  }
					  if(data.poitype=='Garden'){
						  feature1.setStyle(stylePOIGarden);
					  }
					  if(data.poitype=='Hospital'){
						  feature1.setStyle(stylePOIHospitals);
					  }
					  if(data.poitype=='Market'){
						  feature1.setStyle(stylePOIMarket);
					  }
					  if(data.poitype=='Office'){
						  feature1.setStyle(stylePOIOffice);
					  }
					  if(data.poitype=='PostOffice'){
						  feature1.setStyle(stylePOIPostoffice);
					  }
					  if(data.poitype=='Railway'){
						  feature1.setStyle(stylePOIRailway);
					  }
					  if(data.poitype=='Restaurant'){
						  feature1.setStyle(stylePOIRestaurant);
					  }
					  if(data.poitype=='Temple'){
						  feature1.setStyle(stylePOITemple);
					  }
					  if(data.poitype=='University'){
						  feature1.setStyle(stylePOIUniversity);
					  }
					  if(data.poitype=='Water'){
						  feature1.setStyle(stylePOIWater);
					  }
					  savedrawsource.addFeature(feature1);
                 }
				
			} catch (e) {
				alert(e);
			}
  	}

