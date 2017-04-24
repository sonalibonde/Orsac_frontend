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
											<font color="white">Geofence Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body" >
										<div class="widget-main">
	
	
	
	
	<form role="form" name="geofencesumrp" >
	
	<datalist id="geofencesummarylist"> -->
				<option ng-repeat="x in geofencedetailssummary" ng-if="x.status=='Assigned'"  value="{{x.vehicleregno}}"></option>
			</datalist>	
	<datalist id="geofencesummarylistgeoname">
					<option ng-repeat="x in geofencedetailssummary"  value="{{x.geofencename}}"></option>
	</datalist>	 
	<div class="row">

    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Select Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <select id="geofencereportselect"  class="form-control">
     		  <option value="--select--">---select---</option>
     		 <option value="geofence_wise" >Geofence Wise</option>
     		 <option value="vehicle_wise" >Vehicle Wise</option>
 		 </select>
      </div>
      
      <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>{{rname}}:</font><b style="color:Red;font-weight:normal;">*</b></label>
    <input type="text" class="form-control" id="geofencenosummaryreport" required/>
     </div>
      
      
      <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="fdategeosummaryreport" required/>
  	 </div>
      
    
     <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>From Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
       <input type="text" class="form-control"  id="timepicker1geo" required/>
       </div>
       
       
      <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input type="text" class="form-control datepick" id="tdategeosummaryreport" required/>
      </div>
	
	
	
	 <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>To Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input type="text" class="form-control" id="timepicker2geo"  required/>
      </div>
      
	</div>
	<div class="row">
	 <div class="form-group col-xs-4 col-md-2" style="float:right;">
      <button type="submit" class="action-button shadow animate green" ng-click="getRec()"><font color="black">View</font></button>
      </div>
	</div>
	
	</form>
	
      <table class="table table-striped"  id="searchtbl"	width="100%" cellspacing="2" hidden >
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="GeoFenceExcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>					          
          <table id="geosummarytable1" class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="userTable" hidden>
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Vehicle No</font></th>
														    <th><font color="white">Geofence Name</font></th>
															<th><font color="white">In Datetime</font></th>
															<th><font color="white">Out Datetime</font></th>
															<th><font color="white">Total Stoppage(Min)</font></th>
														</tr>
													</thead>

													<tbody>
														<tr ng-show="geofencesummarydetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="veh in geofencesummarydetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{veh.vehicleno}}</font></td>
															<td><font>{{veh.geofencename}}</font></td>
															<td><font>{{veh.intime}}</font></td>
															<td><font>{{veh.outtime}}</font></td>
															<td><font>{{veh.stoppage}}</font></td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData27(newPageNumber)" >
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













