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
											<font color="white">Overspeed Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >
	<div class="widget-main">
			
		 <datalist id="vehicledetaillistHistory">
				<option ng-repeat="x in  overspeedvehdeatils"  value="{{x.vehicleregno}}"></option>
			</datalist>
			
<form role="form" name="history">
<div class="row">

    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control" placeholder="--Select Vehicle No---"  id="overspeedVehicleno"  list="vehicledetaillistHistory"  required/>
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
        <label for="name" class="control-label"><font>Overspeed Limit:</font><b style="color:Red;font-weight:normal;">*</b></label>
         <select id="vehiclesumspeedlimit"   class="form-control" ng-model="limit">
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
       <button  type="submit" class="action-button shadow animate green"  ng-click="getoverspeedReport();"><font color="black">View</font></button>
    </div>
    
 </div>
 </form>

<div id="loghistorydiv">
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
														<col width="20%">
														<col width="20%">
														<col width="30%">
														<col width="20%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Vehicle No</font></th>
														    <th><font color="white">Date/Time</font></th>
														    <th><font color="white">Location</font></th>
															<th><font color="white">Speed</font></th>
														</tr>
													</thead>

													<tbody>
														<tr ng-show="overspeeddetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="veh in overspeeddetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
													
															<td><font>{{veh.vehicleregno}}</font></td>
															<td><font>{{veh.datatimestamp}}</font></td>
															<td><font>{{veh.location}}</font></td>
															<td><font>{{veh.vehiclespeed}}</font></td>
															
													
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData37(newPageNumber)" >
												</dir-pagination-controls>
							</div>					
												
								<div id="popup2" class="modal-box">
<!-- 								  <header> <a  class="js-modal-close close">×</a> -->
<!-- 								    <font><h4>View On Map</h4></fo                                                                                                                                                                               nt> -->
<!-- 								  </header> -->
								  <div class="modal-body">
								    <center><iframe id="vehicleframehistory" height="500px" width="100%"></iframe></center>
								  </div>
								  <footer> <a  class="btn btn-small js-modal-close">Close</a> </footer>
								</div>
								
								<div id="historymapframe" hidden>
								    <center><iframe id="historymapframefr" height="600px" width="100%"></iframe></center>
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
	
	










