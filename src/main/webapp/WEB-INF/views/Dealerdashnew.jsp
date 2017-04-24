
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border" >
					<ul class="nav nav-tabs" id="recent-tab">
						<li class="active"><a data-toggle="tab" href="#/Dealerdashnew"><font>Summary</font>
							</a></li>

						<li><a data-toggle="tab" href="#/DealerdashLiveDetails"><font>Vehicle Live Status</font>
							</a></li>
							
						<li><a data-toggle="tab" href="#/DealerMap"><font>Live Map</font>
						</a></li>
						<li><a data-toggle="tab" href="#/Nonpolling"><font>Nonpolling</font>
						</a></li>

					</ul>
				</div>
			</div>

</br>
</br>



<div class="text-center">
<a class="quick-btn" href="#/DealerFormUpdate" style="background-color: #71a0f2">
<i><img  title="Dealers" src="<c:url value="/resources/imagenew/usergrp.png"/>"></i>
<span><b><font color="white">Dealers</font></b></span>
<span class="label btn-metis-1" style="background-color: #4bdb54"><font size="20px">{{subdealerdetailslist}}</font></span>
</a>
<a class="quick-btn" href="#/CustomerMasterFormUpdate" style="background-color: #fe2f71">
<i><img  title="Total Customers" src="<c:url value="/resources/imagenew/customer.png"/>" >
<span><b><font color="white">Total Customer</font></b></span>
<span class="label btn-metis-2" style="background-color: #72dbdb"><font size="20px">{{dealercustdetailslist}}</font></span>
</a>
<a class="quick-btn" href="#/DealerAssignFormUpdate" style="background-color: #deb947">
<i><img   title="Sold Devices" src="<c:url value="/resources/imagenew/sold.png"/>"></i>
<span><b><font color="white">Sold Devices</font></b></span>
<span class="label btn-metis-3" style="background-color: #4ecf64"><font size="20px">{{soldtotal}}</font></span>
</a>
<a class="quick-btn" href="#/DeviceFormUpdate" style="background-color: #44b4ab">
<i><img   title="Avialable Devices" src="<c:url value="/resources/imagenew/avail.png"/>" ></i>
<span><b><font color="white">Available Devices</font></b></span>
<span class="label btn-metis-4" style="background-color: #ba41b2"><font size="20px">{{AvialDevice}}</font></span>
</a>
<a class="quick-btn" href="#/DeviceFormUpdate" style="background-color: #9f51db">
<i><img   title="Total Devices" src="<c:url value="/resources/imagenew/total.png"/>" ></i>
<span><b><font color="white">Total Devices</font></b></span>
<span class="label btn-metis-5" style="background-color: #db4618"><font size="20px">{{totalDevice}}</font></span>
</a>
<a class="quick-btn" href="#/DeviceFormUpdate" style="background-color: #b7b738">
<i><img title="Damaged Devices" src="<c:url value="/resources/imagenew/damaged.png"/>"></i>
<span><b><font color="white">Damaged Devices</font></b></span>
<span class="label btn-metis-6" style="background-color: #ba1111"><font size="20px">{{damagedDev}}</font></span>
</a>
</div>










<!-- <fieldset style="border: 1px groove blue; height:150px;  padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
<!-- <legend style=" border-bottom: none; width: inherit;"><font size="5">Dealer Details</font></legend> -->
<!-- <div class="row" style="margin-top: -11px;"> -->




<!-- <!-- <div class="col-md-4" style="width:170px;"> --> 
<!-- <!-- 	<a href="" title="Company" style="text-decoration: none"> --> 
<!-- <!-- 				<div class="panel panel-primary"> --> 
<!-- <!-- 				<div class="panel-body"  style="background: #C0C0C0"> --> 
<%-- <%-- 				<center><img  title="Companies" src="<c:url value="/resources/imagenew/usergrp.png"/>"> --%> 
<!-- <!-- 				<font color="#1E0833">{{totalcompanieslist123}}</font> --> 
<%-- <%-- 				</center> --%> 
<!-- <!-- 			</div> --> 
<!-- <!-- 				<div  class="" style="background-color: #1E0833;text-align: center;"> --> 
<!-- <!-- 				<a  data-placement='bottom' title="Company Name" href='#/CompanyFormUpdate'><font color="white" size="3">Companies</font></a></div> --> 
<!-- <!-- 				</div> --> 
<!-- <!-- 					</a> --> 
<!-- <!-- 	</div> --> 

