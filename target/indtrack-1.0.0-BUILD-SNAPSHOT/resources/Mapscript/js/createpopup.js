//alert("in popup")
var index = 0;
var plon,plat;
function getdata(){
	var name = document.getElementById('pname').value;
	var e = document.getElementById("ptype");
	var ptype = e.options[e.selectedIndex].text;
	$.ajax({
        url: "http://209.190.15.26/orsacwebservice/rest/CallService/poiinsert?poiname="+name+
        "&latitude="+plat+"&longitude="+plon+"&poitype="+ptype
    }).then(function(data) {
    	alert("POI Added")
    	$.ajax({
            url: "http://209.190.15.26/orsacwebservice/rest/CallService/poidetails?companyid=30001&loginid=10001"
        }).then(function(data) {
        	//$scope.shelterassignlist = data;
    				showPOI(data);
        });
    });
    

	//content.removeChild(document.getElementById('pdiv'));
	index = 0;
	popup.setPosition(undefined);
	closer.blur();
}
function closepop(){
	index = 0;
	popup.setPosition(undefined);
	closer.blur();
}
var container = document.getElementById('popup');
var content = document.getElementById('popup-content');
var closer = document.getElementById('popup-closer');
closer.onclick = function() {
	index = 0;
	popup.setPosition(undefined);
	closer.blur();
	return false;
};
			var element = document.getElementById('popup');

				
			var popup = new ol.Overlay({
					element : element,
					autoPan : true,
					autoPanAnimation : {
						duration : 250
					},
					positioning : 'bottom-center',
					stopEvent : false
				});
				map.addOverlay(popup);

				// display popup on click
				
				map.on('click', function(evt) {
					var feature = map.forEachFeatureAtPixel(evt.pixel,
							function(feature, layer) {
								return feature;

							});
					if(feature==null && index == 0 && kpoi == "true"){
						index = index + 1;
						 var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
						  plon = lonlat[0];
						  plat = lonlat[1];
						  var coord = ol.proj.transform([plon, plat], 'EPSG:4326', 'EPSG:3857');
						  content.innerHTML = '<div id="pdiv"><table class="popupback"> <tr>'+
				             '<td><div><table class="popup">' +
				             '<tr><td align=center class="tiphead" colspan="2"><font>Add POI</font></td></tr>'+
				              '<tr><td colspan="2" style="padding:0px; height:2px;background-color:#007ee9;"></td></tr>' +
				              '<tr class="tiplabel"><td >POI Name:</td><td><input type="text" id="pname" autofocus></td></tr>' +
				              '<tr class="tiplabel"><td >POI Type:</td><td><select id="ptype" class="pchange" >'+
				              '<option>Airport</option>'+ '<option>Bar</option>'+
				              '<option>Building</option>'+ '<option>Busstop</option>'+
				              '<option>CoffeeHouse</option>'+ '<option>Education</option>'+
				              '<option>Flag</option>'+ '<option>Garden</option>'+
				              '<option>Hospital</option>'+ '<option>Market</option>'+
				              '<option>Office</option>'+ '<option>PostOffice</option>'+
				              '<option>Railway</option>'+ '<option>Restaurant</option>'+
				              '<option>Temple</option>'+ '<option>University</option>'+
				              '<option>Water</option>'+ 
				              '</select></td></tr>' +
				              '<tr class="tiplabel"><td ><button class="btn btn-success" onclick="getdata()">Add</button></td><td><button class="btn btn-danger" onclick="closepop()">Cancel</button></td></tr>' +
//							  '<tr class="tiplabel"><td >Speed:</td><td>' + data.speed + ' Km/Hr</td></tr>' +
//							  '<tr class="tiplabel"><td >Direction:</td><td> '+data.headings +' </td></tr>' +
//							  '<tr class="tiplabel"><td >Gps Status:</td><td>' + data.gpsstatus + '</td></tr>' +
//							  '<tr class="tiplabel"><td >Ignition:</td><td>' + data.ignnumber + ' </td></tr>' +
//							  '<tr class="tiplabel"><td >Location:</td><td> '+data.location +' </td></tr>' +
//							  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
				              '</table></div></td><td></td>'+
				              '</tr></table></div>';
						  popup.setPosition(coord);
					}
					if (feature.get('name')) {
						if (feature) {
							var geometry = feature.getGeometry();
							var coord = geometry.getCoordinates();
							var lonlat = ol.proj.transform(coord, 'EPSG:3857', 'EPSG:4326');
							  var lon = lonlat[0];
							  var lat = lonlat[1];
							$.ajax({
						        url: "http://209.190.15.26/orsacwebservice/rest/CallService/getlocation?lat="+lat+"&lon="+lon
						    }).then(function(data) {
						    	content.innerHTML = feature.get('name') +
								 '<tr><td class="tiplabel">Location:</td><td> '+data.location +' </td></tr>' +
//								  '<tr><td >Depot Name:</td><td>'+ data.depotname+' </td></tr>' +
					              '</table></div></td><td></td>'+
					              '</tr></table></div>';
								if(coord.length > 2){
									popup.setPosition(coord[0]);
								} else{
								 popup.setPosition(coord);
								}
						    });
 							
						} else {
							
						}
					}
				});
				
				
	
