            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<div class="row" >

<!-- <div> -->
			
<%-- 		<center><Strong><i class="fa fa-bar-chart" style="color:black"></i><font color="black">Daily Ambys Performance Details</font></Strong></center> --%>

				
<!-- </div> -->


<div class="col-xs-12">
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
	
			
		
		
		
				<div class="widget-toolbar no-border">
				<ul class="nav nav-tabs" id="recent-tab">
				
					<li >
					<a data-toggle="tab" href="#/LIveoperation"><font>Live Operation</font>
							</a></li>
					<li class="active">
					<a data-toggle="tab" href="#/Performancedashboard"><font>Daily Ambys Performance Details</font>
							</a></li>
						</ul>
				</div>
		
				
			
<div class="row" id="topdata">

<div class="col-md-12">
	
	<div  class="col-md-12">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Star Performing Ambys-On Trip Basis</font></div>
					<div class="panel-body">

<div id="bartop123rtrip" class="barlabel"></div>
	</div>
	</div>
</div>
	
	
</div>
</div>	
			
			
<div class="row">&nbsp;&nbsp;</div>
			
	<div class="row"  id="poordata" >
<div class="col-md-12">

<div >
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Poor Performing Ambys-On trip Basis</font></div>
					<div class="panel-body">

<div id="barpoortrip" class="barlabel"></div>
	</div>
	</div>
	</div>
</div>
</div>				
			
			
<div class="row">&nbsp;&nbsp;</div>
			
			
<div class="row" id="topdata">

<div class="col-md-12">
	<div>
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Star Performing Ambys-Km Basis</font></div>
					<div class="panel-body">

<div id="bartop123r" class="barlabel"></div>
	</div>
</div>
</div>
	
	
</div>
</div>
		
		<div class="row">&nbsp;&nbsp;</div>
		
		
<div class="row"  id="poordata">
<div class="col-md-12">

<div >
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Poor Performing Ambys-KM Basis</font></div>
					<div class="panel-body">

<div id="barpoor" class="barlabel"></div>
	</div>
	</div>
	</div>
</div>
</div>	
		
	
	
	<div class="row">&nbsp;&nbsp;</div>
	
	
	
	
	
	<div class="col-md-12">
	<div>
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Star Performing Ambys-Movement Basis</font></div>
					<div class="panel-body">

<div id="bartop123r1" class="barlabel"></div>
	</div>
	</div>
	</div>
	
	
</div>		
	
	
	
	<div class="row">&nbsp;&nbsp;</div>
	
	
	
	<div class="col-md-12">

<div >
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Poor Performing Ambys-Movement Basis</font></div>
					<div class="panel-body">

<div id="barpoor1" class="barlabel"></div>
	</div>
	</div>
	</div>
</div>		
		
		
		
		
		
		<div class="row">&nbsp;&nbsp;</div>
		
		
		
		
		
		
		<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													 <th><font color="white">Top 10 Star Performing Ambys-On Trip Basis</font></th>
<!-- 													 <th><font color="white">Top 10 Poor Performing Ambys-Km Basis</font></th> -->
													</tr>
													</thead>

												<tbody>
										
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color: #938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black">No Of Trips</font></th>
												</tr>
												</thead>
												<tbody>
												<tr ng-repeat="per in performancetopdetailstrip">
													<td><font color="black">{{per.vehicleno}}</font></td>
													<td><font color="black">{{per.baselocation}}</font></td>
													<td><font color="black">{{per.district}}</font></td>
													<td><font color="black">{{per.distance}}</font></td>
												
												</tr>
											</tbody></table>
												</td>
											
											
												
													</tbody>
	</table>	
		
		
		
		
		
		
		
		
		<div class="row">&nbsp;&nbsp;</div>
		
		
		
		
		<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable1">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
<!-- 													 <th><font color="white">Top 10 Star Performing Ambys-Km Basis</font></th> -->
													 <th><font color="white">Top 10 Poor Performing Ambys-On Trip Basis</font></th>
													</tr>
													</thead>

												<tbody>
										
											
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color:#938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black">No Of Trips</font></th>
												</tr>
												</thead>
												<tbody>
													<tr ng-repeat="per in performancepoordetailstrip">
													<td><font color="black">{{per.vehicleno}}</font></td>
													<td><font color="black">{{per.baselocation}}</font></td>
													<td><font color="black">{{per.district}}</font></td>
													<td><font color="black">{{per.distance}}</font></td>
												
												 </tr>	
												 </tbody>
													</table>
													</td>
													
												
													</tbody>
	</table>
				
		
		
		
