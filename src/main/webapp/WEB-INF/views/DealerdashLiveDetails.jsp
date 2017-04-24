
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	
<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li ><a data-toggle="tab" href="#/Dealerdashnew">Summary
							</a></li>

						<li class="active"><a data-toggle="tab" href="#/DealerdashLiveDetails">Vehicle Live Status
							</a></li>
							
							<li><a data-toggle="tab" href="#/DealerMap"><font>Live Map</font>
						</a></li>
						<li><a data-toggle="tab" href="#/Nonpolling"><font>Nonpolling</font>
						</a></li>

					</ul>
				</div>
			</div>

	

	</div>	<!--/.main-->
	
<div class="row">
<div style="text-align: left; margin-top:20px;"><font color="red">Click the Icons For sorting the  Vehicles Details</font></div>


<div  class="col-md-12">

 <div class="col-md-4"  style="width:352px;">
 <div class="row">

<fieldset style="border: 1px groove blue; height:150px;padding: 0 1em 1em 1em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Vehicle Status</font></legend>
	<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 9px 9px  9px;">
			
					<a href=""><img  title="total vehicles" ng-click="getsorted('all')" src="<c:url value="/resources/images/busimage.png"/>"></a>
				
						</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{totald}}</font></a></div>
				
				</div>
			</div>
			
			
	
			
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;">
					
			<a href=""><img  title="Halt Count" ng-click="getsorted('halt')" src="<c:url value="/resources/images/hand.png"/>"></a>
				
					
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{yellow}}</font></a></div>
					
				</div>
			</div>
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;"">
				
			<a href=""><img   title="Running Count" ng-click="getsorted('running')" src="<c:url value="/resources/imagenew/run.png"/>"></a>
			
					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{green}}</font></a></div>
					
				</div>
			</div>
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;"">
							
					<a href=""><img   title="Stop Count" ng-click="getsorted('stop')" src="<c:url value="/resources/imagenew/stop.png"/>"></a>
					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{red}}</font></a></div>
					
				</div>
			</div>
			
			
			
	
	</fieldset>
	</div>
	</div>
	
<div class="col-md-4"  style="width:1px;"></div>
	
<div class="col-md-4"  style="width:274px;">
 <div class="row">

<fieldset style="border: 1px groove blue; height:150px; padding: 0 1em 1em 1em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Alerts</font></legend>
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;"">
							
					<a href=""><img   title="Temper Status Count" ng-click="getsorted('temper')" src="<c:url value="/resources/imagenew/temper.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{temper}}</font></a></div>
					
				</div>
			</div>
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0; padding: 10px 10px  10px;"">
						
					<a href=""><img   title="AC Count" ng-click="getsorted('ac')" src="<c:url value="/resources/imagenew/battery.png"/>"></a>
					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{ac}}</font></a></div>
					
				</div>
			</div>
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0;padding: 10px 10px  10px;"">
						
					<a href=""><img   title="Overspeed Count" ng-click="getsorted('overspeed')" src="<c:url value="/resources/imagenew/overspeed.png"/>"></a>
					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{overspeed}}</font></a></div>
					
				</div>
			</div>
	
	</fieldset>
	</div>
	</div>
		<div class="col-md-4"    style="width:1px;"></div>
	
	<div class="col-md-4"  style="width:192px;">
 <div class="row">

<fieldset style="border: 1px groove blue; height:150px; padding: 0 1em 1em 1em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">GPS Status</font></legend>
		<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;"">
						
				<a href="">	<img   title="GPS Connect" ng-click="getsorted('gpson')" src="<c:url value="/resources/imagenew/GPSOn.png"/>"></a>

				
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{validgps}}</font></a></div>
					
				</div>
			</div>
			
			
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;"">
						
					<a href=""><img  title="GPS Disconnect" ng-click="getsorted('gpsoff')" src="<c:url value="/resources/imagenew/gpsoff.png"/>"></a>
			
				</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{invalidgps}}</font></a></div>
					
				</div>
			</div>
			
			
	</fieldset>
	</div>
	</div>
<div class="col-md-4"  style="width:1px;"></div>
<div class="col-md-4"  style="width:200px;">
 <div class="row">

