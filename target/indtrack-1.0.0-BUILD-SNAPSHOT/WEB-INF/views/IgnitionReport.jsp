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
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Ignition Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>
									<div>&nbsp;</div>
<div class="widget-body" >
				
<div class="row">				          
	
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Select Report:</font></label>
          <div class=" col-xs-4 col-md-2">
     		 <select id="reportallvehicles">
     		 <option value="--select--">---select option---</option>
     		 <option value="For All vehicles By Date"> For All vehicles By Date</option>
     		 <option value="For All Vehicles  By Date Range"> For All Vehicles  By Date Range</option>
     		  <option value="For Particular vehicles By Date"> For Particular vehicles By Date</option>
     		 <option value="For Particular Vehicle By Date Range">For Particular Vehicle By Date Range</option>
     		 </select>
          </div>
        </div>
      </div>	
	</div>	

<div class="hr hr8 hr-double"></div>								
<div class="widget-main" id="idelhoursallday" hidden>
<form role="form" name="daywisallform">
<div class="row">
  <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
    <input type="text" class="form-control datepick" id="allvehiclesDay" required/>
     </div>
     
     <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
      <button type=submit" class="action-button shadow animate green" ng-click="getignitionAlldate();"><font color="black">View</font></button>
     </div>
        
 </div>
 </form>




      
      <table class="table table-striped" id="table1" width="100%" cellspacing="2" >
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="idelhoursdateallexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>			
      <table  class="table-bordered" border="2" width="100%" cellspacing="0" id="idelhoursDateallwise"  >
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
														<th><font color="#1E0833">Vehicle No</font></th>
														<th><font color="#1E0833">Date</font></th>
														<th><font color="#1E0833">Switch On</font></th>
														<th><font color="#1E0833">Total SwitchON Duration</font></th>
														<th><font color="#1E0833">Switch Off</font></th>
														<th><font color="#1E0833">Total Switchoff Duration</font></th>
														</tr>
													</thead>

													<tbody>
													<tr ng-show="ignitiondetailsdaterAllnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="day in ignitiondetailsdaterAllnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{day.vehicleno}}</font></td>
															<td><font>{{day.tdate}}</font></td>
															<td><font>{{day.switchon_duration}}</font></td>
															<td><font>{{day.total_switchonhours}}</font></td>
															<td><font>{{day.switchoff_duration}}</font></td>
															<td><font>{{day.total_switchoffhours}}</font></td>
													</tr>
													</tbody>
													
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData36(newPageNumber)" >
												</dir-pagination-controls>
												
										</div>
										<!-- /.widget-main -->
								
	<div class="widget-main" id="idelhoursallrangewise" hidden>
	<form  role="form"  name="allvehdaterangeform" > 
	<div class="row">
  <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="allvehiclesdate1" required/>
     </div>
     
     
      <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="allvehiclesdate2" required/>
     </div>
     
     
     
     <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
    <button type="submit" class="action-button shadow animate green" ng-click="getignitionrangewiseall();"><font color="black">View</font></button>	
     </div>
     
   </div>
   </form>
	
	
      
      <table class="table table-striped" id="table2"	width="100%" cellspacing="2" >
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="idelhoursrangeallexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>	
      <table  class="table-bordered" border="2"	width="100%" cellspacing="0" id="idlehoursrangeall" >
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
														<th><font color="#1E0833">Vehicle No</font></th>
														<th><font color="#1E0833">Date</font></th>
														<th><font color="#1E0833">Switch On</font></th>
														<th><font color="#1E0833">Total SwitchON Duration</font></th>
														<th><font color="#1E0833">Switch Off</font></th>
														<th><font color="#1E0833">Total Switchoff Duration</font></th>
														</tr>
													</thead>

													<tbody>
													<tr ng-show="ignitiondetailsdaterangeAllnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="day2 in ignitiondetailsdaterangeAllnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
								 							<td><font>{{day2.vehicleno}}</font></td>
															<td><font>{{day2.tdate}}</font></td>
															<td><font>{{day2.switchon_duration}}</font></td>
															<td><font>{{day2.total_switchonhours}}</font></td>
															<td><font>{{day2.switchoff_duration}}</font></td>
															<td><font>{{day2.total_switchoffhours}}</font></td>
														</tr>
													</tbody>
													
												</table>
      											<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData35(newPageNumber)" >
												</dir-pagination-controls>
      
	
	</div>
										
										
		
<div class="widget-main" id="dayallchart" hidden>

<div class="row">
<div class="col-md-12"> 
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay"  id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i>Vehicle Statistics</div>
					<div class="panel-body">
					<div id="vehiclechart" style="height:350px; "></div>
				</div>
				</div>
			</div>

</div>

</div>
		
	
				
<div class="widget-main" id="datrangeallchart" hidden>