<div class="row">&nbsp;&nbsp;</div>
		
	
	
	
	
<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													 <th><font color="white">Top 10 Star Performing Ambys-Km Basis</font></th>
<!-- 													 <th><font color="white">Top 10 Poor Performing Ambys-Km Basis</font></th> -->
													</tr>
													</thead>

												<tbody>
										
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color: #938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black">Distance-km</font></th>
												</tr>
												</thead>
												<tbody>
												<tr ng-repeat="per in performancetopdetails">
													<td><font color="black">{{per.vehicleno}}</font></td>
													<td><font color="black">{{per.baselocation}}</font></td>
													<td><font color="black">{{per.district}}</font></td>
													<td><font color="black">{{per.distance}}</font></td>
												
												</tr>
											</tbody></table>
												</td>
											
											
												
													</tbody>
	</table>	
		
		
			
			
			
			
<div class="row">&nbsp;&nbsp;</div>
			
			

			
			
	<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable1">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
<!-- 													 <th><font color="white">Top 10 Star Performing Ambys-Km Basis</font></th> -->
													 <th><font color="white">Top 10 Poor Performing Ambys-Km Basis</font></th>
													</tr>
													</thead>

												<tbody>
										
											
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color:#938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black" >Distance-km</font></th>
												</tr>
												</thead>
												<tbody>
													<tr ng-repeat="per in performancepoordetails">
													<td><font color="black">{{per.vehicleno}}</font></td>
													<td><font color="black">{{per.baselocation}}</font></td>
													<td><font color="black">{{per.district}}</font></td>
													<td><font color="black">{{per.distance}}</font></td>
												
												 </tr>	
												 </tbody>
													</table>
													</td>
													
												
													</tbody>
	</table>	
			
			
			
			
			
		<div class="row">&nbsp;&nbsp;</div>



			
	<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													 <th><font color="white">Top 10 Star Performing Ambys-Movement Basis</font></th>
<!-- 													 <th><font color="white">Top 105 Poor Performing Ambys-Movement Basis</font></th> -->
													</tr>
													</thead>

												<tbody>
										
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color: #938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black">Time-HH:MM:SS</font></th>
												</tr>
												</thead>
												<tbody>
												<tr ng-repeat="per in performancetopdetails1">
													<td><font color="black">{{per.vehicleno}}</font></td>
													<td><font color="black">{{per.baselocation}}</font></td>
													<td><font color="black">{{per.district}}</font></td>
													<td><font color="black">{{per.time}}</font></td>
												
												</tr>
											</tbody></table>
												</td>
											
												
													</tbody>
												</table>		
			
			
			
			
			
			<div class="row"  id="poordatatime">

</div>
			
			
	<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable1">
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
<!-- 													 <th><font color="white">Top 10 Star Performing Ambys-Movement Basis</font></th> -->
													 <th><font color="white">Top 10 Poor Performing Ambys-Movement Basis</font></th>
													</tr>
													</thead>

												<tbody>
										
											
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color:#938d82">
												<th><font color="black">Vehicle No.</font></th>
												<th><font color="black">Base Location</font></th>
												<th><font color="black">District</font></th>
												<th><font color="black">Time-HH:MM:SS</font></th>
												</tr>
												</thead>
												<tbody>
													<tr ng-repeat="per in performancepoordetails1">
													<td ><font color="black">{{per.vehicleno}}</font></td>
													<td ><font color="black">{{per.baselocation}}</font></td>
													<td ><font color="black">{{per.district}}</font></td>
													<td ><font color="black">{{per.time}}</font></td>
												
												 </tr>	
												 </tbody>
													</table>
													</td>
													
												
													</tbody>
												</table>	
												
												
												
<!-- ////no of trips												 -->
												
												
												

										



										
												
												
			
			
			
			
								
			










		
			
	</div>
	</div>
	</div>
</div>