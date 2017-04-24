/**
 * 
 */


scotchApp.controller('modelCtrl', function($scope,$http, $compile, $filter) {
	
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
	
	$scope.query = {};
		$scope.queryBy = '$';
		$scope.pagesno = [20,50,80,100,120];
	$scope.pagesint=20;
	$scope.onpagechange = function(page){
		$scope.pagesint=page;
	}

	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {

		$scope.modeldetailslist = data;

	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/assetdetails?companyid='+sptstr[1])
	.success(function(data, status, headers, config) {
		$scope.modelassetnamelist = data;
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
	});
	
	
	$scope.modeleditdata=function modeleditdata(editdatamodel)
	{
		$scope.modeldata=editdatamodel;
	}
	
	
	
	$scope.showmodeldiv1 = function() {
		//alert("in");
		document.getElementById("showeditmodel").hidden = false;
		document.getElementById("mainmodel").hidden = true;
	}
	$scope.back = function() {
		document.getElementById("mainmodel").hidden = false;
		document.getElementById("showeditmodel").hidden = true;
	}
	
	
	
	function printData()
	{
	   var divToPrint=document.getElementById("printTablemodel");
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
	$('#printTablemodel').tableExport({
		type:'pdf',escape:'false',separator: ',',
		tableName:'Model',
		pdfFontSize:10,
		htmlContent:'false',
		consoleLog:'false',
		
		}
	
	);
	}catch(e){alert(e);}
});
	
	
//	
//		try
//			{
//		$(function () {
//				alert("in jspdf model");
//				var doc = new jsPDF();
//			    var doc = new jsPDF("l", "pt", "a4","compress");
//			    var specialElementHandlers = {
//			        '#editor': function (element, renderer) {
//			            return true;
//			        }
//			    };
//			    $('#exportpdf').click(function () {
//			       doc.setFontSize(9);
//			     // doc.setPage(pageNumber);
//			  		doc.text(10, 10, "Model Details");
//   				   doc.fromHTML($('#modelTable1').html(), 15, 25, {
//			            'width': 170, 'elementHandlers': specialElementHandlers
//			        });
// 
//			        doc.save('sample-file.pdf');
//			    });
//			});
//
//			}
//			catch(e)
//		{
//				alert("error"+e);
//				
//			}
//			
//			
	


	
	
$("#exportexcel").click(function(){

try
{
$('#printTablemodel').tableExport({
	type:'excel',escape:'false',separator: ',',
	tableName:'Model',
	
	pdfFontSize:10,
	
	htmlContent:'false',
	consoleLog:'false',
	
	}

);

}catch(e){alert(e);}
});

		
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/makedetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
					$scope.modelmakenamelist = data;
				}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
	
	
	$scope.deletemodel = function(deletemodelid){
		jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
			if(r){
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldelete?id='+deletemodelid.modelid)
		.success(function(data, status, headers, config) {
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
	.success(function(data, status, headers, config) {

		$scope.modeldetailslist = data;
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
	
	
	$scope.modelInsert=function modelInsert()
	{
		
		try
		{	var i=0;
			for(i=0;i<$scope.modelmakenamelist.length;i++)
			{
				if($scope.modelmakenamelist[i].makename==document.getElementById('insertmodelmakename').value)
					{
					 $scope.insertmodelmakeid=$scope.modelmakenamelist[i].makeid;
					}
		}
			
			
			var mymodelinsert = document.modelforminsert;
		      if (mymodelinsert.insertmodelname.value== "")
		      {
		    	 mymodelinsert.insertmodelname.focus();
		      }
		      else  if (mymodelinsert.insertmodelmakename.value== "")
		      	{
			    	 mymodelinsert.insertmodelmakename.focus();
			      }
		      else  {
		    	  var j=0,chk=0;
		    	  for(j=0;j<$scope.modeldetailslist.length;j++)
					{
		    		
					if($scope.modeldetailslist[j].modelname == document.getElementById('insertmodelname').value)
						{
						chk++;
					
						}
					}
		    	  if(chk >0)
		    		  {
						jAlert('Problem in Saving Records!Model Name Already Exists','Information');

		    		  }
		    	  else
		    		  {
		    	  var k=0;
		    	  if($scope.insertmodelmakeid==null){
		    		  jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
						mymodelinsert.insertmodelmakename.focus();
						k++;
					} 
		    	  if(k==0)
		    		  {
		    	  
		$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelinsert?modelname='+document.getElementById('insertmodelname').value+'&makeid='+$scope.insertmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('insertmodelremark').value)
		.success(function(data, status, headers, config) {
			jAlert('Record Inserted Successfully', 'Success Dialog'); 
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
			.success(function(data, status, headers, config) {

				$scope.modeldetailslist = data;

			}).error(function(data, status, headers, config) {
				console.log('error: data = ', data);
			});
		}).error(function(data, status, headers, config) {
			
		jAlert('Unable to proceed your Request','Information');
					
			
			console.log('error: data = ', data);
		});
		}
		    		  }   } 
		}
		catch(e)
		{
			alert(e);
		}
		
	}
	
	
	
	$scope.modelUpdate=function modelUpdate()
	{
		try
		{
			
			$scope.eidtmodelid=$scope.modeldata.modelid;
				
			var i=0;
			for(i=0;i<$scope.modelmakenamelist.length;i++)
			{
				if($scope.modelmakenamelist[i].makename==document.getElementById('modeleditmakename').value)
					{
					 $scope.editmodelmakeid=$scope.modelmakenamelist[i].makeid;
					}
			}
			
			
			var mymodeledit = document.modeleditForm;
		      if (mymodeledit.editmodelname.value== "")
		      {
		    	 mymodeledit.editmodelname.focus();
		      }
		      else  if (mymodeledit.modeleditmakename.value== "")
		      {
		    	 mymodeledit.modeleditmakename.focus();
		      }
		      else 
		    	  {
		    	  
		    	  var k=0;
		    	  if($scope.editmodelmakeid==null){
		    		  jAlert('Problem in Saving Records! Make Name Does Not Exist!','Information');
						 mymodeledit.modeleditmakename.focus();
						k++;
					} 
		    	  if(k==0)
		    		  {
			$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modelUpdate?modelid='+$scope.eidtmodelid+'&modelname='+document.getElementById('editmodelname').value+'&makeid='+$scope.editmodelmakeid+'&loginid='+sptstr[2]+'&remarks='+document.getElementById('editmodelremark').value)
			.success(function(data, status, headers, config) {
				document.getElementById("mainmodel").hidden = false;
				document.getElementById("showeditmodel").hidden = true;
				$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/modeldetails?loginid='+sptstr[2]+'&companyid='+sptstr[7])
				.success(function(data, status, headers, config) {
	$scope.modeldetailslist = data;
	}).error(function(data, status, headers, config) {
					console.log('error: data = ', data);
				});
				jAlert('Record Updated Successfully', 'Success Dialog'); 
				document.getElementById('modeleditForm').reset(); 
				}).error(function(data, status, headers, config) {
				jAlert('Record Not Updated','Information');
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
	
	
});
