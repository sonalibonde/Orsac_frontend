/**
 * 
 */
scotchApp.controller('VehicleCtrl', function($scope,$http, $compile, $filter) {
	
	$scope.loginid=sptstr[2];
	//$scope.dealervehdetails=sptstr[0];
	$scope.roleid=sptstr[6];
	
	$scope.parentDealer='Banglore Dealers';
	
	try
	{
		if($scope.loginid!='10001')
		{
			document.getElementById('maindealer').hidden=true;
		
		}
	}catch(e){}
	
	try{
	if($scope.loginid=='10001' || $scope.loginid=='10002')
	{
		
		document.getElementById('dealersDetails').hidden=false;
		document.getElementById('dealercustomerdetails').hidden=false;
	}
	else if($scope.roleid!='1003')
		{
		$scope.dealervehdetails1=sptstr[0];
		document.getElementById('dealersDetails').hidden=true;
		}
	else
		{
		document.getElementById('dealersDetails').hidden=true;
		document.getElementById('dealercustomerdetails').hidden=true;
		document.getElementById('vehcustdealerdetails').value=sptstr[0];
		}
	}catch(e){}
	
	
	
		var time = new Date();
		var diffMs = (time-mydate); // milliseconds between now & Christmas
		var diffDays = Math.round(diffMs / 86400000); // days
		var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
		var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
		if(diffMins>20){
			jAlert('Session Expired Please Login Again','Information');
			window.location.replace("Logout");
		}
		mydate = new Date();
		
		clearInterval(interval);
			$scope.sort = function(keyname){
				$scope.sortKey = keyname;   //set the sortKey to the param passed
				$scope.reverse = !$scope.reverse; //if true make it false and vice versa
			}
			
			
			$(function() {
				$('.datepick').datepicker({
				    format: "dd-M-yyyy",
				    endDate: '+0d',
				    autoclose: true
				});  
				 $('.datepick').datepicker('setDate', '+0d');
			});
			
				$scope.query = {};
		   		$scope.queryBy = '$';
		   		
		   		$scope.pagesno = [20,50,80,100,120];
				$scope.pagesint=20;
				$scope.onpagechange = function(page){
					$scope.pagesint=page;
				}
				
				
				$scope.showvehclediv1 = function() {
					//alert("in");
					document.getElementById("showeditvehicle").hidden = false;
					document.getElementById("mainvehicle").hidden = true;
				}
				$scope.back = function() {
					document.getElementById("mainvehicle").hidden = false;
					document.getElementById("showeditvehicle").hidden = true;
				}
				
				function printData()
				{
				   var divToPrint=document.getElementById("printTableveh");
				   newWin= window.open("");
				   
				   var htmlToPrint = '' +
			        '<style type="text/css">' +
			        'table th, table td {' +
			        'border:1px solid #000;' +
			        'padding;0.5em;' +
			        '}' +
			        'tr:nth-child(even) {' +
			        'background:#bdbdbd; ' +
			         '}' +
			         'tr:nth-child(odd) {' +
				        'background:#d3d3d3; ' +
				         '}'+ 
			        '</style>';
			        htmlToPrint += divToPrint.outerHTML;
			        newWin = window.open("");
			        newWin.document.write(htmlToPrint);
			        newWin.print();
			        newWin.close();
//					   newWin.document.write(divToPrint.outerHTML);
//					   newWin.print();
//					   newWin.close();
				}
	$('#printbutton').on('click',function(){
				printData();
				})
				
				
			$("#exportpdf").click(function(){
					try
				{
				$('#printTableveh').tableExport({
					type:'pdf',escape:'false',separator: ',',
					//ignoreColumn: [2,3],
					tableName:'Vehicle ',
					pdfFontSize:10,
					//pdfLeftMargin:20,
					htmlContent:'false',
					consoleLog:'false',
					}
				);
				}catch(e){}
			});
				
		$("#exportexcel").click(function(){
		try
			{
			$('#printTableveh').tableExport({
				type:'excel',escape:'false',separator: ',',
				//ignoreColumn: [2,3],
				tableName:'Vehicle',
				pdfFontSize:10,
				//pdfLeftMargin:20,
				htmlContent:'false',
				consoleLog:'false',
				}

			);

			}catch(e){}
			});

		try
		{
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/dealerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {

			$scope.dealerdetailslistveh = data;
			//alert(data);
	}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
			
			
		}catch(e){alert(e);}	
			
			
    	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/customerdetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
		.success(function(data, status, headers, config) {
			$scope.customerdetailsveh = data;
			
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
		});
//				
			
			try
			{
			
//	 		alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7]);
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.vehicledetails = data;
					
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				
				$scope.vehicleeditdata=function vehicleeditdata(vehicledata)
				{
					$scope.editvehicledata=vehicledata;
				}
				
		//		makkename vbind modeldetails
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {

					$scope.vehcilemakenamelist = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
//		 		MODEL BIN
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
				
					$scope.vehiclemodeldetails = data;

				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				/// vcehicletypeiddtails  
				
				
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicletypedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.vehicletype = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				
				$scope.deletevehicle = function(deletevehicleid){
					jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
						if(r){
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledelete?id='+deletevehicleid.vehicleid)
					.success(function(data, status, headers, config) {
//		 				$scope.company = data;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.vehicledetails = data;
						jAlert('Record Deleted Successfully', 'Confirmation Results');
							}).error(function(data, status, headers, config) {
								console.log('error: data = ', data);
							});
					}).error(function(data, status, headers, config) {
						
						jAlert('Records Not Deleted','Information');
						console.log('error: data = ', data);
					});
						}
					});
				}
		   		
		   		
				
				
				
		$scope.VehicleInsert=function VehicleInsert()
				{
			try
					{
						
						var myvehicleInsertForm = document.vehicleinsertform;
					      if (myvehicleInsertForm.vehicleinsertvehno.value== "")
					      {
					    	 myvehicleInsertForm.vehicleinsertvehno.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertchassis.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertchassis.focus();
					      }
					      else if (myvehicleInsertForm.vehiinsertmake1.value== "")
					      {
					    	 myvehicleInsertForm.vehiinsertmake1.focus();
					      }
					      else if (myvehicleInsertForm.vehicleinsertmodel.value== "")
					      {
					    	 myvehicleInsertForm.vehicleinsertmodel.focus();
					      }
					      else if (myvehicleInsertForm.insertvehicletype.value== "")
					      {
					    	 myvehicleInsertForm.insertvehicletype.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertengineno.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertengineno.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertregdate.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertregdate.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertregvaliddate.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertregvaliddate.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertinsurancevaliddate.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertinsurancevaliddate.focus();
					      }
					      else if (myvehicleInsertForm.vehinsertpurchasedate.value== "")
					      {
					    	 myvehicleInsertForm.vehinsertpurchasedate.focus();
					      }
					      
					      else
					    	  {
						var i=0;
						
						for(i=0;i<$scope.vehcilemakenamelist.length;i++)
						{

							if($scope.vehcilemakenamelist[i].makename==document.getElementById('vehiinsertmake1').value)
								{
								$scope.insertvehiclemakeid=$scope.vehcilemakenamelist[i].makeid;
								}
						}
						for(i=0;i<$scope.vehiclemodeldetails.length;i++)
						{

							if($scope.vehiclemodeldetails[i].modelname==document.getElementById('vehicleinsertmodel').value)
								{
								$scope.insertvehiclemodelid=$scope.vehiclemodeldetails[i].modelid;
								}
						}
						for(i=0;i<$scope.vehicletype.length;i++)
						{
							if($scope.vehicletype[i].vehicletypename==document.getElementById('insertvehicletype').value)
								{
									$scope.insertvehicleinserttypeid=$scope.vehicletype[i].vehicletypeid;
								}
						}
						
						
						for(i=0;i<$scope.customerdetailsveh.length;i++)
							{
							if($scope.customerdetailsveh[i].customername==document.getElementById('vehcustdealerdetails').value)
							{
								$scope.customerid=$scope.customerdetailsveh[i].customerid;
							}
						}
						
						 if($scope.roleid=='1003')
						 {
						 $scope.customerid=sptstr[7];
						 }
						 
						 
							//$scope.dealer=document.getElementById('vehdealerdetails').value;
//							
//							for(i=0;i<$scope.dealerdetailslistveh.length;i++)
//							{
//								alert("in for");
//							alert(""+document.getElementById('vehdealerdetails').value);
//								if($scope.dealerdetailslistveh[i].dealername==document.getElementById('vehdealerdetails').value)
//									{
//									alert("in if");
//									$scope.log=$scope.dealerdetailslistveh[i].loginid;
//									alert("kk"+$scope.log);
//									}
//							}
						
							
							  var k=0;
									if($scope.insertvehiclemakeid==null){
										jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');

										  myvehicleInsertForm.vehicleinsertmodel.focus();
										k++;
									} 
									if($scope.insertvehiclemodelid==null){
										jAlert('Problem in Saving Records! Model Name Does Not Exist!','Information');

										myvehicleForm1.insertvehiclemodelid.focus();
										k++;
									} 
									if($scope.insertvehicleinserttypeid==null){
										jAlert('Problem in Saving Records! Vechicle Type Does Not Exist!','Information');

										 myvehicleInsertForm.insertvehicletype.focus();
										k++;
									} 
									if(k==0){
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleinsert?makeid='+$scope.insertvehiclemakeid+'&modelid='+$scope.insertvehiclemodelid+'&vehicletypeid='+$scope.insertvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleinsertvehno').value+'&chasisnumber='+document.getElementById('vehinsertchassis').value+'&enginenumber='+document.getElementById('vehinsertengineno').value+'&bodycolor='+document.getElementById('vehinsertbody').value+'&fueltypeid=170001&regdate='+document.getElementById('vehinsertregdate').value+'&regvaliddate='+document.getElementById('vehinsertregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehinsertinsurancevaliddate').value+'&pucdate='+document.getElementById('vehinsertpurchasedate').value+'&tankcapacity='+document.getElementById('vehinserttank').value+'&loginid='+sptstr[2]+
								'&remarks='+document.getElementById('vehinsertremark').value+'&inusrancecompanyname='+document.getElementById('vehiinsertinsurancecomp').value+'&customerid='+$scope.customerid)
									.success(function(data, status, headers, config) {
										
						jAlert('Record Inserted Successfully', 'Success Dialog'); 

								$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
								.success(function(data, status, headers, config) {
//									alert("success"+data);
									$scope.vehicledetails = data;

								}).error(function(data, status, headers, config) {
									console.log('error: data = ', data);
								});
		

									}).error(function(data, status, headers, config) {
										//alert(data);
										jAlert('Record Not Inserted','Information');
										console.log('error: data = ', data);
									});
						    	  }
					    	  }	
					}
					catch(e)
					{
						alert(e);
					}
					
				}
				
				
		
		
		
		$scope.VehicleUpdate=function VehicleUpdate()
		{
			try
			{
				var myvehicleForm = document.vehicleeditform;
			      if (myvehicleForm.vehicleditvehicleno.value== "")
			      {
			    	 myvehicleForm.vehicleditvehicleno.focus();
			      }
			      else if (myvehicleForm.veheditchassis.value== "")
			      {
			    	 myvehicleForm.veheditchassis.focus();
			      }
			      else if (myvehicleForm.veheditmake.value== "")
			      {
			    	 myvehicleForm.veheditmake.focus();
			      }
			      else if (myvehicleForm.vehicleeditmodel.value== "")
			      {
			    	 myvehicleForm.vehicleeditmodel.focus();
			      }
			      else if (myvehicleForm.editvehicletype.value== "")
			      {
			    	 myvehicleForm.editvehicletype.focus();
			      }
			      else if (myvehicleForm.veheditengineno.value== "")
			      {
			    	 myvehicleForm.veheditengineno.focus();
			      }
			      else if (myvehicleForm.veheditregdate.value== "")
			      {
			    	 myvehicleForm.veheditregdate.focus();
			      }
			      else if (myvehicleForm.veheditregvaliddate.value== "")
			      {
			    	 myvehicleForm.veheditregvaliddate.focus();
			      }
			      else if (myvehicleForm.vehieditinsurancevaliddate.value== "")
			      {
			    	 myvehicleForm.vehieditinsurancevaliddate.focus();
			      }
			      else if (myvehicleForm.veheditpurchasedate.value== "")
			      {
			    	 myvehicleForm.veheditpurchasedate.focus();
			      }
			      else
			    	  {
				$scope.vehicleEditid=$scope.editvehicledata.vehicleid;
				var i=0;
				for(i=0;i<$scope.vehcilemakenamelist.length;i++)
				{

					if($scope.vehcilemakenamelist[i].makename==document.getElementById('veheditmake').value)
						{
						$scope.vehicleEditmakeid=$scope.vehcilemakenamelist[i].makeid;
						}
				}
				for(i=0;i<$scope.vehiclemodeldetails.length;i++)
				{

					if($scope.vehiclemodeldetails[i].modelname==document.getElementById('vehicleeditmodel').value)
						{
						$scope.vehicleEditmodelid=$scope.vehiclemodeldetails[i].modelid;
						}
				}
				
					
				
				for(i=0;i<$scope.vehicletype.length;i++)
				{
					if($scope.vehicletype[i].vehicletypename==document.getElementById('editvehicletype').value)
						{
							$scope.editvehicleinserttypeid=$scope.vehicletype[i].vehicletypeid;
						}
				}
			      var k=0;
					if($scope.vehicleEditmakeid==null){
						jAlert('Problem in Saving Records!Make Name Does Not Exist!','Information');

					 myvehicleForm.veheditmake.focus();
						k++;
					} 
					if($scope.vehicleEditmodelid==null){
						jAlert('Problem in Saving Records!Model Name Does Not Exist!','Information');

						 myvehicleForm.vehicleeditmodel.focus();
						k++;
					} 
					if($scope.editvehicleinserttypeid==null){
						jAlert('Problem in Saving Records! Vehicle Type Does Not Exist!','Information');

					 myvehicleForm.editvehicletype.focus();
						k++;
					} 
					
					
					if(k==0){
//						alert('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleupdate?vehicleid='+$scope.vehicleEditid+'&makeid='+$scope.vehicleEditmakeid+'&modelid='+$scope.vehicleEditmodelid+'&vehicletypeid='+$scope.editvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleditvehicleno').value+'&chasisnumber='+document.getElementById('veheditchassis').value+'&enginenumber='+document.getElementById('veheditengineno').value+'&bodycolor='+document.getElementById('veheditbodycolor').value+'&fueltypeid=170001&regdate='+document.getElementById('veheditregdate').value+'&regvaliddate='+document.getElementById('veheditregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehieditinsurancevaliddate').value+'&pucdate='+document.getElementById('veheditpurchasedate').value+'&tankcapacity='+document.getElementById('vehedittank').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('veheditremark').value+'&inusrancecompanyname='+document.getElementById('veheditinsurancecompname').value);
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicleupdate?vehicleid='+$scope.vehicleEditid+'&makeid='+$scope.vehicleEditmakeid+'&modelid='+$scope.vehicleEditmodelid+'&vehicletypeid='+$scope.editvehicleinserttypeid+'&vehicleregno='+document.getElementById('vehicleditvehicleno').value+'&chasisnumber='+document.getElementById('veheditchassis').value+'&enginenumber='+document.getElementById('veheditengineno').value+'&bodycolor='+document.getElementById('veheditbodycolor').value+'&fueltypeid=170001&regdate='+document.getElementById('veheditregdate').value+'&regvaliddate='+document.getElementById('veheditregvaliddate').value+'&insurancevaliddate='+document.getElementById('vehieditinsurancevaliddate').value+'&pucdate='+document.getElementById('veheditpurchasedate').value+'&tankcapacity='+document.getElementById('vehedittank').value+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('veheditremark').value+'&inusrancecompanyname='+document.getElementById('veheditinsurancecompname').value)
					.success(function(data, status, headers, config) {
						
						document.getElementById("mainvehicle").hidden = false;
						document.getElementById("showeditvehicle").hidden = true;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/vehicledetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {
	// alert(data);
							$scope.vehicledetails = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						
						
						jAlert('Record Updated Successfully', 'Success Dialog'); 
						document.getElementById('vehicleeditform').reset(); 
								
							}).error(function(data, status, headers, config) {
								//alert(data);
								jAlert('Record Not Updated','Information');
								console.log('error: data = ', data);
							});
					}
			    	  }
			}
			catch(e)
			{
				//alert(e);
			}
		}
				
			}
			catch(e)
			{
				
			}
			
		});
