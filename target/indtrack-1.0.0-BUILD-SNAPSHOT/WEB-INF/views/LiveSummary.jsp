
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
<!-- <div class="main-content"> -->
<!-- 				<div class="main-content-inner">//main -->


<div class="row">
	<div class="col-xs-12">
		<div class="infobox infobox-green" style="width: 200px;">
			<div class="infobox-icon">
				<i class="ace-icon fa fa-shopping-cart"></i>

			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">{{totald}}</span>
				<div class="infobox-content">
					<a data-toggle="modal" data-target="#myModal"><b>Total Vehicles</b></a>
				</div>
			</div>

<!-- 			<div class="stat stat-success"></div> -->
		</div>
		<div class="vspace-8-sm"></div>
		<div class="infobox infobox-blue" style="width:200px;">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img src="<c:url value="/resources/assets/images/greenbus.png"/>">
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">{{ignitionon}}</span>
				<div class="infobox-content">
					<a data-toggle="modal" data-target="#ignModal"><b>Iginition ON</b></a>
				</div>
			</div>
<!-- 			<div class="stat stat-success"></div> -->
			
		</div>
		<div class="vspace-8-sm"></div>
		<div class="infobox infobox-pink" style="width: 200px;">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-shopping-cart"></i> -->
				<img src="<c:url value="/resources/assets/images/yellowbus.png"/>">
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">{{ignitionoff}}</span>
				<div class="infobox-content">
					<b>Ignition Off</b>
				</div>
			</div>
<!-- 			<div class="stat stat-success"></div> -->
		</div>

		<div class="vspace-8-sm"></div>
		<div class="infobox infobox-red" style="width: 200px;">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-flask"></i> -->
				<img src="<c:url value="/resources/assets/images/redbus.png"/>">
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">{{validgps}}</span>
				<div class="infobox-content">
					<a data-toggle="modal" data-target="#ignModal"><b>GPS Valid</b></a>
				</div>
			</div>
<!-- 			<div class="stat stat-success"></div> -->
		</div>
		<div class="vspace-9-sm"></div>
		<div class="infobox infobox-blue" style="width: 200px;">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img src="<c:url value="/resources/assets/images/greenbus.png"/>">
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">{{invalidgps}}</span>
				<div class="infobox-content">
					<b>GPS Not Valid</b>
				</div>
			</div>
			<div class="stat stat-success"></div>
			<!-- 											<div class="badge badge-success"> -->

			<!-- 												<i class="ace-icon fa fa-arrow-up"></i> -->
			<!-- 											</div> -->
		</div>
	</div>




 </div> 



<hr class="hr hr-double hr8">
<div class="row">
	<div class="col-xs-12">
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li ><a  href="#/dashboard">Graph</a>
						</li>

						<li class="active"><a  href="#/LiveSummary">Live Summary</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">
						<div id="member-tab" class="tab-pane">
							<div class="clearfix">
								<div class="body" id="main">
								<table class="table table-striped"
													width="100%" cellspacing="0">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td>Search :</td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td>Show Rows</td>
											        	<td></td>
											        	<td><select  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
									<table class="table table-bordered table-striped">
										<thead class="thin-border-bottom">
											<tr>
<!-- 												<th><i class="ace-icon fa fa-caret-right blue"></i><font -->
<!-- 													color="black">IMEI No</font></th> -->
											<th class="hidden-480" ng-click="sort('vehicleid')"><font color="black">Vehicle No</font>
											<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
											</th>

												<th class="hidden-480" ng-click="sort('datatimestamp')"><font color="black">Datatimestamp</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</th>

<!-- 												<th class="hidden-480" ng-click="sort('id')"><font -->
<!-- 													color="black">Longitude</font> -->
<!-- 													<span class="glyphicon sort-icon" ng-show="sortKey=='id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 													</th> -->
												<th class="hidden-480" ng-click="sort('location')"><font
													color="black">Location</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
												<th class="hidden-480" ng-click="sort('vehiclespeed')"><font
													color="black">Speed</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
												<th class="hidden-410"><font color="black">Track On Map</font>
												</th>
												
											</tr>
										</thead>

										<tbody>
											<tr dir-paginate="user in users  |orderBy:sortKey:reverse|filter:query|itemsPerPage:5">
												<td>{{user.vehicleid}}</td>
												<td>{{user.datatimestamp}}</td>
												<td>{{user.location}}</td>
<!-- 												<td>{{user.latitude}}</td> -->
												<td>{{user.vehiclespeed}}</td>
												<td><a href=""  type="submit" ng-click="showmapdiv1(user);"> <span class="glyphicon glyphicon-map-marker"></span></a></td>
											</tr>
										</tbody>
									</table>
									<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" >
									</dir-pagination-controls>
								</div>




<div class="widget-box" id="maptrack" hidden>
<div class="widget-header widget-header-flat widget-header-small">
<h5 class="widget-title">Map Track </h5><button ng-click="back();">Back</button>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
 	<center><iframe id="mapframe" height="500px" width="1000px"></iframe></center>
</div>
</div>
</div>
</div>


							</div>


						</div>


					</div>
				</div>
			</div>
		</div>
	</div>


</div>
<!-- </div> -->

<!-- </div> -->
</div>
