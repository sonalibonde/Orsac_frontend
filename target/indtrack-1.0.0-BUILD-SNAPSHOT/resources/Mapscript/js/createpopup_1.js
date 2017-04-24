//alert("in popup 8");
var index = 0;
var plon,plat;
function getdata(){
	var name = document.getElementById('pname').value;
	$.ajax({
        url: "http://68.64.172.10:9090/nrdamapwebservice/rest/CallService/poiinsert?poiname="+name+
        "&latitude="+plat+"&longitude="+plon
    }).then(function(data) {
    	alert("POI Added")
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
										if (feature.get('name')) {
						if (feature) {
							var geometry = feature.getGeometry();
							var coord = geometry.getCoordinates();
// 							alert(coord[0]);
							content.innerHTML = feature.get('name');
							if(coord.length > 2){
								popup.setPosition(coord[0]);
							} else{
							 popup.setPosition(coord);
							}
						} else {
							
						}
					}
				});
				
				
	