<!-- 	<div class="col-md-4" style="width:170px;"> -->
<!-- 		<a href="" title="Dealers" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body"  style="background: #C0C0C0"> -->
<%-- 					<center><img  title="Dealers" src="<c:url value="/resources/imagenew/usergrp.png"/>"> --%>
<!-- 					<font color="#1E0833">{{subdealerdetailslist}}</font> -->
<%-- 					</center> --%>
<!-- 				</div> -->
<!-- 					<div  class="" style="background-color: #1E0833;text-align: center;"> -->
<!-- 					<a  data-placement='bottom' title="Dealer Name" href='#/DealerFormUpdate'><font color="white" size="3">Dealers</font></a></div> -->
<!-- 					</div> -->
<!-- 		</a> -->
<!-- 	</div> -->

		
<!-- 			<div class="col-md-4" style="width:170px;" > -->
<!-- 			<a href="" title="Total Customers" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body"  style="background: #C0C0C0"> -->
<%-- 			<center><img  title="Total Customers" src="<c:url value="/resources/imagenew/customer.png"/>" > --%>
<!-- 					<font color="#1E0833">{{dealercustdetailslist}}</font> -->
<%-- 					</center> --%>
				
<!-- 					</div> -->
<!-- 				<div  class="" style="background-color: #1E0833;text-align: center;"><a  data-placement='bottom' title="Customer Name" href='#/CustomerMasterFormUpdate'><font color="white">Total Customers</font></a></div> -->
<!-- 					</div> -->
<!-- 					</a> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-4" style="width:170px;"> -->
<!-- 			<a href="" title="Sold Devices" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 				<div class="panel-body"  style="background: #C0C0C0"> -->
<%-- 		<center><img   title="Sold Devices" src="<c:url value="/resources/imagenew/sold.png"/>"> --%>
<!-- 				<font color="#1E0833">	{{soldtotal}}</font> -->
<%-- 				</center> --%>
				
<!-- 					</div> -->
<!-- 		<div  class="" style="background-color: #1E0833;text-align: center;"><a  data-placement='bottom' title="Device Numbers" href='#/DealerAssignFormUpdate'><font color="white">Sold Devices</font></a></div> -->
					
<!-- 				</div> -->
<!-- 				</a> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-4"  style="width:170px;"> -->
<!-- 			<a href="" title="Avialable Devices" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body" style="background: #C0C0C0"> -->
<%-- 		<center><img   title="Avialable Devices" src="<c:url value="/resources/imagenew/avail.png"/>" > --%>
<!-- 				<font color="#1E0833">	{{AvialDevice}}</font> -->
<%-- 				</center> --%>
			
<!-- 					</div> -->
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center;"><a  data-placement='bottom' title="Device Numbers" href='#/DeviceFormUpdate'><font color="white">Available Devices</font></a></div> -->
<!-- 			</div> -->
<!-- 			</a> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-4"  style="width:170px;"> -->
<!-- 			<a href="" title="Total Devices" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 				<div class="panel-body"  style="background: #C0C0C0"> -->
<%-- <center><img   title="Total Devices" src="<c:url value="/resources/imagenew/total.png"/>" > --%>
<%-- 					<font color="#1E0833">{{totalDevice}}</font></center> --%>
				
<!-- <!-- 					<a>View</a> --> 
<!-- 					</div> -->
<!-- 		<div  class="" style="background-color: #1E0833;text-align: center"><a  data-placement='bottom' title="" href='#/DeviceFormUpdate'><font color="white">Total Devices</font></a></div> -->
					
