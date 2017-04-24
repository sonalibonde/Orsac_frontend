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
					
					
					<li>
					
					<li>
<!-- 				<a data-dismiss="modal" data-toggle="modal" data-target="#myModal12" class="dropdown-toggle" href="">  -->
<!--  								<i class="ace-icon fa fa-bell icon-animated-bell"></i>  -->
<!--  								<span class="badge badge-important">Alerts</span> -->
<!--  				</a> -->
				
<!-- 		    	<button id="featureinfo12" class="btn btn-default btclass" data-toggle="modal" data-target="#myModal1" >Save Geofence</button> -->
		    </li>
					<li class="">
					<a data-toggle="tab" href="#/dashboard"><font>Vehicle Live Status</font>
							</a></li>
<!-- 							<li class="active"> -->
<!-- 					<a data-toggle="tab" href="#/AmbysperformancedashBoard"><font>Vehicles Performance</font> -->
<!-- 							</a></li> -->
					
						<li ><a data-toggle="tab" href="#/CustomerMap"><font>Live Map</font>
						</a></li>
						
						
						
<!-- 					<li class=""> -->
<!-- 					<a data-toggle="tab" href="#/DistrictdashGraph"><font>District Wise Vehicle Location Graph</font> -->
<!-- 							</a></li> -->
						
						<li class="">
					<a data-toggle="tab" href="#/AlertsDashboard"><font>Alerts</font>
							</a></li>

					</ul>
				</div>
				
					
			</div>


<%-- <div class="row"><div class="col-md-12"><center><h3>Total Vehicles:748</h3></center></div></</div> --%>



<div class="row">
<div class="col-md-12">

 

<div class="row">
<div class="col-md-12">


<div class="col-sm-4" style="background-color:#9e6214;"><font style="size:20px;" color="white"><b>In Base</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;"  color="white">{{basecount}}</font></div>
</div>
     <div class="col-md-4" style="background-color:#4a3e8e;"><font style="size:20px;" color="white"><b>Away From Base</b></font>
      <span class="count_top"> </span>
     <div class="count"><font style="size:20px;" color="white">{{casecountvalue}}</font></div>
    </div>
    <div class="col-md-4" style="background-color:#f27704;"><font style="size:20px;" color="white"><b>In Base(Hot Spot)</b></font>
   <span class="count_top"></span>
     <div class="count"><font style="size:20px;"  color="white">{{hospcount}}</font></div>
    </div>
  </div>
</div>


<div class="row">&nbsp;</div>
<div class="row">
<div class="col-md-12">
<button type="button"><font color="black">Daily</font></button>
<button type="button"  disabled><font color="black">Weekly</font></button>
<button type="button" disabled><font color="black">Monthly</font></button>
<button type="button"  disabled><font color="black">Yearly</font></button>
</div>
</div>	
	

<div class="row">&nbsp;</div>




<div class="row">
<div class="col-md-12">

 
<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b>Total Ambulances</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">840</font></div>
</div>
	
<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b> Total Ambulance Fitted with GPS</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">820</font></div>
</div>
	
	
	<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b>GPS Working</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">{{workingdata}}</font></div>
</div>
	
	
	</div>
	
	
	</div>
	<hr style="border: 1px solid black">
<div class="row">
<div class="col-md-12">
<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b>Average Trips Per Vehicles</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">{{averagetrip}}</font></div>
</div>
 
<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b>Average Distance Per Vehicles</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">{{averagedistance}}</font></div>
</div>
	
<div class="col-sm-4" style="background-color:lavenderblush;"><font style="size:20px;"><b> Average Cycle Time</b></font>
<span class="count_top"></span>
     <div class="count"><font style="size:20px;">{{averagecycle}} Mins</font></div>
</div>
	</div>
		
</div>
	
<div class="row">&nbsp;</div>

<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Vehicles Status</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="chart-container"></div>

<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="At Base"><i class="fa fa-pie-chart" style="color:#9e6214"></i><font color="black">In Base:{{basecount}}</font></a>
			<font>&nbsp;</font>
