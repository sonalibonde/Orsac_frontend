/**
 * 
 */

scotchApp.controller('companyController', function($scope,$http, $compile, $filter) {
	try {
		
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
			
			
		
			function printData()
			{
			   var divToPrint=document.getElementById("printTable");
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
			
			
			
			$('#printTable').tableExport({
 				type:'pdf',escape:'false',
 				tableName:'Company',
 				pdfFontSize:8,
 				orientation:'landscape',
 				formate:'a4',
 				htmlContent:'false',
 				consoleLog:'false',
				}
			);
 			}catch(e){}
			
	});
//			try
//			{
//			$scope.expor1=function()
//			{
//				alert("inn");
//				$http.get('http://elocator.in/webservice/rest/CallService/pdfgenerator?companyid='+sptstr[7]+'&loginid='+sptstr[2])
//				.success(function(data, status, headers, config) {
//					alert("succ");
////				 $scope.path=data;
//					
//					alert(document.getElementById('exportpdf').href ="home/studio/elocator/13-06-16/pdfFile.pdf");
//				
////					var sURl="home/studio/elocator/13-06-16/pdfFile.pdf";
////					window.downloadFile = function(sUrl){
////					    window.open(sUrl);
////					}
//					
//					
//					
//				}).error(function(data, status, headers, config) {
//					console.log('error: data = ', data);
//				});
//				
//			}
//			
//			
//			}catch(e){alert(e);}
			
			
//			
//			try
//			{                  
//		$(function () {
//				alert("in jspdf");
//				//var doc = new jsPDF();
//			    var doc = new jsPDF("l", "pt", "a4","compress");
//			    var specialElementHandlers = {
//			        '#editor': function (element, renderer) {
//			            return true;
//			        }
//			    };
//			    $('#exportpdf').click(function () {
//			    	
//			      doc.setFontSize(9);
//			     
//			     // doc.setPage(pageNumber);
//			     
//   					doc.text(10, 10, "Company Details");
//				   doc.fromHTML($('#uprintlTable').html(), 15, 25, {
//			            'width': 170,
//			                'elementHandlers': specialElementHandlers
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
			
			
	$("#exportexcel").click(function(){
		
		try
		{
		$('#printTable').tableExport({
			type:'excel',escape:'false',separator: ',',
			tableName:'Company',
			
			pdfFontSize:10,
			
			htmlContent:'false',
			consoleLog:'false',
				}
		
		);
	
		}catch(e){}
	});
	
	
// 	$(function () {
// 	//var  imgData='data:image/jpeg;base64,<c:url value="/resources/assets/images/logonew.png"/>';
		
// 	    var doc = new jsPDF("l", "pt", "a4","compress");
// 	    var specialElementHandlers = {
// 	        '#editor': function (element, renderer) {
// 	            return true;
// 	        }
// 	    };

// 	    $('#exportpdf').click(function () {
	    	
	   
// 	      doc.setFontSize(8);
// 	      //doc.setFont("courier");
// 	     // doc.setPage(pageNumber);
// 	    // doc.setFontType("normal");
// 	  	doc.text(30, 14, "Companies Detail");
		
// 			//doc.addImage(imgData, 'JPEG', 10, 10, 80, 60);
// 	        doc.fromHTML($('#uprintlTable').html(), 15, 25, {
// 	            'width':500,
// 	                'elementHandlers': specialElementHandlers
// 	        });

// 	        doc.save('sample-file.pdf');
// 	    });
// 	});
	
			
			$scope.deletecom = function(comp){
				jConfirm('Do you want to Delete?', 'Confirmation Dialog', function(r) { 
					if(r){
				$http.get('http://elocator.in/webservice/rest/CallService/companydelete?id='+comp.companyid)
				.success(function(data, status, headers, config) {
//	 				$scope.company = data;
					$http.get('http://elocator.in/webservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
						.success(function(data, status, headers, config) {
							$scope.company = data;
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
	   		
// 			Page.setTitle("Welcome");
			$http.get('http://elocator.in/webservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
					.success(function(data, status, headers, config) {
						$scope.company = data;
					}).error(function(data, status, headers, config) {
						console.log('error: data = ', data);
					});

			$scope.showcomdiv1 = function() {
				//alert("in");
				document.getElementById("showedit").hidden = false;
				document.getElementById("maincom").hidden = true;
			}
			$scope.back = function() {
				document.getElementById("maincom").hidden = false;
				document.getElementById("showedit").hidden = true;
			}

			$scope.companyData = function companyData(editname) {
				$scope.editcompanyy = editname;
			}

			$scope.companyinsert = function companyinsert() {
				
				var myForm = document.form1;
			      if (myForm.cname1.value== "")
			      {
			    
			    	 myForm.cname1.focus();
			      }
			      else if (myForm.person1.value== "")
			      { myForm.person1.focus();
			      }
			      else if (myForm.mobile1.value== "")
			      {
			    	
			    	 myForm.mobile1.focus();
			    	
			      }
			      
			      else if (myForm.cadd1.value== "")
			      {
			    	
			    	 myForm.cadd1.focus();
			    	
			      }
			    
			     else if (myForm.radd1.value== "")
			      {
			    	
			    	 myForm.radd1.focus();
			    	
			      }
			     else if (myForm.email1.value== "")
			      {
			    	 myForm.email1.focus();
			     }
			   else
			   {
				     
				$http.get('http://elocator.in/webservice/rest/CallService/companyinsert?companyname='
										+ document.getElementById('cname1').value
										+ '&shortname='
										+ document.getElementById('sname1').value
										+ '&caddress='
										+ document.getElementById('cadd1').value
										+ '&personname='
										+ document.getElementById('person1').value
										+ '&landlin1='
										+ document.getElementById('mobile1').value
										+ '&landlin2='
										+ document.getElementById('landline1').value
										+ '&faxnumber='
										+ document.getElementById('fax1').value
										+ '&regisraddress='
										+ document.getElementById('radd1').value
										+ '&emailid='
										+ document.getElementById('email1').value
										+ '&remark='
										+ document.getElementById('rem1').value
										+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&city='+document.getElementById('insertcompcity').value+'&state='+document.getElementById('insertcompstate').value+'&zip='+document.getElementById('insertcompzip').value).success(
								function(data, status, headers, config) {
// 									
								jAlert('Record Inserted Successfully', 'Success Dialog'); 
									$http.get('http://elocator.in/webservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
											.success(function(data, status,
															headers, config) {
														$scope.company = data;
													})
											.error(
													function(data, status,
															headers, config) {
														console.log('error: data = ',data);

													});
								}).error(
								function(data, status, headers, config) {
								
									var i=0;
									for(i=0;i<$scope.company.length;i++)
										{
										if($scope.company[i].companyname==document.getElementById('cname1').value)
											{
											jAlert('Problem in Saving Records! Company Name Already Exists','Information');
											}
										else if($scope.company[i].shortname==document.getElementById('sname1').value)
										{
											jAlert('Problem in Saving Records! Short Name Already Exists','Information');
										}
										else if($scope.company[i].lanldlinenumber1==document.getElementById('mobile1').value)
										{
										jAlert('Problem in Saving Records! Mobile no Already Exists','Information');
										}
										else if($scope.company[i].emailid==document.getElementById('email1').value)
										{
										jAlert('Problem in Saving Records! Email Id  Already Exists','Information');
										}
										}
								
									console.log('error: data = ', data);
								});
				   }
			}
		$scope.companyedit = function companyedit() {
					try
					{
				
					$scope.companydetails=$scope.company;
					var i=0;
					
					}catch(e){}
					var myForm1 = document.form2;
				      if (myForm1.compname.value== "")
				      {
				    	
				    	 myForm1.compname.focus();
				      }
				      else if (myForm1.personname.value== "")
				      {
				    
				    	 myForm1.personname.focus();
				      }
				      else if (myForm1.mobileno.value== "")
				      {
				    
				    	 myForm1.mobileno.focus();
				    	
				      }
				      
				      else if (myForm1.caddress.value== "")
				      {
				    	
				    	 myForm1.caddress.focus();
				    	
				      }
				    
				     else if (myForm1.raddress.value== "")
				      {
				    	
				    	 myForm1.raddress.focus();
				    	
				      }
				     else if (myForm1.emailID.value== "")
				      {
				    	
				    	 myForm1.emailID.focus();
				    	
				      }
				   else
				   {
					$http.get('http://elocator.in/webservice/rest/CallService/companyedit?companyid='+$scope.editcompanyy.companyid+'&companyname='+ document.getElementById('compname').value
					+ '&shortname='+ document.getElementById('shortname').value+ '&caddress='+ document.getElementById('caddress').value+ '&personname='+ document.getElementById('personname').value+ '&landlin1='+ document.getElementById('mobileno').value+ '&faxnumber='+ document.getElementById('faxno').value+ '&regisraddress='+ document.getElementById('raddress').value+ '&emailid='+ document.getElementById('emailID').value+ '&remark='+ document.getElementById('remark').value
					+ '&parentcompid='+sptstr[1]+'&loginid='+sptstr[2]+'&state='+document.getElementById('editcompstate').value+'&city='+document.getElementById('editcompCity').value+'&zip='+document.getElementById('editcompzip').value)
					.success(function(data, status, headers, config) {
										$http.get('http://elocator.in/webservice/rest/CallService/companydetails?companyid='+sptstr[7]+'&loginid='+sptstr[2])
												.success(function(data, status,	headers, config) {
														$scope.company = data;
															document.getElementById("maincom").hidden = false;
															document.getElementById("showedit").hidden = true;
															//alert("in afetr");
														})
												.error(function(data, status,headers, config) {
															console.log('error: data = ',data);
														});
// 										
										jAlert('Record Updated Successfully', 'Success Dialog'); 
										document.getElementById('form2').reset(); 
									})
									.error(function(data, status, headers, config) {
										
										console.log('error: data = ', data);
									});
				}

	}
		} catch (e) {
			
		}
	});