<!-- 				</div> -->
<!-- 				</a> -->
<!-- 			</div> -->
			
<!-- 			<div class="col-md-4"  style="width:170px;"> -->
<!-- 			<a href="" title="Damaged Devices" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body"  style="background: #C0C0C0"> -->
<%-- 	<center><img title="Damaged Devices" src="<c:url value="/resources/imagenew/damaged.png"/>"> --%>
<%-- 					<font color="#1E0833">{{damagedDev}}</font></center> --%>
					
<!-- <!-- 					<a >View </a> --> 
<!-- 					</div> -->
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href='#/DeviceFormUpdate'><font color="white">Damaged Devices</font></a></div> -->
					
<!-- 				</div> -->
<!-- 				</a> -->
<!-- 			</div> -->
			
			
			
<!-- <div class="ace-settings-container" id="ace-settings-container" style="position: fixed;"> -->
<!-- 	<ul type="none"> -->
<!-- 			<li class="grey"> -->
<!-- 							<a   title="Legends Of Dashboard Icon" data-toggle="dropdown" class="dropdown-toggle" href=""> -->
<!-- 								<i class="ace-icon fa fa-tasks" style="font-size:20px;"></i> -->
<!-- 							</a> -->
							
<!-- 				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close"> -->
<!-- 								<li class="dropdown-header" style="background-color: #1E0833"> -->
<!-- 									<i class="fa fa-info-circle" style="font-size:29px;color:white"></i> -->
<!-- 									<font color="white">Legends </font> -->
<!-- 								</li> -->
<!-- 						<li class="dropdown-content"> -->
<!-- 							<ul class="dropdown-menu dropdown-navbar navbar-pink"> -->
<!-- 							<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 												<img  title="Sub Dealers" src="<c:url value="/resources/imagenew/usergrp.png"/>"> --%>
<!-- 													<font>Sub Dealers</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 												<img  title="Total Customers" src="<c:url value="/resources/imagenew/customer.png"/>" > --%>
<!-- 													<font>Customers</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
							
<!-- 							<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 											<img   title="Sold Devices" src="<c:url value="/resources/imagenew/sold.png"/>"> --%>
<!-- 													<font>Sold Devices</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
										
<!-- 											<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 										<img   title="Avialable Devices" src="<c:url value="/resources/imagenew/avail.png"/>" > --%>
<!-- 													<font>Available Devices</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
							
							
<!-- 								<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 										<img   title="Total Devices" src="<c:url value="/resources/imagenew/total.png"/>" > --%>
<!-- 													<font>Total Devices</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 							<li   style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->
<%-- 									<img title="Damaged Devices" src="<c:url value="/resources/imagenew/damaged.png"/>"> --%>
<!-- 													<font>Damaged Devices</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
							
										
								
										
												
										
										
<!-- 						</ul> -->
<!-- 								</li> -->
								
<!-- 								<li class="dropdown-header" style="background-color: #1E0833"> -->
<!-- 									&nbsp; -->
<!-- 								</li> -->
								
<!-- 			</ul> -->
<!-- 	</li> -->
						
<!-- 		</ul>	 -->
<!-- 				</div> -->
			
<!-- 		</div> -->
	
<!-- 	</fieldset> -->
	
	

	
	
	
	
	
	
	
<div class="row">

<!-- <div id="popover_content_wrapper" style="display: none;" > -->
<!--   <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;"> -->
<!-- <ul type="disc"> -->
<!-- <li ng-repeat="name in dealernamelist"><font color="#1E0833">{{name.dealername}}</font></li> -->
<!-- <ul type="square"> <li ng-repeat="name1 in solddetailslist1"><font color="#1E0833">{{name1.dealername}}</font></li></ul> -->

