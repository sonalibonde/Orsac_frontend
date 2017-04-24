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
						<li ><a data-toggle="tab" href="#/home">Live Vehicle Status
							</a></li>

						<li class="active"><a data-toggle="tab" href="#/CustomerLivedash">Vehicle Details
							</a></li>

					</ul>
				</div>
			</div>

	

	</div>
	
<div style="text-align: left; margin-top:20px;"><font color="red">Click the Icons For sorting the  Vehicles Details</font></div>
	
<div class="col-md-12">

 <div class="col-md-4"  style="width:342px;">
 <div class="row">
<fieldset style="border: 1px groove blue; height:150px; padding: 0 1em 1em 1em; margin: 0 0 0 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Speed  Status</font></legend>

	<div class="row" style="margin-top: -11px;">
	
	
	<div class="col-md-1"  style="width:85px;">
	<a href="" title="Total vehicles" style="text-decoration: none">
				<div class="panel panel-primary">
				
				<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
				<a  href="" ><img  title="Total vehicles" ng-click="getsorted('all')" src="<c:url value="/resources/images/busimage.png"/>"></a>
						</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{totald}}</font></a></div>
				
<!-- 			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">5222</font></a></div> -->
					
				</div>
				</a>
				
			</div>
			
			
			<div class="col-md-1 " style="width:85px;">
			<a href="" title="Halt Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
			<a href="">	<img  title="Halt Count" ng-click="getsorted('hault')" src="<c:url value="/resources/images/hand.png"/>"></a>

					
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{yellow}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1"  style="width:85px;">
				<a href="" title="Running Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
			<a href="">	<img   title="Running Count" ng-click="getsorted('running')" src="<c:url value="/resources/imagenew/run.png"/>"></a>

					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{green}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1" style="width:85px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Stop Count" ng-click="getsorted('stop')" src="<c:url value="/resources/imagenew/stop.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{red}}</font></a></div>
					
				</div>
				
			</div>
			
	</div>
	
	</fieldset>
	</div>
	</div>
	<div class="col-md-4"  style="width:9px;"></div>
	<div class="col-md-4"  style="width:290px;">
	<div class="row">
	<fieldset style="border: 1px groove blue; height:150px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Battery Status</font></legend>

	<div class="row" style="margin-top: -11px;">
	
	
			
			
			<div class="col-md-1"  style="width:85px;">
			<a href="" title="Temper Status Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Temper Status Count" ng-click="getsorted('temper')" src="<c:url value="/resources/imagenew/temper.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{temper}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1"  style="width:85px;">
				<a href="" title="AC Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0; text-align:center;">
				<a href="">		<img   title="AC Count" ng-click="getsorted('ac')" src="<c:url value="/resources/imagenew/battery.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href=''><font color="white">{{ac}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1"  style="width:85px;">
			<a href="" title="Overspeed Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0;text-align:center;">
					<a href="">	<img   title="Overspeed Count" ng-click="getsorted('overspeed')" src="<c:url value="/resources/imagenew/overspeed.png"/>"></a>

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
	<fieldset style="border: 1px groove blue; height:150px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">GPS Status</font></legend>

	<div class="row" style="margin-top: -11px;">
	
			
			
			<div class="col-md-4"  style="width:85px;">
				<a href="" title="GPS Connect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="GPS Connect" ng-click="getsorted('gpson')" src="<c:url value="/resources/imagenew/GPSOn.png"/>"></a>

				
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{validgps}}</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			
			
			<div class="col-md-4"  style="width:85px;">
			<a href="" title="GPS Disconnect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
				<a href="">	<img  title="GPS Disconnect" ng-click="getsorted('gpsoff')" src="<c:url value="/resources/imagenew/gpsoff.png"/>"></a>

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
<fieldset style="border: 1px groove blue; height:150px; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000; margin-top: -10px;">
<legend style=" border-bottom: none; width: inherit;"><font size="5">Ignition Status</font></legend>

	<div class="row" style="margin-top: -11px;">
		
            
	<div class="col-md-2" style="width:85px;">
	<a href="" title="Ignition On" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img  title="Ignition On" ng-click="getsorted('ignnumberon')"  src="<c:url value="/resources/imagenew/IGINIOn.png"/>"></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''><font color="white">{{ignitionon}}</font></a></div>
					
				</div>
				</a>
			
			</div>
			
			
			<div class="col-md-2"  style="width:85px;">
				<a href="" title="Ignition Off" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Ignition Off" ng-click="getsorted('ignnumberoff')" src="<c:url value="/resources/imagenew/IGINOff.png"/>"></a>
		
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
<div class="ace-settings-container" id="ace-settings-container">
	<ul type="none">
			<li class="grey">
							<a   title="Legends Of Dashboard Icon" data-toggle="dropdown" class="dropdown-toggle" href="">
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
<!-- --row--- -->



<div class="row" id="graphrow">


<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Vehicle Statistics</font>
						</div>
					<div class="panel-body">
					<div id="piechart" style="height:150px;"></div>

					</div>
				</div>
			</div><!--/.col-->
			
			
			
			
			<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Device Statistics</font></div>
					<div class="panel-body">
					<div id="barchart" style="height:150px;"></div>

					</div>
				</div>
			</div><!--/.col-->


</div>
<!-- --row -->



</div>
