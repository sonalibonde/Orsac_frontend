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
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Vehicle Summary and Details</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body" >
	<div class="widget-main">
	
	<datalist id="vehiclesummarylist">
			<option ng-repeat="x in vehicledetailssummary" ng-if="x.status=='Assigned'"  value="{{x.vehicleregno}}"></option>
	</datalist>	


<form role="form" name="vehiclesumrp">
<div class="row">

    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control" placeholder="--Select Vehicle No---"  id="vehiclenosummaryreport"  ng-model="BYVehicleno" list="vehiclesummarylist" required/>
    </div>
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
       <input type="text" class="form-control datepick" id="datesummaryreport" required/>
    </div>
    
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>From Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
       <input type="text" class="form-control" id="timepicker1" required/>
    </div>
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>To Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
       <input type="text" class="form-control" id="timepicker2" required/>
    </div>
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Overspeed Limit:</font><b style="color:Red;font-weight:normal;">*</b></label>
    
    <select id="vehiclesumspeedlimit" class="form-control" ng-model="limit"> 
     		 <option value="20" >20</option>
     		 <option value="25" >25</option>
     		 <option value="30">30</option>
     		 <option value="35" >35</option>
     		 <option value="40" >40</option>
     		 <option value="45">45</option>
     		 <option value="50" selected>50</option>
     		 <option value="55">55</option>
     		 <option value="60" >60</option>
     		 <option value="65" >65</option>
     		 <option value="70">70</option>
     		 <option value="75" >75</option>
     		 <option value="80" >80</option>
    		 </select>
    
    
    </div>
   <div class="form-group col-xs-4 col-md-2">
  
   <div>&nbsp;</div>
   <button   type="submit" class="action-button shadow animate green" ng-click="getRec()"><font color="black">View</font></button>	
    </div>
    </div>
</form>

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
											 		<center><iframe id="vehicleframe" height="500px" width="100%"></iframe></center>
												</div>
												<br><br>
												
												
											<table class="table table-striped"  id="searchtbl"	width="100%" cellspacing="2" hidden>
													<colgroup>
														<col width="8%">
														<col width="20%">
														<col width="30%">
														<col width="10%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											        	<td><font>Show Rows</font></td>
											        	
											        	<td><select data-ng-init="option1=pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														</td>
											        	
<%-- 											        	<td style="text-align:right;margin-right:0;"><img title="Track on Map" ng-click="getAllMap();" src="<c:url value="/resources/imagenew/historyicon.png" />"></td> --%>
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="historyexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>
												<br>
												<table id="summarytable2" class="table table-striped table-bordered"
													width="100%" cellspacing="0" hidden id="summaryreport">
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
															<th ng-click="sort('location')"><font color="white">Location</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															

														</tr>
													</thead>

													<tbody>
														<tr ng-show="vehiclesummarydetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="comp in vehiclesummarydetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
														    <td><a class="js-open-modal" ng-click="getmodal(comp)" ><font color="black">{{comp.mindatereceived}}</font></a></td>
															<td><a class="js-open-modal" ng-click="getmodal(comp)" ><font color="black">{{comp.maxdatereceived}}</font></a></td>
															<td>
<!-- 															<font color="blue" ng-if="limit==0">Stoppage {{comp.stop}} min</font> -->
																<font color="green" ng-if="comp.tripid>0 && comp.tripid<=limit">Speed {{comp.tripid}} KM/Hr</font>
																<font color="red" ng-if="comp.tripid>=limit">OverSpeed {{comp.tripid}} KM/Hr</font>
																<font color="blue" ng-if="comp.tripid=='0'">Stoppage {{comp.stop}} min</font>
															</td>
															<td ><font>{{comp.location}}</font></td>
															
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData26(newPageNumber)" >
												</dir-pagination-controls>
												
												 
												
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
<!-- 								 <a class="js-open-modal btn" data-modal-id="popup1"> Pop Up One</a>  -->
								<div id="popup1" class="modal-box">
								  <header> <a  class="js-modal-close close">×</a>
								    <font><h4>View On Map</h4></fo                                                                                                                                                                               nt>
								  </header>
								  <div class="modal-body">
								    <center><iframe id="vehicleframesingle" height="500px" width="100%"></iframe></center>
								  </div>
								  <footer> <a  class="btn btn-small js-modal-close">Close</a> </footer>
								</div>
								<!-- /.widget-box -->
</div>
		
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