<!-- </ul> -->
<!--  </div> -->
<!-- </div> -->
	
	
<div id="solddevice" style="display: none">
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="devi in soldDevicelist"><font color="#1E0833">{{devi.uniqueid}}</font></li></ul>
 </div>
</div>
	
	
<div id="availableDevice" style="display: none;" >
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="avail in avialDeviceNo"><font color="#1E0833">{{avail.uniqueid}}</font></li></ul>
 </div>
</div>


<div id="dealercustomer" style="display: none;" >
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="cust in dealerCustomers"><font color="#1E0833">{{cust.customername}}</font></li></ul>
 </div>
</div>
	
	</div>
	
	
		<div class="row">
			

<!-- <div class="col-md-6" id="showgraph"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:black"></i><font color="black";>Customer Details</font></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 				 <div id="bar_chart" style="height:450px; width:430px;"></div> -->
<!-- 				<div><a  href="" ng-click="showtext();"> -->
<!-- 					<i title="Show Text" class="fa fa-file-text-o"></i> -->
<!-- 				Show Text -->
<!-- 				</a></div> -->

<!-- 				</div> -->
<!-- 				</div> -->
<!-- </div> -->

<!-- <div class="col-md-6" id="customerdet"  hidden > -->
<!-- 				<div class="panel panel-primary" > -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:black"></i><font color="black";>Customer Details</div> -->
<!-- 					<div class="panel-body" style="height:500px;overflow: scroll"> -->
					
<!-- 						<table  border="2"	width="100%" cellspacing="0" id="printTable" > -->
<%-- 													<colgroup> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 													</colgroup> --%>
<!-- 													<thead> -->
<!-- 														<tr id="gridheader"> -->
<!-- 														<th ng-click="sort('dealername')"><font color="white">Dealer Name</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='dealername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 																<th ng-click="sort('customername')"><font color="white">Customer Name</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 															<th ng-click="sort('customername')"><font color="white">Devices sold</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 														</tr> -->
<!-- 													</thead> -->
<!-- 	<tbody> -->
<!-- 														<tr ng-repeat="del in customerDetailslist"> -->
<!-- 														<td><font>{{del.dealername}}</font></td> -->
<!-- 														<td><font>{{del.customername}}</font> -->
<!-- 														<td><font>{{del.no_devices}}</font> -->
<!-- 													</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
												
<!-- 											<div style="text-align: left;"><a href="" ng-click="showgraph();"> -->
<!-- 											<i title="Show Graph" class="fa fa-bar-chart"></i> -->
<!-- 											show Graph -->
<!-- 											</a></div> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->

<!-- 			<div class="col-md-6" > -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:black"></i><font color="black";>Device Sold Details</font></div> -->
<!-- 					<div class="panel-body" style="height:500px;overflow: scroll;"> -->
<!-- 					<table  border="2"	width="100%" cellspacing="0" id="printTable"> -->
<%-- 						<colgroup> --%>
<%-- 							<col width="20%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col ng-if="loginid!=10002"  width="20%"> --%>
<%-- 						</colgroup> --%>
<!-- 						<thead> -->
<!-- 							<tr id="gridheader"> -->
<!-- 							<th ng-if="loginid!=10002"  ng-click="sort('dealername')"><font color="white">Dealer</font> -->
<!-- 									<span class="glyphicon sort-icon" ng-show="sortKey=='dealername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 								</th> -->
<!-- 														<th ng-click="sort('no_ofdevice')"><font color="white">Sub Dealer</font> -->
<!-- 									<span class="glyphicon sort-icon" ng-show="sortKey=='no_ofdevice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 								</th> -->
<!-- <th ng-click="sort('no_ofdevice')"><font color="white">Devices Sold</font> -->
<!-- 									<span class="glyphicon sort-icon" ng-show="sortKey=='no_ofdevice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 								</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 	<tbody> -->
<!-- 			<tr ng-repeat="sold1 in solddetailslist1"> -->
<!-- 				<td ng-if="loginid!=10002" ><font>{{sold1.dealername}}</font></td> -->
<!-- 				<td><font>{{sold1.subdealername}}</font></td>	 -->
<!-- 				<td><a ng-click="getDevicesList(sold1)" style="cursor:pointer;"><font>{{sold1.no_devices}}</font></a></td> -->
			