<fieldset style="border: 1px groove blue; height:150px; padding: 0 1em 1em 1em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Ignition status</font></legend>
	<div class="col-md-1" style="width:80px;">
	<a href="" title="Ignition On" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;">
					<a href="">	<img  title="Ignition On" ng-click="getsorted('ignnumberon')"  src="<c:url value="/resources/imagenew/IGINIOn.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{ignitionon}}</font></a></div>
					
				</div>
				</a>
			
			</div>
			
			
			<div class="col-md-1"  style="width:80px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;padding: 10px 10px  10px;">
						
				<a href="">	<img  title="Ignition Off" ng-click="getsorted('ignnumberoff')" src="<c:url value="/resources/imagenew/IGINOff.png"/>"></a>
		
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{ignitionoff}}</font></a></div>
					
				</div>
			</div>
	
	</fieldset>
	</div>
	</div>
	<div class="ace-settings-container"  id="ace-settings-container" style="position: fixed;">
	<ul type="none">
			<li class="grey">
							<a   title="Legends Of Dashboard Icon" data-toggle="dropdown" class="dropdown-toggle" href="">
								<i class="ace-icon fa fa-tasks" style="font-size:20px;"></i>
							</a>
							
				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header" style="background-color: #1E0833">
									<i class="fa fa-info-circle" style="font-size:29px;color:white"></i>
									<font color="white">Legends </font>
								</li>
						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar navbar-pink">
							
										<li   style="background: #C0C0C0">
											<a href="">
												<img  title="total vehicles" src="<c:url value="/resources/images/busimage.png"/>">
													<font>	Total Vehicles</font>
											</a>
										</li>

										<li  style="background: #C0C0C0">
											<a href="">
												
												<img title="Ignition On"  src="<c:url value="/resources/imagenew/IGINIOn.png"/>">
												<font>Iginition On</font>
											</a>
										</li>

										<li  style="background: #C0C0C0">
											<a href="">
														<img  title="Ignition Off" src="<c:url value="/resources/imagenew/IGINOff.png"/>">
														<font>Iginition OFF</font>
											</a>
										</li>

										<li style="background: #C0C0C0">
											<a href="">
														<img  title="GPS Connect" src="<c:url value="/resources/imagenew/GPSOn.png"/>">
														<font>GPS Connect</font>
											</a>
										</li>
										
										<li  style="background: #C0C0C0">
											<a href="">
									<img title="GPS Disconnect" src="<c:url value="/resources/imagenew/gpsoff.png"/>">
														<font>	GPS Disconnect</font>
											</a>
										</li>
										<li  style="background: #C0C0C0">
											<a href="">

<img title="Halt Count" src="<c:url value="/resources/images/hand.png"/>">	
													<font>Halt Vehicles</font>
											</a>
										</li>
										
									<li  style="background: #C0C0C0">
											<a href="">
<img  title="Running Count" src="<c:url value="/resources/images/run.png"/>"height="32px" width="32px">
												<font>	Running Count</font>
											</a>
										</li>	
										
										<li  style="background: #C0C0C0">
											<a href="">

<img  title="Stop Count" src="<c:url value="/resources/imagenew/stop.png"/>">
													<font>Stop Count</font>
											</a>
										</li>
										
										<li  style="background: #C0C0C0">
											<a href="">

<img   title="Temper status Count" src="<c:url value="/resources/imagenew/temper.png"/>">
													<font>Temper Status Count</font>
											</a>
										</li>
										
										<li  style="background: #C0C0C0">
											<a href="">

<img   title="AC Count" src="<c:url value="/resources/imagenew/battery.png"/>">
													<font>AC Count</font>
											</a>
										</li>
										
										<li  style="background: #C0C0C0">
											<a href="">

<img   title="Overspeed Count" src="<c:url value="/resources/imagenew/overspeed.png"/>">
													<font>Overspeed Count</font>
											</a>
										</li>
										
												
										
										
						</ul>
								</li>
								
								<li class="dropdown-header" style="background-color: #1E0833">
									&nbsp;
								</li>
								
			</ul>
	</li>
						
		</ul>	
				</div>
		
	</div>

