    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="row" >


<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
					<li class="active"><a data-toggle="tab" href="#/home"><font>Vehicle Live Status</font>
							</a></li>
				</ul>
				</div>
			</div>

	<div class="row" id="graphrow" style="margin-top:20px">



<div class="ace-settings-container" id="ace-settings-container">
	<ul type="none">
			<li class="grey open">
							<a   title="Legends Of Dashboard Icon" data-toggle="dropdown" class="dropdown-toggle" href="" area-expanded="true">
								<i class="ace-icon fa fa-tasks" style="font-size:20px;"></i>
<!-- 								<span class="badge badge-grey">Legends</span> -->
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
												
												<img title="Igntion On"  src="<c:url value="/resources/imagenew/IGINIOn.png"/>">
												<font>Ignition On</font>
											</a>
										</li>

										<li  style="background: #C0C0C0">
											<a href="">
														<img  title="Igntion Off" src="<c:url value="/resources/imagenew/IGINOff.png"/>">
														<font>Ignition OFF</font>
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
										
												
<!-- 										<li  style="background: #C0C0C0"> -->
<!-- 											<a href=""> -->

<%-- <img   title="Temper status Count" src="<c:url value="/resources/imagenew/temper.png"/>"> --%>
<!-- 													<font>Temper Status Count</font> -->
<!-- 											</a> -->
<!-- 										</li> -->
										
										<li  style="background: #C0C0C0">
											<a href="">

<img   title="Not Working Count" src="<c:url value="/resources/imagenew/notworking.png"/>">
													<font>Not Working Count</font>
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

	
<!-- <div style="text-align: left; margin-top:20px;"><font color="red">Click the Icons For sorting the  Vehicles Details</font></div> -->
	
<div class="col-md-12">

 <div class="col-md-4"  style="width:450px;">
 <div class="row">
<fieldset style="border: 1px groove blue; height:130px; padding: 0 1em 1em 1em; margin: 0 0 0 0; -webkit-box-shadow: 0px 0px 0px 0px #779ECB; box-shadow: 0px 0px 0px 0px #779ECB; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Vehicle Status</font></legend>

	<div class="row" style="margin-top: -11px;">
	
	
	<div class="col-md-1"  style="width:85px;">
	<a href="" title="Total vehicles" >
				<div class="panel panel-primary">
				
				<div class="panel-body"  style="background: #C0C0C0;height:50px ;text-align:center;">
				<a  ><img  title="Total vehicles" ng-click="getsorted('all')" src="<c:url value="/resources/images/busimage.png"/>"></a>
						</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{totald}}</font></a></div>
				
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">5222</font></a></div> -->
					
				</div>
				</a>
				
			</div>
			
			
			<div class="col-md-1 " style="width:85px;">
			<a  title="Halt Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0;height:50px ;text-align:center;">
			<a href="">	<img  title="Halt Count" ng-click="getsorted('hault')" src="<c:url value="/resources/images/hand.png"/>"></a>

					
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{yellow}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1"  style="width:85px;">
				<a  title="Running Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0;height:50px ;text-align:center;">
			<a href="">	<img   title="Running Count" ng-click="getsorted('running')" src="<c:url value="/resources/imagenew/run.png"/>"></a>

					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{green}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1" style="width:85px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;height:50px ;text-align:center;">
					<a >	<img   title="Stop Count" ng-click="getsorted('stop')" src="<c:url value="/resources/imagenew/stop.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{red}}</font></a></div>
					
				</div>
				
			</div>
			
			
			<div class="col-md-1" style="width:85px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;height:50px ;text-align:center;">
					<a >	<img   title="Not Working Count" ng-click="getsorted('stop')" src="<c:url value="/resources/imagenew/notworking.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{not_working_devices}}</font></a></div>
					
				</div>
				
			</div>
			
	</div>
	
	</fieldset>
	</div>
	</div>
	<div class="col-md-4"  style="width:9px;"></div>
	<div class="col-md-4"  style="width:90px;">
	<div class="row">
	<fieldset style="border: 1px groove blue; height:130px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Alert</font></legend>

	<div class="row" style="margin-top: -11px;">
	
	
			
			
