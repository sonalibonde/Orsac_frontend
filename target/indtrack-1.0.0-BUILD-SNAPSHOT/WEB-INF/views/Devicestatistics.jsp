
<div id="container">
<div class="row">

	<div class="col-xs-12">
	<div class="row">
	
	<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

<div class="widget-toolbar no-border" >
					<ul class="nav nav-tabs" id="recent-tab">
						<li><a data-toggle="tab" href="#/adminDashboard"><font>Summary</font>
							</a></li>

						<li class="active"><a data-toggle="tab" href="#/Devicestatistics"><font>Device Statistics</font>
							</a></li>
							
<!-- 						<li><a data-toggle="tab" href="#/DealerMap"><font>Live Map</font> -->
<!-- 						</a></li> -->
<!-- 						<li><a data-toggle="tab" href="#/Nonpolling"><font>Nonpolling</font> -->
<!-- 						</a></li> -->

					</ul>
				</div>
				</div>
				</br>
				</br>
<div class="col-md-4" id="showgraph">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-pie-chart" style="color:white"></i><font color="white">Device Statistics</font></div>
					<div class="panel-body">
                   <div id="donutchart" style="width: 300px; height: 400px;"></div>
<!-- 				<div><a  href="" ng-click="showtext();"> -->
<!-- 					<i title="Show Text" class="fa fa-file-text-o"></i> -->
<!-- 				Show Text -->
<!-- 				</a></div> -->

				</div>
				</div>
</div>


<div class="col-md-4">
		<div class="panel panel-primary" >
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-pie-chart" style="color:white"></i><font color="white">Vehicle Statistics</font></div>
					<div class="panel-body">
		            <div id="chart-container1" style="width: 300px; height: 400px;" ></div>
				    </div>
		</div>
		</div>

<div class="col-md-4">
		<div class="panel panel-primary" >
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font color="white">Dealer Customer Details</font></div>
					<div class="panel-body">
				    <div id="barchart_values" style="width: 300px; height: 400px;"></div>
				    </div>
		
		
		</div>
		</div>
		
</div>
</div>
</div>

</div>