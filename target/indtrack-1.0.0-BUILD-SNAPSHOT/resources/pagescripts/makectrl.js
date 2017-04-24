/**
 * 
 */


	
scotchApp.controller('MakeCtrl', function($scope,$http, $compile, $filter) {
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
		$scope.query = {};
   		$scope.queryBy = '$';
   		$scope.pagesno = [20,50,80,100,120];
		$scope.pagesint=20;
		$scope.onpagechange = function(page){
			$scope.pagesint=page;
		}
		
		$scope.showmakediv1 = function() {
			document.getElementById("showeditmake").hidden = false;
			document.getElementById("mainmake").hidden = true;
		}
		$scope.back = function() {
			document.getElementById("mainmake").hidden = false;
			document.getElementById("showeditmake").hidden = true;
		}
		
		
		$scope.makeeditdata=function makeeditdata(editmake)
		{
			$scope.editmakedetails=editmake;
		}
		
		function printData()
		{
		   var divToPrint=document.getElementById("printTablemake");
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
		}

		$('#printbutton').on('click',function(){
		printData();
		})
		
		
	$("#exportpdf").click(function(){
		
		try
		{
		$('#printTablemake').tableExport({
			type:'pdf',escape:'false',separator: ',',
			tableName:'Make',
			
			pdfFontSize:10,
			
			htmlContent:'false',
			consoleLog:'false',
			
			}
		
		);
		}catch(e){alert(e);}
	});
		
		


		
		
$("#exportexcel").click(function(){
	
	try
	{
	$('#printTablemake').tableExport({
		type:'excel',escape:'false',separator: ',',
		tableName:'Make',
		
		pdfFontSize:10,
		
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);

	}catch(e){alert(e);}
});

		
		try
		{
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {
// 				alert(data);
				$scope.makenamelist = data;

			}).error(function(data, status, headers, config) {
				alert("error"+data);
				console.log('error: data = ', data);
			});
			
		
			
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
			.success(function(data, status, headers, config) {
				$scope.assetnamelist = data;
			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
		
			
			$scope.deletemake = function(deletemakeid){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedelete?id='+deletemakeid.makeid)
				.success(function(data, status, headers, config) {

					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {

				$scope.makenamelist = data;
					jAlert('Record Deleted Successfully', 'Confirmation Results');
						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
					

				}).error(function(data, status, headers, config) {
					jAlert('Record Not Deleted','Information');
				
					console.log('error: data = ', data);
				});
					}
				});
			}
			
			
			
			$scope.makeInsert= function makeInsert()
			{
				
				try
				{
					var i=0;
					for(i=0;i<$scope.assetnamelist.length;i++)
					{
						
						if($scope.assetnamelist[i].assetname==document.getElementById('insertmakeassetname').value)
						{
							$scope.insertassetid=$scope.assetnamelist[i].assettypeid;
						}
					}
					
					var mymakeinsert = document.makeforminsert;
		      if (mymakeinsert.insertmakename.value== "")
		      {
		    	 mymakeinsert.insertmakename.focus();
		      }
		      
		      else  if (mymakeinsert.insertmakeassetname.value== "")
		      {
		    	 mymakeinsert.insertmakeassetname.focus();
		      }
		      else
		    	  {
		    	  
		    	  var i=0;chk=0;
		    	  for(i=0;i<$scope.makenamelist.length;i++)
		    		  {
		    		  
		    		  if($scope.makenamelist[i].makename==document.getElementById('insertmakename').value)
		    			  {
		    			 chk++
		    			  }
		    		  }
		    		  if(chk>0)
		    			  {
		    			  jAlert('Problem in Saving Records! Make Name Already Exist!','Information');
		    			  }
		    		  else
		    			  {
		       var k=0;
		    	  
		    	  if($scope.insertassetid==null){
		    		  jAlert('Problem in Saving Records! Make Type Does Not Exist!','Information');
						 mymakeinsert.insertmakeassetname.focus();
						k++;
					} 
					if(k==0){
		      		
		      	
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeinsert?makename='+document.getElementById('insertmakename').value+
							'&assetid='+$scope.insertassetid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmakeremark').value)
					.success(function(data, status, headers, config) {

						jAlert('Record Inserted Successfully', 'Success Dialog'); 
					
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?companyid='+sptstr[1])
						.success(function(data, status, headers, config) {

							$scope.makenamelist = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});

						

					}).error(function(data, status, headers, config) {
							jAlert('Unable to Proceed Your Request','Information');
								
						console.log('error: data = ', data);
					});
		    	  }	
		    			  }	
		    	  }		
				}
				catch(e)
				{
					alert(e);
				}
				
			}
			
			
			
			$scope.makeupdate=function makeupdate()
			{
				
				try{
					
					
					//
		var mymakeEdit = document.makeedit;
		      if (mymakeEdit.editMakeName.value== "")
		      {
		    	 mymakeEdit.editMakeName.focus();
		      }
		      else  if (mymakeEdit.editmakeassetname.value== "")
		      {
		    	 mymakeEdit.editmakeassetname.focus();
		      }	
		      else
		    	  {
		    	  $scope.makeEditid=$scope.editmakedetails.makeid;
					var i=0;
					
					for(i=0;i<$scope.assetnamelist.length;i++)
					{
						if($scope.assetnamelist[i].assetname==document.getElementById('editmakeassetname').value)
						{
							$scope.editassetid=$scope.assetnamelist[i].assettypeid;
						}
					}
		    	  
		    	  var k=0;
		    	 
		    	  if($scope.editassetid==null){
		    		  jAlert('Problem in Saving Records! Make Type Does Not Exist!','Information');
						 mymakeEdit.editmakeassetname.focus();
						k++;
					} 
					if(k==0){
						
					$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makeupdate?makeid='+$scope.makeEditid+
					'&makename='+document.getElementById('editMakeName').value+'&assetid='+$scope.editassetid+'&loginid='+sptstr[2]+
					'&remarks='+document.getElementById('editmakeremark').value)
					.success(function(data, status, headers, config) {
						document.getElementById("mainmake").hidden = false;
						document.getElementById("showeditmake").hidden = true;
						$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
						.success(function(data, status, headers, config) {

							$scope.makenamelist = data;

						}).error(function(data, status, headers, config) {
							console.log('error: data = ', data);
						});
						jAlert('Record Updated Successfully', 'Success Dialog'); 
						document.getElementById('makeedit').reset(); 
					}).error(function(data, status, headers, config) {
						jAlert('Record Not updated','Information');
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
			
		}
		catch(e)
		{
			
		};
	});