<!-- 			<div class="col-md-1"  style="width:85px;"> -->
<!-- 			<a href="" title="Temper Status Count" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;"> -->
<%-- 					<a href="">	<img   title="Temper Status Count" ng-click="getsorted('temper')" src="<c:url value="/resources/imagenew/temper.png"/>"></a> --%>

<!-- 					</div> -->
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{temper}}</font></a></div> -->
					
<!-- 				</div> -->
<!-- 				</a> -->
				
<!-- 			</div> -->
			
<!-- 			<div class="col-md-1"  style="width:85px;"> -->
<!-- 				<a href="" title="AC Count" style="text-decoration: none"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-body"  style="background: #C0C0C0; text-align:center;"> -->
<%-- 				<a href="">		<img   title="AC Count" ng-click="getsorted('ac')" src="<c:url value="/resources/imagenew/battery.png"/>"></a> --%>

<!-- 					</div> -->
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{ac}}</font></a></div> -->
					
<!-- 				</div> -->
<!-- 				</a> -->
				
<!-- 			</div> -->
			
			<div class="col-md-1"  style="width:85px;">
			<a href="" title="Overspeed Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0;height:50px ;text-align:center;">
					<a >	<img   title="Overspeed Count" ng-click="getsorted('overspeed')" src="<c:url value="/resources/imagenew/overspeed.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{overspeed}}</font></a></div>
					
				</div>
				</a>
			
			</div>
	
	</div>
	
	</fieldset>
	
	</div>
	</div>
	
<!-- 	</div> -->
<!-- 	<div class="col-md-12"> -->
	
	<div class="col-md-4"  style="width:9px;"></div>
	<div class="col-md-4"  style="width:190px;">
	<div class="row">
	<fieldset style="border: 1px groove blue; height:130px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">GPS Status</font></legend>

	<div class="row" style="margin-top: -11px;">
	
			
			
			<div class="col-md-4"  style="width:85px;">
				<a href="" title="GPS Connect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;height:50px ;text-align:center;">
					<a >	<img   title="GPS Connect" ng-click="getsorted('gpson')" src="<c:url value="/resources/imagenew/GPSOn.png"/>"></a>

				
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{validgps}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			
			
			<div class="col-md-4"  style="width:85px;">
			<a href="" title="GPS Disconnect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;height:50px ;text-align:center;">
				<a >	<img  title="GPS Disconnect" ng-click="getsorted('gpsoff')" src="<c:url value="/resources/imagenew/gpsoff.png"/>"></a>

				</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{invalidgps}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
	
	</div>
	
	</fieldset>
	</div>
	</div>
	
	<div class="col-md-4"  style="width:9px;"></div>
<div class="col-md-4"   style="width:190px;">
<div class="row">
<fieldset style="border: 1px groove blue; height:130px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Ignition Status</font></legend>

	<div class="row" style="margin-top: -11px;">
		
            
	<div class="col-md-2" style="width:85px;">
	<a href="" title="Ignition On" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;height:50px ;">
					<a >	<img  title="Ignition On" ng-click="getsorted('ignnumberon')"  src="<c:url value="/resources/imagenew/IGINIOn.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{ignitionon}}</font></a></div>
					
				</div>
				</a>
			
			</div>
			
			
			<div class="col-md-2"  style="width:85px;">
				<a href="" title="Ignition Off" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;height:50px ;">
					<a >	<img   title="Ignition Off" ng-click="getsorted('ignnumberoff')" src="<c:url value="/resources/imagenew/IGINOff.png"/>"></a>
		
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{ignitionoff}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			

	
	</div>
	
	</fieldset>
	</div>
	</div>
	

	
	
	
	
<!-- </div> -->


</div>

</br>
</br>

<!-- <div class="col-md-6"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"> -->
<!-- 					<i class="fa fa-pie-chart" style="color:white"></i> -->
<!-- 						<font color="white">Vehicle Statistics</font> -->
<!-- 						</div> -->
<!-- 					<div class="panel-body"> -->
<!-- 					<div id="piechart" style="height:150px;"></div> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
			
			
			
<!-- 			<div class="col-md-6" style="width:500px;"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font color="white">Device Statistics</font></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 					<div id="barchart" style="height:150px;"></div> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->