<a href="" title="At Case"><i class="fa fa-pie-chart" style="color:#4a3e8e"></i><font color="black">Away from Base:{{casecount}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="At Hot Spot"><i class="fa fa-pie-chart" style="color:#f27704"></i><font color="black">In Base ( Hot Spot):{{hospcount}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="Away From Hot Spot"><i class="fa fa-pie-chart" style="color:#BA3416"></i><font color="black">Away From Hot Spot:20</font></a>

<font>&nbsp;</font>
<a href="" title="Not Sending Data Currently "><i class="fa fa-pie-chart" style="color:#e57979"></i><font color="black">Not Working GPS:{{notworkingdata}}</font></a>

</div>
					</div>
				</div>
			</div><!--/.col-->




<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Trip To Hospitals</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="hospitaltrips"></div>

<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="Goverment Hospitals"><i class="fa fa-pie-chart" style="color:#634003"></i><font color="black">Government Hospital:{{basecount}}</font></a>
			<font>&nbsp;</font>
<a href="" title="Private Hospital"><i class="fa fa-pie-chart" style="color:#240e3d"></i><font color="black">Private Hospital:{{casecountvalue}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="First Aid"><i class="fa fa-pie-chart" style="color:#BA3416"></i><font color="black">First Aid:{{hospcount}}</font></a>
			

</div>
					</div>
				</div>
			</div>


<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Trip Per Vehicles Per day</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="averagenooftrips"></div>
	
	
	<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="5 Trips"><i class="fa fa-pie-chart" style="color:#f4d442"></i><font color="black">5 Trips:{{fivecount}}</font></a>
			<font>&nbsp;</font>
<a href="" title="6 To 11 Trips"><i class="fa fa-pie-chart" style="color:#177a57"></i><font color="black">6 To 11 Trips:{{elevencount}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="11 To 15 trips"><i class="fa fa-pie-chart" style="color:#061442"></i><font color="black">11 To 15 trips:{{fifteencount}}</font></a>
			<font>&nbsp;</font>

<font>&nbsp;</font>
<a href="" title="16 Trips"><i class="fa fa-pie-chart" style="color:#a80a39"></i><font color="black">16 Trips:{{sixteencount}}</font></a>

</div>
	
	
	</div>
	</div>
	</div>



</div>




</div>




<div class="row">&nbsp;</div>
<div class="row">
<div class="col-md-12">
	
	<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Distance Km Per day</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="distancecovered"></div>
	
<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="15 Km"><i class="fa fa-pie-chart" style="color:#DB6318"></i><font color="black">15 Km:{{fifteenkm}}</font></a>
			<font>&nbsp;</font>
<a href="" title="15 To 50km"><i class="fa fa-pie-chart" style="color:#E81336"></i><font color="black">15 To 50km:{{fiftykm}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="51 To 100 Km"><i class="fa fa-pie-chart" style="color:#165434"></i><font color="black">51 To 100 Km:{{hundredkm}}</font></a>
			<font>&nbsp;</font>

<font>&nbsp;</font>
<a href="" title="Above 100"><i class="fa fa-pie-chart" style="color:#27273d"></i><font color="black">Above 100 Km:{{above100}}</font></a>

</div>
	
	</div>
	</div>
	</div>
	
	
	
	
	<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Cycle Times Per Vehicles Per day</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="cyclegraph"></div>
	
	<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="5 Trips"><i class="fa fa-pie-chart" style="color:#DB6318"></i><font color="black">1 To 30 Mins:{{fivecycle}}</font></a>
			<font>&nbsp;</font>
<a href="" title="6 To 11 Trips"><i class="fa fa-pie-chart" style="color:#0d1c17"></i><font color="black">31 to 60 Mins:{{elevencycle}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="11 To 15 Trips"><i class="fa fa-pie-chart" style="color:#634003"></i><font color="black">61 To 90 Mins:{{fifteencycle}}</font></a>
			<font>&nbsp;</font>

<font>&nbsp;</font>
<a href="" title="15 To 16 trips"><i class="fa fa-pie-chart" style="color:#240e3d"></i><font color="black">91 To 120 Mins:{{sixteencycle}}</font></a>

</div>
		</div>
	</div>
	</div>
	
	
	
	
	<div class="col-md-4" style="width:420px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Idle Time Per day</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="idledashgraph"></div>
	
	
	<div style="width:100%">

<font>&nbsp;</font>
<a href="" title="5 Trips"><i class="fa fa-pie-chart" style="color:#9C112A"></i><font color="black">>5 Mins:{{fiveidle}}</font></a>
			<font>&nbsp;</font>
<a href="" title="6 To 11 Trips"><i class="fa fa-pie-chart" style="color:#27576B"></i><font color="black">11 To 15 Mins:{{elevenidle}}</font></a>
			<font>&nbsp;</font>
	<a href="" title="11 To 15 Trips"><i class="fa fa-pie-chart" style="color:#634003"></i><font color="black">16 To 20 Mins:{{fifteenidle}}</font></a>
			<font>&nbsp;</font>

<font>&nbsp;</font>
<a href="" title="15 To 16 trips"><i class="fa fa-pie-chart" style="color:#07630F"></i><font color="black">21 Mins and Above:{{sixteenidle}}</font></a>

</div>
	
	
	</div>
	</div>
	</div>
	
	
</div>
</div>
	

<div class="row">&nbsp;</div>

















<!-- --row -->
</div>
</div>
</div>