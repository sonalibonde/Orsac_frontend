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
						<li class="active"><a data-toggle="tab" href="#/DeviceFormUpdate"><font>Devices</font>
						</a></li>

						<li ng-if="roleid==1001 && loginid!=10001"><a data-toggle="tab" href="#/DeviceFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="devicemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Devices Detail</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
<!-- 												<legend -->
<!-- 													style="padding: 0 10px; border-bottom: none; width: inherit;">Device Creation -->
<!-- 													</legend> -->
<datalist id="userlist">
				<option ng-repeat="x in userclist" value="{{x.companyname}}"></option>
				<option value="All"></option>
		</datalist>
				<datalist id="dealerlist">
				<option ng-repeat="x in dealerdetailslistvehass" value="{{x.dealername}}"></option>
				<option value="All"></option>
		</datalist>
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
											            <td><div style="width:158px;"><font>Search By Deviceid/IMEINo</font></div></td>
											            <td><input class="form-control" id="devicesearch" ng-model="searcbydeviceno"/>
<!-- 											            <input class="form-control" ng-model="query[queryBy]" /> -->
											            </td>
											             <td><div style="width:20px;"><font>Dealer</font></div></td>
											            <td><input class="form-control" style="width:100px;"id="dealersearch" list="dealerlist" ng-model="dealersearch"/></td>
											        	<td><button ng-click="searchdealerdevice();"><font>Search</font></button></td>				
											            <td><div style="width:20px;"><font>Company</font></div></td>
											            <td><input class="form-control"  style="width:100px;"id="compsearch" list="userlist" ng-model="compsearch"/></td>
											        	<td><button ng-click="searchdevice();"><font>Search</font></button></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												
									<div id="deviceDiv" >	
									<table class="table-bordered" border="2" width="100%" cellspacing="0" id="printTable">
													<colgroup>
														<col width="5%">
<%-- 														<col width="10%"> --%>
														<col width="15%">
<%-- 														<col width="15%"> --%>
<%-- 														<col width="12%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="4%"> --%>
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
														

													</colgroup>
													<thead>
														<tr id="gridheader" style="color:black">
					<td ng-click="sort('rowno')"><font  color="white">Sr.No.</font>	<span class="glyphicon sort-icon" ng-show="sortKey=='uniqueid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
<!-- 					<td ng-click="sort('deviceid')"><font color="white">Device Id</font><span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					
					<td ng-click="sort('uniqueid')"><font color="white">Device Number</font>
					<span class="glyphicon sort-icon" ng-show="sortKey=='uniqueid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					
<!-- 					<td ng-click="sort('makename')"><font color="white">Make Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='makename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td ng-click="sort('modelname')"><font color="white">Model Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					<td ng-click="sort('customername')" ng-if='roleid!=1003'><font color="white">Customer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<td ng-click="sort('dealername')" ng-if='roleid!=1003'><font color="white">Dealer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
<!-- 					<td ng-click="sort('remark')"><font color="white">Remark</font><span class="glyphicon sort-icon" ng-show="sortKey=='remark'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> --> 
					<td ng-click="sort('vehicleno')"><font color="white">Vehicle No</font><span class="glyphicon sort-icon" ng-show="sortKey=='vehicleno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<td ng-click="sort('statussim')"><font color="white">Sim Status</font><span class="glyphicon sort-icon" ng-show="sortKey=='statussim'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<td ng-click="sort('statusvehicle')"><font color="white">Vehicle Status</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<td ng-click="sort('polling_status')"><font color="white">Polling</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<td ng-click="sort('rowno')"><font color="white">Receipt</font>
					<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
					</td>
															
<!-- 					<td ng-click="sort('print')"><font color="white">Print</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					
<!-- 					<td ng-click="sort(flag')"><font color="#1E0833">Activate</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					

<!-- 					<td ng-click="sort(flag')"><font color="#1E0833">Activate</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					
					
<!-- 					<td ng-click="sort(flag')"><font color="white">Action</font><span class="glyphicon sort-icon" ng-show="sortKey=='statusvehicle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td><font color="white">Edit</font></td> -->
<!-- 					<td><font color="white">Delete</font></td> -->

														</tr>
													</thead>

													<tbody>
