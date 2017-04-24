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
					
					
					<li class="">
					<a data-toggle="tab" href="#/dashboard"><font>Vehicle Live Status</font>
							</a></li>
<!-- 							<li class=""> -->
<!-- 					<a data-toggle="tab" href="#/AmbysperformancedashBoard"><font>Vehicles Performance</font> -->
<!-- 					</a></li> -->
						<li ><a data-toggle="tab" href="#/CustomerMap"><font>Live Map</font>
						</a></li>
							
<!-- 					<li class=""> -->
<!-- 					<a data-toggle="tab" href="#/DistrictdashGraph"><font>District Wise Vehicle Location Graph</font> -->
<!-- 							</a></li> -->
						<li class="active">
					<a data-toggle="tab" href="#/AlertsDashboard"><font>Alerts</font>
							</a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->
	<div id="task-tab" class="tab-pane active">
		<div class="col-sm-12">
								<div class="widget-box" id="maincustomerassign">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<i class="ace-icon fa fa-bell icon-animated-bell"></i> 
											<font color="white">Alerts</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
						
						<div style="text-align:right">
						<table>
						<tr>
						<td><a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a></td>
							<td>&nbsp;</td>		 
									 <td>Total Records:{{dashboardAlertdata.length}}</td>
						</tr>
						</table>
						
							
							</div>
				<div class="row">&nbsp;</div>			
								
				<table class="table-bordered" border="2" width="100%" cellspacing="0">
				 <colgroup>
		        <col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				</colgroup>
		        <thead>
		        <tr id="gridheader">
		       <td ><font color="white">Sr.No</font></td>
		        <td ><font color="white">District</font></td>
		         <td ><font color="white">Base Location</font></td>
		 	   <td ><font color="white">Vehicle No</font></td>
		         <td><font color="white">Datetimestamp</font></td>
		        <td ><font color="white">Alerts</font></td>
		        <td><font color="white">Location</font></td>
		        <td><font color="white">On Map</font></td>
		       </tr>
		 		 </thead>
		 		 <tbody>
		 		<tr dir-paginate="xy in dashboardAlertdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
		 		<td ><font color="black">{{xy.rowno}}</font></td>
		 		<td ><font color="black">{{xy.district}}</font></td>
		 		<td ><font color="black">{{xy.baseloc}}</font></td>
		 		<td ><font color="black" >{{xy.vehicleno}}</font></td>
		 		<td ><font color="black">{{xy.datetime }}</font></a></td>
		 		<td ><font color="black">{{xy.alerttype}}</font></a></td>
		 	   <td ><font color="black">{{xy.location}}</font></td>
		        
		        <td ><a class="js-open-modal" ng-click="getmodal(xy)" data-dismiss="modal" data-toggle="modal" href=""><font color="black"><i class="fa fa-map-marker" aria-hidden="true"></i></font></a></td>
		 		 </tbody>
				</table>
				
										<dir-pagination-controls
										max-size="8"
										direction-links="true"
										boundary-links="true" 
										on-page-change="getDataalert(newPageNumber)" >
									</dir-pagination-controls>							
											
											

										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								


</div>
								
								
								
								
								
							</div>
							<!-- 											end of bar				 -->


						</div>


				




					</div>
				</div>
				<!-- /.widget-main -->
			</div>
			<!-- /.widget-body -->
		</div>
	
		<!-- /.widget-box -->
	
	
	
	
	</div>
	<!-- /.col -->













