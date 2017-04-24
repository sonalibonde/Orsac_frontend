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
											<font color="white">IMEI Details</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body" >
										<div class="widget-main">
	
		
		
		
	<form  name="bangimei">
    <div class="row">	
    
    
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>IMEI or Device Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
        <input type="text" class="form-control datepick" id="imeibang" required/>
    </div>	
    
    <div class="form-group col-xs-4 col-md-2">
		<div>&nbsp;</div>      
  <button class="action-button shadow animate green" ng-click="getRec()"><font color="black">View</font></button>
    </div>
    
<!--       <div class="col-sm-4 "> -->
<!--         <div class="form-group"> -->
<!--           <label for="inputPassword" class="col-md-4 control-label"><font color="black">IMEI or Device Number:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--      		 <input type="text" class="form-control datepick" id="imeibang"/> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
     
<!--        <div class="col-sm-6 col-lg-6 col-md-offset-4"> -->
<!--         <div class="form-group"> -->
<!--           <button class="action-button shadow animate green" ng-click="getRec()"><font color="black">View</font></button>				 -->
<!--         </div> -->
<!--       </div>		 -->
      </div>
      </form>
<table class="table table-striped"	width="100%" cellspacing="0" id="userTable1" hidden>
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td><select data-ng-init="option1=pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>				          
                <table  class=" table-bordered" border="2" width="100%" cellspacing="0" id="userTable" hidden>
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="13%">
														<col width="13%">
														<col width="13%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<td><font color="white">Device No</font></td>
														    <td><font color="white">IMEI NO</font></td>
														    <td><font color="white">Customer Name</font></td>
														     <td><font color="white">Mobile NO</font></td>
															<td><font color="white">Polling Time</font></td>
															<td><font color="white">Latitude</font></td>
															<td><font color="white">Longitude</font></td>
															<td><font color="white">Location</font></td>
															<td><font color="white">Speed</font></td>
															<td><font color="white">Direction</font></td>
															<td><font color="white">GPS Status</font></td>
															<td><font color="white">Ignition</font></td>
														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="bang in bangaloredetails |orderBy:sortKey:forward|filter:query|itemsPerPage:pagesint">
															<td><font>{{bang.deviceid}}</font></td>
															<td><font>{{bang.imeino}}</font></td>
															<td><font>{{bang.customername}}</font></td>
															<td><font>{{bang.mobileno}}</font></td>
															<td><font>{{bang.packetdate}}  {{bang.packettime}}</font></td>
															<td><font>{{bang.latitude}}</font></td>
															<td><font>{{bang.longitude}}</font></td>
															<td><font>{{bang.location}}</font></td>
															<td><font>{{bang.vehiclespeed}}</font></td>
															<td><font>{{bang.vehicledirection}}</font></td>
															<td><font>{{bang.gpsstatus}}</font></td>
															<td><font>{{bang.ignumber}}</font></td>
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













