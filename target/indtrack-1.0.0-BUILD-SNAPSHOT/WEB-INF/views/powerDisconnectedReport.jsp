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
											<font color="white">Ignition ON/OFF Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >
	<div class="widget-main">
<form role="form" name="history">
<div class="row">
   
   <div class="form-group col-xs-4 col-md-2">
		<label for="name" class="control-label"><font>District:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <select id="alertdistrict2" ng-model="distrname">
           	<option  value="Not Assigned">All</option>
			<option ng-repeat="x in  selectDistrict" value="{{x.district}}">{{x.district}}</option>
		</select>
    </div>
    
     <div class="form-group col-xs-4 col-md-2">
      <datalist id="vehicledetaillistHistory">
				<option ng-repeat="x in  historyvehicledetails" ng-if="x.district==distrname"  value="{{x.vehicleregno}}"></option>
		</datalist>
        <label for="name" class="control-label"><font>Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control" placeholder="--Select Vehicle No---"  id="alertvehicleno"  list="vehicledetaillistHistory"  required/>
    </div>
    


    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="alertfromndate" required>
    </div>
    
    
     <div class="form-group col-xs-4 col-md-2">
    <label for="name" class="control-label"><font>From Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
    <input id="input-fromtime" value="00:00:00" data-default="00:00:00">
  	</div>
    
     <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="alerttodate" required>
    </div>
  
    <div class="form-group col-xs-4 col-md-2">
    <label for="name" class="control-label"><font>To Time:</font><b style="color:Red;font-weight:normal;">*</b></label>
    <input id="input-totime" value="23:59:00" data-default="23:59:00">
  	</div>
  
  
    <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
      <button  type="submit" id="showrep" class="action-button shadow animate green"  ng-click="getLogs();"><font color="black">View</font></button>
    </div>
     <div class="form-group col-xs-4">
  	   <div class="alert alert-danger"  id="reportmsg" hidden data-toggle=" bottom">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong>You can see Report within seven days!
  		</div>
  	</div>
</div>
</form>

<table class=" table-bordered" border="2" width="100%" cellspacing="0" id="alertlogTable" hidden>
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
													</colgroup>
													
													
													<thead>
														<tr id="gridheader">
														<th><font color="white">Sr.No</font></th>
														<th><font color="white">District</font></th>
														<th><font color="white">Base Location</font></th>
														<th><font color="white">Vehicle No</font></th>
														<th><font color="white">Ignition ON/OFF</font></th>
														<th><font color="white">Date/Time</font></th>
													</tr>
													</thead>

												<tbody>
												<tr dir-paginate="alert in alertLogReport|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{alert.rowno}}</font></td>
															<td><font>{{districtpower}}</font></td>
															<td><font>{{alert.baselocation}}</font></td>
															<td><font>{{alert.vehicleregno}}</font></td>
															<td><font>{{alert.type_of_alerts}}</font></td>
															<td><font>{{alert.datatimestamp}}</font></td>
															
														
												</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getDatadis(newPageNumber)"  >
											</dir-pagination-controls>












								
								
			
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
	
	










