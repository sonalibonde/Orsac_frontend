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
											<font color="white">Day Wise Vehicle Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>
									<div>&nbsp;</div>
	<div class="widget-body" >
				
		<div class="row">				          
	
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Show Report:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     		 <select id="reportparticularvehicles" class="form-control ">
     		 <option value="--select--">---select option---</option>
     		 <option value="Day wise Vehicles">Day wise Vehicles-Km Travelled</option>
     		 <option value="Date Range wise Vehicles">Date Range wise Vehicles-Km Travelled</option>
     		
     		 </select>
          </div>
        </div>
      </div>
<!--       <div class="col-sm-4"> -->
<!--         <div class="form-group"> -->
<!--                  <button class="action-button shadow animate green" ng-click="showvehiclereport()"><font color="black">Show Report</font></button>				 -->
<!--      	 </div> -->
<!--       </div>			 -->
      </div>
      
		<div class="hr hr8 hr-double"></div>									
	<div class="widget-main" id="daywiseparticular" hidden>
	
	
	<form>
    <div class="row">				          
	
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     		 <input type="text" class="form-control datepick" id="particularvehicleday"/>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="vehicledetaillist">
				<option ng-repeat="x in  reportvehicledetails"  value="{{x.vehicleregno}}"></option>
			</datalist>
          	 <input type="text" class="form-control "  placeholder="--Select Vehicle No---" list="vehicledetaillist"  id="daywisevehicleno"/>
          </div>
        </div>
      </div>
      
       <div class="">
        <div class="form-group">
          <button class="action-button shadow animate green" ng-click="getDaywiseParticularvehiclereport()"><font color="black">View</font></button>				
        </div>
      </div>		
      </div>
      </form>			
      <table  class=" table-bordered" border="2" width="100%" cellspacing="0"  id="dateiwsevehi" hidden>
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
														<th><font color="#1E0833">Vehicle No</font></th>
														<th><font color="#1E0833">Date</font></th>
														<th><font color="#1E0833">Distance Travel</font></th>
														
														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="rep in reportvehicledetails |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
															<td><font>{{rep.vehicleno}}</font></td>
															<td><font>{{rep.todate}}</font></td>
															<td><font>{{rep.distance}} KM</font></td>
															
														</tr>
													</tbody>
													
												</table>
												
							
										</div>
										<!-- /.widget-main -->
										
										
<div class="widget-main" id="datewisevehicles" hidden>
									
<form>
    <div class="row">				          
	
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">From Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     		 <input type="text" class="form-control datepick" id="particularvehicledate1"/>
          </div>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     		 <input type="text" class="form-control datepick" id="particularvehicledate2"/>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="vehicledetaillist">
				<option ng-repeat="x in  reportvehicledetails"  value="{{x.vehicleregno}}"></option>
			</datalist>
          	 <input type="text" class="form-control " placeholder="--Select Vehicle NO---" list="vehicledetaillist"  id="datewisevehicleno"/>
          </div>
        </div>
      </div>
      
       <div class="col-sm-6">
        <div class="form-group">
          <button class="action-button shadow animate green" ng-click="getdatewisevehicle()"><font color="black">View</font></button>				
        </div>
      </div>		
      </div>
      </form>			
      <table  class=" table-bordered" border="2"  width="100%" cellspacing="0" id="daterangewisevehi" hidden>
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
														<th><font color="#1E0833">Distance Travel-KM</font></th>
														<th><font color="#1E0833">Total Distance </font></th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<tr dir-paginate="rep1 in rangewisevehicle |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
															<td><font>{{rep1.vehicleno}}</font></td>
															<td><font>{{rep1.todate}}</font></td>
															<td><font>{{rep1.distance}} KM</font></td>
															<td><font>{{rep1.total}} KM</font></td>
															
														</tr>
												
													</tbody>
													
												</table>
												
											
												
									</div>
									
										
								
							
								
				
				
				
<!-- 	chart			 -->


<div class="widget-main" id="dayparticularchart" hidden>

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













