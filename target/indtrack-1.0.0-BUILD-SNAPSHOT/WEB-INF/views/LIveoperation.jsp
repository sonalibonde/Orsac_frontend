<div class="col-xs-12">
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
	
			
		
		
		
				<div class="widget-toolbar no-border">
				<ul class="nav nav-tabs" id="recent-tab">
				
					<li class="active">
					<a data-toggle="tab" href="#/LIveoperation"><font>Live Operation</font>
							</a></li>
					<li class="">
					<a data-toggle="tab" href="#/Performancedashboard"><font>Daily Vehicle Performance Details</font>
							</a></li>
						</ul>
		
		
				</div>
				
				
				
	<div class="row">&nbsp;&nbsp;</div>			
			
			
			
			<div class="row">
		<div class="col-md-12">
		
		<div  class="col-md-12">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>District Wise Trip Completion</font></div>
					<div class="panel-body">
		
		
				<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable">
													<colgroup>
														<col width="30%">
														<col width="30%">
														<col width="30%">
														</colgroup>
														
														
														
										<thead>
										<tr id="gridheader">
										
										<th><font color="white">Total Nos. of Trips </font></th>
										<th><font color="white">Total Nos. of Completed Trips </font></th>
										<th><font color="white">Total Trips on Route</font></th>
										</tr>
										
										</thead>
										
										<tbody ng-repeat="x in liveoperationgrid">
										<tr>
										<td><font color="black">{{x.total}}</font></td>
										<td><font color="black">{{x.completed}}</font></td>
										<td><font color="black">{{x.oncase}}</font></td>
										</tr>
										</tbody>				
														
				</table>
		
		
		</div>
		</div>
			</div>		
				
				</div>
				</div>
				
				
		<div class="row">&nbsp;&nbsp;</div>			
			
			
			
				
				
		<div class="row">
		<div class="col-md-12">
		
		<div  class="col-md-12">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>District Wise Trip Completion</font></div>
					<div class="panel-body">
		<div  id="liveoperationtrip"></div>
		
		</div>
		</div>
			</div>		
				
				</div>
				</div>
				
				
				
				
		<div class="row">
		<div class="col-md-12">
		
		<center><Strong><font style="size:20px;" color="black">Top Performer District:-<b>{{topdist}}</b></font></Strong></center>
		
		
		</div>
				
				
				
				
				
				
				
				
				
				</div>
				</div>
				</div>
				