<!-- <div class="row"> -->

<!-- <div class="col-md-12"  id="main"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><font color="white";>Vehicle Details</font> -->
<!-- 					<div style="text-align: right;margin-top: -10px;"><font color="white";>Total Records:{{total_count}}</font></div> -->
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 					<div class="panel-body"> -->
<!-- 								<table class="table table-striped" cellspacing="0"> -->
<%-- 													<colgroup> --%>
<%-- 														<col width="5%"> --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 													</colgroup> --%>
<!-- 													<tr> -->
<!-- 											            <td><font>Search</font></td> -->
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											        
<!-- 											             <td><div style="width:158px;"><font>Overspeed Limit</font></div></td> -->
<!-- 											            <td> <select id="livevehiclesumspeedlimit"   class="form-control" ng-model="limit"> -->
<!--      														 <option value="20" >20</option> -->
<!--      														 <option value="25" >25</option> -->
<!--      														 <option value="30">30</option> -->
<!--      														 <option value="35" >35</option> -->
<!--      														 <option value="40" >40</option> -->
<!--      		 												 <option value="45">45</option> -->
<!--      														 <option value="50" selected>50</option> -->
<!--      		 												 <option value="55">55</option> -->
<!--      		 												 <option value="60" >60</option> -->
<!--      		 												 <option value="65" >65</option> -->
<!--      		 												 <option value="70">70</option> -->
<!--      														 <option value="75" >75</option> -->
<!--      													    <option value="80" >80</option> -->
<!--    															 </select>   -->
<!--    														</td> -->
<!--    														<td></td> -->
<!-- 											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td> -->
<!-- 											        	<td> -->
<!-- 											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)"> -->
<!-- 														    </select> -->
<!-- 														    </td> -->
														     
<%-- 									<td style="text-align:right;margin-right:0;"><a href=""><img title="Export To Excel" id="Summaryexcel" src="<c:url value="/resources/imagenew/icon.png" />"></a></td> --%>
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td style="text-align:right;margin-right:0;"><a id="printbutton" title="Print" href=""> -->
<%-- 		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px"> --%>
<!-- 										</a></td> -->
<!-- 											        	</tr></table></td> -->
<!-- <!-- 											        	<td><font>Total Records:{{total_count}}</font></td> --> 

<%-- <td ><a href="" data-placement='left' title="Non polling"  id="popdanger1"><img  title="Non Polling Devices"   src="<c:url value="/resources/images/nonpolling.png"/>"><font>Non Polling</font></a></td> --%>

<!-- 											        </tr>    -->
<!-- 												</table> -->
<!-- <!-- 												<select ng-init="somethingHere = options[0]" ng-model="somethingHere" ng-options="option.name for option in options"></select> --> 
<!-- 											<table class="table"  border="1px" style=" border-color:black;" id="livesumm"> -->
<!-- 										<thead class="thin-border-bottom"> -->
<!-- 											<tr id="gridheader"> -->
<!-- 												<td class="hidden-480" ng-click="sort('Serial No')"><font color="White">Sr.No.</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
<!-- 												<td class="hidden-480" ng-click="sort('vehicleid')"><font color="White">Vehicle No</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
<!-- <!-- 												<td class="hidden-480" ng-click="sort('imeino')"><font color="#1E0833">IMEI No</font> --> 
<!-- <!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='imeino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> --> 
<!-- <!-- 												</td> --> 
<!-- <!-- 												<td class="hidden-480" ng-click="sort('deviceid')"><font color="#1E0833">Device No</font> --> 
<!-- <!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> --> 
<!-- <!-- 												</td> --> 
												
<!-- 												<td class="hidden-480" ng-click="sort('location')"><font -->
<!-- 													color="White">Location</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- 												<td class="hidden-480" ng-click="sort('datatimestamp')"><font color="White">Polling Time</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
												
<!-- 												<td class="hidden-480" ng-click="sort('vehiclespeed')"><font -->
<!-- 													color="White">Speed</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td class="hidden-480" ng-click="sort('vehiclestatus')"><font color="White">Status</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclestatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
							
<!-- 													<td class="hidden-480" ng-click="sort('vehicletype')"><font color="White">Vehicle Type</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicletype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
												
