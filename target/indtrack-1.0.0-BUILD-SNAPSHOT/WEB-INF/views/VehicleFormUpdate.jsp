<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li class="active"><a data-toggle="tab" href="#/VehicleFormUpdate"><font>Vehicle Details</font>
								</a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/VehicleFormInsert"><font>New Entry</font></a></li>
				
					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="mainvehicle">
									<div
										class="widget-header widget-header-flat widget-header-small"  id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
										<font color="white">Vehicles Details</font>
										<a style="margin-left:70%;"><font color="white">Total Records:{{vehicledetails.length}}</font></a>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
												<div>&nbsp;</div>
												<table class="table table-striped"
													width="100%" cellspacing="0">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td><div style="width:150px;"><font>Search By Vehicle No</font></div></td>
											            <td><input class="form-control"  id="searchbyVehicleNo" ng-model="ByVehicleno" /></td>
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											            <td></td>
											            <td></td>
											            <td></td>
											              
											        	<td>
											        	<table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]" data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table>
											        	
														   </td>
											        </tr>   
												</table>
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTableveh">
													<colgroup>
														<col width="5%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														
														<col width="10%">
														<col width="10%">
													

													</colgroup>
													
													<thead>
														<tr id="gridheader">
														
											<td ng-click="sort('rowno')"><font color="white">Sr.No.</font>
										<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
																	
															</td>			
															<td ng-click="sort('vehicleregno')"><font color="white">Vehicle No</font>
										<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleregno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
																	
															</td>
<!-- 															<th>Vehicle Id</th> -->
															<td ng-click="sort('vehicletypename')"><font color="white">Vehicle Type</font>
														<span class="glyphicon sort-icon" ng-show="sortKey=='vehicletypename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td ng-click="sort('fitnessvalidity')"><font color="white">Fitness Validity</font>
														<span class="glyphicon sort-icon" ng-show="sortKey=='makename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td ng-click="sort('insurancevalidity')"><font color="white">Insurance Validity</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td ng-click="sort('tankcapacity')"><font color="white">Tank Capacity</font>
															<span class="glyphicon sort-icon" ng-show="sortKey=='tankcapacity'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															
															<td ng-click="sort('status')"><font color="white">Status</font>
															<span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('rowno')"><font color="white">Receipt</font>
															<td ng-if="loginid!=10001"><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="vehicledetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="vehi in vehicledetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{vehi.rowno}}</font></td>
															<td><font>{{vehi.vehicleregno}}</font></td>
															<td><font>{{vehi.vehicletypename}}</font></td>
															<td><font>{{vehi.fitnessvalidity}}</font></td>
															<td><font>{{vehi.insurancevalidity}}</font></td>
															<td><font>{{vehi.tankcapacity}}</font></td>
															
															<td><font>{{vehi.status}}</font></td>
															<td><a ng-if="vehi.isapproved=='true'" id="target"  ng-click="print_this(vehi);"><button  style="background-color: orange;color: white; width:95px;"><font>Download PDF</font></button></a></td>
															<td><a ng-if="loginid!=10001" href="" type="submit"
																ng-click="vehicleeditdata(vehi);showvehclediv1()"><i
																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td>
															<td><a href=""></a><img ng-if="vehi.flag=='true'" ng-click="deletevehicle(vehi)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
</a></td>
															
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData40(newPageNumber)" >
													</dir-pagination-controls>
<!-- 											</fieldset> -->
<!-- 												<div style="text-align: right;"><font>Total Records:{{vehicledetails.length}}</font></div>	 -->
											<div class="hr hr8 hr-double"></div>
<div style="text-align:center;">	
		<a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
		<a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a>
										
										
										<a href="" title="Export To Excel" id="exportexcel" ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a>
										</div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
								
			
			
<div class="widget-box" id="showeditvehicle" hidden >
<div class="widget-header widget-header-flat widget-header-small"  id="dealerlabel">
<h5 class="widget-title"><font color="black"> Edit Vehicle</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="vehicleeditform">
    <div class="row">
    
    
    
<!--     <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="input8" class="col-md-4 control-label"><font color="black">Select Sub Dealers:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control " id="veheditfitnessval" value="{{editvehicledata.dealername}}"   placeholder="Fitness Validity" type="text" required> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div>  -->
      
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="input8" class="col-md-4 control-label"><font color="black">Select Customer:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control " id="veheditfitnessval" value="{{editvehicledata.customername}}"   placeholder="Fitness Validity" type="text" required> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div>  -->
      
      
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Fitness Validity:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditfitnessval" value="{{editvehicledata.fitnessvalidity}}"   placeholder="Fitness Validity" type="text" required>
          </div>
        </div>
      </div> 
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Validity:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditinsuranceval" value="{{editvehicledata.insurancevalidity}}"   placeholder="Insurance Validity" type="text" required>
          </div>
        </div>
      </div> 
    
    
    