<div class="col-md-12"  id="main"  >
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:white"></i><font color="white";>Vehicle Details
					<div style="text-align: right;margin-top: -10px;"><font color="white";>Total Records:{{total_count}}</font></div>
					</div>
					<div class="panel-body">
					

					
								<table class="table table-striped" cellspacing="0">

													<tr>
											            <td><font color="black">Search By Customer Name/DeviceNO</font></td>
											            <td><input class="form-control" id="livesearchbyDeviceid" /></td>
											            <td><<font color="black">Overspeed Limit</font></td>
											            <td> <select id="livevehiclesumspeedlimit"   class="form-control" ng-model="limit">
     														 <option value="20" >20</option>
     														 <option value="25" >25</option>
     														 <option value="30">30</option>
     														 <option value="35" >35</option>
     														 <option value="40" >40</option>
     		 												 <option value="45">45</option>
     														 <option value="50" selected>50</option>
     		 												 <option value="55">55</option>
     		 												 <option value="60" >60</option>
     		 												 <option value="65" >65</option>
     		 												 <option value="70">70</option>
     														 <option value="75" >75</option>
     													    <option value="80" >80</option>
   															 </select>  
   														</td>
											           
											        	<td><font color="black">Show Rows</font></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														    </td>
														    
															
															 
<%-- <td ><a href="" data-placement='left' title="Non polling"  id="popdanger"><img  title="Non Polling Devices"  src="<c:url value="/resources/images/nonpolling.png"/>"><font>Non Polling</font></a></td> --%>
<td ><a href="" data-placement='left' ng-click="getsorted('downVehicles')" title="Down Vehicles">
<%-- <img  id="downvehicles"  src="<c:url value="/resources/images/nonpolling.png"/>"> --%>
<font>Down Vehicles</font></a></td>
<td style="text-align:right;margin-right:0;"><a href=""><img title="Export To Excel" id="Summaryexcel" src="<c:url value="/resources/imagenew/icon.png" />"></a></td>
															
															<td style="text-align:right;margin-right:0;"><a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
															 </td>
<td><a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a></td>

													
													
														    		        	
											        </tr>   
												</table>
												<div id="liveDiv">
										<table class=""  border="1px" style=" border-color:black; width:100%;" id="livesumm" >
										<colgroup>
														<col width="2%">
														<col width="4%">
														<col width="9%">
														<col width="12%">
														<col width="5%">
														<col width="9%">
														<col width="9%">
														
														<col width="9%">
														<col width="5%">
														<col width="13%">

														<col width="12%">
													</colgroup>
										<thead class="thin-border-bottom">
											<tr id="gridheader">
												<td style="word-wrap:break-word" ng-click="sort('Serial No')"><font color="white">Sr.No.</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('vehicletype')"><font color="white">Type</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicletype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('vehicleid')"><font color="white">Vehicle No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('imeino')"><font color="white">IMEI No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='imeino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('deviceid')"><font color="white">Device No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('mobileno')"><font color="white">Mobile No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='mobileno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word"  ng-click="sort('customername')"><font color="white">Customer Name</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												
												
												<td style="word-wrap:break-word" class="hidden-480" ng-click="sort('datatimestamp')"><font color="white">Polling Time</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
													
												<td style="word-wrap:break-word"  ng-click="sort('vehiclespeed')"><font
													color="white">Speed (KM/Hr)</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
