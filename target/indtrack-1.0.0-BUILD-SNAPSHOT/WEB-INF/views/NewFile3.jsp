<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">
						<div id="task-tab" class="tab-pane active">
							<div class="col-sm-12">
								<div class="widget-box" id="rolemain">
									<div
										class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64);">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Vehicle Summary Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body" >
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
<!-- 												<legend -->
<!-- 													style="padding: 0 10px; border-bottom: none; width: inherit;">Device Creation -->
<!-- 													</legend> -->

							<table>
<%-- 													<colgroup> --%>
<%-- 														<col width="5%"> --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 													</colgroup> --%>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
				<table class="table table-striped"
													width="100%" cellspacing="0">
<%-- 													<colgroup> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 													</colgroup> --%>
													<tr>
													<datalist id="vehiclesummarylist">
															<option ng-repeat="x in vehicledetailssummary" ng-if="x.status=='Assigned'"  value="{{x.vehicleregno}}"></option>
													</datalist>
														<td><font>Vehicle No:</font></td>
														<td><input type="text" class="form-control" id="vehiclenosummaryreport" list="vehiclesummarylist"/></td>
														<td><font>Date:</font></td>
														<td><input type="text" class="form-control datepick" id="datesummaryreport"/></td>
														<td>From Time:</td>
														<td><timepicker-pop input-time="time1"  class="input-group" disabled="disabled"
																show-meridian='showMeridian' value="0:0"> </timepicker-pop></td>
														<td>To Time:</td>
														<td><timepicker-pop input-time="time2" class="input-group" disabled="disabled"
															show-meridian='showMeridian'> </timepicker-pop></td>
														<td><button class="action-button shadow animate green" ng-click="getRec()"><font color="black">View</font></button></td>
													</tr>
												</table>

												<table id="summarytable1" class="table table-striped table-bordered"
													width="100%" cellspacing="0" id="userTable" hidden>
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Distance (K.M) - Map Based</font></th>
<!-- 															<th><font color="white">Total Distance</font></th> -->
															<th><font color="white">Stoppage (Minutes)</font></th>
															<th><font color="white">Overspeeding Events</font></th>
															<th><font color="white">Max Speed</font></th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td><font>{{distance}}</font></td>
<!-- 															<td><font>{{distance}}</font></td> -->
															<td><font>{{stoppmins}}</font></td>
															<td><font>{{speedviolation}}</font></td>
															<td><font>{{maxspeed}} KM/Hr</font></td>
														</tr>
													</tbody>
												</table>
												<div id="vehicletrack" hidden>
												<center><iframe id=vehicleframe" height="500px" width="800px"></iframe></center>
												</div>
												
												<table id="summarytable2" class="table table-striped table-bordered"
													width="100%" cellspacing="0" hidden>
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">

													</colgroup>
													<thead>
														<tr id="gridheader">

															<th ng-click="sort('mindatereceived')"><font color="white">Start Date</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='mindatereceived'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('maxtimereceived')"><font color="white">End Date</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='maxtimereceived'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('tripid')"><font color="white">Stoppage/Speed</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='tripid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
<!-- 															<th ng-click="sort('location')"><font color="white">Location</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
															

														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="comp in vehiclesummarydetails |orderBy:sortKey:forward|filter:query|itemsPerPage:pagesint">
														    <td><font>{{comp.mindatereceived}}</font></td>
															<td><font>{{comp.maxdatereceived}}</font></td>
															<td>
																<font color="green" ng-if="comp.tripid>0 && comp.tripid<50 ">Speed {{comp.tripid}} KM/Hr</font>
																<font color="red" ng-if="comp.tripid>=50">OverSpeed {{comp.tripid}} KM/Hr</font>
																<font color="blue" ng-if="comp.tripid=='0'">Stoppage {{comp.stop}} min</font>
															</td>
<!-- 															<td ><font>{{comp.companyaddress}}</font></td> -->
															
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" >
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













