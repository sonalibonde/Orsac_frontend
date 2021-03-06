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
											<font color="white">Alert Log Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >
	<div class="widget-main">
			
			 <datalist id="vehicledetaillistHistory">
				<option ng-repeat="x in  historyvehicledetails"  value="{{x.vehicleregno}}"></option>
			</datalist>
			
<form role="form" name="history">
<div class="row">
  
    
     <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control" placeholder="--Select Vehicle No---"  id="alertvehicleno"  list="vehicledetaillistHistory"  required/>
    </div>
    
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Type Of Alerts:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <select id="alertselect"  class="form-control">
     		 <option value="--select--">---select---</option>
     		 <option value="Tamper" >Tamper</option>
     		 <option value="Overspeed">Overspeed</option>
     		 <option value="AC">AC</option>
     		 <option value="Geofence">Geofence</option>
     	 	 </select>
    
    </div>
    
    
     
    <div class="form-group col-xs-4 col-md-2" id="overspeedDiv" hidden>
        <label for="name" class="control-label"><font>Overspeed Limit:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <select id="livevehiclesumspeedlimit"   class="form-control" ng-model="limit">
     														 <option value="20" >20</option>
     														 <option value="25" >25</option>
     														 <option value="30">30</option>
     														 <option value="35" >35</option>
     														 <option value="40" >40</option>
     		 												 <option value="45">45</option>
     														 <option value="50">50</option>
     		 												 <option value="55">55</option>
     		 												 <option value="60" >60</option>
     		 												 <option value="65" >65</option>
     		 												 <option value="70">70</option>
     														 <option value="75" >75</option>
     													    <option value="80" >80</option>
   	 </select>
    
    </div>
    
    
    
    
    
    
    
    
    
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="alertfromndate" required>
    </div>
    
     <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="alerttodate" required>
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
			
				<table class="table table-striped" id="historytableback" hidden	width="100%" cellspacing="2">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td style="text-align:right;margin-right:0;"><img title="Back" ng-click="getdatahist();" src="<c:url value="/resources/imagenew/backbtn.png" />"></td>
			         </tr>
				</table>
				
		<div id="loghistorydiv">
<!-- 				<button class="action-button shadow animate green"  ng-click="getAllMap();"><font color="black">View on Map</font></button> -->
				<table class="table table-striped" id="alertlogTable"	width="100%" cellspacing="2"  hidden>
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
														    </select></td>
											        	
											        	<td style="text-align:right;margin-right:0;"><img title="Track on Map" ng-click="getAllMap();" src="<c:url value="/resources/imagenew/historyicon.png" />"></td>
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="historyexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>	
												<div id="historyDiv">		          
                								<table  class=" table-bordered" border="2" 
													width="100%" cellspacing="0" id="AlertLogable" hidden>
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="10%">
														<col width="5%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Vehicle No</font></th>
														    <th><font color="white">DateTimestamp</font></th>
															<th><font color="white">Alert</font></th>
															<th><font color="white">Location</font></th>
														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="historylogreportnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="alert in alertLogReport|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{alert.vehicleregno}}</font></td>
															<td><font>{{alert.datatimestamp}}</font></td>
															<td><font>{{alert.type_of_alerts}}</font></td>
															<td><font>{{alert.location}}</font></td>
															<td><a class="js-open-modal" ng-click="getmodal(his)" ><img src="<c:url value="/resources/imagenew/historyicon.png" />"
									 height="20px" width="20px"></a></td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData32(newPageNumber)" >
												</dir-pagination-controls>
							</div>					
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
	
	










