<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
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
											<font color="white">Route Wise Time taken</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >
	<div class="widget-main">
			
		 <datalist id="vehicledetaillistHistory">
				<option ng-repeat="x in  overspeedvehdeatils"  value="{{x.sheltername}}"></option>
			</datalist>
			
<form role="form" name="history">
<div class="row">

    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Mine:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control" placeholder="--Select Mine Name---"  ng-model="overspeedVehicleno" id="overspeedVehicleno"  list="vehicledetaillistHistory"  required/>
    </div>
    
    
    
      <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control datepick"  id="overspeedfromndate"   required/>
    </div>
    
      <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control datepick"  id="overspeedtodate"   required/>
    </div>
    
    
   
    
    
    
     <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
       <button  type="submit" class="action-button shadow animate green"  ng-click="getoverspeedReport();"><font color="black">View</font></button>
    </div>
    
 </div>
 </form>

<div id="loghistorydiv">


<table class=" table-bordered" border="2"  width="100%" cellspacing="0" id="overspeedtable2" hidden>
													<colgroup>
														<col width="30%">
														<col width="30%">
														<col width="30%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Mine</font></th>
														    <th><font color="white">Total trips</font></th>
														    <th><font color="white">Total Time Taken(Mins)</font></th>
															
														</tr>
													</thead>

													<tbody>
														<tr>
															<td><font>{{overspeedVehicleno}}</font></td>
															<td><font>{{tripcount}}</font></td>
															<td><font>{{ttime}}</font></td>
															
														</tr>
													</tbody>
												</table>
												
												<br><br>
<!-- 				<button class="action-button shadow animate green"  ng-click="getAllMap();"><font color="black">View on Map</font></button> -->
				<table class="table table-striped" id="overspeedtable1"	width="100%" cellspacing="2"  hidden>
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="overspeedexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>				          
                								<table   class=" table-bordered" border="2"  width="100%" cellspacing="0" id="overspeedtable"  hidden>
													<colgroup>
														<col width="2%">
														<col width="10%">
														<col width="10%">
														<col width="5%">
														<col width="10%">
														<col width="5%">
														<col width="10%">
														<col width="5%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="2%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Sr.No</font></th>
															<th><font color="white">ETP No</font></th>
														    <th><font color="white">Vehicle No</font></th>
														    
														    <th><font color="white">OUT</font></th>
														    <th><font color="white">OUT Time</font></th>
														    <th><font color="white">IN</font></th>
															<th><font color="white">IN Time</font></th>
														    <th><font color="white">Time (Mins)</font></th>
														    
														    <th><font color="white">Source</font></th>
															<th><font color="white">Destination</font></th>
<!-- 															<th><font color="white">Rout Name</font></th> -->
															<th><font color="white">Trip StartTime</font></th>
															<th><font color="white">Trip EndTime</font></th>
															<th><font color="white">Map</font></th>
														</tr>
													</thead>

													<tbody>
														<tr ng-show="overspeeddetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="veh in overspeeddetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{veh.index}}</font></td>
															<td><font>{{veh.etpno}}</font></td>
															<td><font>{{veh.vehicleno}}</font></td>
															
															<td><font>{{veh.outtype}}</font></td>
															<td><font>{{veh.outtime}}</font></td>
															<td><font>{{veh.intype}}</font></td>
															<td><font>{{veh.intime}}</font></td>
															<td><font>{{veh.time}}</font></td>
															
															<td><font>{{veh.source}}</font></td>
															<td><font>{{veh.destination}}</font></td>
<!-- 															<td><font>{{veh.routename}}</font></td> -->
															<td><font>{{veh.starttime}}</font></td>
															<td><font>{{veh.endtime}}</font></td>
															
															<td><a  ng-click="shomap(veh)" ><img src="<c:url value="/resources/imagenew/historyicon.png" />"
									 					height="20px" width="20px"></a></td>
													
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getDatatruckmov(newPageNumber)" >
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
</div>			
	
	