<!-- 													<td style="word-wrap:break-word"  ng-click="sort('vehiclestatus')"><font -->
<!-- 													color="#1E0833">Status</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclestatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													<td style="word-wrap:break-word"  ng-click="sort('ignumber')"><font color="white">Alert Details</font></td> 
<!-- 													<td style="word-wrap:break-word"  ng-click="sort('ignumber')"><font -->
<!-- 													color="#1E0833">Ignition</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='ignumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- 													<td style="word-wrap:break-word" ng-click="sort('vehicledirection')"><font -->
<!-- 													color="#1E0833">Direction</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicledirection'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- 													<td ng-click="sort('gpsstatus')"><font -->
<!-- 													color="#1E0833">GPS Valid</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='gpsstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td style="word-wrap:break-word"  ng-click="sort('temperstatus')"><font -->
<!-- 													color="#1E0833">Tamper</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='temperstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td style="word-wrap:break-word" ng-click="sort('ac')"><font -->
<!-- 													color="#1E0833">Ac</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='ac'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td style="word-wrap:break-word" ng-click="sort('overspeedstaus')"><font -->
<!-- 													color="#1E0833">Overpeed</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='overspeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 												<td style="word-wrap:break-word"><font color="#1E0833">On Map</font> -->
<!-- 												</td> -->
													<td style="word-wrap:break-word"  ng-click="sort('location')"><font
													color="white">Location</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
												
											</tr>
										</thead>

										<tbody>
										<tr ng-show="users.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
											<tr ng-style="set_color(user)"  dir-paginate="user in users|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.rowno}}</font></td>
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehicletype}}"/> "height="19" width="19"></font></td>
												<td    style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.vehicleid}}</font></td>
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.imeino}}</font></td>
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.deviceid}}</font></td>
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.mobileno}}</font></td>
												<td style="word-wrap:break-word"><font color="black"; style="font-weight: 800;" >{{user.customername}}</font></td>
												
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.datatimestamp}}</font></td>
												<td style="word-wrap:break-word"><font  color="black"; style="font-weight: 800;" >{{user.vehiclespeed}}</font></td>
												<td>
<!-- 													<table style="width:100%"> -->
<%-- 														<tr style="background-color:#568176"><td><font>Vehicle - </font></td><td><img src="<c:url value="{{user.vehiclestatus}}"/> "height="19" width="19"></td></tr> --%>
<%-- 														<tr style="background-color:#19A8C4"><td><font>Ignition - </font></td><td><img src="<c:url value="{{user.ignumber}}"/> "height="19" width="19"></td></tr> --%>
<%-- 														<tr style="background-color:#568176"><td><font>Direction - </font></td><td><img src="<c:url value="{{user.vehicledirection}}"/> "height="19" width="19"></td></tr> --%>
<%-- 														<tr style="background-color:#19A8C4"><td><font>GPS - </font></td><td><img src="<c:url value="{{user.gpsstatus}}"/> "height="19" width="19"></td></tr> --%>
<!-- 														<tr style="background-color:#568176"><td><font>Tamper - </font></td><td>{{user.temperstatus}}</td></tr> -->
<!-- 														<tr style="background-color:#19A8C4"><td><font>AC - </font></td><td>{{user.ac}}</td></tr> -->
<!-- 														<tr style="background-color:#568176"><td><font>Overspeed - </font></td><td>{{user.overspeed}}</td></tr> -->
<!-- 													</table> -->

												<table style="width:100%">
														<tr style="background-color:#E8D9BA"><td><font  color="black"; style="font-weight: 800;" >Vehicle - </font></td><td><img src="<c:url value="{{user.vehiclestatus}}"/> "height="19" width="19"></td></tr>
														<tr style="background-color:#CFBFA1"><td><font  color="black"; style="font-weight: 800;" >Ignition - </font></td><td><img src="<c:url value="{{user.ignumber}}"/> "height="19" width="19"></td></tr>
														<tr style="background-color:#E8D9BA"><td><font  color="black"; style="font-weight: 800;" >Direction - </font></td><td><img src="<c:url value="{{user.vehicledirection}}"/> "height="19" width="19"></td></tr>
														<tr style="background-color:#CFBFA1"><td><font  color="black"; style="font-weight: 800;" >GPS - </font></td><td><img src="<c:url value="{{user.gpsstatus}}"/> "height="19" width="19"></td></tr>
														<tr style="background-color:#E8D9BA"><td><font  color="black"; style="font-weight: 800;" >Temper - </font></td><td><font color="black">{{user.temperstatus}}</font></td></tr>
														<tr style="background-color:#CFBFA1"><td><font  color="black"; style="font-weight: 800;" >AC - </font></td><td><font color="black">{{user.ac}}</font></td></tr>
														<tr style="background-color:#E8D9BA"><td><font  color="black"; style="font-weight: 800;" >Overspeed - </font></td><td><font color="black">{{user.overspeed}}</font></td></tr>
													</table>
												</td>
