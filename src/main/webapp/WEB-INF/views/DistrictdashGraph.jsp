<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						
					<li>
					<li class="">
					<a data-toggle="tab" href="#/dashboard"><font>Vehicle Live Status</font>
							</a></li>
								<li class="">
					<a data-toggle="tab" href="#/AmbysperformancedashBoard"><font>Ambys Performance</font>
							</a></li>
						<li ><a data-toggle="tab" href="#/CustomerMap"><font>Live Map</font>
						</a></li>
									
					<li class="active">
					<a data-toggle="tab" href="#/DistrictdashGraph"><font>District Wise Vehicle Location Graph</font>
							</a></li>
							<li class="">
					<a data-toggle="tab" href="#/AlertsDashboard"><font>Alerts</font>
							</a></li>
					</ul>
				</div>
			</div>


			<div class="widget-body">
				
<div id="task-tab" class="tab-pane active">

<!-- <div class="row" id="graphrow" style="margin-top:20px"> -->


<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>District Wise Vehicle Location Graph</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="donutchart" style="width: 900px; height: 600px;text-align: center;""></div>
<center><div style="width:800px">
<a href=""  ng-click="baseDetails();" title=""><i class="fa fa-pie-chart" style="color:#206999;font-size:25px "></i>&nbsp;&nbsp;&nbsp;<font color="black" style="font-size:25px ">At Base:{{basecount}}</font></a>
<font>&nbsp;&nbsp;&nbsp;</font>
<a href="" ng-click="caseDetails();" title=""><i class="fa fa-pie-chart" style="color:#064c0f;font-size:25px"></i>&nbsp;&nbsp;&nbsp;<font  color="black" style="font-size:25px ">On Case:{{casecount}}</font></a>

<font>&nbsp;&nbsp;&nbsp;</font>
<a  href=""  ng-click="hospDetails();" title=""><i class="fa fa-pie-chart" style="color:#e58d09;font-size:25px"></i>&nbsp;&nbsp;&nbsp;<font color="black" style="font-size:25px ">On Hot Spot:{{hospcount}}</font></a>



</div>
	</center>
	
	
	
	
								
								
								
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>
							<!-- 											end of bar				 -->

</div>
<div class="row"  id="basedetails" hidden>
<div>

					
				
					<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<thead class="thin-border-bottom">
					<tr id="gridheader">
					<td><font color="White">Vehicle No.</font></td>
					<td><font color="White">Type.</font></td>
					<td><font color="White">Datetimestamp</font></td>
					<td><font color="White">View On Map</font></td>
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="base in baseDEtailsdata">
<!-- 					<tr dir-paginate="k in basedata|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font>{{base.vehicleno}}</font></td>
					<td><font>{{base.type}}</font></td>
					<td><font>{{base.date}}</font></td>
					<td><a ng-click="showmapdiv1(base)" href=""><font><i class="fa fa-map-marker"></i></font></a></td>
					</tr>
					</tbody>
					</table>
					
<!-- 				<dir-pagination-controls -->
<!-- 					max-size="5" -->
<!-- 					direction-links="true" -->
<!-- 					boundary-links="true"  -->
<!-- 					on-page-change="getDatabase(newPageNumber)" > -->
<!-- 				</dir-pagination-controls> -->
												
					</div>
					</div>
					


</div>







<div class="row"  id="hospdetails" hidden>
<div>

					
				
					<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<thead class="thin-border-bottom">
					<tr id="gridheader">
					<td><font color="White">Vehicle No.</font></td>
					<td><font color="White">Type.</font></td>
					<td><font color="White">Datetimestamp</font></td>
					<td><font color="White">View On Map</font></td>
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="hosp in hospDEtailsdata">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					
					<td><font>{{hosp.vehicleno}}</font></td>
					<td><font>{{hosp.type}}</font></td>
					<td><font>{{hosp.date}}</font></td>
					<td> <a ng-click="showmapdiv1(hosp)" href=""><font><i class="fa fa-map-marker"></i></a></font></td>
				</tr>
					</tbody>
					</table>
<!-- 				<dir-pagination-controls -->
<!-- 					max-size="5" -->
<!-- 					direction-links="true" -->
<!-- 					boundary-links="true"  -->
<!-- 					on-page-change="getDatabase(newPageNumber)" > -->
<!-- 				</dir-pagination-controls> -->
					</div>
					</div>
					
					
					
					
					
<div class="row"  id="casedetails" hidden>
<div>

					
				
					<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<thead class="thin-border-bottom">
					<tr id="gridheader">
					<td><font color="White">Vehicle No.</font></td>
					<td><font color="White">Type.</font></td>
					<td><font color="White">Datetimestamp</font></td>
					<td><font color="White">View On Map</font></td>
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="case in caseDEtailsdata">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					
					<td><font>{{case.vehicleno}}</font></td>
					<td><font>{{case.type}}</font></td>
					<td><font>{{case.date}}</font></td>
					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td>
				</tr>
					</tbody>
					</table>
<!-- 				<dir-pagination-controls -->
<!-- 					max-size="5" -->
<!-- 					direction-links="true" -->
<!-- 					boundary-links="true"  -->
<!-- 					on-page-change="getDatabase(newPageNumber)" > -->
<!-- 				</dir-pagination-controls> -->
					</div>
					</div>
					
					
					
					
					
					
					
					


</div>











						</div>


					




					</div>
			
				<!-- /.widget-main -->
		
			<!-- /.widget-body -->
	
	
		<!-- /.widget-box -->
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	
	<!-- /.col -->