<!--     <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group "> -->
<!--           <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--           <datalist id="vehiclemakenamebind"> -->
<!-- 				<option ng-repeat="x in vehcilemakenamelist" ng-if="x.assetname=='Vehicle'" value="{{x.makename}}"></option> -->
<!-- 		</datalist> -->
<!--             <input class="form-control" ng-model="editvehicledata.makename"  value="{{editvehicledata.makename}}"   list="vehiclemakenamebind" id="veheditmake" placeholder="Make" type="text" required> -->
          
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Model Name:</font> <b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--           <datalist id="vehicleeditmodelbind"> -->
<!-- 				<option ng-repeat="x in vehiclemodeldetails" ng-if="x.makename==editvehicledata.makename" value="{{x.modelname}}"></option> -->
<!-- 		  </datalist> -->
<!--             <input class="form-control"  value="{{editvehicledata.modelname}}" id="vehicleeditmodel" list="vehicleeditmodelbind"  placeholder="Model" type="text" required> -->
         
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    
    
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " value="{{editvehicledata.vehicleregno}}"  id="vehicleditvehicleno" placeholder="Vehicle No" type="text" required>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Chasis No:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control "  value="{{editvehicledata.chasisnumber}}" id="veheditchassis" placeholder="Chasis No" type="text" required>
          </div>
        </div>
      </div>
      
        <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vehicle Type:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="vehicletypebind">
				<option ng-repeat="x in vehicletype" value="{{x.vehicletypename}}"></option>
		</datalist>
            <input class="form-control "  value="{{editvehicledata.vehicletypename}}" id="editvehicletype" list="vehicletypebind"  placeholder="Vehicle Type" type="text" required>
          
          </div>
        </div>
      </div>
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="input5" class="col-md-4 control-label"><font color="black">Tank Capacity:</font></label>
          <div class="col-md-8">
            <input class="form-control " value="{{editvehicledata.tankcapacity}}"  id="vehedittank" placeholder="Tank capacity" type="text">
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="input6" class="col-md-4 control-label"><font color="black">Body Color:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditbodycolor"  value="{{editvehicledata.bodycolor}}" placeholder="Body Color" type="text">
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="input7" class="col-md-4 control-label"><font color="black">Engine Number:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditengineno" value="{{editvehicledata.enginenumber}}"  placeholder="Engine Number" type="text" required>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Registration Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="veheditregdate"  value="{{editvehicledata.regdate}}" placeholder="Registration Date" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Registration Valid Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="veheditregvaliddate" value="{{editvehicledata.regvaliddate}}"   placeholder="Registration Valid  Date" type="text" required>
          </div>
        </div>
      </div> 
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Company Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditinsurancecompname" value="{{editvehicledata.insurancecompany}}"   placeholder="Insurance Company Name" type="text" required>
          </div>
        </div>
      </div> 
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Valid Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehieditinsurancevaliddate" value="{{editvehicledata.insurancevaliddate}}" placeholder="Insurance Valid  Date" type="text" required>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Purchase date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="veheditpurchasedate"  value="{{editvehicledata.pucdate}}" placeholder="Purchase Date" type="text" required>
          </div>
        </div>
      </div>
        <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditremark"  value="{{editvehicledata.remarks}}"  placeholder="Remark" type="text">
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Image1:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <img src="{{url1}}"/>
          </div>
        </div>
      </div>
      
       <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Image2:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <img src="{{url2}}"/>
          </div>
        </div>
      </div>
  
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          
          <div class="col-md-4">
       <button type="submit"  class="action-button shadow animate green" ng-click="VehicleUpdate();"><font color="black">Update</font></button>
	</div>
	<div class="col-md-4">
	<a    ng-click="back()"><button  class="action-button shadow animate red"><font color="black">Back</font></button></a>
          </div>
        </div>
      </div>
</div>
</form>
<!-- </fieldset> -->
	
	</div>
	</div>
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

<div id="receipt12" hidden="true">
<table class="table-bordered" border="2" width="100%" cellspacing="0">
<tr><th colspan="8" style="text-align:center"><b>ORSAC RECEIPT</b></th></tr>
<tr>
<th colspan="8" style="text-align:center">Directorate Of Steel & Mines Department</th>
</tr>
<tr><td colspan="4" style="text-align:left">Receipt NO:{{receipt}}</td>
<td colspan="4" style="text-align:right">Date:{{ndate}}</td>
</tr>
<tr><th colspan="8" style="text-align:center">GPS/GPRS Device Activation</th></tr>
<tr><td colspan="6">Activation No:RCPT/2014/7/24-62235</td>
<td colspan="6">Vehicle No:{{vehicleno}}</td>
</tr>
<tr><td colspan="6">Activation Date   :{{ndate}}</td>
<td colspan="6">Dealer Name   :</td>
</tr>
<tr><td colspan="6">IMEI No   :{{uniqueid}}</td>
<td colspan="6">Customer Name :RAPLCustomer</td>
</tr>
<tr><td colspan="6">Sim No   :{{simno}}</td>
<td colspan="6">Vehicle Category:NA</td>
</tr>
</table>
<div>--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</div>
<table class="table-bordered" border="2" width="100%" cellspacing="0">
<tr><th colspan="8" style="text-align:center">Directorate Of Steel & Mines Department</th>
</tr>
<tr><td colspan="4" style="text-align:left">Receipt No:{{receipt}}</td>
<td colspan="4" style="text-align:right">Date:{{ndate}}</td>
</tr>
<tr><th colspan="8" style="text-align:center">GPS/GPRS Device Activation</th></tr>
<tr><td colspan="6">Activation No:RCPT/2014/7/24-62235</td>
<td colspan="6">Vehicle No:{{vehicleno}}</td>
</tr>
<tr><td colspan="6">Activation Date   :{{ndate}}</td>
<td colspan="6">Dealer Name  :</td>
</tr>
<tr><td colspan="6">IMEI No        :{{uniqueid}}</td>
<td colspan="6">Customer Name:RAPLCustomer</td>
</tr>
<tr><td colspan="6">Sim No       :{{simno}}</td>
<td colspan="6">Vehicle Category:NA</td>
</tr>
</table>

</div>

</div>