<!-- 													<td class="hidden-480" ng-click="sort('ignumber')"><font -->
<!-- 													color="White">Ignition</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='ignumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- 													<td class="hidden-480" ng-click="sort('vehicledirection')"><font -->
<!-- 													color="White">Direction</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicledirection'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- 													<td class="hidden-480" ng-click="sort('gpsstatus')"><font -->
<!-- 													color="White">GPS Valid</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='gpsstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
<!-- <!-- 													<td style="word-wrap:break-word"  ng-click="sort('temperstatus')"><font --> 
<!-- <!-- 													color="White">Tamper</font> --> 
<!-- <!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='temperstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> --> 
<!-- <!-- 													</td> --> 
													
<!-- <!-- 													<td style="word-wrap:break-word" ng-click="sort('ac')"><font --> 
<!-- <!-- 													color="White">Ac</font> --> 
<!-- <!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='ac'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> --> 
<!-- <!-- 													</td> --> 
													
<!-- 													<td style="word-wrap:break-word" ng-click="sort('overspeedstaus')"><font -->
<!-- 													color="White">Overpeed</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='overspeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
													
<!-- 												<td class="hidden-410"><font color="White">Track On Map</font> -->
<!-- 												</td> -->
												
<!-- 											</tr> -->
<!-- 										</thead> -->

<!-- 										<tbody> -->
<%-- 											<tr ng-show="users.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
<!-- 											<tr dir-paginate="user in users|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"> -->
<!-- 												<td><font>{{user.rowno}}</font></td> -->
<!-- 												<td><font>{{user.vehicleid}}</font></td> -->
<!-- <!-- 												<td><font>{{user.imeino}}</font></td> --> 
<!-- <!-- 												<td><font>{{user.deviceid}}</font></td> --> 
<!-- 												<td><font>{{user.location}}</font></td> -->
<!-- 												<td><font>{{user.datatimestamp}}</font></td> -->
<!-- 												<td><font>{{user.vehiclespeed}}</font></td> -->
<%-- 												<td><font><img src="<c:url value="{{user.vehiclestatus}}"/> "height="23"></font></td> --%>
<%-- 												<td><font><img src="<c:url value="{{user.vehicletype}}"/> "height="23"></font></td> --%>
<%-- 												<td><font><img src="<c:url value="{{user.ignumber}}"/> "height="23"></font></td> --%>
<%-- 												<td><font><img src="<c:url value="{{user.vehicledirection}}"/> "height="23"></font></td> --%>
<%-- 												<td><font><img src="<c:url value="{{user.gpsstatus}}"/> "height="23"></font></td> --%>
<!-- <!-- 												<td style="word-wrap:break-word"><font>{{user.temperstatus}}</font></td> --> 
<!-- <!-- 												<td style="word-wrap:break-word"><font>{{user.ac}}</font></td> --> 
<!-- 												<td style="word-wrap:break-word"><font>{{user.overspeed}}</font></td> -->
<%-- 												<td><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(user);graphhide();"><img src="<c:url value="/resources/imagenew/map.png" />" --%>
<!-- 									 height="20px" width="20px"></a></td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 									<dir-pagination-controls -->
<!-- 										max-size="8" -->
<!-- 										direction-links="true" -->
<!-- 										boundary-links="true"  -->
<!-- 										on-page-change="getData(newPageNumber)" > -->
<!-- 									</dir-pagination-controls> -->
								
<!-- 				<div id="popover_content_wrapper1"    hidden="true" > -->
<!-- <!--  <div class="pop-title">Non Polling Devices</div> --> 
<!--     <div class="pop-content"> -->
<!--   <div  style="overflow-x:auto;overflow-y:auto; height:200px; width:250px;"> -->
<!-- <!-- <ul type="disc"> --> 
<!-- <!-- <li ng-repeat="name in nonPollingDetails"><font color="#1E0833">{{name.uniqueid}}</font></li> --> 
<!-- <!-- </ul> --> 

<!-- <table class="table-bordered" border="2" width="100%" cellspacing="0"> -->
<%-- <colgroup>	 --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														</colgroup> --%>
<!-- <thead><tr style="background: black"><td><font color="white">Device ID</font></td> -->
<!-- <td><font color="white">IMEI NO</font></td> -->