<!-- 		</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
												
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 			</div>/.col -->
			
		</div><!--/.row-->	
		
		
		<br><br><br>
		
		<div class="col-md-12">

<!--  <div class="col-xs-2" style="background-color:lavender;"><font style="size:20px;"><b>{{x.companyName}}</b></font> -->
 
<!-- </div> -->


<table class="table-bordered" border="0" width="100%" cellspacing="2">
<colgroup>
														<col width="15%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
														<col width="15%">
<%-- 														<col width="15%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="15%"> --%>
														
<thead>													</colgroup>
<tr>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Company Name</center></font></th>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Running</center></font></th> --%>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Stop</center></font></th> --%>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Halt</center></font></th> --%>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Total Devices</center></font></th>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Polling Devices</center></font></th>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>NonPollling Devices</center></font></th>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Installed Devices</center></font></th>

</tr>
</thead>
<tbody>
  <tr ng-repeat="x in totaldevicesdet">
    <td style="background-color:white;"><font style="size:20px;"><center>{{ x.companyName }}</center></font></td>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.running}}</b></center></font></td> --%>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.stop}}</b></center></font></td> --%>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.halt}}</b></center></font></td> --%>
    <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.totalDevices}}</b></center></font></td>
    <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.pollingDevices}}</b></center></font></td>
     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.nonPolllingDevices}}</b></center></font></td>
      <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.installedDevices}}</b></center></font></td>
  </tr>
  </tbody>
</table>



  &nbsp; 
<!-- </div> -->
  </div>
		
		
		
		
		
		
		
		
		<div class="modal fade" id="myModal2" role="dialog" >
		    <div class="modal-dialog" style="border:black thin solid">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header" style="background-color: #8D80AF">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <center><font color="white"><h4 class="modal-title"><u>Device Details</u></h4></font></center>
		        </div>
		        <div class="modal-body" style="height:400px;overflow:scroll;">
		        <table border="2"	width="100%" cellspacing="0" id="printTable">
		        	<thead>
		        		<tr id="gridheader">
<th style="text-align:center;"><font color="white">Device No</font></th>			        		
<th style="text-align:center;"><font color="white">Device IMEI No</font></th>
			        		<th style="text-align:center;"><font color="white">Sim Mobile No</font></th>
		        		</tr>
		        	</thead>
		        	<tr ng-repeat="x in devicedetails">
<td style="text-align:center;"><font>{{x.deviceid}}</font></td>					
<td style="text-align:center;"><font>{{x.imeino}}</font></td>	
					<td style="text-align:center;"><font>{{x.simno}}</font></td>
		        </table>
		        </div>
		      </div>
		      
		    </div>
		  </div>

<!-- 		<div class="row"> -->
<!-- 		<div class="col-md-12">  -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay"  id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i>Device Status Details</div> -->
<!-- 					<div class="panel-body"> -->
<!-- 					<div id="combo" style="height:300px;"></div> -->
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->


	</div>	<!--/.main-->
	
	
<div id="graphrow" >
<br><br><br><br><br>

<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:black"></i>
						<font color="black">Vehicle Statistics</font>
						</div>
					<div class="panel-body">
					<div id="piechart" style="height:150px;"></div>

					</div>
				</div>
			</div><!--/.col-->
			
			
			
			
			<div class="col-md-6" style="width:500px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:black"></i><font color="black">Device Statistics</font></div>
					<div class="panel-body">
					<div id="barchart" style="height:150px;"></div>

					</div>
				</div>
			</div><!--/.col-->
			</div>
	
<div id="mytab" style="display:none">
    
</div>








<!-- </div> -->
<!-- <!-- --row --> 
<!-- </div> -->

</div>
</div>