<%-- 											<tr ng-show="devicenew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
											<tr dir-paginate="dev in devicenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{dev.rowno}}</font></td>
<!-- 															<td><font>{{dev.deviceid}}</font></td> -->
															<td><font>{{dev.uniqueid}}</font></td>
<!-- 															<td><font>{{dev.makename}}</font></td> -->
<!-- 															<td><font>{{dev.modelname}}</font></td> -->
															<td ng-if='roleid!=1003'><font>{{dev.customername}}</font></td>
															<td ng-if='roleid!=1003'><font>{{dev.dealername}}</font></td>
<!-- 															<td><font>{{dev.remark}}</font></td> -->
															<td><font>{{dev.vehicleno}}</font></td>
															<td ng-if='dev.statussim=="Assigned"'><button  style="background-color: green;color: white; width:100%;"><font>{{dev.statussim}}</font></button></td>
															
															<td ng-if='dev.statussim!="Assigned"'><button  style="background-color: #e07b53;color: white; width:100%"><font>{{dev.statussim}}</font></button></td>
															
															<td ng-if='dev.statusvehicle=="Assigned"'><button style="background-color: green;color: white; width:100%"><font>{{dev.statusvehicle}}</font></button></td>
															
															<td ng-if='dev.statusvehicle!="Assigned"'><button style="background-color: #e07b53;color: white; width:100%"><font>{{dev.statusvehicle}}</font></button></td>
															
															<td ng-if='dev.polling_status=="Polling"'><button style="background-color: #82bf56;color: white; width:100%"><font>Polling</font></button></td>
															<td ng-if='dev.polling_status=="NotPolling"'><button style="background-color: red;color: white; width:100%"><font>Non Polling</font></button></td>
															<td ng-if='dev.polling_status=="Pollingor"'><button style="background-color: orange;color: white; width:100%"><font>Non Working</font></button></td>
<!-- 															<td><font><a><button style="background-color: green;color: black; width:90px">{{dev.print}}</button></a></font></td> -->
<!-- 															<td  ng-if="dev.device_status=='Deactivate'"  ng-click="deletedevice(dev)"><a ng-if="dev.flag=='true'"><button  style="background-color: #e07b53;color: white; width:95px"><font>{{dev.device_status}}</font></button></a></td> -->
<!-- 															<td ng-if="dev.device_status=='Activate'" ng-click="activatedevice(dev);"><a ng-if="dev.flag=='true'"><button  style="background-color: green;color: white; width:95px;"><font>{{dev.device_status}}</font></button></a></td> -->
															<td><a ng-if="dev.isapproved=='t'"  ng-click="print_this(dev);"><button  style="background-color: 	#B19CD9;color: white; width:100%;"><font>Download PDF</font></button></a></td>
<!-- 															<td><a  ng-if="dev.flag=='true'" type="submit"  ng-click="showdevicediv1();deviceData(dev);" href=""><i -->
<!-- 																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td> -->
<!-- <!-- 				 -->
<!-- 											<td><a href="" ng-click="activatedevice(dev);"><font>Activate</font></a></td> -->
															
<!-- 															<td><a href="" ng-click="sendcommand(dev.uniqueid);">Activate</button></td> -->
															
<!-- 															<td> -->
<%-- 															<img   ng-if="dev.flag=='true'" ng-click="deletedevice(dev)" src="<c:url value="/resources/assets/images/Delete.png"/>" height="16px" width="16px"> --%>
<!-- 															</td> -->
														
														
														
														</tr>
													</tbody>
												</table>
												</div>
												<dir-pagination-controls
													max-size="8"
													direction-links="true"
													boundary-links="true" 
													on-page-change="getData12(newPageNumber)" >
												</dir-pagination-controls>
												</div>
<!-- 											</fieldset> -->
												<div style="text-align: right;"><font>Total Records:{{device.length}}</font></div>	
											
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
								