<div class="row">
<div class="col-md-12"> 
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay"  id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i>Vehicle Statistics</div>
					<div class="panel-body">
					<div id="vehiclechartdaterange" style="height:350px; "></div>
				</div>
				</div>
			</div>

</div>

</div>
		
		
		
		
		
<!-- 		vehiclewise -->
		
		
	<div class="widget-main" id="idlehoursparticulardate" hidden>
	
	<form  role="form" name="particulardateform"> 
	
	<datalist id="vehicledetaillist"> 
		<option ng-repeat="x in  reportvehicledetails"  value="{{x.vehicleregno}}"></option> 
</datalist> 
<div class="row">
  <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font>  Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="particularvehicleday" required/>
     </div>
     
     
      <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
    	 <input type="text" class="form-control "  placeholder="--Select Vehicle No---" list="vehicledetaillist"  id="daywisevehicleno" required/>
     </div>
     
     
     <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
       <button  type="submit" class="action-button shadow animate green" ng-click="getigmitiondatewise();"><font color="black">View</font></button>
     </div>
     
     </div>
     </form>
	
	
      
      		<table class="table table-striped" id="table3"	width="100%" cellspacing="2">
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="idlehoursparticulardateexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>			
      <table  class=" table-bordered" border="2" width="100%" cellspacing="0"  id="idlehousparticulardatewise">
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
														<th><font color="#1E0833">Vehicle No</font></th>
														<th><font color="#1E0833">Date</font></th>
														<th><font color="#1E0833">Switch On</font></th>
														<th><font color="#1E0833">Total SwitchON Duration</font></th>
														<th><font color="#1E0833">Switch Off</font></th>
														<th><font color="#1E0833">Total Switchoff Duration</font></th>
														
														</tr>
													</thead>

													<tbody>
														<tr ng-show="ignitiondetailsdatenew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="rep in ignitiondetailsdatenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{rep.vehicleno}}</font></td>
															<td><font>{{rep.tdate}}</font></td>
															<td><font>{{rep.switchon_duration}}</font></td>
															<td><font>{{rep.total_switchonhours}}</font></td>
															<td><font>{{rep.switchoff_duration}}</font></td>
															<td><font>{{rep.total_switchoffhours}}</font></td>
															
														</tr>
													</tbody>
													
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData34(newPageNumber)" >
												</dir-pagination-controls>
							
										</div>
										<!-- /.widget-main -->
										
										
<div class="widget-main" id="idlehoursparticulaRange" hidden>

 <form role="form" name="particulardaterangeForm">


<datalist id="vehicledetaillist"> 
	<option ng-repeat="x in  reportvehicledetails"  value="{{x.vehicleregno}}"></option>
</datalist>
<div class="row">
  <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="particularvehicledate1" required/>
     </div>
     
     <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
     <input type="text" class="form-control datepick" id="particularvehicledate2" required/>
     </div>
     
     
     
     <div class="form-group col-xs-4 col-md-2">
     <label for="name" class="control-label"><font> Vehicle:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input type="text" class="form-control " placeholder="--Select Vehicle No---" list="vehicledetaillist"  id="datewisevehicleno" required/>
     </div>
     
     
     <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
     <button  type="submit" class="action-button shadow animate green" ng-click="getIgnitiondaterange();"><font color="black">View</font></button>
     </div>
     
     </div>
   </form>


      		<table class="table table-striped" id="table4"	width="100%" cellspacing="2">
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
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="idlehoursparticularrangeexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>				
      <table  class=" table-bordered" border="2"  width="100%" cellspacing="0"  id="idlehoursdaterangearticular">
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													
													</colgroup>
						
													<thead>
														<tr id="gridheader">
														<th><font color="#1E0833">Vehicle No</font></th>
														<th><font color="#1E0833">Date</font></th>
														<th><font color="#1E0833">Switch On</font></th>
														<th><font color="#1E0833">Total SwitchON Duration</font></th>
														<th><font color="#1E0833">Switch Off</font></th>
														<th><font color="#1E0833">Total Switchoff Duration</font></th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<tr ng-show="ignitiondetailsdaterangenew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="rep1 in ignitiondetailsdaterangenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{rep1.vehicleno}}</font></td>
															<td><font>{{rep1.tdate}}</font></td>
															<td><font>{{rep1.switchon_duration}}</font></td>
															<td><font>{{rep1.total_switchonhours}}</font></td>
															<td><font>{{rep1.switchoff_duration}}</font></td>
															<td><font>{{rep1.total_switchoffhours}}</font></td>
															
															
														</tr>
												
													</tbody>
													
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData33(newPageNumber)" >
												</dir-pagination-controls>
											
												
									</div>
									
										
				
		
		

		
		
		
		
										
										
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













