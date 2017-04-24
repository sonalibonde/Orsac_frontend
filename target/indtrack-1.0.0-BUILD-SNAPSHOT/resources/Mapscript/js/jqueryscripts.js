/**
 * 
 */
//alert("jquery")
try{
	var route=0,geof=0;
 try{
	 var layers =[];
	 var over = '<div id="overlay"></div>';
	    $(over).appendTo('body');
	    try{
	    $(function() { 
//	    	alert(layers.length);
			var checkedLayer = $('#layerswitcher input[name=layer]:checked').val();
			for (var i = 0, ii = layers.length; i < ii; ++i) {
				layers[i].setVisible(i==checkedLayer);
				 
			}
		});
			
		$("#layerswitcher input[name=layer]").change(function() { 
//			alert(layers.length);
			var checkedLayer = $('#layerswitcher input[name=layer]:checked').val();
			for (var i = 0, ii = layers.length; i < ii; ++i) {
				layers[i].setVisible(i==checkedLayer);
							
				}
		 });
		try{
        	var geoint = setInterval(function () {
    	    	
    			if(drawsource.getFeatures()!=''){
    				map.removeInteraction(draw);
    				document.getElementById("clearfeature").disabled=false;
    				document.getElementById("clearfeature2").disabled=false;
    				document.getElementById("featureinfo12").disabled=false;
//    					addInteraction();
    			}else{
    				document.getElementById("clearfeature").disabled=true;
    				document.getElementById("clearfeature2").disabled=true;
    				document.getElementById("featureinfo12").disabled=true;
    			}
    			
    			
    			if(routedrawsource.getFeatures()!=''){
    				map.removeInteraction(draw);
    				document.getElementById("clearfeature").disabled=false;
    				document.getElementById("clearfeature2").disabled=false;
    				document.getElementById("routesave").disabled=false;
//    					addInteraction();
    			}else{
    				document.getElementById("clearfeature").disabled=true;
    				document.getElementById("clearfeature2").disabled=true;
    				document.getElementById("routesave").disabled=true;
    			}
    			
//    			if(route==0){
//    				document.getElementById("showroute").disabled=false;
//    			}else{
//    				document.getElementById("showroute").disabled=true;
//    			}

    			if(geof==0){
    				document.getElementById("showgeofence").disabled=false;
    			}else{
    				document.getElementById("showgeofence").disabled=true;
    			}
    			
    			if(drawsource.getFeatures()!='' || routedrawsource.getFeatures()!=''){
    				document.getElementById("clearfeature").disabled=false;
    				document.getElementById("clearfeature2").disabled=false;
    			}
    			
    			
    		},10);
        }catch(e){
        	//alert(e);
        }
	    }catch(e){
	    	//alert(e);
	    }
 
 
 $("#all").click(function(){
 	$("#hisdiv").hide();
     $("#livediv").hide();
     $("#stop").hide();
     $("#tripdiv").hide();
 });
 
 $("#trip").click(function(){
	 	$("#hisdiv").hide();
	     $("#livediv").hide();
	     $("#stop").hide();
	     $("#tripdiv").show();
	 });

 $("#live").click(function(){
 	$("#hisdiv").hide();
     $("#livediv").show();
     $("#stop").hide();
     $("#tripdiv").hide();
 });

 $("#history").click(function(){
 	$("#livediv").hide();
     $("#hisdiv").show();
     $("#tripdiv").hide();
 });
//alert("jhd")
 $('.datepick').datepicker({
		format: "dd-M-yyyy",
		endDate: '+0d',
	    autoclose: true
	});
 $('.datepick').datepicker('setDate', '+0d'); 
//	$('#data').on('show', function(e){
//	    console.debug('show', e.date, $(this).data('stickyDate'));
//	    
//	    if ( e.date ) {
//	         $(this).data('stickyDate', e.date);
//	    }
//	    else {
//	         $(this).data('stickyDate', null);
//	    }
//	});
//
//	$('#data').on('hide', function(e){
//	    console.debug('hide', e.date, $(this).data('stickyDate'));
//	    var stickyDate = $(this).data('stickyDate');
//	    
//	    if ( !e.date && stickyDate ) {
//	        console.debug('restore stickyDate', stickyDate);
//	        $(this).datepicker('setDate', stickyDate);
//	        $(this).data('stickyDate', null);
//	    }
//	});
 }catch(e){
	 alert(e);
 }
}catch(e){
	 alert(e);
}
