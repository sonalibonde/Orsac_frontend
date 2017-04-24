/**
 * 
 */
scotchApp.controller('bangalorectrl', function($scope,$http, $compile, $filter)
	{
	
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
		$scope.query = {};
   		$scope.queryBy = '$';
   		
   		$scope.pagesno = [20,50,80,100,120];
		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
	$scope.getRec=function ()
	{
		document.getElementById('userTable1').hidden=true;
		document.getElementById('userTable').hidden=true;
	try{
		$http.get('http://elocator.in/webservice/rest/CallService/bangimeidetails?imei='+document.getElementById('imeibang').value)
		.success(function(data, status, headers, config) {
		    if(data.length==0){
		    	jAlert('No Data Found','Information');
				document.getElementById('userTable1').hidden=true;
				document.getElementById('userTable').hidden=true;
		    }else{
			$scope.bangaloredetails = data;
			document.getElementById('userTable1').hidden=false;
			document.getElementById('userTable').hidden=false;
		    }
	}).error(function(data, status, headers, config) {
		jAlert('No Data Found','Information');
		document.getElementById('userTable1').hidden=true;
		document.getElementById('userTable').hidden=true;
			console.log('error: data = ', data);
		});
	}catch(e){alert(e);}
	
	}
	});
	