<div class="widget-box" id="deviceedit" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"> <font color="white">Edit Device</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
	<div>&nbsp;</div>

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="deviceEdit">
    <div class="row">
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Make Name</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="devicemakenamebind">
				<option ng-repeat="x in devicemakenamelist" ng-if="x.assetname=='GPS Device'" value="{{x.makename}}"></option>
		</datalist>
   <input class="form-control" id="deviceditmake"  value="{{editdevice.makename}}" placeholder="Make Name" type="text"  list="devicemakenamebind" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Model Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
      <datalist id="devicemodelnamebind">
			<option ng-repeat="x in devicemodeldetails" ng-if="x.makename==editdevice.makename" value="{{x.modelname}}"></option>
		</datalist>
            <input class="form-control" id="deviceeditmodel" value="{{editdevice.modelname}}"  list="devicemodelnamebind" placeholder="Model Name" type="text" required>
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Device ID:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editdeviceid"  value="{{editdevice.deviceid}}" placeholder="Device Id" type="text" maxlength="6" required>
           </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Device Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editdeviceno"  onkeyup="deviceValidation(this)" onchange="devicenolengthValidation(this)" value="{{editdevice.uniqueid}}" placeholder="Device Number" type="text" maxlength="15" required>
         <div class="alert alert-warning"  id="iddeviceno" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="devicenolengthValidation" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 15 digits!
  		</div>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="deviceeditRemarkd1" value="{{editdevice.remark}}" placeholder="Remark" type="text">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          <div class="col-md-4">
    <button  class="action-button shadow animate green" ng-click="devieupdate();"><font color="black">Update</font></button>
   </div>
     <div class="col-md-4">
   <a ng-click="back();"><button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>		
          </div>
        </div>
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
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
	
	<div id="receipt" hidden>
	
	<table class="table-bordered" border="2" width="100%" cellspacing="0">
	<tr><th colspan="8" style="text-align:center"><b>ORSAC RECEIPT</b></th></tr>
	<tr>
	<th colspan="8" style="text-align:center">Directorate Of Steel & Mines Department</th>
	</tr>
	<tr><td colspan="4" style="text-align:left">Receipt NO.:{{receipt}}</td>
	<td colspan="4" style="text-align:right">Date:{{ndate}}</td>
	</tr>
	<tr><th colspan="8" style="text-align:center">GPS/GPRS Device Activation</th></tr>
	<tr><td colspan="6">Activation No :RCPT/2014/7/24-62235</td>
	<td colspan="6">Vehicle No:{{vehicleno}}</td>
	</tr>
	<tr><td colspan="6">Activation Date :{{ndate}}</td>
	<td colspan="6">Dealer Name   :{{dealer}}</td>
	</tr>
	<tr><td colspan="6">IMEI No  :{{uniqueid}}</td>
	<td colspan="6">Customer Name :RAPLCustomer</td></tr>
	<tr><td colspan="6">Sim No :{{simno}}</td>
	<td colspan="6">Vehicle Category:NA</td>
	</tr></table><div>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</div>
	<table class="table-bordered" border="2" width="100%" cellspacing="0">
	<tr><th colspan="8" style="text-align:center"><b>ORSAC RECEIPT</b></th></tr>
	<tr>
	<th colspan="8" style="text-align:center">Directorate Of Steel & Mines Department</th>
	</tr>
	<tr><td colspan="4" style="text-align:left">Receipt NO.:{{receipt}}</td>
	<td  colspan="4" style="text-align:right">Date:{{ndate}}</td>
	</tr>
	<tr><th colspan="8" style="text-align:center">GPS/GPRS Device Activation</th></tr>
	<tr><td colspan="6">Activation No :RCPT/2014/7/24-62235</td>
	<td colspan="6">Vehicle No:{{vehicleno}}</td>
	</tr>
	<tr><td colspan="6">Activation Date :{{ndate}}</td>
	<td colspan="6">Dealer Name   :{{dealer}}</td>
	</tr>
	<tr><td colspan="6">IMEI No  :{{uniqueid}}</td>
	<td colspan="6">Customer Name :RAPLCustomer</td></tr>
	<tr><td colspan="6">Sim No :{{simno}}</td>
	<td colspan="6">Vehicle Category:NA</td>
	</tr></table>
	
	</div>
	
	</div>
	<!-- /.col -->



	
	
	
	</div>
	<!-- /.col -->