<!-- <td><font color="white">Sim Number</font></td></tr></thead> -->
<!-- <tbody> -->
<!-- <tr ng-repeat="name in nonPollingDetails"> -->
<!-- <td><font>{{name.deviceid}}</font></td> -->
<!-- <td><font>{{name.uniqueid}}</font></td> -->
<!-- <td><font>{{name.simnumber}}</font></td> -->
<!-- </tr> -->
<!-- </tbody> -->
<!-- </table> -->
<!--  </div> -->
<!--  </div> -->
<!-- </div> -->
<!-- 					</div> -->
<!-- 			</div> -->
<!-- 	</div> -->


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


<div class="row">

<div class="col-md-12"  id="main">
<div class="panel panel-primary">
<div class="panel-heading dark-overlay" id="dealerlabel"><font color="white";>Vehicle Details</font>
<div style="text-align: right;margin-top: -10px;"><font color="white";>Total Records:{{total_count}}</font></div>
</div>
</div>
<div class="panel-body">

<datalist id="userlist">
<option ng-repeat="x in userclist" value="{{x.companyname}}"></option>
<option value="All" selected></option>
</datalist>
<table class="table table-striped" cellspacing="0">
<%-- <colgroup> --%>
<%-- <col width="5%"> --%>
<%-- <col width="15%"> --%>
<%-- <col width="05%"> --%>
<%-- <col width="10%"> --%>
<%-- <col width="05%"> --%>
<%-- <col width="05%"> --%>
<%-- <col width="05%"> --%>
<%-- <col width="05%"> --%>
<%-- <col width="05%"> --%>

<%-- <col width="05%"> --%>
<%-- </colgroup> --%>
<tr>  <td><font>Search</font></td>
<td><input class="form-control" ng-model="query[queryBy]" /></td>
 <td><div ><font>Company</font></div></td>
  <td><input class="form-control" id="compsearch" list="userlist" ng-model="compsearch"/></td>
	<td><button ng-click="searchvehicle();"><font>Search</font></button></td>	
     <td><div ><font>Overspeed Limit</font></div></td>
											           

 <td> <select id="livevehiclesumspeedlimit"  style="width:60px;" class="form-control" ng-model="limit">
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
     													    <option  value="80" >80</option>
   															 </select>  
   														</td>
   													
											        	<td><table><tr><td><div><font>Show Rows</font></div></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														    </td>
									        	</tr></table></td>
									        	
									        	<td style="text-align:right;margin-right:0;"><a href=""><img height="30px";width="30px"; title="Export To Excel" id="Summaryexcel" src="<c:url value="/resources/imagenew/icon.png" />"></a></td>
									<td><a data-toggle="tab" href="#/CustomerMap"><font size=20px><img  height="30px";width="30px";title="All vehicles on map" src="<c:url value="/resources/imagenew/map.png" />"></font></a></td>
									<td style="text-align:right;margin-right:0;"><a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a></td>
<!-- 											        	<td><font>Total Records:{{total_count}}</font></td> -->

<%-- <td ><a href="" data-placement='left' title="Non polling"  id="popdanger1"><img  title="Non Polling Devices"   src="<c:url value="/resources/images/nonpolling.png"/>"><font>Non Polling</font></a></td> --%>


											        </tr>   
												</table>
<!-- 												<select ng-init="somethingHere = options[0]" ng-model="somethingHere" ng-options="option.name for option in options"></select> -->
<div id="deviceDiv">
											<table class="table"  border="1px" style=" border-color:black;" id="livesumm">
										<thead class="thin-border-bottom">
											<tr id="gridheader">
												<td class="hidden-480" ng-click="sort('Serial No')"><font color="White">Sr.No.</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td class="hidden-480" ng-click="sort('vehicleid')"><font color="White">Vehicle No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td class="hidden-480" ng-click="sort('cid')"><font color="white">Company</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='cid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
<!-- 												<td class="hidden-480" ng-click="sort('deviceid')"><font color="#1E0833">Device No</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
												
												<td class="hidden-480" ng-click="sort('location')"><font
													color="White">Location</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
												<td class="hidden-480" ng-click="sort('datatimestamp')"><font color="White">Polling Time</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												
												<td class="hidden-480" ng-click="sort('vehiclespeed')"><font
													color="White">Speed</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													
													<td class="hidden-480" ng-click="sort('vehiclestatus')"><font color="White">Status</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclestatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
							
