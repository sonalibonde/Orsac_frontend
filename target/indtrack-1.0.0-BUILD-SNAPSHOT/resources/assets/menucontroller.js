/**
 * 
 */


alert("menucontroller");
scotchApp.controller('menuCtrl', function($scope,$http, $compile, $filter) {
		try {
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [5,10,50,100,150,200];
				$scope.pagesint=5;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				$scope.deletemenu = function(menuasignid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menudelete?id='+menuasignid.menuid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
						.success(function(data, status, headers, config) {
							$scope.menusdetails = data;
								jAlert('Record Deleted Successfully', 'Confirmation Results');

							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
						
						

					}).error(function(data, status, headers, config) {
						//document.getElementById("texterror").innerHTML = "<center>Record Not Deleted </center>";
						//document.getElementById("errorsmsg").hidden = false;
						jAlert('Records Not Deleted','Information');
						console.log('error: data = ', data);
					});
					
						}
					});
				}
		   		
		   		
		   		
//	 			Page.setTitle("Welcome");
				$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
					.success(function(data, status, headers, config) {
						$scope.menusdetails = data;
		//					alert(data);
		
					}).error(function(data, status, headers, config) {
		// 				alert(data);
						console.log('error: data = ', data);
					});
				
				$scope.showmenudiv1 = function() {
					//alert("in");
					document.getElementById("showeditmenu").hidden = false;
					document.getElementById("mainmenu").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("mainmenu").hidden = false;
					document.getElementById("showeditmenu").hidden = true;
				} 
				
				
				$scope.menuData = function menuData(editname) {
					$scope.menueditdet = editname;
					
				}

				$scope.menuinsert = function menuinsert() {
// 					alert("bfguybhbfsd");
					var myForm = document.menuinsertform;
				      if (myForm.insertmenuname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.insertmenuname.focus();
				      }else if (myForm.insertnavigateurl.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.insertnavigateurl.focus();
					    }
// 				      else if (myForm.insertparentmenu.value== "")
// 				      {
// 					    	// alert("company name not be empty");
// 					    	 myForm.insertparentmenu.focus();
// 					    }
				      else if (myForm.insertorderno.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.insertorderno.focus();
					    }
				     
					    else
						   {
							   var i=0;
							   
								for(i=0;i<$scope.menusdetails.length;i++){
									if($scope.menusdetails[i].menutext == document.getElementById('insertparentmenu').value)
									{
										$scope.menuparentidinsert=$scope.menusdetails[i].menuid;
									}
								}
// 								alert($scope.menuparentidinsert);
// 								var k=0
// 								if($scope.menuparentidinsert==null){ 
// 									jAlert('Problem in Saving Records!Parent Menu Name Does Not Exist!','Information');
// //		 							document.getElementById("texterror").innerHTML = "Problem in Saving Records!\n Menu Name Does Not Exist"; 
// //		 							//document.getElementById("errorsmsg").hidden = false; 
// 									 myForm.insertparentmenu.focus(); 
// 									k++; 
// //		 							alert($scope.deviceinsertvendordetails+" "+$scope.deviceinsertmakid+" "+$scope.deviceinsertmodelid); 
// 								} 
								
// 								if(k==0){
								var url = document.getElementById("insertnavigateurl").value;
								url =  url.replace("#","");
								url =  url.replace("/","");
								if($scope.menuparentidinsert==null){
									$scope.menuparentidinsert='11';
								}
							
							$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menuinsert?menutext='
									+document.getElementById("insertmenuname").value
									+'&description='+document.getElementById("insertdescription").value
									+'&navigateurl='+url
									+'&parentid='+$scope.menuparentidinsert+'&orderno='+document.getElementById("insertorderno").value
									).success(
											function(data, status, headers, config) {
//			 									
												$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
														.success(function(data, status, headers, config) {
																	$scope.menusdetails = data;
//		 															alert(data);
																})
														.error(function(data, status, headers, config) {
																	console.log('error: data = ',data);
//		 	 														alert("Record Not inserted");
//		 															//document.getElementById("errorsmsg").hidden = false;
																});
												jAlert('Record Inserted Successfully', 'Success Dialog'); 
												document.getElementById("form2").reset(); 
											}).error(function(data, status, headers, config) {
//		 										alert("error:"+data);
//		 										//document.getElementById("errorsmsg").hidden = false;
											var i=0;
											for(i=0;i<$scope.menusdetails.length;i++)
												{
												if($scope.menusdetails[i].menutext==document.getElementById('insertmenuname').value)
										jAlert('Problem in Saving Records! Menu Name Already Exists','Information');
												}
												console.log('error: data = ', data);
											});
							   }
						   }
// 				}
				
				
// 				try{
				
				$scope.menueditform = function menueditform() {
// 					alert("in edit");
					try{
					var myForm = document.menuupdateform;
				      if (myForm.updatemenuname.value== "")
				      {
				    	// alert("company name not be empty");
				    	 myForm.updatemenuname.focus();
				      }else if (myForm.updatenavigateurl.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.updatenavigateurl.focus();
					  }
// 				      else if (myForm.updateparentmenu.value== "")
// 				      {
// 					    	// alert("company name not be empty");
// 					    	 myForm.updateparentmenu.focus();
// 					  }
				      else if (myForm.updateorderno.value== "")
				      {
					    	// alert("company name not be empty");
					    	 myForm.updateorderno.focus();
					   }
				   else
				   {
					   var i=0;
					   
						for(i=0;i<$scope.menusdetails.length;i++){
							if($scope.menusdetails[i].menutext == document.getElementById('updateparentmenu').value)
							{
								$scope.menuparentidedit=$scope.menusdetails[i].menuid;
							}
						}
						
						
						var url = document.getElementById("updatenavigateurl").value;
						url =  url.replace("#","");
						url =  url.replace("/","");
// 						alert($scope.menuparentidedit);
						if($scope.menuparentidedit==null){
							$scope.menuparentidedit='11';
						}

					
					$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menuupdate?menuid='
							+$scope.menueditdet.menuid+'&menutext='+document.getElementById("updatemenuname").value
							+'&description='+document.getElementById("updatedescription").value
							+'&navigateurl='+url
							+'&parentid='+$scope.menuparentidedit+'&orderno='+document.getElementById("updateorderno").value
							).success(
									function(data, status, headers, config) {
//	 									
										$http.get('http://localhost:9090/indtrackwebservice/rest/CallService/menudetails?roleid='+sptstr[sptstr.length-2]+'&parentid='+sptstr[4])
												.success(function(data, status, headers, config) {
															$scope.menusdetails = data;
// 															alert(data);
															document.getElementById("mainmenu").hidden = false;
															document.getElementById("showeditmenu").hidden = true;
														})
												.error(function(data, status, headers, config) {
															console.log('error: data = ',data);
// 	 														alert("Record Not inserted");
// 															//document.getElementById("errorsmsg").hidden = false;
														});
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('menuupdateform').reset(); 
									}).error(function(data, status, headers, config) {
// 										alert("error:"+data);
// 										//document.getElementById("errorsmsg").hidden = false;
								jAlert('Record Not Inserted','Information');
										console.log('error: data = ', data);
									});
					   }
					}catch(e){alert(e);}
				}		
			} catch (e) {
				alert(e);
			}
		});
	