<%-- 												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehiclestatus}}"/> "height="19" width="19"></font></td> --%>
												
<%-- 												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.ignumber}}"/> "height="19" width="19"></font></td> --%>
<%-- 												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehicledirection}}"/> "height="19" width="19"></font></td> --%>
<%-- 												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.gpsstatus}}"/> "height="19" width="19"></font></td> --%>
<!-- 												<td style="word-wrap:break-word"><font>{{user.temperstatus}}</font></td> -->
<!-- 												<td style="word-wrap:break-word"><font>{{user.ac}}</font></td> -->
<!-- 												<td style="word-wrap:break-word"><font>{{user.overspeed}}</font></td> -->
<%-- 												<td style="word-wrap:break-word"><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(user);graphhide();"><img src="<c:url value="/resources/imagenew/map.png" />" --%>
<!-- 												 height="20px" width="20px"></a></td> -->
												<td style="word-wrap:break-word"><font style="font-weight:800;"><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(user);graphhide();">
												{{user.location}}</a></font></td>
											</tr>
										</tbody>
									</table>
									<dir-pagination-controls
										max-size="8"
										direction-links="true"
										boundary-links="true" 
										on-page-change="getData(newPageNumber)" >
									</dir-pagination-controls>
									</div>
						</div>
			</div>
	</div>



<div class="col-md-12"  id="nonpollingTable"  hidden >
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:white"></i>Non Polling Devices
					<div style="text-align: right;margin-top: -10px;"><font>Total Records:{{pollingtotal_count}}</font></div>
<!-- 					</div> -->
<!-- 					<div style="text-align: right;margin-top: -10px;"> -->
			<a  href="" ng-click="backToLive();" title="Go Back" style="float:right;">
			<img src="<c:url value="/resources/imagenew/back.png" />" height="20px" width="20px">
			</a>
					</div>
					<div class="panel-body">
					
					
										
								<table class="table table-striped" cellspacing="0">
<colgroup>
														<col width="12%">
														<col width="12%">
														<col width="12%">
														<col width="12%">
													<col width="12%">
													</colgroup>
													<tr>
											            <td><font>Search By IMEINO/DeviceNO</font></td>
											            <td><div style="text-align: right;"><input class="form-control" id="nonpollingsearchbyDeviceid" /></div></td>
											           	<td><font>Show Rows</font></td>
											        	<td>
											        	<select data-ng-init="option2 = pagesno[0]"  data-ng-model="option2" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option2)">
														    </select>
														    </td>
														    </tr>
														    </table>
					
					
					
					<table class=""  border="1px" style=" border-color:black; width:100%;" id="livesumm" >
										<colgroup>
														<col width="9%">
														<col width="12%">
														<col width="12%">
														<col width="12%">
													<col width="12%">
													</colgroup>
										<thead class="thin-border-bottom">
											<tr id="gridheader">
											<td style="word-wrap:break-word" ng-click="sort('Serial No')"><font color="white">Sr.No.</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('deviceid')"><font color="white">Device ID</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('imeino')"><font color="white">IMEI NO</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='imeino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('simnumber')"><font color="white">Sim Number</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='simnumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('customername')"><font color="white">Customer Name</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												</tr>
												</thead>
												<tbody>
												
									<tr  dir-paginate="x in nonPollingDetails|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="pollingtotal_count">
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.rowno}}</font></td>			
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.deviceid}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.uniqueid}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.simnumber}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.customername}}</font></td>
												
									</tr>
												</tbody>
												
				</table>
<dir-pagination-controls
										max-size="8"
										direction-links="true"
										boundary-links="true" 
										on-page-change="getDatapol(newPageNumber)" >
									</dir-pagination-controls>

</div>
</div>
</div>









<div class="col-md-12"  id="maptrack" hidden>
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">Map  Track
					<a  href="" ng-click="back();showgraph();" title="Go Back"  style="float:right;">
<img src="<c:url value="/resources/imagenew/back.png" />" height="20px" width="20px">
</a>
					</div>
					<div class="panel-body">
				<center><iframe id="mapframe" height="500px" width="100%"></iframe></center>
						</div>
</div>







</div>
<!-- --row -->
</div>
</div>
</div>


