/**
 * 
 */

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
      
      
      function getDrawnFeatureValue(){
    	  var GEOJSON_PARSER = new ol.format.GeoJSON();
		  var linejson = GEOJSON_PARSER.writeFeatures(drawsource.getFeatures());
		  return linejson;
      }
      
      $("#clearfeature").click(function(){
    	  drawsource.clear();
    	  savedrawsource.clear();
	    });
      
      
      function showFeature(geojsonObject) {
			try {
				for(i=0;i<geojsonObject.length;i++){
					
					var feature = (new ol.format.GeoJSON())
					.readFeatures(geojsonObject[i].coord);
						
						var feature1 = new ol.Feature({
						  geometry: feature[0].get('geometry'),
						  name:  '<table class="popupback"> <tr>' +
				             '<td><div><table class="popup">' +
				             '<tr><td align=center class="tiphead" colspan="2">Geofence Details</td></tr>'+
				              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
				              '<tr class="tiplabel"><td >Rote Name:</td><td>' + geojsonObject[i].geofencename + '</td></tr>' +
				              '</table></div></td><td></td>'+
				              '</tr></table></div>'
						});
					feature1.setId(geojsonObject[i].geofencename);
					savedrawsource.addFeature(feature1);
				}
				
			} catch (e) {
				alert(e);
			}
		}
      
      var geoint = setInterval(function () {
    	  try{
//    		  alert("in");
			if(drawsource.getFeatures()!=''){
				map.removeInteraction(draw);
				document.getElementById("clearfeature").hidden=false;
				document.getElementById("featureinfo12").hidden=false;
			}else{
				document.getElementById("clearfeature").hidden=true;
				document.getElementById("featureinfo12").hidden=true;
			}
    	  }catch(e){
    		  alert(e); 
    	  }
		},10);
