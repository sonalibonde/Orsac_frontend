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
											<font color="white">Ambulance Geo Fence In and Out Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body" >
										<div class="widget-main">
		
	
<form role="form" name="geofencesumrp" >
	<div class="row">
	 <datalist id="vehicledetaillistFence">
				<option ng-repeat="x in  geoFencevehicledetails" ng-if="x.district==distrname"   value="{{x.vehicleregno}}"></option>
	</datalist>
 
	<div class="form-group col-xs-4 col-md-2">
		<label for="name" class="control-label"><font>District:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <select id="alertdistrict" ng-model="distrname">
           	<option  value="Not Assigned">All</option>
			<option ng-repeat="x in  districtdetails" value="{{x.district}}">{{x.district}}</option>
		</select>
    </div>
	 <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control" id="geoFenceVehicleNo"  list="vehicledetaillistFence" required/>
  </div>
 <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input type="text" class="form-control datepick" id="geofenceDate" required/>
  </div>
	
	
	
	 <div class="form-group col-xs-4 col-md-2">
		<div>&nbsp;</div>
      <button type="submit" class="action-button shadow animate green" ng-click="getLogs()"><font color="black">View</font></button>
  </div>
 
	</div>
	
	
		
	
	</form>
	
     					          
          								<table id="alertlogTable"  class="table table-bordered" border="2"
													width="100%" cellspacing="0"  hidden> 
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Date</font></th>
														    <th><font color="white">District</font></th>
														    <th><font color="white">Base Location</font></th>
															<th><font color="white">Vehicle No.</font></th>
															<th><font color="white">Base Location OUT Time</font></th>
															<th><font color="white">Hospital IN Time</font></th>
															<th><font color="white">Hospital OUT Time</font></th>
															<th><font color="white">Base Location IN Time</font></th>
															
														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="veh in geofenceReportnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{datefence}}</font></td>
															<td><font>{{veh.district}}</font></td>
															<td><font>{{veh.baselocation}}</font></td>
															<td><font>{{veh.vehicleno}}</font></td>
															<td><font>{{veh.baseout}}</font></td>
															<td><font>{{veh.hostin}}</font></td>
															<td><font>{{veh.hostout}}</font></td>
															<td><font>{{veh.basein}}</font></td>
															
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getDatageofenceAlert(newPageNumber)" >
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