<!-- 													<td class="hidden-480" ng-click="sort('vehicletype')"><font color="White">Vehicle Type</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicletype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 												</td> -->
												
													<td class="hidden-480" ng-click="sort('ignumber')"><font
													color="White">Ignition</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='ignumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td class="hidden-480" ng-click="sort('vehicledirection')"><font
													color="White">Direction</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicledirection'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td class="hidden-480" ng-click="sort('gpsstatus')"><font
													color="White">GPS Valid</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='gpsstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
<!-- 													<td style="word-wrap:break-word"  ng-click="sort('temperstatus')"><font -->
<!-- 													color="White">Tamper</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='temperstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td style="word-wrap:break-word" ng-click="sort('ac')"><font -->
<!-- 													color="White">Ac</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='ac'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
<!-- 													<td style="word-wrap:break-word" ng-click="sort('overspeedstaus')"><font -->
<!-- 													color="White">Overspeed</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='overspeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</td> -->
													
													
												<td class="hidden-410"><font color="White">Track On Map</font>
												</td>
												
											</tr>
										</thead>

										<tbody>
											
											<tr dir-paginate="user in users|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
												<td><font>{{user.rowno}}</font></td>
												<td><font>{{user.vehicleid}}</font></td>
												<td><font>{{user.cid}}</font></td>
<!-- 												<td><font>{{user.deviceid}}</font></td> -->
												<td><font>{{user.location}}</font></td>
												<td><font>{{user.datatimestamp}}</font></td>
												<td><font>{{user.vehiclespeed}}</font></td>
												<td><font><img src="<c:url value="{{user.vehiclestatus}}"/> "height="23"></font></td>
<%-- 												<td><font><img src="<c:url value="{{user.vehicletype}}"/> "height="23"></font></td> --%>
												<td><font><img src="<c:url value="{{user.ignumber}}"/> "height="23"></font></td>
												<td><font><img src="<c:url value="{{user.vehicledirection}}"/> "height="23"></font></td>
												<td><font><img src="<c:url value="{{user.gpsstatus}}"/> "height="23"></font></td>
<!-- 												<td style="word-wrap:break-word"><font>{{user.temperstatus}}</font></td> -->
<!-- 												<td style="word-wrap:break-word"><font>{{user.ac}}</font></td> -->
<!-- 												<td style="word-wrap:break-word"><font>{{user.overspeed}}</font></td> -->
												<td><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(user);graphhide();"><img src="<c:url value="/resources/imagenew/map.png" />"
									 height="20px" width="20px"></a></td>
											</tr>
										</tbody>
									</table>
									<dir-pagination-controls
										max-size="8"
										direction-links="true"
										boundary-links="true" 
										on-page-change="getData(newPageNumber)" >
									</dir-pagination-controls>
								
				<div id="popover_content_wrapper1"    hidden="true" >
<!--  <div class="pop-title">Non Polling Devices</div> -->
    <div class="pop-content">
  <div  style="overflow-x:auto;overflow-y:auto; height:200px; width:250px;">
<!-- <ul type="disc"> -->
<!-- <li ng-repeat="name in nonPollingDetails"><font color="#1E0833">{{name.uniqueid}}</font></li> -->
<!-- </ul> -->

<table class="table-bordered" border="2" width="100%" cellspacing="0">
<colgroup>	
														<col width="20%">
														<col width="15%">
														<col width="15%">
														</colgroup>
<thead><tr style="background: black"><td><font color="white">Device ID</font></td>
<td><font color="white">IMEI NO</font></td>

<td><font color="white">Sim Number</font></td></tr></thead>
<tbody>
<tr ng-repeat="name in nonPollingDetails">
<td><font>{{name.deviceid}}</font></td>
<td><font>{{name.uniqueid}}</font></td>
<td><font>{{name.simnumber}}</font></td>
</tr>
</tbody>
</table>
 </div>
 </div>
</div>
					</div>
	</div>		</div>
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
