
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
<!-- <div class="main-content"> -->
<!-- 				<div class="main-content-inner">//main -->

<div>
							<font><b>DashBoard</b></font>
							
</div>
<div class="row">
	<div class="col-sm-12 ">
		<div class="infobox" style="width: 90px; height:60px">
			<div class="infobox-icon">
			<img  title="total vehicles" src="<c:url value="/resources/images/bus.png"/>">
		{{totald}}
			</div>

		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox" style="width:90px;height:60px">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img title="Ignition On"  src="<c:url value="/resources/images/IGINIOn.png"/>">
				{{ignitionon}}
			</div>

			
		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox" style="width:90px;height:60px">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-shopping-cart"></i> -->
				<img  title="Ignition Off" src="<c:url value="/resources/images/IGINOff.png"/>">
				{{ignitionoff}}
			</div>

		</div>

		<div class="vspace-4-sm"></div>
		<div class="infobox" style="width:90px;height:60px" >
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-flask"></i> -->
				<img  title="GPS Connect" src="<c:url value="/resources/images/GPSON.png"/>">
				{{validgps}}
			</div>

		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox " style="width:90px;height:60px">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img title="GPS Disconnect" src="<c:url value="/resources/images/GPSOFF.png"/>">
				{{invalidgps}}
			</div>


		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox " style="width:90px;height:60px">
			<div class="infobox-icon" >
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img title="Halt Count" src="<c:url value="/resources/images/hand.png"/>">
				{{yellow}}
			</div>


		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox " style="width: 90px;height:60px">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img  title="Running Count" src="<c:url value="/resources/images/run.png"/>"height="32px" width="32px">
			{{green}}
			</div>


		</div>
		<div class="vspace-4-sm"></div>
		<div class="infobox " style="width: 90px;height:60px">
			<div class="infobox-icon">
				<!-- 												<i class="ace-icon fa fa-twitter"></i> -->
				<img  title="Stop Count" src="<c:url value="/resources/images/stop.png"/>">
			{{red}}
			</div>



		</div>
		
<!-- 		<div class="vspace-4-sm"></div> -->
<!-- 		<div class="infobox "> -->
<!-- 			<div > -->
<!-- 			<a href="#/RawData">Raw Data Details</a> -->
<!-- 			</div> -->



<!-- 		</div> -->
	</div>

 </div> 

<div class="row">
	<div class="col-xs-12">
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">
						<div id="task-tab" class="tab-pane active">
							<!-- 											for bar division -->
							<div class="col-sm-6">
								<div class="widget-box">

									<div class="widget-body">
										<div class="widget-main">
										<div id="piechart" style="height: 180px"></div>

										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>
							<!-- 											end of bar				 -->


							<!-- for pie div -->
							<div class="col-sm-6">
								<div class="widget-box">

									<div class="widget-body">
										<div class="widget-main">
											<!-- 							 					<div id="3dbar" style="height: 300px"></div> -->
<!-- 											<div id="container1" style="height: 200px"></div> -->
											<div id="barchart" style="height: 180px"></div>

										

			</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>
							<!-- end of pie -->

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


</div>
						<div class="widget-box">	
							<div>
								<div id="main">
								<table class="table table-striped"
													width="230px" cellspacing="0">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														    </td>
										<td><a href="" title="Export To Excel" id="exportexcel" ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a></td>
											        	</tr></table></td>
											        </tr>   
												</table>
<!-- 												<select ng-init="somethingHere = options[0]" ng-model="somethingHere" ng-options="option.name for option in options"></select> -->
									<table class="table table-bordered " id="livesumm">
										<thead class="thin-border-bottom" style="height:34px">
											<tr id="gridheader">
<!-- 												<th><i class="ace-icon fa fa-caret-right blue"></i><font -->
<!-- 													color="black">IMEI No</font></th> -->
												<th class="hidden-480" ng-click="sort('vehicleid')"><font color="white">Vehicle No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</th>
												<th class="hidden-480" ng-click="sort('location')"><font
													color="white">Location</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
												<th class="hidden-480" ng-click="sort('datatimestamp')"><font color="white">Polling Time</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</th>

												<th class="hidden-480" ng-click="sort('vehiclespeed')"><font
													color="white">Speed</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
													<th class="hidden-480" ng-click="sort('ignumber')"><font
													color="white">Ignition</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='ignumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
													<th class="hidden-480" ng-click="sort('vehicledirection')"><font
													color="white">Direction</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicledirection'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
													<th class="hidden-480" ng-click="sort('gpsstatus')"><font
													color="white">GPS Valid</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='gpsstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</th>
												<th class="hidden-410"><font color="white">Track On Map</font>
												</th>
												
											</tr>
										</thead>

										<tbody>
											<tr dir-paginate="user in users |orderBy:sortKey:reverse|filter:query|itemsPerPage:5">
												<td><font>{{user.vehicleid}}</font></td>
												<td><font>{{user.location}}</font></td>
												<td><font>{{user.datatimestamp}}</font></td>
												<td><font>{{user.vehiclespeed}}</font></td>
												<td><font><img src="<c:url value="{{user.ignumber}}"/> "height="23"></font></td>
												<td><font><img src="<c:url value="{{user.vehicledirection}}"/> "height="23"></font></td>
												<td><font><img src="<c:url value="{{user.gpsstatus}}"/> "height="23"></font></td>
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
<h5 class="widget-title">Map Track </h5>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a  href="" ng-click="back();" title="Go Back"  style="padding-right:30px;">
<img src="<c:url value="/resources/assets/images/back_2.png" />" height="16px" width="20px">

</a>
<br>
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
